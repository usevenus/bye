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

Slicing

=cut

$test->for('tagline');

=abstract

Slicing in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5]);

  my $slice = $array->range(1, 2, 3);

  join(',', @$slice);

  # "2,3,4"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '2,3,4');

  $result
});

=description

Venus provides methods for extracting portions of arrays. Use C<range> to
get elements at specific indices, C<head> for the beginning, and C<tail> for
the end of an array.

=cut

$test->for('description');

=examples

The following are examples of slicing in Venus.

=cut

=example slice.0

Use C<range> to extract elements at specific indices.

=example-1 slice.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new(['a', 'b', 'c', 'd', 'e']);

  my $slice = $array->range(0, 1, 2);

  join(',', @$slice);

  # "a,b,c"

=cut

$test->for('example', 1, 'slice.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'a,b,c');

  $result
});

=example slice.1

Use C<head> to get the first N elements.

=example-1 slice.1

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5]);

  my $head = $array->head(3);

  join(',', @$head);

  # "1,2,3"

=cut

$test->for('example', 1, 'slice.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1,2,3');

  $result
});

=example slice.2

Use C<tail> to get the last N elements.

=example-1 slice.2

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5]);

  my $tail = $array->tail(2);

  join(',', @$tail);

  # "4,5"

=cut

$test->for('example', 1, 'slice.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '4,5');

  $result
});

=example slice.3

Use C<part> to split an array by a condition.

=example-1 slice.3

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5, 6]);

  my $parts = $array->part(sub { $_[1] % 2 == 0 });

  my $evens = join(',', @{$parts->[0]});

  # "2,4,6"

=cut

$test->for('example', 1, 'slice.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '2,4,6');

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

$test->do('render', './topics/slicing.pod')->done;
