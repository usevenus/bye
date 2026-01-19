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

Unpack

=cut

$test->for('tagline');

=abstract

Unpack in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Unpack;

  my $unpack = Venus::Unpack->new(['hello', 123]);

  $unpack->arg(0);

  # "hello"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "hello");

  $result
});

=description

L<Venus::Unpack> provides argument unpacking with type checking. Use C<arg>
to select arguments by index and C<all> to get all arguments.

=cut

$test->for('description');

=examples

The following are examples of argument unpacking in Venus.

=cut

=example unpack.0

Use C<arg> to select arguments by index.

=example-1 unpack.0

  package main;

  use Venus::Unpack;

  my $unpack = Venus::Unpack->new(['a', 'b', 'c']);

  $unpack->arg(1);

  # "b"

=cut

$test->for('example', 1, 'unpack.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'b');

  $result
});

=example unpack.1

Access last argument.

=example-1 unpack.1

  package main;

  use Venus::Unpack;

  my $unpack = Venus::Unpack->new([1, 2, 3]);

  $unpack->arg(2);

  # 3

=cut

$test->for('example', 1, 'unpack.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3);

  $result
});

=example unpack.2

Access first argument.

=example-1 unpack.2

  package main;

  use Venus::Unpack;

  my $unpack = Venus::Unpack->new(['x', 'y', 'z']);

  $unpack->arg(0);

  # "x"

=cut

$test->for('example', 1, 'unpack.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'x');

  $result
});

=example unpack.3

Get arguments by position.

=example-1 unpack.3

  package main;

  use Venus::Unpack;

  my $unpack = Venus::Unpack->new(['first', 'second']);

  my $a = $unpack->arg(0);

  my $b = $unpack->arg(1);

  "$a-$b";

  # "first-second"

=cut

$test->for('example', 1, 'unpack.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'first-second');

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

$test->do('render', './topics/unpack.pod')->done;
