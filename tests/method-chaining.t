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

Method Chaining

=cut

$test->for('tagline');

=abstract

Method Chaining in Venus

=cut

$test->for('abstract');

=synopsis

  package Task;

  use Venus::Class;

  with 'Venus::Role::Doable';

  attr 'status';

  sub start {
    my ($self) = @_;
    $self->status('running');
    return $self;
  }

  sub finish {
    my ($self) = @_;
    $self->status('done');
    return $self;
  }

  package main;

  my $task = Task->new;

  $task->do('start')->do('finish')->status;

  # "done"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'done');

  $result
});

=description

L<Venus::Role::Doable> provides the C<do> method for fluent method chaining.
The C<do> method calls a method and returns the invocant, allowing multiple
method calls to be chained together.

=cut

$test->for('description');

=examples

The following are examples of method chaining in Venus.

=cut

=example do.0

Use C<do> to call a method and return the object for chaining.

=example-1 do.0

  package Builder;

  use Venus::Class;

  with 'Venus::Role::Doable';

  attr 'parts';

  sub BUILD {
    my ($self) = @_;
    $self->parts([]);
  }

  sub add {
    my ($self, $part) = @_;
    push @{$self->parts}, $part;
    return $self;
  }

  package main;

  my $builder = Builder->new;

  $builder->do('add', 'A')->do('add', 'B')->do('add', 'C');

  my $result = join '', @{$builder->parts};

  # "ABC"

=cut

$test->for('example', 1, 'do.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'ABC');

  $result
});

=example do.1

The C<do> method always returns the invocant, even if the called method returns something else.

=example-1 do.1

  package Counter;

  use Venus::Class;

  with 'Venus::Role::Doable';

  attr 'value';

  sub increment {
    my ($self) = @_;
    $self->value(($self->value // 0) + 1);
    return 'incremented';  # this return value is ignored by do
  }

  package main;

  my $counter = Counter->new;

  my $result = $counter->do('increment')->do('increment')->value;

  # 2

=cut

$test->for('example', 1, 'do.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 2);

  $result
});

=example do.2

Chain C<do> with regular method calls for flexible workflows.

=example-1 do.2

  package Pipeline;

  use Venus::Class;

  with 'Venus::Role::Doable';

  attr 'data';

  sub transform {
    my ($self, $code) = @_;
    $self->data($code->($self->data));
    return $self;
  }

  sub result {
    my ($self) = @_;
    return $self->data;
  }

  package main;

  my $pipeline = Pipeline->new(data => 5);

  my $result = $pipeline
    ->do('transform', sub { $_[0] * 2 })
    ->do('transform', sub { $_[0] + 3 })
    ->result;

  # 13 (5 * 2 + 3)

=cut

$test->for('example', 1, 'do.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 13);

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

$test->do('render', './topics/method-chaining.pod')->done;
