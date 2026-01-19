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

Boxing

=cut

$test->for('tagline');

=abstract

Boxing Values in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Box;

  my $box = Venus::Box->new(value => 'hello');

  $box->uppercase->unbox;

  # "HELLO"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'HELLO');

  $result
});

=description

L<Venus::Box> wraps any value and provides a fluent interface for chaining
method calls. Each method call returns a new box containing the result,
allowing transformations to be composed elegantly.

=cut

$test->for('description');

=examples

The following are examples of boxing in Venus.

=cut

=example box.0

Use C<Venus::Box> to wrap a value and chain transformations.

=example-1 box.0

  package main;

  use Venus::Box;

  my $box = Venus::Box->new(value => [3, 1, 4, 1, 5]);

  my $result = $box->sort->join('-')->unbox;

  # "1-1-3-4-5"

=cut

$test->for('example', 1, 'box.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1-1-3-4-5');

  $result
});

=example box.1

Methods are proxied to the underlying value and return a new box.

=example-1 box.1

  package main;

  use Venus::Box;

  my $box = Venus::Box->new(value => 42);

  my $result = $box->add(8)->unbox;

  # 50

=cut

$test->for('example', 1, 'box.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 50);

  $result
});

=example box.2

Use C<unbox> to extract the final value from a box.

=example-1 box.2

  package main;

  use Venus::Box;

  my $box = Venus::Box->new(value => { name => 'venus' });

  my $result = $box->get('name')->unbox;

  # "venus"

=cut

$test->for('example', 1, 'box.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'venus');

  $result
});

=example box.3

Use the C<box> function from Venus for convenient boxing.

=example-1 box.3

  package main;

  use Venus 'box';

  my $result = box('hello world')->split(' ')->count->unbox;

  # 2

=cut

$test->for('example', 1, 'box.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 2);

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

$test->do('render', './topics/boxing.pod')->done;
