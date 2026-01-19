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

CLI

=cut

$test->for('tagline');

=abstract

CLI in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Cli;

  my $cli = Venus::Cli->new(name => 'mycli');

  $cli->option('name', {
    help => 'Your name',
    type => 'string',
  });

  $cli->parse('--name', 'Alice');

  $cli->option_value('name');

  # "Alice"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Alice');

  $result
});

=description

L<Venus::Cli> provides a framework for building command-line applications.
Define options with C<option>, arguments with C<argument>, and use C<parse>
to process input.

=cut

$test->for('description');

=examples

The following are examples of CLI applications in Venus.

=cut

=example cli.0

Define boolean options.

=example-1 cli.0

  package main;

  use Venus::Cli;

  my $cli = Venus::Cli->new(name => 'mycli');

  $cli->option('verbose', {
    help => 'Verbose output',
    alias => 'v',
    type => 'boolean',
  });

  $cli->parse('--verbose');

  $cli->option_value('verbose') ? 'verbose' : 'quiet';

  # "verbose"

=cut

$test->for('example', 1, 'cli.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'verbose');

  $result
});

=example cli.1

Define numeric options.

=example-1 cli.1

  package main;

  use Venus::Cli;

  my $cli = Venus::Cli->new(name => 'mycli');

  $cli->option('port', {
    help => 'Port number',
    type => 'number',
    default => 8080,
  });

  $cli->parse('--port', '3000');

  $cli->option_value('port');

  # 3000

=cut

$test->for('example', 1, 'cli.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3000);

  $result
});

=example cli.2

Define positional arguments.

=example-1 cli.2

  package main;

  use Venus::Cli;

  my $cli = Venus::Cli->new(name => 'mycli');

  $cli->argument('file', {
    help => 'Input file',
    range => '0',
  });

  $cli->parse('input.txt');

  $cli->argument_value('file');

  # "input.txt"

=cut

$test->for('example', 1, 'cli.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'input.txt');

  $result
});

=example cli.3

Use default values for options.

=example-1 cli.3

  package main;

  use Venus::Cli;

  my $cli = Venus::Cli->new(name => 'mycli');

  $cli->option('host', {
    help => 'Server host',
    type => 'string',
    default => 'localhost',
  });

  $cli->parse;

  $cli->option_value('host');

  # "localhost"

=cut

$test->for('example', 1, 'cli.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'localhost');

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

$test->do('render', './topics/cli.pod')->done;
