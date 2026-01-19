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

Dispatching

=cut

$test->for('tagline');

=abstract

Construct and Call in One Step

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus 'string';

  my $result = string 'hello', 'uppercase';

  # "HELLO"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'HELLO');

  $result
});

=description

Venus constructor functions accept an optional method name and arguments,
allowing you to create an object and call a method in a single expression.

=cut

$test->for('description');

=examples

The following are examples of dispatching methods via constructor functions.

=cut

=example space.0

Use the C<space> function with a method name to load a package dynamically.

=example-1 space.0

  package main;

  use Venus 'space';

  my $result = space 'Venus::String', 'load';

  # "Venus::String"

=cut

$test->for('example', 1, 'space.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Venus::String');

  $result
});

=example array.0

Use the C<array> function with a method name to construct and query an array.

=example-1 array.0

  package main;

  use Venus 'array';

  my $result = array [1, 2, 3], 'count';

  # 3

=cut

$test->for('example', 1, 'array.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3);

  $result
});

=example string.0

Use the C<string> function with a method name to transform a string.

=example-1 string.0

  package main;

  use Venus 'string';

  my $result = string 'hello', 'uppercase';

  # "HELLO"

=cut

$test->for('example', 1, 'string.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'HELLO');

  $result
});

=example path.0

Use the C<path> function with a method name to check path properties.

=example-1 path.0

  package main;

  use Venus 'path';

  my $result = path '.', 'exists';

  # 1

=cut

$test->for('example', 1, 'path.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

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

$test->do('render', './topics/dispatching.pod')->done;
