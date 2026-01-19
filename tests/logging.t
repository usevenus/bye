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

Logging

=cut

$test->for('tagline');

=abstract

Logging in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Log;

  my $log = Venus::Log->new;

  $log->level('debug');

  $log->debug("Test message");

  # bless(..., "Venus::Log")

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Log');

  $result
});

=description

L<Venus::Log> provides logging with configurable levels. Methods include
C<debug>, C<info>, C<warn>, C<error>, and C<fatal>. Use C<level> to set
the minimum log level.

=cut

$test->for('description');

=examples

The following are examples of logging in Venus.

=cut

=example log.0

Use C<info> to log informational messages.

=example-1 log.0

  package main;

  use Venus::Log;

  my $log = Venus::Log->new;

  $log->level('info');

  $log->info("Application started");

  # bless(..., "Venus::Log")

=cut

$test->for('example', 1, 'log.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Log');

  $result
});

=example log.1

Use C<warn> to log warning messages.

=example-1 log.1

  package main;

  use Venus::Log;

  my $log = Venus::Log->new;

  $log->level('warn');

  $log->warn("Resource running low");

  # bless(..., "Venus::Log")

=cut

$test->for('example', 1, 'log.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Log');

  $result
});

=example log.2

Use C<error> to log error messages.

=example-1 log.2

  package main;

  use Venus::Log;

  my $log = Venus::Log->new;

  $log->level('error');

  $log->error("Operation failed");

  # bless(..., "Venus::Log")

=cut

$test->for('example', 1, 'log.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->type($result, 'Venus::Log');

  $result
});

=example log.3

Use C<level_name> to get the current log level name.

=example-1 log.3

  package main;

  use Venus::Log;

  my $log = Venus::Log->new;

  $log->level('debug');

  $log->level_name;

  # "debug"

=cut

$test->for('example', 1, 'log.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'debug');

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

$test->do('render', './topics/logging.pod')->done;
