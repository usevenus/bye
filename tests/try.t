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

Try

=cut

$test->for('tagline');

=abstract

Try in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Try;

  my $try = Venus::Try->new;

  my $result = $try->call(sub { "success" })->result;

  $result;

  # "success"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "success");

  $result
});

=description

L<Venus::Try> provides try-catch-finally functionality for exception handling.
Use C<call> to define the code, C<default> for error handling, and C<finally>
for cleanup.

=cut

$test->for('description');

=examples

The following are examples of exception handling in Venus.

=cut

=example try.0

Use C<call> to execute code that might fail.

=example-1 try.0

  package main;

  use Venus::Try;

  my $try = Venus::Try->new;

  my $result = $try->call(sub { 10 + 20 })->result;

  $result;

  # 30

=cut

$test->for('example', 1, 'try.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 30);

  $result
});

=example try.1

Use C<default> to handle any errors.

=example-1 try.1

  package main;

  use Venus::Try;

  my $try = Venus::Try->new;

  my $result = $try->call(sub { die "oops!" })->default(sub { "recovered" })->result;

  $result;

  # "recovered"

=cut

$test->for('example', 1, 'try.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'recovered');

  $result
});

=example try.2

Use C<maybe> to return undef on errors.

=example-1 try.2

  package main;

  use Venus::Try;

  my $try = Venus::Try->new;

  my $result = $try->call(sub { die "fail!" })->maybe->result;

  defined $result ? 'defined' : 'undef';

  # "undef"

=cut

$test->for('example', 1, 'try.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'undef');

  $result
});

=example try.3

Use C<finally> for cleanup code.

=example-1 try.3

  package main;

  use Venus::Try;

  my $cleaned = 0;

  my $try = Venus::Try->new;

  my $result = $try->call(sub { "done" })->finally(sub { $cleaned = 1 })->result;

  "$result-$cleaned";

  # "done-1"

=cut

$test->for('example', 1, 'try.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'done-1');

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

$test->do('render', './topics/try.pod')->done;
