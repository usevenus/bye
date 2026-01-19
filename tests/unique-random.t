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

Unique and Random

=cut

$test->for('tagline');

=abstract

Unique and Random in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 2, 3, 3, 3]);

  my $unique = $array->unique;

  join(',', @$unique);

  # "1,2,3"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1,2,3');

  $result
});

=description

L<Venus::Array> provides C<unique> to remove duplicates and C<random> to
select random elements. L<Venus::Set> automatically maintains unique values.

=cut

$test->for('description');

=examples

The following are examples of unique and random operations in Venus.

=cut

=example unique.0

Use C<unique> to remove duplicate values.

=example-1 unique.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new(['a', 'b', 'a', 'c', 'b', 'a']);

  my $unique = $array->unique;

  join(',', @$unique);

  # "a,b,c"

=cut

$test->for('example', 1, 'unique.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'a,b,c');

  $result
});

=example unique.1

Use C<Venus::Set> for collections that are always unique.

=example-1 unique.1

  package main;

  use Venus::Set;

  my $set = Venus::Set->new([1, 2, 2, 3, 3, 3, 4, 4, 4, 4]);

  $set->count;

  # 4

=cut

$test->for('example', 1, 'unique.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 4);

  $result
});

=example random.0

Use C<random> to get a random element.

=example-1 random.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([10, 20, 30, 40, 50]);

  my $random = $array->random;

  $array->any(sub { $_[1] == $random }) ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'random.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example random.1

Use C<random> on C<Venus::Set> for unique random selection.

=example-1 random.1

  package main;

  use Venus::Set;

  my $set = Venus::Set->new(['red', 'green', 'blue']);

  my $random = $set->random;

  $set->any(sub { $_[1] eq $random }) ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'random.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

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

$test->do('render', './topics/unique-random.pod')->done;
