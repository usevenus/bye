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

Values

=cut

$test->for('tagline');

=abstract

Value Objects in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::String;

  my $string = Venus::String->new('hello world');

  print $string;

  # "hello world"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=description

Venus provides value classes that wrap Perl primitives (strings, numbers,
arrays, hashes) in objects. These objects stringify and numify automatically,
and provide useful methods for manipulation.

=cut

$test->for('description');

=examples

The following are examples of value objects in Venus.

=cut

=example string.0

L<Venus::String> wraps strings. It stringifies automatically when printed.

=example-1 string.0

  package main;

  use Venus::String;

  my $string = Venus::String->new('hello world');

  print $string;

  # prints "hello world"

=cut

$test->for('example', 1, 'string.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example number.0

L<Venus::Number> wraps numbers. It numifies automatically in numeric contexts.

=example-1 number.0

  package main;

  use Venus::Number;

  my $number = Venus::Number->new(42);

  my $result = $number + 8;

  # 50

=cut

$test->for('example', 1, 'number.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 50);

  $result
});

=example array.0

L<Venus::Array> wraps arrayrefs. Use C<get> to retrieve the underlying data.

=example-1 array.0

  package main;

  use Venus::Array;

  my $array = Venus::Array->new([1, 2, 3]);

  my $data = $array->get;

  # [1, 2, 3]

=cut

$test->for('example', 1, 'array.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, [1, 2, 3]);

  $result
});

=example hash.0

L<Venus::Hash> wraps hashrefs. Use C<get> to retrieve the underlying data.

=example-1 hash.0

  package main;

  use Venus::Hash;

  my $hash = Venus::Hash->new({ name => 'Venus' });

  my $data = $hash->get;

  # { name => 'Venus' }

=cut

$test->for('example', 1, 'hash.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, { name => 'Venus' });

  $result
});

=example boolean.0

L<Venus::Boolean>, L<Venus::True>, and L<Venus::False> represent boolean values.

=example-1 boolean.0

  package main;

  use Venus::True;
  use Venus::False;

  my $true = Venus::True->new;
  my $false = Venus::False->new;

  my $result = $true && !$false;

  # 1

=cut

$test->for('example', 1, 'boolean.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example boolean.1

The C<Venus> package automatically exports C<true> and C<false> keyword
functions which provide fully backward-compatible boolean values.

=example-1 boolean.1

  package main;

  use Venus;

  my $result = true && !false;

  # 1

=cut

$test->for('example', 1, 'boolean.1', sub {
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

$test->do('render', './topics/values.pod')->done;
