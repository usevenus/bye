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

Strings

=cut

$test->for('tagline');

=abstract

String Operations in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::String;

  my $string = Venus::String->new('hello world');

  $string->uppercase;

  # "HELLO WORLD"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'HELLO WORLD');

  $result
});

=description

L<Venus::String> provides methods for manipulating string data. Strings
auto-stringify, so they work seamlessly with Perl's built-in string operators.

=cut

$test->for('description');

=examples

The following are examples of string operations using Venus.

=cut

=example string.0

Use C<uppercase> and C<lowercase> to change case.

=example-1 string.0

  package main;

  use Venus::String;

  my $string = Venus::String->new('Hello World');

  my $upper = $string->uppercase;

  # "HELLO WORLD"

=cut

$test->for('example', 1, 'string.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'HELLO WORLD');

  $result
});

=example string.1

Use C<camelcase> and C<snakecase> for identifier transformations.

=example-1 string.1

  package main;

  use Venus::String;

  my $string = Venus::String->new('hello world');

  my $camel = $string->camelcase;

  # "helloWorld"

=cut

$test->for('example', 1, 'string.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'helloWorld');

  $result
});

=example string.2

Use C<contains> and C<index> to search within strings.

=example-1 string.2

  package main;

  use Venus::String;

  my $string = Venus::String->new('hello world');

  my $found = $string->contains('world');

  # 1

=cut

$test->for('example', 1, 'string.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example string.3

Use C<append>, C<prepend>, and C<trim> for string manipulation.

=example-1 string.3

  package main;

  use Venus::String;

  my $string = Venus::String->new('  hello  ');

  my $trimmed = $string->trim;

  # "hello"

=cut

$test->for('example', 1, 'string.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'hello');

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

$test->do('render', './topics/strings.pod')->done;
