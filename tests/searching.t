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

Searching

=cut

$test->for('tagline');

=abstract

Searching in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([10, 20, 30, 40, 50]);

  my $found = $array->grep(sub { $_[1] > 25 });

  join(',', @$found);

  # "30,40,50"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '30,40,50');

  $result
});

=description

Venus provides methods for searching collections. Use C<grep> to filter by
condition, C<any>/C<all>/C<none> for boolean checks, C<exists> to check for
keys/indices, and C<find> for path-based access to nested structures.

=cut

$test->for('description');

=examples

The following are examples of searching in Venus.

=cut

=example search.0

Use C<any> to check if any element matches.

=example-1 search.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5]);

  my $result = $array->any(sub { $_[1] > 3 }) ? 'found' : 'none';

  $result;

  # "found"

=cut

$test->for('example', 1, 'search.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'found');

  $result
});

=example search.1

Use C<all> to check if all elements match.

=example-1 search.1

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([2, 4, 6, 8]);

  my $result = $array->all(sub { $_[1] % 2 == 0 }) ? 'all even' : 'not all';

  $result;

  # "all even"

=cut

$test->for('example', 1, 'search.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'all even');

  $result
});

=example search.2

Use C<none> to check if no elements match.

=example-1 search.2

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 3, 5, 7]);

  my $result = $array->none(sub { $_[1] % 2 == 0 }) ? 'no evens' : 'has evens';

  $result;

  # "no evens"

=cut

$test->for('example', 1, 'search.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'no evens');

  $result
});

=example search.3

Use C<exists> to check for keys in a hash.

=example-1 search.3

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ name => 'Alice', age => 30 });

  my $result = $hash->exists('name') ? 'has name' : 'no name';

  $result;

  # "has name"

=cut

$test->for('example', 1, 'search.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'has name');

  $result
});

=example search.4

Use C<find> for path-based access to nested data.

=example-1 search.4

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({
    user => { profile => { city => 'NYC' } }
  });

  my $result = $hash->find('user', 'profile', 'city');

  $result;

  # "NYC"

=cut

$test->for('example', 1, 'search.4', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'NYC');

  $result
});

=example search.5

Use C<one> to check if exactly one element matches.

=example-1 search.5

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3, 4, 5]);

  my $result = $array->one(sub { $_[1] == 3 }) ? 'one match' : 'not one';

  $result;

  # "one match"

=cut

$test->for('example', 1, 'search.5', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'one match');

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

$test->do('render', './topics/searching.pod')->done;
