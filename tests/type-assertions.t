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

Type Assertions

=cut

$test->for('tagline');

=abstract

Type Assertions in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('Example');

  $assert->accept('string');

  $assert->valid('hello');

  # 1

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=description

L<Venus::Assert> provides type assertions with detailed error messages. Unlike
L<Venus::Check>, assertions include contextual information about what was
expected and what was received when validation fails.

=cut

$test->for('description');

=examples

The following are examples of type assertions in Venus.

=cut

=example assert.0

Use C<accept> to specify accepted types, then C<valid> to check.

=example-1 assert.0

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('Age');

  $assert->accept('number');

  my $result = $assert->valid(25);

  # 1

=cut

$test->for('example', 1, 'assert.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example assert.1

Use C<validate> to assert and return the value, throwing on failure.

=example-1 assert.1

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('Name');

  $assert->accept('string');

  my $result = $assert->validate('Alice');

  # "Alice"

=cut

$test->for('example', 1, 'assert.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Alice');

  $result
});

=example assert.2

Use C<expression> to accept complex type expressions.

=example-1 assert.2

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('OptionalId');

  $assert->expression('number | undef');

  my $result = $assert->valid(undef);

  # 1

=cut

$test->for('example', 1, 'assert.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example assert.3

Use C<expression> with the pipe operator to accept multiple types.

=example-1 assert.3

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('StringOrNumber');

  $assert->expression('string | number');

  my $valid_str = $assert->valid('hello');
  my $valid_num = $assert->valid(42);

  my $result = $valid_str && $valid_num;

  # 1

=cut

$test->for('example', 1, 'assert.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

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

$test->do('render', './topics/type-assertions.pod')->done;
