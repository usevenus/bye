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

Meta

=cut

$test->for('tagline');

=abstract

Meta in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Meta;

  my $meta = Venus::Meta->new(name => 'Venus::String');

  my $attrs = $meta->attrs;

  ref $attrs;

  # "ARRAY"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "ARRAY");

  $result
});

=description

L<Venus::Meta> provides package introspection for examining attributes, bases,
roles, and methods of a package.

=cut

$test->for('description');

=examples

The following are examples of package introspection in Venus.

=cut

=example meta.0

Use C<attrs> to list package attributes.

=example-1 meta.0

  package main;

  use Venus::Meta;

  my $meta = Venus::Meta->new(name => 'Venus::Array');

  my $attrs = $meta->attrs;

  ref $attrs;

  # "ARRAY"

=cut

$test->for('example', 1, 'meta.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'ARRAY');

  $result
});

=example meta.1

Use C<bases> to list base classes.

=example-1 meta.1

  package main;

  use Venus::Meta;

  my $meta = Venus::Meta->new(name => 'Venus::Path');

  my $bases = $meta->bases;

  ref $bases;

  # "ARRAY"

=cut

$test->for('example', 1, 'meta.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'ARRAY');

  $result
});

=example meta.2

Use C<roles> to list composed roles.

=example-1 meta.2

  package main;

  use Venus::Meta;

  my $meta = Venus::Meta->new(name => 'Venus::String');

  my $roles = $meta->roles;

  ref $roles;

  # "ARRAY"

=cut

$test->for('example', 1, 'meta.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'ARRAY');

  $result
});

=example meta.3

Use C<subs> to list package methods.

=example-1 meta.3

  package main;

  use Venus::Meta;

  my $meta = Venus::Meta->new(name => 'Venus::Array');

  my $subs = $meta->subs;

  ref $subs;

  # "ARRAY"

=cut

$test->for('example', 1, 'meta.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'ARRAY');

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

$test->do('render', './topics/meta.pod')->done;
