package main;

use 5.018;

use strict;
use warnings;

use Venus;
use Venus::Test;

my $test = test(__FILE__);

=name

Venus

=cut

$test->for('name');

=tagline

Methods

=cut

$test->for('tagline');

=abstract

Methods in Venus

=cut

$test->for('abstract');

=synopsis

  package Calculator;

  use Venus::Class;

  sub add {
    my ($self, $a, $b) = @_;
    return $a + $b;
  }

  package main;

  my $calc = Calculator->new;

  $calc->add(2, 3);

  # 5

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 5);

  $result
});

=description

Methods in Venus classes are defined as regular Perl subroutines. Venus provides
patterns for method dispatch including the C<try> method from
L<Venus::Role::Tryable> for safe method invocation.

=cut

$test->for('description');

=examples

The following are examples of methods in Venus.

=cut

=example method.0

Define methods as regular subroutines.

=example-1 method.0

  package Greeter;

  use Venus::Class;

  attr 'name';

  sub greet {
    my ($self, $greeting) = @_;
    return "$greeting, " . $self->name . "!";
  }

  package main;

  my $greeter = Greeter->new(name => 'World');

  my $result = $greeter->greet('Hello');

  # "Hello, World!"

=cut

$test->for('example', 1, 'method.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Hello, World!');

  $result
});

=example method.1

Use C<can> to check if an object has a method.

=example-1 method.1

  package Checker;

  use Venus::Class;

  sub exists { 1 }

  package main;

  my $checker = Checker->new;

  my $result = $checker->can('exists') ? 'yes' : 'no';

  # "yes"

=cut

$test->for('example', 1, 'method.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'yes');

  $result
});

=example method.2

Use C<try> from L<Venus::Role::Tryable>, or C<maybe> from
L<Venus::Role::Catchable> to safely invoke methods.

=example-1 method.2

  package Divider;

  use Venus::Class;

  with 'Venus::Role::Tryable';
  with 'Venus::Role::Catchable';

  sub divide {
    my ($self, $a, $b) = @_;
    die "Cannot divide by zero" if $b == 0;
    return $a / $b;
  }

  package main;

  my $divider = Divider->new;

  my $result = $divider->maybe('divide', 10, 2);

  # 5

=cut

$test->for('example', 1, 'method.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 5);

  $result
});

=example method.3

Methods can call other methods on the same object.

=example-1 method.3

  package Account;

  use Venus::Class;

  attr 'balance';

  sub deposit {
    my ($self, $amount) = @_;
    $self->balance(($self->balance // 0) + $amount);
  }

  sub withdraw {
    my ($self, $amount) = @_;
    $self->balance(($self->balance // 0) - $amount);
  }

  sub transfer {
    my ($self, $amount, $target) = @_;
    $self->withdraw($amount);
    $target->deposit($amount);
    return $self->balance;
  }

  package main;

  my $source = Account->new(balance => 100);
  my $target = Account->new(balance => 50);

  my $result = $source->transfer(25, $target);

  # 75 (source balance after transfer)

=cut

$test->for('example', 1, 'method.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 75);

  $result
});

=layout

name
abstract
synopsis
description
examples: example
partials
authors
license
project

=cut

$test->for('layout');

# END

$test->do('render', './topics/methods.pod')->done;
