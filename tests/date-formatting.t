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

Date Formatting

=cut

$test->for('tagline');

=abstract

Date Formatting in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(0);

  $date->rfc822;

  # "Thu, 01 Jan 1970 00:00:00 +0000"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->ok($result =~ /01 Jan 1970/);

  $result
});

=description

L<Venus::Date> provides multiple formatting methods including C<rfc822>,
C<rfc3339>, C<iso8601>, and custom C<format> strings.

=cut

$test->for('description');

=examples

The following are examples of date formatting in Venus.

=cut

=example fmt.0

Use C<hms> to get hours, minutes, seconds.

=example-1 fmt.0

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(3661);

  $date->hms;

  # "01:01:01"

=cut

$test->for('example', 1, 'fmt.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '01:01:01');

  $result
});

=example fmt.1

Use C<mdy> to get month, day, year.

=example-1 fmt.1

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(0);

  $date->mdy;

  # "01-01-1970"

=cut

$test->for('example', 1, 'fmt.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '01-01-1970');

  $result
});

=example fmt.2

Use C<rfc3339> for RFC 3339 format.

=example-1 fmt.2

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(0);

  my $rfc = $date->rfc3339;

  $rfc =~ /1970-01-01/ ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'fmt.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example fmt.3

Use C<string> for ISO 8601 string format.

=example-1 fmt.3

  package main;

  use Venus::Date;

  my $date = Venus::Date->new(0);

  my $str = $date->string;

  $str =~ /1970-01-01/ ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'fmt.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

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

$test->do('render', './topics/date-formatting.pod')->done;
