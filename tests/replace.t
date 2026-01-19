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

Replace

=cut

$test->for('tagline');

=abstract

Replace in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Replace;

  my $replace = Venus::Replace->new(
    string => 'hello world',
    regexp => 'world',
    substr => 'Venus'
  );

  $replace->do('evaluate')->get;

  # "hello Venus"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "hello Venus");

  $result
});

=description

L<Venus::Replace> provides regex-based string replacement. Set C<string>,
C<regexp>, and C<substr> attributes, then call C<evaluate> to perform the
replacement.

=cut

$test->for('description');

=examples

The following are examples of string replacement in Venus.

=cut

=example rep.0

Basic string replacement.

=example-1 rep.0

  package main;

  use Venus::Replace;

  my $replace = Venus::Replace->new(
    string => 'foo bar foo',
    regexp => 'foo',
    substr => 'baz'
  );

  $replace->do('evaluate')->get;

  # "baz bar foo"

=cut

$test->for('example', 1, 'rep.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'baz bar foo');

  $result
});

=example rep.1

Global replacement with C<flags>.

=example-1 rep.1

  package main;

  use Venus::Replace;

  my $replace = Venus::Replace->new(
    string => 'foo bar foo',
    regexp => 'foo',
    substr => 'baz',
    flags => 'g'
  );

  $replace->do('evaluate')->get;

  # "baz bar baz"

=cut

$test->for('example', 1, 'rep.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'baz bar baz');

  $result
});

=example rep.2

Case-insensitive replacement.

=example-1 rep.2

  package main;

  use Venus::Replace;

  my $replace = Venus::Replace->new(
    string => 'Hello HELLO hello',
    regexp => 'hello',
    substr => 'hi',
    flags => 'gi'
  );

  $replace->do('evaluate')->get;

  # "hi hi hi"

=cut

$test->for('example', 1, 'rep.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'hi hi hi');

  $result
});

=example rep.3

Use C<count> to get the number of replacements.

=example-1 rep.3

  package main;

  use Venus::Replace;

  my $replace = Venus::Replace->new(
    string => 'aaa',
    regexp => 'a',
    substr => 'b',
    flags => 'g'
  );

  $replace->evaluate;

  $replace->count;

  # 3

=cut

$test->for('example', 1, 'rep.3', sub {
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

$test->do('render', './topics/replace.pod')->done;
