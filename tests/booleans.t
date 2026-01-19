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

Booleans

=cut

$test->for('tagline');

=abstract

Boolean Values in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus;

  my $result = true && !false;

  # 1

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=description

Venus provides boolean values through L<Venus::Boolean>, L<Venus::True>, and
L<Venus::False> classes, plus the convenient C<true> and C<false> keyword
functions exported from L<Venus>.

=cut

$test->for('description');

=examples

The following are examples of boolean operations using Venus.

=cut

=example true.0

Use C<true> from Venus as a boolean true value.

=example-1 true.0

  package main;

  use Venus;

  my $value = true;

  my $result = $value ? 'yes' : 'no';

  # "yes"

=cut

$test->for('example', 1, 'true.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'yes');

  $result
});

=example false.0

Use C<false> from Venus as a boolean false value.

=example-1 false.0

  package main;

  use Venus;

  my $value = false;

  my $result = $value ? 'yes' : 'no';

  # "no"

=cut

$test->for('example', 1, 'false.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'no');

  $result
});

=example boolean.0

Use L<Venus::Boolean> to create a boolean from any value.

=example-1 boolean.0

  package main;

  use Venus::Boolean;

  my $bool = Venus::Boolean->new('yes');

  my $result = $bool->is_true;

  # 1

=cut

$test->for('example', 1, 'boolean.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example boolean.1

Use L<Venus::True> for explicit true values.

=example-1 boolean.1

  package main;

  use Venus::True;

  my $bool = Venus::True->new;

  my $result = $bool && 'works';

  # "works"

=cut

$test->for('example', 1, 'boolean.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'works');

  $result
});

=example boolean.2

Use L<Venus::False> for explicit false values.

=example-1 boolean.2

  package main;

  use Venus::False;

  my $bool = Venus::False->new;

  my $result = $bool || 'default';

  # "default"

=cut

$test->for('example', 1, 'boolean.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'default');

  $result
});

=example boolean.3

Use C<negate> to flip a boolean value.

=example-1 boolean.3

  package main;

  use Venus::Boolean;

  my $bool = Venus::Boolean->new(0);

  my $result = $bool->negate;

  # 1

=cut

$test->for('example', 1, 'boolean.3', sub {
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

$test->do('render', './topics/booleans.pod')->done;
