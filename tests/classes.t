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

Classes

=cut

$test->for('tagline');

=abstract

Class Building in Venus

=cut

$test->for('abstract');

=synopsis

  package Person;

  use Venus::Class;

  attr 'name';
  attr 'age';

  package main;

  my $person = Person->new(name => 'Alice', age => 30);

  $person->name;

  # "Alice"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Alice');

  $result
});

=description

L<Venus::Class> provides a DSL for building classes. It automatically sets up
strict/warnings, enables Perl 5.18 features, and provides functions like
C<attr> for declaring attributes and C<base> for inheritance.

=cut

$test->for('description');

=examples

The following are examples of class building using Venus.

=cut

=example class.0

Use C<attr> to declare object attributes with automatic accessors.

=example-1 class.0

  package Counter;

  use Venus::Class;

  attr 'count';

  sub increment {
    my ($self) = @_;
    $self->count(($self->count // 0) + 1);
  }

  package main;

  my $counter = Counter->new;

  $counter->increment;

  my $result = $counter->count;

  # 1

=cut

$test->for('example', 1, 'class.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example class.1

Use C<base> to inherit from another class.

=example-1 class.1

  package Animal;

  use Venus::Class;

  attr 'name';

  sub speak {
    my ($self) = @_;
    return $self->name . ' speaks';
  }

  package Dog;

  use Venus::Class;

  base 'Animal';

  sub speak {
    my ($self) = @_;
    return $self->name . ' barks';
  }

  package main;

  my $dog = Dog->new(name => 'Rex');

  my $result = $dog->speak;

  # "Rex barks"

=cut

$test->for('example', 1, 'class.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Rex barks');

  $result
});

=example class.2

Classes get a default constructor that accepts a hash or hashref.

=example-1 class.2

  package Point;

  use Venus::Class;

  attr 'x';
  attr 'y';

  package main;

  my $point = Point->new({ x => 10, y => 20 });

  my $result = $point->x + $point->y;

  # 30

=cut

$test->for('example', 1, 'class.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 30);

  $result
});

=example class.3

Use C<BUILD> to run initialization code after construction.

=example-1 class.3

  package Logger;

  use Venus::Class;

  attr 'messages';

  sub BUILD {
    my ($self) = @_;
    $self->messages([]);
  }

  sub log {
    my ($self, $msg) = @_;
    push @{$self->messages}, $msg;
  }

  package main;

  my $logger = Logger->new;

  $logger->log('Started');

  my $result = $logger->messages;

  # ["Started"]

=cut

$test->for('example', 1, 'class.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, ['Started']);

  1
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

$test->do('render', './topics/classes.pod')->done;
