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

Errors

=cut

$test->for('tagline');

=abstract

Errors in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Error;

  my $error = Venus::Error->new(message => 'Something went wrong');

  $error->message;

  # "Something went wrong"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Something went wrong');

  $result
});

=description

L<Venus::Error> provides a structured error class with support for messages,
context, and stack traces. Errors can be thrown and caught using Venus's
exception handling mechanisms.

=cut

$test->for('description');

=examples

The following are examples of errors in Venus.

=cut

=example error.0

Create an error with a message.

=example-1 error.0

  package main;

  use Venus::Error;

  my $error = Venus::Error->new(message => 'File not found');

  my $result = $error->message;

  # "File not found"

=cut

$test->for('example', 1, 'error.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'File not found');

  $result
});

=example error.1

Use C<name> to identify error types.

=example-1 error.1

  package main;

  use Venus::Error;

  my $error = Venus::Error->new(
    name => 'on.file.missing',
    message => 'File not found'
  );

  my $result = $error->name;

  # "on.file.missing"

=cut

$test->for('example', 1, 'error.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'on.file.missing');

  $result
});

=example error.2

Use C<stash> to attach additional context to errors.

=example-1 error.2

  package main;

  use Venus::Error;

  my $error = Venus::Error->new(message => 'Invalid input');

  $error->stash(field => 'email');

  my $result = $error->stash('field');

  # "email"

=cut

$test->for('example', 1, 'error.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'email');

  $result
});

=example error.3

Errors stringify to their message for easy display.

=example-1 error.3

  package main;

  use Venus::Error;

  my $error = Venus::Error->new(message => 'Connection failed');

  my $result = "$error";

  # includes "Connection failed"

=cut

$test->for('example', 1, 'error.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->like($result, qr/Connection failed/);

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

$test->do('render', './topics/errors.pod')->done;
