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

Result Monad

=cut

$test->for('tagline');

=abstract

Result Monad in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Result;

  my $valid = Venus::Result->new(value => 'success');

  my $invalid = Venus::Result->new(issue => 'failure');

  $valid->is_valid && $invalid->is_invalid;

  # 1

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=description

L<Venus::Result> represents the outcome of an operation that can succeed or
fail. Use the C<value> attribute for success and C<issue> attribute for
failure. Check status with C<is_valid> and C<is_invalid>.

=cut

$test->for('description');

=examples

The following are examples of result monads in Venus.

=cut

=example result.0

Use C<value> to create a valid result.

=example-1 result.0

  package main;

  use Venus::Result;

  my $result = Venus::Result->new(value => 42);

  $result->is_valid ? $result->value : 'error';

  # 42

=cut

$test->for('example', 1, 'result.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 42);

  $result
});

=example result.1

Use C<issue> to create an invalid result.

=example-1 result.1

  package main;

  use Venus::Result;

  my $result = Venus::Result->new(issue => 'Not found');

  $result->is_invalid ? $result->issue : 'ok';

  # "Not found"

=cut

$test->for('example', 1, 'result.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Not found');

  $result
});

=example result.2

Use C<on_valid> to handle successful results.

=example-1 result.2

  package main;

  use Venus::Result;

  my $result = Venus::Result->new(value => 10);

  my $output;

  $result->on_valid(sub { $output = $_[0]->value * 2 });

  $output;

  # 20

=cut

$test->for('example', 1, 'result.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 20);

  $result
});

=example result.3

Use C<on_invalid> to handle failed results.

=example-1 result.3

  package main;

  use Venus::Result;

  my $result = Venus::Result->new(issue => 'Failed');

  my $output = 'default';

  $result->on_invalid(sub { $output = "Error: " . $_[0]->issue });

  $output;

  # "Error: Failed"

=cut

$test->for('example', 1, 'result.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Error: Failed');

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

$test->do('render', './topics/result-monad.pod')->done;
