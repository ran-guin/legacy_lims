package Bio::Root::Root;
use strict;

# $Id: Root.pm,v 1.10.2.2 2002/07/01 22:38:14 sac Exp $

=head1 NAME

Bio::Root::Root - Hash-based implementation of Bio::Root::RootI

=head1 SYNOPSIS

  # any bioperl or bioperl compliant object is a RootI 
  # compliant object

  # Here's how to throw and catch an exception using the eval-based syntax.

  $obj->throw("This is an exception");

  eval {
      $obj->throw("This is catching an exception");
  };

  if( $@ ) {
      print "Caught exception";
  } else {
      print "no exception";
  }

  # Alternatively, using the new typed exception syntax in the throw() call:

    $obj->throw( -class => 'Bio::Root::BadParameter',
                 -text  => "Can't open file $file",
                 -value  => $file);

  # Exceptions can be used in an eval{} block as shown above or within
  # a try{} block if you have installed the Error.pm module.
  # Here's a brief example. For more, see Bio::Root::Exception

  use Error qw(:try);

    try {
    $obj->throw(  # arguments as above );
    }
    catch Bio::Root::FileOpenException with {
        my $err = shift;
        print "Handling exception $err\n";
   };

=head1 DESCRIPTION

This is a hashref-based implementation of the Bio::Root::RootI
interface.  Most bioperl objects should inherit from this.

See the documentation for Bio::Root::RootI for most of the methods
implemented by this module.  Only overridden methods are described
here.

=head2 Throwing Exceptions

One of the functionalities that Bio::Root::RootI provides is the
ability throw() exceptions with pretty stack traces. Bio::Root::Root
enhances this with the ability to use B<Error.pm> (available from CPAN)
if it has also been installed. 

If Error.pm has been installed, throw() will use it. This causes an
Error.pm-derived object to be thrown. This can be caught within a
C<catch{}> block, from wich you can extract useful bits of
information. If Error.pm is not installed, it will use the 
Bio::Root::RootI-based exception throwing facilty.

=head2 Typed Exception Syntax 

The typed exception syntax of throw() has the advantage of plainly
indicating the nature of the trouble, since the name of the class
is included in the title of the exception output.

To take advantage of this capability, you must specify arguments
as named parameters in the throw() call. Here are the parameters:

=over 4

=item -class

name of the class of the exception.
This should be one of the classes defined in B<Bio::Root::Exception>,
or a custom error of yours that extends one of the exceptions
defined in B<Bio::Root::Exception>.

=item -text

a sensible message for the exception

=item -value

the value causing the exception or $!, if appropriate.

=back

Note that Bio::Root::Exception does not need to be imported into
your module (or script) namespace in order to throw exceptions
via Bio::Root::Root::throw(), since Bio::Root::Root imports it.

=head2 Try-Catch-Finally Support

In addition to using an eval{} block to handle exceptions, you can
also use a try-catch-finally block structure if B<Error.pm> has been
installed in your system (available from CPAN).  See the documentation
for Error for more details.

Here's an example. See the B<Bio::Root::Exception> module for 
other pre-defined exception types:

   try {
    open( IN, $file) || $obj->throw( -class => 'Bio::Root::FileOpenException',
                                     -text => "Cannot open file $file for reading",
                                     -value => $!);
   }
   catch Bio::Root::BadParameter with {
       my $err = shift;   # get the Error object
       # Perform specific exception handling code for the FileOpenException
   }
   catch Bio::Root::Exception with {
       my $err = shift;   # get the Error object
       # Perform general exception handling code for any Bioperl exception.
   }
   otherwise {
       # A catch-all for any other type of exception
   }
   finally {
       # Any code that you want to execute regardless of whether or not
       # an exception occurred.
   };  
   # the ending semicolon is essential!


=head1 CONTACT

Functions originally from Steve Chervitz. Refactored by Ewan Birney.
Re-refactored by Lincoln Stein.

=head1 APPENDIX

The rest of the documentation details each of the object
methods. Internal methods are usually preceded with a _

=cut

#'

use vars qw(@ISA $DEBUG $ID $Revision $VERSION $VERBOSITY $ERRORLOADED);
use strict;
use Bio::Root::RootI;
use Carp 'confess';
@ISA = 'Bio::Root::RootI';

BEGIN { 
    $ID        = 'Bio::Root::Root';
    $VERSION   = 1.0;
    $Revision  = '$Id: Root.pm,v 1.10.2.2 2002/07/01 22:38:14 sac Exp $ ';
    $DEBUG     = 0;
    $VERBOSITY = 0;
    $ERRORLOADED = 0;

    # Check whether or not Error.pm is available.

    # $main::DONT_USE_ERROR is intended for testing purposes and also
    # when you don't want to use the Error module, even if it is installed.
    # Just put a BEGIN { $DONT_USE_ERROR = 1; } at the top of your script.
    if( not $main::DONT_USE_ERROR ) {
        if ( eval "require Error"  ) {
            import Error qw(:try);
            require Bio::Root::Exception;
            $ERRORLOADED = 1;
            $Error::Debug = 1; # enable verbose stack trace 
        }
    } 
    if( !$ERRORLOADED ) {
        require Carp; import Carp qw( confess );
    }
    $main::DONT_USE_ERROR;  # so that perl -w won't warn "used only once"

}

=head2 _create_object()

 Title   : _create_object()
 Usage   : $obj->create_object(@args)
 Function: Method which actually creates the blessed  hashref
 Returns : Blessed hashref
 Args    : Ignored

Override this method, the new() method, or _initialize() to make a
custom constructor.

=cut

sub _create_object {
  my ($class,@args) = @_;
  $class = ref($class) if ref($class);
  return bless {},$class;
}

sub verbose {
   my ($self,$value) = @_;
   # allow one to set global verbosity flag
   if( $DEBUG ) { return $DEBUG }
   
   if(ref($self) && (defined $value || ! defined $self->{'_root_verbose'}) ) {
       $value = 0 unless defined $value;
       $self->{'_root_verbose'} = $value;
   }
   return (ref($self) ? $self->{'_root_verbose'} : $VERBOSITY);
}

sub _register_for_cleanup {
  my ($self,$method) = @_;
  if($method) {
    if(! exists($self->{'_root_cleanup_methods'})) {
      $self->{'_root_cleanup_methods'} = [];
    }
    push(@{$self->{'_root_cleanup_methods'}},$method);
  }
}

sub _unregister_for_cleanup {
  my ($self,$method) = @_;
  my @methods = grep {$_ ne $method} $self->_cleanup_methods;
  $self->{'_root_cleanup_methods'} = \@methods;
}


sub _cleanup_methods {
  my $self = shift;
  my $methods = $self->{'_root_cleanup_methods'} or return;
  @$methods;
}

=head2 throw

 Title   : throw
 Usage   : $obj->throw("throwing exception message");
           or
           $obj->throw( -class => 'Bio::Root::Exception',
                        -text  => "throwing exception message",
                        -value => $bad_value  );
 Function: Throws an exception, which, if not caught with an eval or
           a try block will provide a nice stack trace to STDERR 
           with the message.
           If Error.pm is installed, and if a -class parameter is
           provided, Error::throw will be used, throwing an error 
           of the type specified by -class.
           If Error.pm is installed and no -class parameter is provided
           (i.e., a simple string is given), A Bio::Root::Exception 
           is thrown.
 Returns : n/a
 Args    : A string giving a descriptive error message
           Named parameters:
           '-class'  a string for the name of a class that derives 
                     from Error.pm, such as any of the exceptions 
                     defined in Bio::Root::Exception.
                     Default class: Bio::Root::Exception
           '-text'   a string giving a descriptive error message
           '-value'  the value causing the exception, or $! (optional)

           Thus, if only a string argument is given, and Error.pm is available,
           this is equivalent to the arguments:
                 -text  => "message",
                 -class => Bio::Root::Exception
 Comments : If Error.pm is installed, and you don't want to use it
            for some reason, you can block the use of Error.pm by
           Bio::Root::Root::throw() by defining a scalar named
           $main::DONT_USE_ERROR (define it in your main script
           and you don't need the main:: part) and setting it to 
           a true value.

=cut

#'

sub throw{
   my ($self,@args) = @_;
   
   my ( $text, $class ) = $self->_rearrange( [qw(TEXT CLASS)], @args);

   if( $ERRORLOADED ) {
#       print STDERR "  Calling Error::throw\n\n";

       # Enable re-throwing of Error objects.
       # If the error is not derived from Bio::Root::Exception, 
       # we can't guarantee that the Error's value was set properly
       # and, ipso facto, that it will be catchable from an eval{}.
       # But chances are, if you're re-throwing non-Bio::Root::Exceptions,
       # you're probably using Error::try(), not eval{}.
       # TODO: Fix the MSG: line of the re-thrown error. Has an extra line
       # containing the '----- EXCEPTION -----' banner.
       if( ref($args[0])) {
           if( $args[0]->isa('Error')) {
               my $class = ref $args[0];
               throw $class ( @args );
           } else {
               my $text .= "\nWARNING: Attempt to throw a non-Error.pm object: " . ref$args[0];
               my $class = "Bio::Root::Exception";
               throw $class ( '-text' => $text, '-value' => $args[0] ); 
           }
       } else {
           $class ||= "Bio::Root::Exception";
   
	   my %args;
	   if( @args % 2 == 0 && $args[0] =~ /^-/ ) {
	       %args = @args;
	       $args{-text} = $text;
	       $args{-object} = $self;
	   }
 
           throw $class ( %args || @args );
       }
   }
   else {
#       print STDERR "  Not calling Error::throw\n\n";
       $class ||= '';
       my $std = $self->stack_trace_dump();
       my $title = "------------- EXCEPTION $class -------------";
       my $footer = "\n" . '-' x CORE::length($title);

       my $out = "\n$title\n" .
           "MSG: $text\n". $std . $footer . "\n";

       die $out;
   }
}


1;

