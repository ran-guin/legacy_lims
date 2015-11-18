#-----------------------------------------------------------------
# $Id: HitI.pm,v 1.9.2.2 2002/06/19 22:17:08 jason Exp $
#
# BioPerl module Bio::Search::Hit::HitI
#
# Cared for by Steve Chervitz <sac@bioperl.org>
#
# Originally created by Aaron Mackey <amackey@virginia.edu>
#
# You may distribute this module under the same terms as perl itself
#-----------------------------------------------------------------

# POD documentation - main docs before the code

=head1 NAME

Bio::Search::Hit::HitI - Interface for a hit in a similarity search result

=head1 SYNOPSIS

Bio::Search::Hit::HitI objects should not be instantiated since this
module defines a pure interface.

Given an object that implements the Bio::Search::Hit::HitI  interface,
you can do the following things with it:

    $hit_name = $hit->name();

    $desc = $hit->description();

    $len = $hit->length

    $alg = $hit->algorithm();

    $score = $hit->raw_score();

    $significance = $hit->significance();

    while( $hsp = $obj->next_hsp()) { ... }

=head1 DESCRIPTION

    Bio::Search::Hit::* objects are data structures that contain information
about specific hits obtained during a library search.  Some information will
be algorithm-specific, but others will be generally defined.

=head1 FEEDBACK

=head2 Mailing Lists

User feedback is an integral part of the evolution of this and other
Bioperl modules. Send your comments and suggestions preferably to one
of the Bioperl mailing lists.  Your participation is much appreciated.

  bioperl-l@bioperl.org             - General discussion
  http://bio.perl.org/MailList.html - About the mailing lists

=head2 Reporting Bugs

Report bugs to the Bioperl bug tracking system to help us keep track
the bugs and their resolution.  Bug reports can be submitted via email
or the web:

  bioperl-bugs@bio.perl.org
  http://bio.perl.org/bioperl-bugs/

=head1 AUTHOR - Aaron Mackey, Steve Chervitz

Email amackey@virginia.edu  (original author)
Email sac@bioperl.org

=head1 COPYRIGHT

Copyright (c) 1999-2001 Aaron Mackey, Steve Chervitz. All Rights Reserved.

=head1 DISCLAIMER

This software is provided "as is" without warranty of any kind.

=head1 APPENDIX

The rest of the documentation details each of the object
methods. Internal methods are usually preceded with a _

=cut

# Let the code begin...

package Bio::Search::Hit::HitI;

use Bio::Root::RootI;

use vars qw(@ISA);
use strict;

@ISA = qw( Bio::Root::RootI );


=head2 name

 Title   : name
 Usage   : $hit_name = $hit->name();
 Function: returns the name of the Hit sequence
 Returns : a scalar string
 Args    : none

=cut

sub name {
    my ($self,@args) = @_;
    $self->throw_not_implemented;
}

=head2 description

 Title   : description
 Usage   : $desc = $hit->description();
 Function: Retrieve the description for the hit
 Returns : a scalar string
 Args    : none

=cut

sub description {
    my ($self,@args) = @_;
    $self->throw_not_implemented;
}

=head2 accession

 Title   : accession
 Usage   : $acc = $hit->accession();
 Function: Retrieve the accession (if available) for the hit
 Returns : a scalar string (empty string if not set)
 Args    : none

=cut

sub accession {
    my ($self,@args) = @_;
    $self->throw_not_implemented;
}

=head2 length

 Title   : length
 Usage   : my $len = $hit->length
 Function: Returns the length of the hit 
 Returns : integer
 Args    : none

=cut

sub length {
   my ($self,@args) = @_;
   $self->throw_not_implemented;
}


=head2 algorithm

 Title   : algorithm
 Usage   : $alg = $hit->algorithm();
 Function: Gets the algorithm specification that was used to obtain the hit
           For BLAST, the algorithm denotes what type of sequence was aligned 
           against what (BLASTN: dna-dna, BLASTP prt-prt, BLASTX translated 
           dna-prt, TBLASTN prt-translated dna, TBLASTX translated 
           dna-translated dna).
 Returns : a scalar string 
 Args    : none

=cut

sub algorithm {
    my ($self,@args) = @_;
    $self->throw_not_implemented;
}

=head2 raw_score

 Title   : raw_score
 Usage   : $score = $hit->raw_score();
 Function: Gets the "raw score" generated by the algorithm.  What
           this score is exactly will vary from algorithm to algorithm,
           returning undef if unavailable.
 Returns : a scalar value
 Args    : none

=cut

sub raw_score {
    my ($self,@args) = @_;
    $self->throw_not_implemented;
}

=head2 significance

 Title   : significance
 Usage   : $significance = $hit->significance();
 Function: Used to obtain the E or P value of a hit, i.e. the probability that
           this particular hit was obtained purely by random chance.  If
           information is not available (nor calculatable from other
           information sources), return undef.
 Returns : a scalar value or undef if unavailable
 Args    : none

=cut

sub significance {
    my ($self,@args) = @_;
    $self->throw_not_implemented;
}

=head2 next_hsp

 Title    : next_hsp
 Usage    : while( $hsp = $obj->next_hsp()) { ... }
 Function : Returns the next available High Scoring Pair
 Example  : 
 Returns  : Bio::Search::HSP::HSPI object or null if finished
 Args     : none

=cut

sub next_hsp {
    my ($self,@args) = @_;
    $self->throw_not_implemented;
}

=head2 hits

 Title   : hits
 Usage   :
 Function:
 Returns : 
 Args    :


=cut

sub hits{
   my ($self,@args) = @_;


}


1;




