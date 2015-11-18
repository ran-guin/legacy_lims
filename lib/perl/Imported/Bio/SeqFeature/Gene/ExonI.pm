# $Id: ExonI.pm,v 1.4.2.1 2002/04/18 13:05:25 jason Exp $
#
# BioPerl module for Bio::SeqFeature::Gene::ExonI
#
# Cared for by Hilmar Lapp <hlapp@gmx.net>
#
# Copyright Hilmar Lapp
#
# You may distribute this module under the same terms as perl itself

# POD documentation - main docs before the code

=head1 NAME

Bio::SeqFeature::Gene::ExonI - Interface for a feature representing an exon

=head1 SYNOPSIS

See documentation of methods.

=head1 DESCRIPTION

A feature representing an exon. An exon in this definition is
transcribed and at least for one particular transcript not spliced out
of the pre-mRNA. However, it does not necessarily code for amino acid.

=head1 FEEDBACK

=head2 Mailing Lists

User feedback is an integral part of the evolution of this
and other Bioperl modules. Send your comments and suggestions preferably
 to one of the Bioperl mailing lists.
Your participation is much appreciated.

  bioperl-l@bioperl.org          - General discussion
  http://bio.perl.org/MailList.html             - About the mailing lists

=head2 Reporting Bugs

Report bugs to the Bioperl bug tracking system to help us keep track
 the bugs and their resolution.
 Bug reports can be submitted via email or the web:

  bioperl-bugs@bio.perl.org
  http://bio.perl.org/bioperl-bugs/

=head1 AUTHOR - Hilmar Lapp

Email hlapp@gmx.net

Describe contact details here

=head1 APPENDIX

The rest of the documentation details each of the object methods.
Internal methods are usually preceded with a _

=cut


# Let the code begin...


package Bio::SeqFeature::Gene::ExonI;
use vars qw(@ISA);
use strict;

use Carp;
use Bio::SeqFeatureI;

@ISA = qw(Bio::SeqFeatureI);


=head2 is_coding

 Title   : is_coding
 Usage   : if($exon->is_coding()) {
                   # do something
           }
 Function: Whether or not the exon codes for amino acid.
 Returns : TRUE if the object represents a feature translated into protein,
           and FALSE otherwise.
 Args    : 


=cut

sub is_coding {
    my ($self) = @_;
    $self->throw_not_implemented();
}

=head2 cds

 Title   : cds()
 Usage   : $cds = $exon->cds();
 Function: Get the coding sequence of the exon as a sequence object.

           The returned sequence object must be in frame 0, i.e., the first
           base starts a codon.

           An implementation may return undef, indicating that a coding
           sequence does not exist, e.g. for a UTR (untranslated region).

 Returns : A L<Bio::PrimarySeqI> implementing object.
 Args    : 


=cut

sub cds {
    my ($self) = @_;
    $self->throw_not_implemented();
}

1;
