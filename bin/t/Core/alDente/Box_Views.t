#!/usr/bin/perl
## ./template/unit_test_template.txt ##
#####################################
#
# Standard Template for unit testing
#
#####################################

### Template 4.1 ###

use FindBin;
use lib $FindBin::RealBin . "/../../../../lib/perl";
use lib $FindBin::RealBin . "/../../../../lib/perl/Core";
use lib $FindBin::RealBin . "/../../../../lib/perl/Imported";
use lib $FindBin::RealBin . "/../../../../lib/perl/Plugins";

use Data::Dumper;
use Test::Simple no_plan;
use Test::More;
use Test::Differences;
use RGTools::Unit_Test;

use Getopt::Long;
&GetOptions(
	    'method=s'    => \$opt_method,
	);

my $method = $opt_method;                ## Allow user to specify method(s) to test 
my $dbc;                                 ## only used for modules enabling database connections

############################
use alDente::Box_Views;
############################

############################################


use_ok("alDente::Box_Views");

if ( !$method || $method =~ /\bnew\b/ ) {
    can_ok("alDente::Box_Views", 'new');
    {
        ## <insert tests for new method here> ##
    }
}

if ( !$method || $method =~ /\bhome_page\b/ ) {
    can_ok("alDente::Box_Views", 'home_page');
    {
        ## <insert tests for home_page method here> ##
    }
}

if ( !$method || $method =~ /\bgeneric_home_page\b/ ) {
    can_ok("alDente::Box_Views", 'generic_home_page');
    {
        ## <insert tests for generic_home_page method here> ##
    }
}

## END of TEST ##

ok( 1 ,'Completed Box_Views test');

exit;
