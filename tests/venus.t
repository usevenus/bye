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

Bootstrap

=cut

$test->for('tagline');

=abstract

Bootstrapping in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus qw(box cast array hash string);

  my $result = box("  hello world  ")->trim->uppercase->unbox->value;

  $result;

  # "HELLO WORLD"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "HELLO WORLD");

  $result
});

=description

The real ergonomics and productivity boosts in Venus come from combining its
various abilities. The L<Venus> module can export a laundry list of constructor
functions like C<string>, C<array>, C<hash>, C<box>, and C<cast> that create
(i.e., bootstrap) Venus objects from Perl values. Use C<box> for fluent method
chaining across transformations, C<cast> for automatic type detection, and
constructor functions for readable object creation.

=cut

$test->for('description');

=examples

The following examples show how combining Venus features creates powerful,
expressive code.

=cut

=example venus.0

Use C<box> for fluent method chaining across multiple transformations.

=example-1 venus.0

  package main;

  use Venus qw(box);

  my $result = box([5, 3, 1, 4, 1, 5, 9, 2, 6])
    ->unique
    ->sort
    ->unbox
    ->value;

  join ",", @$result;

  # "1,2,3,4,5,6,9"

=cut

$test->for('example', 1, 'venus.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1,2,3,4,5,6,9');

  $result
});

=example venus.1

Use C<cast> to automatically detect types and create the appropriate object.

=example-1 venus.1

  package main;

  use Venus qw(cast);

  my $str = cast("hello");

  my $arr = cast([1, 2, 3]);

  my $hsh = cast({a => 1});

  join "-", ref($str), ref($arr), ref($hsh);

  # "Venus::String-Venus::Array-Venus::Hash"

=cut

$test->for('example', 1, 'venus.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Venus::String-Venus::Array-Venus::Hash');

  $result
});

=example venus.2

Use constructor functions for clear, readable object creation.

=example-1 venus.2

  package main;

  use Venus qw(array hash);

  my $users = array([
    hash({name => 'alice', role => 'admin'}),
    hash({name => 'bob', role => 'user'}),
  ]);

  $users->count;

  # 2

=cut

$test->for('example', 1, 'venus.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 2);

  $result
});

=example venus.3

Combine C<array> operations with callbacks for data processing pipelines.

=example-1 venus.3

  package main;

  use Venus qw(array);

  my $numbers = array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

  my $evens = $numbers->grep(sub { $_ % 2 == 0 });

  array($evens)->join(", ");

  # "2, 4, 6, 8, 10"

=cut

$test->for('example', 1, 'venus.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '2, 4, 6, 8, 10');

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

$test->do('render', './topics/venus.pod')->done;
