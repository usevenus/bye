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

Random

=cut

$test->for('tagline');

=abstract

Random in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Random;

  my $random = Venus::Random->new(42);

  $random->digit;

  # 5

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->ok(defined $result);

  $result
});

=description

L<Venus::Random> provides methods for generating random data including numbers,
strings, UUIDs, and passwords.

=cut

$test->for('description');

=examples

The following are examples of random generation in Venus.

=cut

=example rand.0

Use C<number> to generate random integers.

=example-1 rand.0

  package main;

  use Venus::Random;

  my $random = Venus::Random->new(42);

  my $num = $random->number(1, 100);

  $num >= 1 && $num <= 100 ? 'in range' : 'out of range';

  # "in range"

=cut

$test->for('example', 1, 'rand.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'in range');

  $result
});

=example rand.1

Use C<letter> to generate random letters.

=example-1 rand.1

  package main;

  use Venus::Random;

  my $random = Venus::Random->new(42);

  my $letter = $random->letter;

  $letter =~ /[a-zA-Z]/ ? 'valid letter' : 'invalid';

  # "valid letter"

=cut

$test->for('example', 1, 'rand.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid letter');

  $result
});

=example rand.2

Use C<uuid> to generate UUIDs.

=example-1 rand.2

  package main;

  use Venus::Random;

  my $random = Venus::Random->new(42);

  my $uuid = $random->uuid;

  $uuid =~ /^[0-9a-f-]+$/ ? 'valid uuid' : 'invalid';

  # "valid uuid"

=cut

$test->for('example', 1, 'rand.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid uuid');

  $result
});

=example rand.3

Use C<select> to select random elements from a list.

=example-1 rand.3

  package main;

  use Venus::Random;

  my $random = Venus::Random->new(42);

  my $item = $random->select(['a', 'b', 'c']);

  $item =~ /^[abc]$/ ? 'valid select' : 'invalid';

  # "valid select"

=cut

$test->for('example', 1, 'rand.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid select');

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

$test->do('render', './topics/random.pod')->done;
