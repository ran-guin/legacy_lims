#!/usr/bin/perl

################################
#
# Template for unit testing
#
################################

use FindBin;
use lib $FindBin::RealBin . "/../../../../../lib/perl";
use lib $FindBin::RealBin . "/../../../../../lib/perl/Core";
use lib $FindBin::RealBin . "/../../../../../lib/perl/Departments";
use lib $FindBin::RealBin . "/../../../../../lib/perl/Imported";

use Data::Dumper;
use Test::Simple no_plan;
use Test::More;
use SDB::CustomSettings qw(%Configs);

use Getopt::Long;
&GetOptions(
	    'method=s'    => \$opt_method,
	);

my $method = $opt_method;                ## Allow user to specify method(s) to test 

my $host = $Configs{UNIT_TEST_HOST};
#my $dbase = 'alDente_unit_test_DB';
my $dbase = $Configs{UNIT_TEST_DATABASE};
my $user   = 'unit_tester';
my $pwd    = 'unit_tester';

require SDB::DBIO;
my $dbc = new SDB::DBIO(
                        -host     => $host,
                        -dbase    => $dbase,
                        -user     => $user,
                        -password => $pwd,
                        -connect  => 1,
                        );


sub self {
    my %override_args = @_;
    my %args;

    # Set default values
    $args{-dbc} = defined $override_args{-dbc} ? $override_args{-dbc} : $dbc;

    return new Statistics_Controller(%args);

}

############################################################
use_ok("Mapping::Statistics_Controller");

if ( !$method || $method =~ /\bnew\b/ ) {
    can_ok("Mapping::Statistics_Controller", 'new');
    {
        ## <insert tests for new method here> ##
    }
}

if ( !$method || $method =~ /\bsetup\b/ ) {
    can_ok("Mapping::Statistics_Controller", 'setup');
    {
        ## <insert tests for setup method here> ##
    }
}

if ( !$method || $method =~ /\bmain\b/ ) {
    can_ok("Mapping::Statistics_Controller", 'main');
    {
        ## <insert tests for main method here> ##
    }
}

if ( !$method || $method =~ /\bgenerate_summary\b/ ) {
    can_ok("Mapping::Statistics_Controller", 'generate_summary');
    {
        ## <insert tests for generate_summary method here> ##
    }
}

## END of TEST ##

ok( 1 ,'Completed Statistics_Controller test');

exit;
