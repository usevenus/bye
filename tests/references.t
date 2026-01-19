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

References

=cut

$test->for('tagline');

=abstract

Reference Types in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Code;

  my $code = Venus::Code->new(sub { $_[0] * 2 });

  $code->call(5);

  # 10

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 10);

  $result
});

=description

Venus provides wrapper classes for Perl's reference types: L<Venus::Scalar> for
scalar references and L<Venus::Code> for code references (subroutines).

=cut

$test->for('description');

=examples

The following are examples of reference types in Venus.

=cut

=example scalar.0

Use L<Venus::Scalar> to wrap a scalar reference.

=example-1 scalar.0

  package main;

  use Venus::Scalar;

  my $scalar = Venus::Scalar->new(\my $value);

  ${ $scalar->get } = 'hello';

  my $result = ${ $scalar->get };

  # "hello"

=cut

$test->for('example', 1, 'scalar.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'hello');

  $result
});

=example code.0

Use L<Venus::Code> to wrap a code reference and call it.

=example-1 code.0

  package main;

  use Venus::Code;

  my $code = Venus::Code->new(sub { shift() + 10 });

  my $result = $code->call(5);

  # 15

=cut

$test->for('example', 1, 'code.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 15);

  $result
});

=example code.1

Use C<curry> to create a new coderef with pre-applied arguments.

=example-1 code.1

  package main;

  use Venus::Code;

  my $add = Venus::Code->new(sub { $_[0] + $_[1] });

  my $add5 = $add->curry(5);

  my $result = $add5->(3);

  # 8

=cut

$test->for('example', 1, 'code.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 8);

  $result
});

=example code.2

Use C<compose> to chain multiple coderefs together.

=example-1 code.2

  package main;

  use Venus::Code;

  my $double = Venus::Code->new(sub { $_[0] * 2 });

  my $add1 = sub { $_[0] + 1 };

  my $composed = $double->compose($add1);

  my $result = $composed->(5);

  # 11 (5 * 2 + 1)

=cut

$test->for('example', 1, 'code.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 11);

  $result
});

=example code.3

Use C<rcurry> to create a coderef with arguments appended (right curry).

=example-1 code.3

  package main;

  use Venus::Code;

  my $greet = Venus::Code->new(sub { "$_[0], $_[1]!" });

  my $hello = $greet->rcurry('World');

  my $result = $hello->('Hello');

  # "Hello, World!"

=cut

$test->for('example', 1, 'code.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Hello, World!');

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

$test->do('render', './topics/references.pod')->done;
