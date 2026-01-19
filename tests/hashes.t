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

Hashes

=cut

$test->for('tagline');

=abstract

Hash Operations in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ name => 'Venus', type => 'planet' });

  $hash->keys;

  # ["name", "type"]

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same([sort @$result], ['name', 'type']);

  1
});

=description

L<Venus::Hash> wraps Perl hashrefs and provides methods for common hash
operations. Hashes deref automatically, so they work seamlessly with Perl's
built-in hash operations.

=cut

$test->for('description');

=examples

The following are examples of hash operations using Venus.

=cut

=example hash.0

Use C<keys> and C<values> to list hash contents.

=example-1 hash.0

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ a => 1, b => 2 });

  my $result = $hash->values;

  # [1, 2] (order may vary)

=cut

$test->for('example', 1, 'hash.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same([sort @$result], [1, 2]);

  1
});

=example hash.1

Use C<exists> to check for key presence.

=example-1 hash.1

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ name => 'Venus' });

  my $result = $hash->exists('name');

  # 1

=cut

$test->for('example', 1, 'hash.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example hash.2

Use C<delete> to remove a key and return its value.

=example-1 hash.2

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ a => 1, b => 2, c => 3 });

  my $result = $hash->delete('b');

  # 2

=cut

$test->for('example', 1, 'hash.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 2);

  $result
});

=example hash.3

Use C<count> to get the number of key-value pairs.

=example-1 hash.3

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ a => 1, b => 2, c => 3 });

  my $result = $hash->count;

  # 3

=cut

$test->for('example', 1, 'hash.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3);

  $result
});

=example hash.4

Use C<merge> to combine hashes, with later values overwriting earlier ones.

=example-1 hash.4

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ a => 1, b => 2 });

  my $result = $hash->merge({ b => 3, c => 4 });

  # { a => 1, b => 3, c => 4 }

=cut

$test->for('example', 1, 'hash.4', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, { a => 1, b => 3, c => 4 });

  1
});

=example hash.5

Use C<pairs> to get key-value pairs as an array of arrays.

=example-1 hash.5

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ x => 10, y => 20 });

  my $result = $hash->pairs;

  # [["x", 10], ["y", 20]] (order may vary)

=cut

$test->for('example', 1, 'hash.5', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  my %h = map { $_->[0] => $_->[1] } @$result;
  $test->same(\%h, { x => 10, y => 20 });

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

$test->do('render', './topics/hashes.pod')->done;
