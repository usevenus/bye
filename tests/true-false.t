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

True False

=cut

$test->for('tagline');

=abstract

True False in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::True;
  use Venus::False;

  my $true = Venus::True->new;

  my $false = Venus::False->new;

  $true ? 'yes' : 'no';

  # "yes"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "yes");

  $result
});

=description

L<Venus::True> and L<Venus::False> provide boolean singleton values for
representing true and false in Venus.

=cut

$test->for('description');

=examples

The following are examples of boolean values in Venus.

=cut

=example bool.0

Use Venus::True for true values.

=example-1 bool.0

  package main;

  use Venus::True;

  my $true = Venus::True->new;

  $true ? 'truthy' : 'falsy';

  # "truthy"

=cut

$test->for('example', 1, 'bool.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'truthy');

  $result
});

=example bool.1

Use Venus::False for false values.

=example-1 bool.1

  package main;

  use Venus::False;

  my $false = Venus::False->new;

  $false ? 'truthy' : 'falsy';

  # "falsy"

=cut

$test->for('example', 1, 'bool.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'falsy');

  $result
});

=example bool.2

Compare boolean values.

=example-1 bool.2

  package main;

  use Venus::True;
  use Venus::False;

  my $true = Venus::True->new;

  my $false = Venus::False->new;

  $true && !$false ? 'logic works' : 'logic broken';

  # "logic works"

=cut

$test->for('example', 1, 'bool.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'logic works');

  $result
});

=example bool.3

Use boolean in conditionals.

=example-1 bool.3

  package main;

  use Venus::True;

  my $enabled = Venus::True->new;

  my $status = $enabled ? 'on' : 'off';

  $status;

  # "on"

=cut

$test->for('example', 1, 'bool.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'on');

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

$test->do('render', './topics/true-false.pod')->done;
