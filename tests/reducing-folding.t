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

Gathering and Reducing

=cut

$test->for('tagline');

=abstract

Gathering and Reducing in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Gather;

  my $gather = Venus::Gather->new([1, 2, 3, 4, 5]);

  $gather->when(sub { $_ % 2 == 0 })->then(sub { $_ * 10 });

  $gather->none(sub { [] });

  my $result = $gather->result;

  join(',', @$result);

  # "20,40"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '20,40');

  $result
});

=description

L<Venus::Gather> provides pattern matching on collections. Use C<when> and
C<then> to define conditions and transformations. Items matching a condition
are transformed by the corresponding C<then> block.

=cut

$test->for('description');

=examples

The following are examples of gathering and reducing in Venus.

=cut

=example gather.0

Use C<when> and C<then> to transform matching items.

=example-1 gather.0

  package main;

  use Venus::Gather;

  my $gather = Venus::Gather->new(['apple', 'banana', 'cherry']);

  $gather->when(sub { /^a/ })->then(sub { uc $_ });
  $gather->when(sub { /^b/ })->then(sub { "fruit:$_" });

  $gather->none(sub { [] });

  my $result = $gather->result;

  join(',', @$result);

  # "APPLE,fruit:banana"

=cut

$test->for('example', 1, 'gather.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'APPLE,fruit:banana');

  $result
});

=example gather.1

Use C<take> to include matching items unchanged.

=example-1 gather.1

  package main;

  use Venus::Gather;

  my $gather = Venus::Gather->new([1, 2, 3, 4, 5, 6]);

  $gather->when(sub { $_ > 3 })->take;

  $gather->none(sub { [] });

  my $result = $gather->result;

  join(',', @$result);

  # "4,5,6"

=cut

$test->for('example', 1, 'gather.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '4,5,6');

  $result
});

=example gather.2

Use C<skip> to exclude matching items.

=example-1 gather.2

  package main;

  use Venus::Gather;

  my $gather = Venus::Gather->new([1, 2, 3, 4, 5]);

  $gather->when(sub { $_ % 2 == 0 })->skip;
  $gather->when(sub { 1 })->take;

  $gather->none(sub { [] });

  my $result = $gather->result;

  join(',', @$result);

  # "1,3,5"

=cut

$test->for('example', 1, 'gather.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1,3,5');

  $result
});

=example gather.3

Use C<just> to match exact values.

=example-1 gather.3

  package main;

  use Venus::Gather;

  my $gather = Venus::Gather->new(['red', 'green', 'blue']);

  $gather->just('red')->then(sub { '#FF0000' });
  $gather->just('green')->then(sub { '#00FF00' });
  $gather->just('blue')->then(sub { '#0000FF' });

  my $result = $gather->result;

  join(',', @$result);

  # "#FF0000,#00FF00,#0000FF"

=cut

$test->for('example', 1, 'gather.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '#FF0000,#00FF00,#0000FF');

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

$test->do('render', './topics/reducing-folding.pod')->done;
