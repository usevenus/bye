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

Method Modifiers

=cut

$test->for('tagline');

=abstract

Method Modifiers in Venus

=cut

$test->for('abstract');

=synopsis

  package Counter;

  use Venus 'before', 'after';

  use Venus::Class;

  attr 'count';

  sub increment {
    my ($self) = @_;
    return $self->count(($self->count // 0) + 1);
  }

  before 'increment', sub {
    my ($self) = @_;
    # runs before increment
  };

  after 'increment', sub {
    my ($self) = @_;
    # runs after increment
  };

  package main;

  my $counter = Counter->new;

  $counter->increment;

  $counter->count;

  # 1

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=description

Venus provides method modifiers C<before>, C<after>, and C<around> to wrap
existing methods with additional behavior. These are useful for logging,
validation, or modifying arguments and return values.

=cut

$test->for('description');

=examples

The following are examples of method modifiers in Venus.

=cut

=example before.0

Use C<before> to run code before a method executes.

=example-1 before.0

  package Logger;

  use Venus 'before';

  use Venus::Class;

  attr 'log';

  sub BUILD {
    my ($self) = @_;
    $self->log([]);
  }

  sub process {
    my ($self, $item) = @_;
    push @{$self->log}, "processed: $item";
    return $item;
  }

  before 'process', sub {
    my ($self, $item) = @_;
    push @{$self->log}, "starting: $item";
  };

  package main;

  my $logger = Logger->new;

  $logger->process('task');

  my $result = join ', ', @{$logger->log};

  # "starting: task, processed: task"

=cut

$test->for('example', 1, 'before.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'starting: task, processed: task');

  $result
});

=example after.0

Use C<after> to run code after a method executes.

=example-1 after.0

  package Notifier;

  use Venus 'after';

  use Venus::Class;

  attr 'notifications';

  sub BUILD {
    my ($self) = @_;
    $self->notifications([]);
  }

  sub save {
    my ($self, $data) = @_;
    return "saved: $data";
  }

  after 'save', sub {
    my ($self, $data) = @_;
    push @{$self->notifications}, "notified about: $data";
  };

  package main;

  my $notifier = Notifier->new;

  my $saved = $notifier->save('record');

  my $result = $notifier->notifications->[0];

  # "notified about: record"

=cut

$test->for('example', 1, 'after.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'notified about: record');

  $result
});

=example around.0

Use C<around> to wrap a method and control its execution.

=example-1 around.0

  package Multiplier;

  use Venus 'around';

  use Venus::Class;

  sub calculate {
    my ($self, $n) = @_;
    return $n * 2;
  }

  around 'calculate', sub {
    my ($orig, $self, $n) = @_;
    my $result = $self->$orig($n);  # call original
    return $result + 1;  # modify result
  };

  package main;

  my $mult = Multiplier->new;

  my $result = $mult->calculate(5);

  # 11 (5 * 2 + 1)

=cut

$test->for('example', 1, 'around.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 11);

  $result
});

=example around.1

Use C<around> to modify arguments before passing to the original method.

=example-1 around.1

  package Greeter;

  use Venus 'around';

  use Venus::Class;

  sub greet {
    my ($self, $name) = @_;
    return "Hello, $name!";
  }

  around 'greet', sub {
    my ($orig, $self, $name) = @_;
    return $self->$orig(uc $name);  # uppercase the name
  };

  package main;

  my $greeter = Greeter->new;

  my $result = $greeter->greet('alice');

  # "Hello, ALICE!"

=cut

$test->for('example', 1, 'around.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Hello, ALICE!');

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

$test->do('render', './topics/method-modifiers.pod')->done;
