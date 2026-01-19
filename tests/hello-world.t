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

Hello World

=cut

$test->for('tagline');

=abstract

Getting to "Hello World"

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus 'log';

  log 'Hello World';

  # bless(..., "Venus::Log")

  # Prints "Hello World" to STDOUT

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Log');

  $result
});

=description

Venus is an object-orientation framework for Perl 5. This topic demonstrates
basic output using Venus.

=cut

$test->for('description');

=examples

The following are examples of how to output information using Venus.

=cut

=example log.0

Use the C<log> function to output a message to STDOUT. The C<log> function
returns a L<Venus::Log> object.

=example-1 log.0

  package main;

  use Venus 'log';

  log 'Hello World';

  # bless(..., "Venus::Log")

  # Prints "Hello World" to STDOUT

=cut

$test->for('example', 1, 'log.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Log');

  $result
});

=example say.0

Venus value objects stringify automatically, so Perl's built-in C<say> works
naturally with them.

=example-1 say.0

  package main;

  use feature 'say';

  use Venus 'string';

  my $message = string 'Hello World';

  say $message;

  # "Hello World"

  $message

=cut

$test->for('example', 1, 'say.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::String');
  $test->is($result->get, 'Hello World');

  $result
});

=example log.1

Unlike C<say>, the C<log> function can output complex data structures like
arrays, hashes, and objects.

=example-1 log.1

  package main;

  use Venus 'log';

  log { name => 'World', greeting => 'Hello' };

  # bless(..., "Venus::Log")

  # Prints '{greeting => "Hello", name => "World"}' to STDOUT

=cut

$test->for('example', 1, 'log.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Log');

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

$test->do('render', './topics/hello-world.pod')->done;
