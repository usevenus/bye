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

Type Checking

=cut

$test->for('tagline');

=abstract

Type Checking in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Check;

  my $check = Venus::Check->new;

  $check->string;

  $check->eval('hello');

  # 1

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=description

Venus provides L<Venus::Check> for type validation and L<Venus::Type> for
parsing type expressions. These tools help ensure data conforms to expected
types.

=cut

$test->for('description');

=examples

The following are examples of type checking in Venus.

=cut

=example check.0

Use C<Venus::Check> to validate values against types.

=example-1 check.0

  package main;

  use Venus::Check;

  my $check = Venus::Check->new;

  $check->number;

  my $result = $check->eval(42);

  # 1

=cut

$test->for('example', 1, 'check.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example check.1

Use C<maybe> to allow a type or undef.

=example-1 check.1

  package main;

  use Venus::Check;

  my $check = Venus::Check->new;

  $check->maybe('string');

  my $result = $check->eval(undef);

  # 1

=cut

$test->for('example', 1, 'check.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example check.2

Use C<either> to allow multiple types.

=example-1 check.2

  package main;

  use Venus::Check;

  my $check = Venus::Check->new;

  $check->either('string', 'number');

  my $result = $check->eval(42);

  # 1

=cut

$test->for('example', 1, 'check.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example check.3

Use C<result> to validate and return the value, or throw on failure.

=example-1 check.3

  package main;

  use Venus::Check;

  my $check = Venus::Check->new;

  $check->arrayref;

  my $result = $check->result([1, 2, 3]);

  # [1, 2, 3]

=cut

$test->for('example', 1, 'check.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, [1, 2, 3]);

  1
});

=example type.0

Use C<Venus::Type> to create checks from type expressions.

=example-1 type.0

  package main;

  use Venus::Type;

  my $type = Venus::Type->new;

  my $check = $type->check('string | number');

  my $result = $check->eval('hello');

  # 1

=cut

$test->for('example', 1, 'type.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example type.1

Use C<within> to check array contents.

=example-1 type.1

  package main;

  use Venus::Check;

  my $check = Venus::Check->new;

  $check->within('arrayref', 'string');

  my $result = $check->eval(['a', 'b', 'c']);

  # 1

=cut

$test->for('example', 1, 'type.1', sub {
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

$test->do('render', './topics/type-checking.pod')->done;
