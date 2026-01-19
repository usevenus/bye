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

Sorting

=cut

$test->for('tagline');

=abstract

Sorting in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([3, 1, 4, 1, 5]);

  my $sorted = $array->sort;

  join(',', @$sorted);

  # "1,1,3,4,5"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1,1,3,4,5');

  $result
});

=description

L<Venus::Array> provides C<sort> and C<rsort> methods for sorting arrays.
The C<sort> method sorts in ascending order, while C<rsort> sorts in
descending order.

=cut

$test->for('description');

=examples

The following are examples of sorting in Venus.

=cut

=example sort.0

Use C<sort> to sort numbers in ascending order.

=example-1 sort.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([5, 2, 8, 1, 9]);

  my $sorted = $array->sort;

  join(',', @$sorted);

  # "1,2,5,8,9"

=cut

$test->for('example', 1, 'sort.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1,2,5,8,9');

  $result
});

=example sort.1

Use C<rsort> to sort in descending order.

=example-1 sort.1

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([5, 2, 8, 1, 9]);

  my $sorted = $array->rsort;

  join(',', @$sorted);

  # "9,8,5,2,1"

=cut

$test->for('example', 1, 'sort.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '9,8,5,2,1');

  $result
});

=example sort.2

Use C<sort> to sort strings alphabetically.

=example-1 sort.2

  package main;

  use Venus::Array;

  my $array = Venus::Array->new(['banana', 'apple', 'cherry']);

  my $sorted = $array->sort;

  join(',', @$sorted);

  # "apple,banana,cherry"

=cut

$test->for('example', 1, 'sort.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'apple,banana,cherry');

  $result
});

=example sort.3

Use C<reverse> to reverse array order.

=example-1 sort.3

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5]);

  my $reversed = $array->reverse;

  join(',', @$reversed);

  # "5,4,3,2,1"

=cut

$test->for('example', 1, 'sort.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '5,4,3,2,1');

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

$test->do('render', './topics/sorting.pod')->done;
