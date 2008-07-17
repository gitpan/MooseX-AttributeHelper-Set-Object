package MooseX::AttributeHelper::Set::Object;
use Moose;
use MooseX::AttributeHelpers;
use MooseX::AttributeHelper::MethodProvider::Set::Object;
use Set::Object;


=head1 NAME

MooseX::AttributeHelper::Set::Object - Attribute helper for Set::Object

=head1 VERSION

Version 0.01 released 07/16/2008

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    package Publisher;
    use Moose;
    use MooseX::AttributeHelper::Set::Object;

    has _subscribers => (
        metaclass => 'Set::Object',
        is        => 'ro',
        provides  => {
            insert   => 'subscribe',
            remove   => 'unsubscribe',
            invert   => 'toggle_subscription',
            clear    => 'remove_all_subscribers',
            elements => 'subscribers',
            contains => 'is_subscriber',
            size     => 'num_subscribers',
        },
    );

=head1 DESCRIPTION

This module implements a Set attribute using the Set::Object class. See
L<MooseX::AttributeHelper::MethodProvider::Set::Object> for the list of
methods it provides.

=cut


extends 'MooseX::AttributeHelpers::Base';

use Moose::Util::TypeConstraints 'class_type';
class_type 'Set::Object';
sub helper_type { 'Set::Object' }

has '+method_provider' => (
    default => 'MooseX::AttributeHelper::MethodProvider::Set::Object',
);

before process_options_for_provides => sub {
    my ($self, $options, $name) = @_;
    if ((my $type = $self->helper_type) && !exists $options->{isa}) {
        $options->{isa} = $type;
    }
    $options->{default} = sub { Set::Object->new }
        unless exists $options->{default};
};

no Moose;

package # hide me from search.cpan.org
    Moose::Meta::Attribute::Custom::Set::Object;
sub register_implementation { 'MooseX::AttributeHelper::Set::Object' }


=head1 SEE ALSO

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
