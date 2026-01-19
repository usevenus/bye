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

Joining

=cut

$test->for('tagline');

=abstract

Joining in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Array;

  my $array = Venus::Array->new(['a', 'b', 'c']);

  my $joined = $array->join(', ');

  $joined;

  # "a, b, c"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'a, b, c');

  $result
});

=description

L<Venus::Array>, L<Venus::Map>, and L<Venus::Set> all provide a C<join> method
for combining elements into a string with a specified separator.

=cut

$test->for('description');

=examples

The following are examples of joining in Venus.

=cut

=example join.0

Use C<join> on C<Venus::Array> to combine elements.

=example-1 join.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5]);

  my $result = $array->join('-');

  $result;

  # "1-2-3-4-5"

=cut

$test->for('example', 1, 'join.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1-2-3-4-5');

  $result
});

=example join.1

Use C<join> on C<Venus::Map> to combine hash values.

=example-1 join.1

  package main;

  use Venus::Map;

  my $map = Venus::Map->new({ x => 10, y => 20, z => 30 });

  my $result = $map->join(' + ');

  $result;

  # "10 + 20 + 30"

=cut

$test->for('example', 1, 'join.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->like($result, qr/10.+20.+30|10.+30.+20|20.+10.+30|20.+30.+10|30.+10.+20|30.+20.+10/);

  $result
});

=example join.2

Use C<join> on C<Venus::Set> which contains unique values only.

=example-1 join.2

  package main;

  use Venus::Set;

  my $set = Venus::Set->new([1, 2, 2, 3, 3, 3]);

  my $result = $set->join(', ');

  $result;

  # "1, 2, 3"

=cut

$test->for('example', 1, 'join.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1, 2, 3');

  $result
});

=example join.3

Use C<join> with an empty separator to concatenate.

=example-1 join.3

  package main;

  use Venus::Array;

  my $array = Venus::Array->new(['h', 'e', 'l', 'l', 'o']);

  my $result = $array->join('');

  $result;

  # "hello"

=cut

$test->for('example', 1, 'join.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'hello');

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

$test->do('render', './topics/joining.pod')->done;
