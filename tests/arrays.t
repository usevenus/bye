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

Arrays

=cut

$test->for('tagline');

=abstract

Array Operations in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3]);

  $array->push(4, 5);

  $array->get;

  # [1, 2, 3, 4, 5]

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, [1, 2, 3, 4, 5]);

  1
});

=description

L<Venus::Array> wraps Perl arrayrefs and provides methods for common array
operations. Arrays deref automatically, so they work seamlessly with Perl's
built-in array operations.

=cut

$test->for('description');

=examples

The following are examples of array operations using Venus.

=cut

=example array.0

Use C<push> and C<pop> to add and remove elements from the end.

=example-1 array.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3]);

  $array->push(4);

  my $result = $array->pop;

  # 4

=cut

$test->for('example', 1, 'array.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 4);

  $result
});

=example array.1

Use C<unshift> and C<shift> to add and remove elements from the beginning.

=example-1 array.1

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([2, 3, 4]);

  $array->unshift(1);

  my $result = $array->shift;

  # 1

=cut

$test->for('example', 1, 'array.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example array.2

Use C<count> and C<length> to get the number of elements.

=example-1 array.2

  package main;

  use Venus::Array;

  my $array = Venus::Array->new(['a', 'b', 'c', 'd']);

  my $result = $array->count;

  # 4

=cut

$test->for('example', 1, 'array.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 4);

  $result
});

=example array.3

Use C<first> and C<last> to access elements at the ends.

=example-1 array.3

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([10, 20, 30]);

  my $result = $array->first;

  # 10

=cut

$test->for('example', 1, 'array.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 10);

  $result
});

=example array.4

Use C<join> to concatenate elements into a string.

=example-1 array.4

  package main;

  use Venus::Array;

  my $array = Venus::Array->new(['a', 'b', 'c']);

  my $result = $array->join('-');

  # "a-b-c"

=cut

$test->for('example', 1, 'array.4', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'a-b-c');

  $result
});

=example array.5

Use C<reverse> to reverse the order of elements.

=example-1 array.5

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3]);

  my $result = $array->reverse;

  # [3, 2, 1]

=cut

$test->for('example', 1, 'array.5', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, [3, 2, 1]);

  1
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

$test->do('render', './topics/arrays.pod')->done;
