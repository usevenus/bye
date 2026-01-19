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

Process

=cut

$test->for('tagline');

=abstract

Process in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Process;

  my $process = Venus::Process->new;

  $process->pid > 0 ? 'has pid' : 'no pid';

  # "has pid"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "has pid");

  $result
});

=description

L<Venus::Process> provides methods for process management including forking,
communication between processes, and lifecycle management.

=cut

$test->for('description');

=examples

The following are examples of process operations in Venus.

=cut

=example proc.0

Use C<pid> to get the current process ID.

=example-1 proc.0

  package main;

  use Venus::Process;

  my $process = Venus::Process->new;

  $process->pid > 0 ? 'valid pid' : 'invalid pid';

  # "valid pid"

=cut

$test->for('example', 1, 'proc.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid pid');

  $result
});

=example proc.1

Check if a process is registered (active).

=example-1 proc.1

  package main;

  use Venus::Process;

  my $process = Venus::Process->new;

  $process->is_registered ? 'registered' : 'not registered';

  # "not registered"

=cut

$test->for('example', 1, 'proc.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'not registered');

  $result
});

=example proc.2

Use C<trap> to set a signal handler.

=example-1 proc.2

  package main;

  use Venus::Process;

  my $process = Venus::Process->new;

  $process->trap(USR1 => sub { });

  $process->untrap('USR1');

  'signal setup';

  # "signal setup"

=cut

$test->for('example', 1, 'proc.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'signal setup');

  $result
});

=example proc.3

Use C<exit> to terminate the process with a code.

=example-1 proc.3

  package main;

  use Venus::Process;

  my $process = Venus::Process->new;

  # In practice: $process->exit(0);

  'exit available';

  # "exit available"

=cut

$test->for('example', 1, 'proc.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'exit available');

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

$test->do('render', './topics/process.pod')->done;
