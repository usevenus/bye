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

Space

=cut

$test->for('tagline');

=abstract

Space in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Space;

  my $space = Venus::Space->new('Venus::String');

  $space->loaded ? 'loaded' : 'not loaded';

  # "not loaded"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->ok(defined $result);

  $result
});

=description

L<Venus::Space> provides package introspection and manipulation including
loading modules, checking inheritance, and accessing package metadata.

=cut

$test->for('description');

=examples

The following are examples of package introspection in Venus.

=cut

=example space.0

Use C<load> to load a module.

=example-1 space.0

  package main;

  use Venus::Space;

  my $space = Venus::Space->new('Venus::String');

  $space->load;

  $space->loaded ? 'loaded' : 'not loaded';

  # "loaded"

=cut

$test->for('example', 1, 'space.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'loaded');

  $result
});

=example space.1

Use C<package> to get the package name.

=example-1 space.1

  package main;

  use Venus::Space;

  my $space = Venus::Space->new('Venus::Array');

  $space->package;

  # "Venus::Array"

=cut

$test->for('example', 1, 'space.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Venus::Array');

  $result
});

=example space.2

Use C<parent> to get the parent package.

=example-1 space.2

  package main;

  use Venus::Space;

  my $space = Venus::Space->new('Venus::Array');

  $space->load;

  my $parent = $space->parent;

  $parent->package;

  # "Venus"

=cut

$test->for('example', 1, 'space.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Venus');

  $result
});

=example space.3

Use C<child> to create a child package space.

=example-1 space.3

  package main;

  use Venus::Space;

  my $space = Venus::Space->new('Venus');

  my $child = $space->child('Array');

  $child->package;

  # "Venus::Array"

=cut

$test->for('example', 1, 'space.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Venus::Array');

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

$test->do('render', './topics/space.pod')->done;
