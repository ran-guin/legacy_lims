# $Id: SearchResultEventBuilder.pm,v 1.14 2002/02/06 16:09:25 jason Exp $
#
# BioPerl module for Bio::SearchIO::SearchResultEventBuilder
#
# Cared for by Jason Stajich <jason@bioperl.org>
#
# Copyright Jason Stajich
#
# You may distribute this module under the same terms as perl itself

# POD documentation - main docs before the code

=head1 NAME

Bio::SearchIO::SearchResultEventBuilder - Event Handler for SearchIO events.

=head1 SYNOPSIS

# Do not use this object directly, this object is part of the SearchIO
# event based parsing system.

=head1 DESCRIPTION

This object handles Search Events generated by the SearchIO classes
and build appropriate Bio::Search::* objects from them.

=head1 FEEDBACK

=head2 Mailing Lists

User feedback is an integral part of the evolution of this and other
Bioperl modules. Send your comments and suggestions preferably to
the Bioperl mailing list.  Your participation is much appreciated.

  bioperl-l@bioperl.org              - General discussion
  http://bioperl.org/MailList.shtml  - About the mailing lists

=head2 Reporting Bugs

Report bugs to the Bioperl bug tracking system to help us keep track
of the bugs and their resolution. Bug reports can be submitted via
email or the web:

  bioperl-bugs@bioperl.org
  http://bioperl.org/bioperl-bugs/

=head1 AUTHOR - Jason Stajich

Email jason@bioperl.org

Describe contact details here

=head1 CONTRIBUTORS

Additional contributors names and emails here

=head1 APPENDIX

The rest of the documentation details each of the object methods.
Internal methods are usually preceded with a _

=cut


# Let the code begin...


package Bio::SearchIO::SearchResultEventBuilder;
use vars qw(@ISA %KNOWNEVENTS);
use strict;

use Bio::Root::Root;
use Bio::SearchIO::EventHandlerI;
use Bio::Search::Result::GenericResult;
use Bio::Search::Hit::GenericHit;
use Bio::Search::HSP::GenericHSP;


@ISA = qw(Bio::Root::Root Bio::SearchIO::EventHandlerI);

=head2 new

 Title   : new
 Usage   : my $obj = new Bio::SearchIO::SearchResultEventBuilder();
 Function: Builds a new Bio::SearchIO::SearchResultEventBuilder object 
 Returns : Bio::SearchIO::SearchResultEventBuilder
 Args    :


=cut

sub new {
  my($class,@args) = @_;

  my $self = $class->SUPER::new(@args);
  return $self;
}

=head2 will_handle

 Title   : will_handle
 Usage   : if( $handler->will_handle($event_type) ) { ... }
 Function: Tests if this event builder knows how to process a specific event
 Returns : boolean
 Args    : event type name


=cut

sub will_handle{
   my ($self,$type) = @_;
   # these are the events we recognize
   return ( $type eq 'hsp' || $type eq 'hit' || $type eq 'result' );
}

=head2 SAX methods

=cut

=head2 start_result

 Title   : start_result
 Usage   : $handler->start_result($resulttype)
 Function: Begins a result event cycle
 Returns : none 
 Args    : Type of Report

=cut

sub start_result {
   my ($self,$type) = @_;
   $self->{'_resulttype'} = $type;
   $self->{'_subjects'} = [];   
   return;
}

=head2 end_result

 Title   : end_result
 Usage   : my @results = $parser->end_result
 Function: Finishes a result handler cycle Returns : A Bio::Search::Result::ResultI
 Args    : none

=cut

sub end_result {
    my ($self,$type,$data) = @_;

    my $result = new Bio::Search::Result::GenericResult
	('-database_name'           => $data->{'dbname'},
	 '-database_letters'        => $data->{'dblets'},
	 '-database_entries'        => $data->{'dbsize'},
	 '-query_name'              => $data->{'queryname'},
	 '-query_length'            => $data->{'querylen'},
	 '-query_accession'         => $data->{'queryacc'},
	 '-query_description'       => $data->{'querydesc'},
	 
#	 '-program_name'            => $data->{'programname'},
#	 '-program_version'         => $data->{'programver'},
	 '-algorithm'              => $type,
	 '-algorithm_version'      => $data->{'programver'},	 
	 '-parameters'        => $data->{'param'},
	 '-statistics'        => $data->{'stat'},
	 '-hits'              => $self->{'_hits'});

    $self->{'_hits'} = [];
    return $result;
}

=head2 start_hsp

 Title   : start_hsp
 Usage   : $handler->start_hsp($name,$data)
 Function: Begins processing a HSP event
 Returns : none
 Args    : type of element 
           associated data (hashref)

=cut

sub start_hsp {
    my ($self,@args) = @_;
    return;
}

=head2 end_hsp

 Title   : end_hsp
 Usage   : $handler->end_hsp()
 Function: Finish processing a HSP event
 Returns : none
 Args    : type of event and associated hashref


=cut

sub end_hsp {
    my ($self,$type,$data) = @_;
    
    # this code is to deal with the fact that Blast XML data
    # always has start < end and one has to infer strandedness
    # from the frame which is a problem for the Search::HSP object
    # which expect to be able to infer strand from the order of 
    # of the begin/end of the query and hit coordinates

    if( defined $data->{'queryframe'} && # this is here to protect from undefs
	(( $data->{'queryframe'} < 0 && 
	   $data->{'querystart'} < $data->{'queryend'} ) ||       
	 $data->{'queryframe'} > 0 && 
	 ( $data->{'querystart'} > $data->{'queryend'} ) ) 
	)
    { 
	# swap
	($data->{'querystart'},
	 $data->{'queryend'}) = ($data->{'queryend'},				 $data->{'querystart'});
    } 
    if( defined $data->{'hitframe'} && # this is here to protect from undefs
	((defined $data->{'hitframe'} && $data->{'hitframe'} < 0 && 
	  $data->{'hitstart'} < $data->{'hitend'} ) ||       
	 defined $data->{'hitframe'} && $data->{'hitframe'} > 0 && 
	 ( $data->{'hitstart'} > $data->{'hitend'} ) )
	) 
    { 
	# swap
	($data->{'hitstart'},
	 $data->{'hitend'}) = ($data->{'hitend'},
			       $data->{'hitstart'});
    }
    $data->{'queryframe'} ||= 0;
    $data->{'hitframe'} ||= 0;
    # handle Blast 2.1.2 which did not support data member: hsp_align-len
    
    $data->{'querylen'} ||= length $data->{'queryseq'};
    $data->{'hitlen'}   ||= length $data->{'hitseq'};
    $data->{'hsplen'}   ||= length $data->{'homolseq'};
    

    my $hsp = new Bio::Search::HSP::GenericHSP
	(
	 '-algorithm'     => $type,
	 '-score'         => $data->{'score'} || $data->{'swscore'},
	 '-bits'          => $data->{'bits'},
	 '-identical'     => $data->{'identical'},
	 '-hsp_length'    => $data->{'hsplen'},
	 '-conserved'     => $data->{'conserved'},
	 '-hsp_gaps'      => $data->{'gaps'},
	 '-hit_gaps'      => $data->{'hitgaps'},
	 '-query_gaps'    => $data->{'querygaps'},
	 '-evalue'        => $data->{'evalue'},
	 '-pvalue'        => $data->{'pvalue'},
	 '-query_start'   => $data->{'querystart'},
	 '-query_end'     => $data->{'queryend'},
	 '-hit_start'     => $data->{'hitstart'},
	 '-hit_end'       => $data->{'hitend'},
	 '-query_seq'     => $data->{'queryseq'},
	 '-hit_seq'       => $data->{'hitseq'},
	 '-homology_seq'  => $data->{'homolseq'},
	 '-query_length'  => $data->{'querylen'},
	 '-hit_length'    => $data->{'hitlen'},
	 '-query_name'    => $data->{'queryname'},
	 '-hit_name'      => $data->{'hitname'},
	 '-query_frame'   => $data->{'queryframe'},
	 '-hit_frame'     => $data->{'hitframe'},
	 );
    push @{$self->{'_hsps'}}, $hsp;
    return $hsp;
}


=head2 start_hit

 Title   : start_hit
 Usage   : $handler->start_hit()
 Function: Starts a Hit event cycle
 Returns : none
 Args    : type of event and associated hashref


=cut

sub start_hit{
    my ($self,$type) = @_;
    $self->{'_hsps'} = [];    
    return;
}


=head2 end_hit

 Title   : end_hit
 Usage   : $handler->end_hit()
 Function: Ends a Hit event cycle
 Returns : Bio::Search::Hit::HitI object
 Args    : type of event and associated hashref


=cut

sub end_hit{
   my ($self,$type,$data) = @_;   
    my $hit = new Bio::Search::Hit::GenericHit
	( '-algorithm' => $type,
	  '-name'        => $data->{'hitname'}, 
	  '-length'      => $data->{'hitlen'},
	  '-accession'   => $data->{'hitacc'},
	  '-description' => $data->{'hitdesc'},
	  '-significance'=> $data->{'hitsignif'},
	  '-score'       => $data->{'hitscore'},
	  '-hsps'        => $self->{'_hsps'});
   push @{$self->{'_hits'}}, $hit;
   $self->{'_hsps'} = [];
   return $hit;
}

1;