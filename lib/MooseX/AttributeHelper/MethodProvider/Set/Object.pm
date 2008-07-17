package MooseX::AttributeHelper::MethodProvider::Set::Object;
use Moose::Role;

=head1 NAME

MooseX::AttributeHelper::MethodProvider::Set::Object - implementation of the
provided methods for the Set::Object attribute helper

=head1 PROVIDED METHODS

=over 4

=item B<insert>

=item B<remove>

=item B<invert>

=item B<clear>

=item B<elements>

=item B<contains>

=item B<size>

=back

These methods all do the same thing as their counterparts in L<Set::Object>,
including taking list arguments where appropriate.

=cut


sub insert : method {
    my ($attr, $reader, $writer) = @_;
    return sub { $reader->($_[0])->insert(@_[1..$#_]) }
}

sub remove : method {
    my ($attr, $reader, $writer) = @_;
    return sub { $reader->($_[0])->remove(@_[1..$#_]) }
}

sub invert : method {
    my ($attr, $reader, $writer) = @_;
    return sub { $reader->($_[0])->invert(@_[1..$#_]) }
}

sub clear : method {
    my ($attr, $reader, $writer) = @_;
    return sub { $reader->($_[0])->clear }
}

sub elements : method {
    my ($attr, $reader, $writer) = @_;
    return sub { $reader->($_[0])->elements }
}

sub contains : method {
    my ($attr, $reader, $writer) = @_;
    return sub { $reader->($_[0])->contains(@_[1..$#_]) }
}

sub size : method {
    my ($attr, $reader, $writer) = @_;
    return sub { $reader->($_[0])->size }
}


=head1 SEE ALSO

L<MooseX::AttributeHelper::Set::Object>

L<Moose>, L<MooseX::AttributeHelpers>, L<Set::Object>

=head1 AUTHOR

Jesse Luehrs, C<< <jluehrs2 at uiuc.edu> >>

=head1 BUGS

No known bugs.

Please report any bugs through RT: email
C<bug-moosex-attributehelper-set-object at rt.cpan.org>, or browse
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-AttributeHelper-Set-Object>.

=head1 SUPPORT

You can find this documentation for this module with the perldoc command.

    perldoc MooseX::AttributeHelper::Set::Object

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooseX-AttributeHelper-Set-Object>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-AttributeHelper-Set-Object>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-AttributeHelper-Set-Object>

=item * Search CPAN

L<http://search.cpan.org/dist/MooseX-AttributeHelper-Set-Object>

=back

=head1 COPYRIGHT AND LICENSE

Copyright 2008 Jesse Luehrs.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
