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

Argument Unpacking

=cut

$test->for('tagline');

=abstract

Typed Argument Unpacking

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus 'unpack';

  my ($name, $age) = unpack('Alice', 30)->args;

  # ("Alice", 30)

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my ($name, $age) = $tryable->result;
  $test->is($name, 'Alice');
  $test->is($age, 30);

  $name
});

=description

Venus provides the C<unpack> function and L<Venus::Unpack> class for unpacking
and validating subroutine arguments with type coercion and constraints.

=cut

$test->for('description');

=examples

The following are examples of argument unpacking using Venus.

=cut

=example unpack.0

Use C<unpack> with C<args> to extract arguments as a list.

=example-1 unpack.0

  package main;

  use Venus 'unpack';

  my ($x, $y) = unpack(10, 20)->args;

  # (10, 20)

=cut

$test->for('example', 1, 'unpack.0', sub {
  my ($tryable) = @_;
  my ($x, $y) = $tryable->result;
  $test->is($x, 10);
  $test->is($y, 20);

  $x
});

=example unpack.1

Use C<into> to coerce arguments into specific Venus types.

=example-1 unpack.1

  package main;

  use Venus 'unpack';

  my ($name) = unpack('alice')->into('Venus::String');

  $name->titlecase;

  # "Alice"

=cut

$test->for('example', 1, 'unpack.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Alice');

  $result
});

=example unpack.2

Use C<signature> to validate arguments against type expressions.

=example-1 unpack.2

  package main;

  use Venus 'unpack';

  my ($name, $age) = unpack('Bob', 25)->signature('string', 'number');

  # ("Bob", 25)

=cut

$test->for('example', 1, 'unpack.2', sub {
  my ($tryable) = @_;
  my ($name, $age) = $tryable->result;
  $test->is($name, 'Bob');
  $test->is($age, 25);

  $name
});

=example unpack.3

Use C<cast> to auto-deduce arguments to their Venus types.

=example-1 unpack.3

  package main;

  use Venus 'unpack';

  my ($data) = unpack([1, 2, 3])->cast;

  $data->count;

  # 3

=cut

$test->for('example', 1, 'unpack.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3);

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

$test->do('render', './topics/argument-unpacking.pod')->done;
