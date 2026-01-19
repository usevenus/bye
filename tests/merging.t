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

Merging

=cut

$test->for('tagline');

=abstract

Merging in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus 'merge_swap';

  my $result = merge_swap(
    { a => 1, b => 2 },
    { b => 20, c => 3 },
    { c => 30, d => 4 }
  );

  $result->{b} + $result->{c};

  # 50

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 50);

  $result
});

=description

Venus provides multiple merge strategies as functions. All merge functions
accept multiple arguments and process them left to right. Strategies include
C<merge_keep> (preserve original), C<merge_swap> (overwrite), C<merge_join>
(combine arrays), and C<merge_take> (deep merge). Each has a C<_mutate>
variant that modifies in place.

=cut

$test->for('description');

=examples

The following are examples of merging in Venus.

=cut

=example merge.0

Use C<merge_swap> to overwrite values (later values win).

=example-1 merge.0

  package main;

  use Venus 'merge_swap';

  my $result = merge_swap(
    { name => 'Alice', age => 25 },
    { age => 30, city => 'NYC' }
  );

  $result->{age};

  # 30

=cut

$test->for('example', 1, 'merge.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 30);

  $result
});

=example merge.1

Use C<merge_keep> to preserve original values on conflicts.

=example-1 merge.1

  package main;

  use Venus 'merge_keep';

  my $result = merge_keep(
    { name => 'Alice', age => 25 },
    { age => 30, city => 'NYC' }
  );

  $result->{age};

  # 25

=cut

$test->for('example', 1, 'merge.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 25);

  $result
});

=example merge.2

Use C<merge_join> to combine array values.

=example-1 merge.2

  package main;

  use Venus 'merge_join';

  my $result = merge_join(
    { tags => ['a', 'b'] },
    { tags => ['c', 'd'] }
  );

  join(',', @{$result->{tags}});

  # "a,b,c,d"

=cut

$test->for('example', 1, 'merge.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'a,b,c,d');

  $result
});

=example merge.3

Use C<merge_take> for deep recursive merging.

=example-1 merge.3

  package main;

  use Venus 'merge_take';

  my $result = merge_take(
    { user => { name => 'Bob' } },
    { user => { age => 30 } }
  );

  $result->{user}{name} . ':' . $result->{user}{age};

  # "Bob:30"

=cut

$test->for('example', 1, 'merge.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Bob:30');

  $result
});

=example merge.4

Merge multiple values in one call.

=example-1 merge.4

  package main;

  use Venus 'merge_swap';

  my $result = merge_swap(
    { a => 1 },
    { b => 2 },
    { c => 3 },
    { d => 4 }
  );

  join(',', sort keys %$result);

  # "a,b,c,d"

=cut

$test->for('example', 1, 'merge.4', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'a,b,c,d');

  $result
});

=example merge.5

Use C<Venus::Hash> C<merge> method (uses C<merge_swap> internally).

=example-1 merge.5

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ a => 1, b => 2 });

  my $result = $hash->merge({ b => 20 }, { c => 3 });

  $result->{a} + $result->{b} + $result->{c};

  # 24

=cut

$test->for('example', 1, 'merge.5', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 24);

  $result
});

=example merge.6

Use C<Venus::Array> C<merge> method to replace array contents.

=example-1 merge.6

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3]);

  my $result = $array->merge([4, 5], [6, 7, 8]);

  join(',', @$result);

  # "6,7,8"

=cut

$test->for('example', 1, 'merge.6', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '6,7,8');

  $result
});

=example merge.7

Chain C<merge> calls on C<Venus::Map>.

=example-1 merge.7

  package main;

  use Venus::Map;

  my $map = Venus::Map->new({ x => 1 });

  $map->merge({ y => 2 })->merge({ z => 3 });

  $map->count;

  # 3

=cut

$test->for('example', 1, 'merge.7', sub {
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

$test->do('render', './topics/merging.pod')->done;
