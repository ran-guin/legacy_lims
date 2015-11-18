#!/usr/local/bin/perl

###############################
# DBIntegrity.pl
###############################
#
# This program is the home page for the error checking subroutines.  They allow
# the user to check for broken foreign key links or edit and perform checks
# using the Error_Check Table.
#
##################################################################################
use strict;

use FindBin;
use lib $FindBin::RealBin . "/../lib/perl";
use lib $FindBin::RealBin . "/../lib/perl/Core";
use lib $FindBin::RealBin . "/../lib/perl/Imported";

use CGI qw(:standard);

#use Crypt::CBC;
#use Crypt::Blowfish;
use CGI::Carp('fatalsToBrowser');
use Getopt::Std;
use Data::Dumper;

use SDB::DBIO;
use SDB::CustomSettings;
use SDB::DB_Form_Viewer;

use RGTools::HTML_Table;
use RGTools::RGIO;
use RGTools::Process_Monitor;
use RGTools::Conversion qw(convert_date);

use alDente::Notification;
use alDente::SDB_Defaults;
use alDente::Web;
use alDente::DBIntegrity qw(perform_cmd_indexcheck print_fk_tables perform_fk_checks print_errchks perform_cmdchks show_errchk_details perform_refchks describe_table show_tables $Mode $Home $dbase $host $thislink);

################## Global Variables ###################################
use vars qw($homefile $homelink $URL_address);    #Mode can either be 'cmd' for command-line mode or 'web' for web-interface mode
use vars qw($user $task);                         #$password_key $task);
use vars qw(%Configs );
our ( $opt_d, $opt_u, $opt_p, $opt_t, $opt_e, $opt_h, $opt_n, $opt_l, $opt_f, $opt_v, $opt_o, $opt_i, $opt_N, $opt_X, $opt_m, $opt_Q );
getopts('d:u:p:t:e:h:n:l:f:v:o:i:NX:mQ');
my $tables;
my $err_chk_ids;
my $to_emails;
my $logfile;
my $index_check;
my $field;
my $values;
my $enum_chk;
my $fk_chk;
my @options;
my @exclusions;
my $qty_units_chk;
my $error_checks;

$homefile     = 'DBIntegrity.pl';
$Home         = "$URL_address/$homefile";
$URL_temp_dir = $Configs{URL_temp_dir};

################## Get values of all command-line switches ###################################
if ($opt_d) { $dbase         = $opt_d }                  #database name
if ($opt_h) { $host          = $opt_h }                  #database host
if ($opt_u) { $user          = $opt_u }                  #user for database login
if ($opt_i) { $index_check   = $opt_i }                  # check that all fks have indexes
if ($opt_t) { $tables        = $opt_t }                  #which tables to be checked for foreign keys
if ($opt_e) { $error_checks  = $opt_e }                  #which error checks to be performed
if ($opt_n) { $to_emails     = $opt_n }                  #A list of email recipents for which error notifications are sent to.
if ($opt_l) { $logfile       = $opt_l }                  #Path and file name to log file.
if ($opt_f) { $field         = $opt_f }                  #field to be performed reference check
if ($opt_v) { $values        = $opt_v }                  #values of the field to be performed reference check
if ($opt_o) { @options       = split( /,/, $opt_o ) }    #convert the comma-delimited options list into an array format.
if ($opt_X) { @exclusions    = split( /,/, $opt_X ) }
if ($opt_N) { $enum_chk      = $opt_N }
if ($opt_Q) { $qty_units_chk = $opt_Q }

if ( $error_checks =~ /[a-zA-Z]/ ) {
    ## strings indicate named standard error checks requested ##
    $index_check   = ( $error_checks =~ /\bindex\b/ );
    $enum_chk      = ( $error_checks =~ /\benum\b/ );
    $fk_chk        = ( $error_checks =~ /\bfk\b/ );
    $qty_units_chk = ( $error_checks =~ /\b(qty|units)\b/ );
    if ( $error_checks =~ /\b(custom|error)\b/ ) { $err_chk_ids = 'All' }
}
else {
    ## integers supplied indicateds specific error check ids to test ##
    $err_chk_ids = $error_checks;
}

my $clear_report = 0;
my @ignore       = @exclusions;

$host = $opt_h || $Configs{BACKUP_HOST} || $Configs{PRODUCTION_HOST};    ### use the replication server to do integrity checks.

######################## construct Process_Monitor object for writing to log file ###########

################## Now determine which mode we are entering.... ###################################

if ($opt_m) {

    # print help information
    _print_help_info();
    exit;
}
elsif ( !$opt_d ) {

    # web interface mode
    $Mode = 'web';
    &alDente::DBIntegrity::_start_web_mode();
    exit;
}

# command-line mode
$Mode = 'cmd';

#    my $Report = Process_Monitor->new('DBIntegrity.pl Script', -url=>"../share/DBIntegrity_Report.html");
my $file_name = "DBIntegrity_Report" . substr( timestamp(), 0, 8 ) . ".html";

my $url = "../tmp/$file_name";
my $Main_Report = Process_Monitor->new( 'DBIntegrity', -url => $url );

my $daily_report = $file_name;

my $errors_found = 0;
my $html_table;
my $logfile_note;
my $ignored_tables = scalar(@ignore);

my $file              = "/home/sequence/alDente/share/DBIntegrity_Report.html";
my $daily_report_file = "$URL_temp_dir/$daily_report";

if ($clear_report) {
    open my $FILE, '>', $file or $Main_Report->set_Warning("Cannot write to the file: $file");
    print $FILE 'DB Integrity Check Report<br>';
    close $FILE;
}

if ($logfile) {

    # redirect console output to log file.
    open( STDOUT, ">$logfile" ) or $Main_Report->set_Warning("Cannot write to the file: $logfile");
    $logfile_note = "<br><u>Log file location</u>: $logfile";
}

# OPEN Report HTML file
open my $FILE, '+>>', $file or $Main_Report->set_Warning("Cannot write to the file: $file");
open my $DAILY_LOG_FILE, '+>>', $daily_report_file or $Main_Report->set_Warning("Cannot write to the file: $daily_report_file");

my $addr;

print $FILE "The following checks are performed on: " . &convert_date( date_time(),           'Simple' ) . "<br>";
print $DAILY_LOG_FILE "The following checks are performed on: " . &convert_date( date_time(), 'Simple' ) . "<br>";

my $dbc = SDB::DBIO->new( -host => $host, -dbase => $dbase, -user => $user, -connect => 1 );

#First see which task we are performing.

if ($index_check) {

    # check foreign keys for indexes
    my $ok = index_check();
    $Main_Report->succeeded();
}
if ($err_chk_ids) {
    custom_error_check();
}

if ($tables) {

    # foreign key checks
    if ($enum_chk) {
        enum_check();
        my $ok = index_check();
        $Main_Report->succeeded();
    }
    if ($qty_units_chk) {
        qty_units_check();
        my $ok = index_check();
        $Main_Report->succeeded();
    }
    if ($fk_chk) {
        fk_check();
        my $ok = index_check();
        $Main_Report->succeeded();
    }
}
elsif ($field) {

    # reference checks
    # parse the options
    reference_checks();
}

#    else {    #didn't specify any task to perform
#        print("No task specified.\n");
#    }

close $FILE;
close $DAILY_LOG_FILE;

$Main_Report->completed();

#$Main_Report->DESTROY;

exit;

#####################
sub index_check {
#####################
    my $log_string  = '';
    my $omit_non_fk = undef;
    my $add_index   = undef;

    if ( grep /^fk_only/, @options ) {
        $omit_non_fk = 1;
        print "NON FK";
    }
    if ( grep /^add_index/, @options ) {
        $add_index = 1;
        print "ADD IND";
    }

    my @check_tables;

    if ($ignored_tables) {
        my $all_tables = [ alDente::DBIntegrity::show_tables($dbc) ];
        foreach my $table (@$all_tables) {
            unless ( grep /^\s*$table\s*$/, @ignore ) { push( @check_tables, $table ); }
        }
    }
    elsif ( $tables =~ /All/i ) {

        # Performing checks on all tables.
        @check_tables = alDente::DBIntegrity::show_tables($dbc);
    }
    elsif ($tables) {

        # Performing checks on the tables included in the comma-delimited  list.
        @check_tables = split /,/, $tables;
    }
    else {
        print "No tables specified for the -t switch.\n";
        return;
    }

    my $Report = Process_Monitor->new( 'DBIntegrity', -url => $url, -variation => 'index_check' );

    $log_string = alDente::DBIntegrity::perform_cmd_indexcheck( $dbc, \@check_tables, $omit_non_fk, $add_index, $Report );
    $Report->completed();

    #$Report->DESTROY;

    return 1;
}

###################
sub enum_check {
###################
    # $check_name = "DBIntegrity_enum_check";
    my @check_tables;
    if ( $tables =~ /All/i ) {
        @check_tables = alDente::DBIntegrity::show_tables($dbc);
    }
    elsif ($tables) {
        print "we are in enum_chk,tables\n";
        @check_tables = split /,/, $tables;
    }

    my $Report = Process_Monitor->new( 'DBIntegrity', -url => $url, -variation => 'enum_check' );

    ( $errors_found, $html_table ) = alDente::DBIntegrity::perform_enum_checks( -dbc => $dbc, -tables => \@check_tables, -report => $Report, -file => $FILE, -daily_log => $DAILY_LOG_FILE );
    $Report->completed();

    #$Report->DESTROY;

    #$Report->set_Message("Tested enum checks: ". $errors_found . " errors found");
    return;
}

#########################
sub qty_units_check {
#########################
    # $check_name = "DBIntegrity_qty_units_check";
    my @check_tables;
    if ( $tables =~ /All/i ) {
        @check_tables = alDente::DBIntegrity::show_tables($dbc);
    }
    elsif ($tables) {
        @check_tables = split /,/, $tables;
    }

    my $Report = Process_Monitor->new( 'DBIntegrity', -url => $url, -variation => 'qty_units_check' );
    ( $errors_found, $html_table ) = alDente::DBIntegrity::perform_qty_units_checks( -dbc => $dbc, -tables => \@check_tables, -report => $Report, -file => $FILE, -daily_log => $DAILY_LOG_FILE );
    $Report->completed();

    #$Report->DESTROY;

    return 1;
}

#################
sub fk_check {
#################
    # $check_name = "DBIntegrity_FK_check";

    #Parse the options.
    my $include_nulls = grep /^nulls$/i,    @options;
    my $show_no_errs  = grep /^no_errs$/i,  @options;
    my $gen_list      = grep /^gen_list$/i, @options;

    my @check_tables;
    if ($ignored_tables) {
        my $all_tables = [ alDente::DBIntegrity::show_tables($dbc) ];
        foreach my $table (@$all_tables) {
            unless ( grep /^\s*$table\s*$/, @ignore ) { push( @check_tables, $table ); }
        }
    }
    elsif ( $tables =~ /All/i ) {

        # Performing checks on all tables.
        @check_tables = alDente::DBIntegrity::show_tables($dbc);
    }
    elsif ($tables) {    #Performing checks on the tables included in the comma-delimited  list.
        @check_tables = split /,/, $tables;
    }
    else {
        print("No tables specified for the -t switch.\n");
        return;
    }

    my $Report = Process_Monitor->new( 'DBIntegrity', -url => $url, -variation => 'fk_check' );
    ( $errors_found, $html_table ) = alDente::DBIntegrity::perform_fk_checks( $dbc, \@check_tables, $include_nulls, $show_no_errs, $gen_list, $Report, $FILE, $DAILY_LOG_FILE );

    if ( $errors_found && $to_emails ) {

        # we are sending email notifications if errors found.

        #####################################
        # necessary to populate the Cron summary email notification

        my $link = "<a href=$Home><b>Go to DBIntegrity login page</b></a><br><br>";
        $Report->set_Message($link);
        $Report->create_HTML_page( $html_table->Printout(0) );
    }
    $Report->completed();

    #$Report->DESTROY;

    return 1;
}

############################
sub custom_error_check {
############################
    # error checks
    # Parse the options;

    # $check_name = "DBIntegrity_Error_check";
    my $show_no_errs = grep /^no_errs$/i,      @options;
    my $force_notify = grep /^force_notify$/i, @options;    #Force to send notification emails even if Notice_Sent is less than (today - Notice_Frequency).
    my $gen_list     = grep /^gen_list$/i,     @options;

    my @notify_ids;
    my @check_ids;
    if ( $err_chk_ids =~ /All/i ) {                         #Performing all error checks defined by all users.
        @check_ids = $dbc->Table_find( 'Error_Check', 'Error_Check_ID', 'order by Error_Check_ID' );
    }
    elsif ( $err_chk_ids =~ /Me/i ) {                       #Performing all error checks defined by the current user.
        @check_ids = $dbc->Table_find( 'Error_Check', 'Error_Check_ID', "where Username = '$user' order by Error_Check_ID" );
    }
    elsif ($err_chk_ids) {

        # Performing specified error checks..
        @check_ids = split ',', $err_chk_ids;
    }
    else {
        print("No error checks specified for the -e switch.\n");
        return;
    }

    if (@check_ids) {

        my $Report = Process_Monitor->new( 'DBIntegrity', -url => $url, -variation => 'custom_error_check' );
        ( $errors_found, $html_table, @notify_ids ) = alDente::DBIntegrity::perform_cmdchks( $dbc, \@check_ids, $show_no_errs, $to_emails, $force_notify, $gen_list, $Report, $FILE, $DAILY_LOG_FILE );

        if ( @notify_ids && $to_emails ) {    #we are sending email notifications if errors found.
            #####################################
            # necessary to populate the Cron summary email notification
            my $link = "<a href=$Home><b>Go to DBIntegrity login page</b></a><br><br>";
            $Report->set_Message($link);
            $Report->create_HTML_page( $html_table->Printout(0) );
            ######################################
            my $send_date = &today();
            my $fback = $dbc->Table_update_array( 'Error_Check', ['Notice_Sent'], [$send_date], "where Error_Check_ID in (" . join( ",", @notify_ids ) . ")", -autoquote => 1 );
        }
        $Report->completed();

        #$Report->DESTROY;
    }
    else {
        print("You have not defined any error checks.\n");
    }

    return 1;
}

##########################
sub reference_checks {
##########################
    my $gen_list;
    my $recursive;
    if ($values) {
        $gen_list  = grep /^gen_list$/i,  @options;
        $recursive = grep /^recursive$/i, @options;
    }

    print "\n*************************************************************************************************************************************\n";
    if ($values) {
        print "In the '$dbase' database, the following fields reference the field '$field' and contain the value(s) '$values':\n";
    }
    else {
        print "In the '$dbase' database, the following fields reference the field '$field':\n";
    }
    print "*************************************************************************************************************************************\n";

    alDente::DBIntegrity::perform_refchks( $dbc, $field, $values, $gen_list, $recursive, 0 );

    return 1;
}

#############################
sub _print_help_info {
#############################
    #
    #Prints the help info to the console if the -h switch is specified.
    #
    print <<HELP;

File:  DBIntegrity.pl
####################

Options:
##########

------------------------------
1) Database login information:
------------------------------
-d     database specification
-u     user for database login

---------------------------
2) Tasks to be performed:
---------------------------
***Note: The following tasks a,b and c are mutually exclusive and can NOT be executed together.

a) Perform foreign key checks - checks the database and look for orphan foreign key records:
-t     tables to be checked. Possible values are:
            1) all     => perform the checks on all tables in the database (Caution: could be slow)
            2) a comma-delimited list of table names 
-o     provide extra options in a comma-delimited list. Possible values are: (optional)
            1) show_no_errs    => display/report results with no errors as well
            2) gen_list        => generate a comma-delimited list of orphan foreign keys
-n     send out notification email when errors are detected. Possible values are: (optional)
            1) a comma-delimited list of email addresses to send to
-l     log the console output to a file. Possible value: (optional)
            1) the path and file name of the log file

b) Perform error checks on data integrity based on command strings in the Error_Check table:
-e     error checks to be executed. Possible values are:     
            1) all     => perform all error checks defined by all users
            2) me      => perform all error checks defined by me
            3) a comma-delimited list of Error_Check_ID
            4) a list of standard tests to perform (eg enum,fk,qty )
-o     provide extra options in a comma-delimited list. Possible values are: (optional)
            1) show_no_errs    => display/report results with no errors as well
            2) force_notify    => force to send error notification regardless of notification frequency specified in Error_Check table
-n     send out notification email when errors are detected. Possible values are: (optional)
            1) a comma-delimited list of email addresses to send to
-l     log the console output to a file. Possible values are: (optional)
            1) the path and file name of the log file

c) Perform reference checks - for a given database field, search for foreign key fields that reference this field:
-f     field to be checked. Possible values are:
            1) the name of a database field
-v     specific values of the field to be checked and prints out number of reference records. Possible values are: (optional)
            1) a comma-delimited list of field values
-o     provide extra options in a comma-delimited list. Possible values are: (optional)
            1) gen_list        => generate a comma-delimited list of the primary key field values of reference records found from the -v switch
            2) recursive       => recursively find references to the primary key field of reference records found from the -v switch

d) Perform enum field checks - for a given database table, find all enum fields and check if there are values not defined in the enum field (most likely empty):
-N     enum checks to be executed.
-t     tables to be checked. Possible values are:
            1) all     => perform the checks on all tables in the database (Caution: could be slow)
            2) a comma-delimited list of table names

e) Perform quantity units field checks - for a given database table, find all quantity fields and check if there are undefined values in the corresponding units field (most likely empty):
-Q     quantity units checks to be executed.
-t     tables to be checked. Possible values are:
            1) all     => perform the checks on all tables in the database (Caution: could be slow)
            2) a comma-delimited list of table names
 

-----------------
3) Miscellaneous:
-----------------
-h     print help information

Examples:
###########
To run the program in web interface mode:       DBIntegrity

To run the program in command-line mode and perform:
-foreign key checks:
       -all tables:                             DBIntegrity -d sequence -u bob -p 123 -t all
       -tables Account,Box,Contact:             DBIntegrity -d sequence -u bob -p 123 -t Account,Box,Contact
       -all tables (include null values):       DBIntegrity -d sequence -u bob -p 123 -t all -o include_nulls
-error checks:
       -all error checks defined by me:         DBIntegrity -d sequence -u bob -p 123 -e me
       -error checks \# 1,2,5:                  DBIntegrity -d sequence -u bob -p 123 -e 1,2,5
       -all error checks & notify abc\@def.ca:  DBIntegrity -d sequence -u bob -p 123 -e all -n abc\@def.ca
       -all error checks & log to /log/DB.log:  DBIntegrity -d sequence -u bob -p 123 -e all -l /log/DB.log
-reference checks:
       -field Stock_ID:                         DBIntegrity -d sequence -u bob -p 123 -f Stock_ID
       -field Stock_ID 2,5,8:                   DBIntegrity -d sequence -u bob -p 123 -f Stock_ID -v 2,5,8
       -field Stock_ID 2,5,8 & generate list:   DBIntegrity -d sequence -u bob -p 123 -f Stock_ID -v 2,5,8 -o gen_list
-index checks:
       -all tables:                             DBIntegrity.pl -d sequence -u bob -p 123 -i -t all
       -echo only fk fields                     DBIntegrity.pl -d sequence -u bob -p 123 -i -t all -o fk_only
       -add indexes for fk fields               DBIntegrity.pl -d sequence -u bob -p 123 -i -t all -o fk_only,add_index
       -Clone_Sequence table on lims-dbm        DBIntegrity.pl -d sequence:lims-dbm -u bob p 123 -i -t Clone_Sequence
-enum field checks:
       -all tables:                             DBIntegrity -d sequence -u bob -p 123 -N -t all
       -tables Plate,Stock:                     DBIntegrity -d sequence -u bob -p 123 -N -t Plate,Stock

-quantity unit field checks:
       -all tables:                             DBIntegrity -d sequence -u bob -p 123 -Q -t all
       -tables Plate,Stock:                     DBIntegrity -d sequence -u bob -p 123 -Q -t Plate,Stock
       
HELP
}

1;
