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

Assert

=cut

$test->for('tagline');

=abstract

Assert in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('string');

  $assert->check('hello') ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "valid");

  $result
});

=description

L<Venus::Assert> provides type assertions with coercions. Create an assertion
with a type expression and use C<check> to validate or C<coerce> to transform.

=cut

$test->for('description');

=examples

The following are examples of type assertions in Venus.

=cut

=example assert.0

Use C<check> to validate types.

=example-1 assert.0

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('number');

  $assert->check(42) ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'assert.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example assert.1

Check array types.

=example-1 assert.1

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('arrayref');

  $assert->check([1, 2, 3]) ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'assert.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example assert.2

Use C<maybe> for optional values.

=example-1 assert.2

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('maybe[string]');

  my $valid_undef = $assert->check(undef) ? 'ok' : 'fail';

  my $valid_str = $assert->check('hello') ? 'ok' : 'fail';

  "$valid_undef-$valid_str";

  # "ok-ok"

=cut

$test->for('example', 1, 'assert.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'ok-ok');

  $result
});

=example assert.3

Use C<either> for union types.

=example-1 assert.3

  package main;

  use Venus::Assert;

  my $assert = Venus::Assert->new('string | number');

  my $check_str = $assert->check('hello');

  my $check_num = $assert->check(42);

  $check_str && $check_num ? 'both valid' : 'failed';

  # "both valid"

=cut

$test->for('example', 1, 'assert.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'both valid');

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

$test->do('render', './topics/assert.pod')->done;
