#!perl -T
use strict;
use warnings;
use Test::More tests => 13;
use Test::Deep;

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

package Foo;

sub new { bless {}, shift }

package Bar;

sub new { bless {}, shift }

package main;

my $publisher = Publisher->new;
my $foo = Foo->new;
my $bar = Bar->new;

sub check_state {
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    my ($elements) = @_;
    cmp_bag([$publisher->subscribers], $elements);
    is($publisher->num_subscribers, @$elements);
}

$publisher->subscribe($foo);
check_state([$foo]);
$publisher->subscribe($bar, 'baz');
check_state([$foo, $bar, 'baz']);
$publisher->unsubscribe($bar);
check_state([$foo, 'baz']);
$publisher->toggle_subscription($bar, 'baz');
check_state([$foo, $bar]);
ok($publisher->is_subscriber($foo));
ok($publisher->is_subscriber($bar));
ok(!$publisher->is_subscriber('baz'));
$publisher->remove_all_subscribers;
check_state([]);
