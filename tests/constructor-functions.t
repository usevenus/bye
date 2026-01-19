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

Constructor Functions

=cut

$test->for('tagline');

=abstract

Creating Venus Objects

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus 'array';

  my $data = array [1, 2, 3];

  # bless(..., "Venus::Array")

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Array');

  $result
});

=description

Venus exports constructor functions for creating value objects. These functions
provide a concise way to wrap Perl data types in Venus objects.

=cut

$test->for('description');

=examples

The following are examples of constructor functions for creating Venus objects.

=cut

=example array.0

Use the C<array> function to create a L<Venus::Array> object from an arrayref.

=example-1 array.0

  package main;

  use Venus 'array';

  my $data = array [1, 2, 3];

  # bless(..., "Venus::Array")

=cut

$test->for('example', 1, 'array.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Array');
  $test->same($result->get, [1, 2, 3]);

  $result
});

=example hash.0

Use the C<hash> function to create a L<Venus::Hash> object from a hashref.

=example-1 hash.0

  package main;

  use Venus 'hash';

  my $data = hash { name => 'Venus', type => 'framework' };

  # bless(..., "Venus::Hash")

=cut

$test->for('example', 1, 'hash.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Hash');
  $test->same($result->get, { name => 'Venus', type => 'framework' });

  $result
});

=example string.0

Use the C<string> function to create a L<Venus::String> object from a string.

=example-1 string.0

  package main;

  use Venus 'string';

  my $data = string 'hello world';

  # bless(..., "Venus::String")

=cut

$test->for('example', 1, 'string.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::String');
  $test->is($result->get, 'hello world');

  $result
});

=example number.0

Use the C<number> function to create a L<Venus::Number> object from a number.

=example-1 number.0

  package main;

  use Venus 'number';

  my $data = number 42;

  # bless(..., "Venus::Number")

=cut

$test->for('example', 1, 'number.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Number');
  $test->is($result->get, 42);

  $result
});

=example path.0

Use the C<path> function to create a L<Venus::Path> object from a path string.

=example-1 path.0

  package main;

  use Venus 'path';

  my $data = path '/home/user';

  # bless(..., "Venus::Path")

=cut

$test->for('example', 1, 'path.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Path');
  $test->is($result->get, '/home/user');

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

$test->do('render', './topics/constructor-functions.pod')->done;
