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

Type Casting

=cut

$test->for('tagline');

=abstract

Type Casting in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus 'cast';

  my $object = cast('hello');

  $object->isa('Venus::String');

  # 1

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=description

Venus provides the C<cast> function to convert Perl primitives into Venus
value objects. The function automatically detects the type and wraps it in
the appropriate Venus class.

=cut

$test->for('description');

=examples

The following are examples of type casting in Venus.

=cut

=example cast.0

Use C<cast> to convert a string to a Venus::String.

=example-1 cast.0

  package main;

  use Venus 'cast';

  my $object = cast('hello world');

  my $result = $object->uppercase;

  # "HELLO WORLD"

=cut

$test->for('example', 1, 'cast.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'HELLO WORLD');

  $result
});

=example cast.1

Use C<cast> to convert a number to a Venus::Number.

=example-1 cast.1

  package main;

  use Venus 'cast';

  my $object = cast(42);

  my $result = $object->add(8);

  # 50

=cut

$test->for('example', 1, 'cast.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 50);

  $result
});

=example cast.2

Use C<cast> to convert an arrayref to a Venus::Array.

=example-1 cast.2

  package main;

  use Venus 'cast';

  my $object = cast([1, 2, 3]);

  my $result = $object->count;

  # 3

=cut

$test->for('example', 1, 'cast.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3);

  $result
});

=example cast.3

Use C<cast> to convert a hashref to a Venus::Hash.

=example-1 cast.3

  package main;

  use Venus 'cast';

  my $object = cast({ name => 'Venus' });

  my $result = $object->get('name');

  # "Venus"

=cut

$test->for('example', 1, 'cast.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Venus');

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

$test->do('render', './topics/type-casting.pod')->done;
