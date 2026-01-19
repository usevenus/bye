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

Date Time

=cut

$test->for('tagline');

=abstract

Date Time in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(0);

  $date->format('%Y-%m-%d');

  # "1970-01-01"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "1970-01-01");

  $result
});

=description

L<Venus::Date> provides date and time manipulation. Use C<format> for custom
formatting, C<add_*> and C<sub_*> for arithmetic, and C<iso8601> for standard
formats.

=cut

$test->for('description');

=examples

The following are examples of date and time operations in Venus.

=cut

=example date.0

Use C<format> to customize date output.

=example-1 date.0

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(0);

  $date->format('%H:%M:%S');

  # "00:00:00"

=cut

$test->for('example', 1, 'date.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '00:00:00');

  $result
});

=example date.1

Use C<add_days> to add days to a date.

=example-1 date.1

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(0);

  $date->add_days(1);

  $date->format('%Y-%m-%d');

  # "1970-01-02"

=cut

$test->for('example', 1, 'date.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '1970-01-02');

  $result
});

=example date.2

Use C<epoch> to get the Unix timestamp.

=example-1 date.2

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(86400);

  $date->epoch;

  # 86400

=cut

$test->for('example', 1, 'date.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 86400);

  $result
});

=example date.3

Use C<iso8601> for ISO 8601 formatted dates.

=example-1 date.3

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(0);

  my $iso = $date->iso8601;

  $iso =~ /1970-01-01/ ? 'valid iso' : 'invalid iso';

  # "valid iso"

=cut

$test->for('example', 1, 'date.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid iso');

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

$test->do('render', './topics/date-time.pod')->done;
