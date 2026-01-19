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

Collection Iteration

=cut

$test->for('tagline');

=abstract

Collection Iteration in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5]);

  my $total = 0;

  $array->each(sub { $total += $_ });

  $total;

  # 15

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 15);

  $result
});

=description

Venus provides iteration methods on L<Venus::Array> and L<Venus::Hash> for
traversing collections. Methods like C<each>, C<map>, C<grep>, and C<first>
enable functional-style data processing.

=cut

$test->for('description');

=examples

The following are examples of collection iteration in Venus.

=cut

=example each.0

Use C<each> to iterate over array elements.

=example-1 each.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new(['a', 'b', 'c']);

  my @items;

  $array->each(sub { push @items, $_ });

  join(',', @items);

  # "a,b,c"

=cut

$test->for('example', 1, 'each.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'a,b,c');

  $result
});

=example each.1

Use C<each> to iterate over hash key-value pairs.

=example-1 each.1

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ a => 1, b => 2 });

  my $sum = 0;

  $hash->each(sub { $sum += $_ });

  $sum;

  # 3

=cut

$test->for('example', 1, 'each.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3);

  $result
});

=example map.0

Use C<map> to transform array elements.

=example-1 map.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3]);

  my $mapped = $array->map(sub { $_ * 10 });

  join(',', @$mapped);

  # "10,20,30"

=cut

$test->for('example', 1, 'map.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '10,20,30');

  $result
});

=example grep.0

Use C<grep> to filter array elements.

=example-1 grep.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5, 6]);

  my $evens = $array->grep(sub { $_ % 2 == 0 });

  join(',', @$evens);

  # "2,4,6"

=cut

$test->for('example', 1, 'grep.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '2,4,6');

  $result
});

=example first.0

Use C<first> to get the first element of an array.

=example-1 first.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([10, 20, 30, 40]);

  my $first = $array->first;

  $first;

  # 10

=cut

$test->for('example', 1, 'first.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 10);

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

$test->do('render', './topics/collection-iteration.pod')->done;
