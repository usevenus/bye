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

Inheritance

=cut

$test->for('tagline');

=abstract

Class Inheritance in Venus

=cut

$test->for('abstract');

=synopsis

  package Animal;

  use Venus::Class;

  attr 'name';

  sub speak { 'generic sound' }

  package Cat;

  use Venus::Class;

  base 'Animal';

  sub speak { 'meow' }

  package main;

  my $cat = Cat->new(name => 'Whiskers');

  $cat->speak;

  # "meow"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'meow');

  $result
});

=description

Venus provides C<base> for class inheritance. Child classes inherit attributes
and methods from parent classes. Use C<from> when you want to inherit with
interface auditing via the parent's C<AUDIT> method.

=cut

$test->for('description');

=examples

The following are examples of inheritance in Venus.

=cut

=example base.0

Use C<base> to inherit from a parent class.

=example-1 base.0

  package Vehicle;

  use Venus::Class;

  attr 'speed';

  sub move { 'moving' }

  package Car;

  use Venus::Class;

  base 'Vehicle';

  sub honk { 'beep' }

  package main;

  my $car = Car->new(speed => 60);

  my $result = $car->move . ' at ' . $car->speed . ' mph';

  # "moving at 60 mph"

=cut

$test->for('example', 1, 'base.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'moving at 60 mph');

  $result
});

=example base.1

Child classes can override parent methods, even if they're attributes.

=example-1 base.1

  package Shape;

  use Venus::Class;

  attr 'area';

  package Square;

  use Venus::Class;

  base 'Shape';

  attr 'side';

  sub area {
    my ($self) = @_;
    return $self->side ** 2;
  }

  package main;

  my $square = Square->new(side => 5);

  my $result = $square->area;

  # 25

=cut

$test->for('example', 1, 'base.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 25);

  $result
});

=example base.2

Use C<SUPER::> to call the parent's method, or C<super> from
L<Venus::Role::Superable>.

=example-1 base.2

  package Logger;

  use Venus::Class;

  sub log {
    my ($self, $msg) = @_;
    return "[LOG] $msg";
  }

  package TimestampLogger;

  use Venus::Class;

  base 'Logger';
  with 'Venus::Role::Superable';

  sub log {
    my ($self, $msg) = @_;
    my $base = $self->super($msg);
    return "[" . time() . "] $base";
  }

  package main;

  my $logger = TimestampLogger->new;

  my $result = $logger->log('test');

  # "[1234567890] [LOG] test" (timestamp varies)

=cut

$test->for('example', 1, 'base.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->like($result, qr/\[\d+\] \[LOG\] test/);

  $result
});

=example from.0

Use C<from> to inherit with interface auditing.

=example-1 from.0

  package Serializable;

  use Venus::Class;

  sub AUDIT {
    my ($self, $from) = @_;
    die "$from must implement 'encode'" unless $from->can('encode');
  }

  package JsonSerializable;

  use Venus::Class;

  from 'Serializable';

  sub encode {
    my ($self, $data) = @_;
    return '{"ok":1}';
  }

  package main;

  my $json = JsonSerializable->new;

  my $result = $json->encode({ ok => 1 });

  # '{"ok":1}'

=cut

$test->for('example', 1, 'from.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '{"ok":1}');

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

$test->do('render', './topics/inheritance.pod')->done;
