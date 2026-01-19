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

Value Deconstruction

=cut

$test->for('tagline');

=abstract

Extracting Nested Values

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus 'gets';

  my $data = { user => { name => 'Alice' } };

  my ($name) = gets $data, 'user.name';

  # "Alice"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Alice');

  $result
});

=description

Venus provides the C<gets> function for extracting nested values from data
structures using dot-notation paths.

=cut

$test->for('description');

=examples

The following are examples of value deconstruction using Venus.

=cut

=example gets.0

Use C<gets> with dot-notation to extract a nested hash value.

=example-1 gets.0

  package main;

  use Venus 'gets';

  my $data = { user => { name => 'Alice', age => 30 } };

  my ($name) = gets $data, 'user.name';

  # "Alice"

=cut

$test->for('example', 1, 'gets.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Alice');

  $result
});

=example gets.1

Use numeric indices in dot-notation to extract from arrays.

=example-1 gets.1

  package main;

  use Venus 'gets';

  my $data = { users => ['Alice', 'Bob', 'Eve'] };

  my ($first) = gets $data, 'users.0';

  # "Alice"

=cut

$test->for('example', 1, 'gets.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Alice');

  $result
});

=example gets.2

Use C<gets> with multiple paths to extract multiple values at once.

=example-1 gets.2

  package main;

  use Venus 'gets';

  my $data = { name => 'Alice', age => 30, city => 'NYC' };

  my ($name, $city) = gets $data, 'name', 'city';

  # ("Alice", "NYC")

=cut

$test->for('example', 1, 'gets.2', sub {
  my ($tryable) = @_;
  my ($name, $city) = $tryable->result;
  $test->is($name, 'Alice');
  $test->is($city, 'NYC');

  $name
});

=example gets.3

Combine C<gets> with C<list> to reorder and flatten extracted values.

=example-1 gets.3

  package main;

  use Venus 'gets', 'list';

  my $tuple = ['device', ['0.0.0.0', '127.0.0.1'], 'root'];

  my ($user, $device, @ips) = map list($_), gets $tuple, '2', '0', '1';

  # ("root", "device", "0.0.0.0", "127.0.0.1")

=cut

$test->for('example', 1, 'gets.3', sub {
  my ($tryable) = @_;
  my ($user, $device, @ips) = $tryable->result;
  $test->is($user, 'root');
  $test->is($device, 'device');
  $test->same(\@ips, ['0.0.0.0', '127.0.0.1']);

  $user
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

$test->do('render', './topics/value-deconstruction.pod')->done;
