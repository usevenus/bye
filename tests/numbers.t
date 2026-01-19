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

Numbers

=cut

$test->for('tagline');

=abstract

Numeric Operations in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Number;

  my $number = Venus::Number->new(10);

  $number->add(5);

  # 15

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 15);

  $result
});

=description

L<Venus::Number> and L<Venus::Float> provide methods for numeric operations.
Numbers auto-numify, so they work seamlessly with Perl's built-in operators.

=cut

$test->for('description');

=examples

The following are examples of numeric operations using Venus.

=cut

=example number.0

Use C<add>, C<sub>, and C<multi> for basic arithmetic.

=example-1 number.0

  package main;

  use Venus::Number;

  my $number = Venus::Number->new(10);

  my $result = $number->multi(3);

  # 30

=cut

$test->for('example', 1, 'number.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 30);

  $result
});

=example number.1

Use C<gt>, C<lt>, and C<eq> for comparisons.

=example-1 number.1

  package main;

  use Venus::Number;

  my $number = Venus::Number->new(10);

  my $result = $number->gt(5);

  # 1

=cut

$test->for('example', 1, 'number.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example number.2

Use C<abs>, C<sqrt>, and C<pow> for math operations.

=example-1 number.2

  package main;

  use Venus::Number;

  my $number = Venus::Number->new(16);

  my $result = $number->sqrt;

  # 4

=cut

$test->for('example', 1, 'number.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 4);

  $result
});

=example float.0

Use L<Venus::Float> for decimal number operations.

=example-1 float.0

  package main;

  use Venus::Float;

  my $float = Venus::Float->new(3.14159);

  my $result = $float->multi(2);

  # 6.28318

=cut

$test->for('example', 1, 'float.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->like($result, qr/^6\.283/);

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

$test->do('render', './topics/numbers.pod')->done;
