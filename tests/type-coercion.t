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

Type Coercion

=cut

$test->for('tagline');

=abstract

Type Coercion in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Coercion;

  my $coercion = Venus::Coercion->new;

  $coercion->accept('string');

  $coercion->format(sub { uc $_ });

  $coercion->result('hello');

  # "HELLO"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'HELLO');

  $result
});

=description

L<Venus::Coercion> transforms values from one form to another. It accepts type
constraints and applies formatters to coerce values into the desired shape.

=cut

$test->for('description');

=examples

The following are examples of type coercion in Venus.

=cut

=example coercion.0

Use C<accept> and C<format> to define a coercion.

=example-1 coercion.0

  package main;

  use Venus::Coercion;

  my $coercion = Venus::Coercion->new;

  $coercion->accept('number');

  $coercion->format(sub { $_ * 2 });

  my $result = $coercion->result(5);

  # 10

=cut

$test->for('example', 1, 'coercion.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 10);

  $result
});

=example coercion.1

Chain multiple formatters for complex transformations.

=example-1 coercion.1

  package main;

  use Venus::Coercion;

  my $coercion = Venus::Coercion->new;

  $coercion->accept('string');

  $coercion->format(sub { $_ . '!' });

  $coercion->format(sub { uc $_ });

  my $result = $coercion->result('hello');

  # "HELLO!"

=cut

$test->for('example', 1, 'coercion.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'HELLO!');

  $result
});

=example coercion.2

Use C<Venus::Type> to create coercions from type expressions.

=example-1 coercion.2

  package main;

  use Venus::Type;

  my $type = Venus::Type->new;

  my $coercion = $type->coercion('arrayref');

  $coercion->format(sub { scalar @{$_} });

  my $result = $coercion->result([1, 2, 3]);

  # 3

=cut

$test->for('example', 1, 'coercion.2', sub {
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

$test->do('render', './topics/type-coercion.pod')->done;
