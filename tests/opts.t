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

Opts

=cut

$test->for('tagline');

=abstract

Opts in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Opts;

  local @ARGV = ('--name=Alice');

  my $opts = Venus::Opts->new(
    specs => ['name|n=s'],
    named => { name => 'name' }
  );

  $opts->get('name');

  # "Alice"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  local @ARGV = ('--name=Alice');
  my $result = $tryable->result;
  $test->is($result, 'Alice');

  $result
});

=description

L<Venus::Opts> provides command-line option parsing using Getopt::Long specs.
Define options with C<specs>, map names with C<named>, and retrieve values
with C<get>.

=cut

$test->for('description');

=examples

The following are examples of command-line option parsing in Venus.

=cut

=example opts.0

Use C<specs> to define option types.

=example-1 opts.0

  package main;

  use Venus::Opts;

  local @ARGV = ('--verbose');

  my $opts = Venus::Opts->new(
    specs => ['verbose|v'],
    named => { verbose => 'verbose' }
  );

  $opts->get('verbose') ? 'verbose on' : 'verbose off';

  # "verbose on"

=cut

$test->for('example', 1, 'opts.0', sub {
  my ($tryable) = @_;
  local @ARGV = ('--verbose');
  my $result = $tryable->result;
  $test->is($result, 'verbose on');

  $result
});

=example opts.1

Use C<exists> to check if an option was provided.

=example-1 opts.1

  package main;

  use Venus::Opts;

  local @ARGV = ('--debug');

  my $opts = Venus::Opts->new(
    specs => ['debug|d', 'quiet|q'],
    named => { debug => 'debug', quiet => 'quiet' }
  );

  $opts->exists('quiet') ? 'has quiet' : 'no quiet';

  # "no quiet"

=cut

$test->for('example', 1, 'opts.1', sub {
  my ($tryable) = @_;
  local @ARGV = ('--debug');
  my $result = $tryable->result;
  $test->is($result, 'no quiet');

  $result
});

=example opts.2

Parse numeric option values.

=example-1 opts.2

  package main;

  use Venus::Opts;

  local @ARGV = ('--port=8080');

  my $opts = Venus::Opts->new(
    specs => ['port|p=i'],
    named => { port => 'port' }
  );

  $opts->get('port');

  # 8080

=cut

$test->for('example', 1, 'opts.2', sub {
  my ($tryable) = @_;
  local @ARGV = ('--port=8080');
  my $result = $tryable->result;
  $test->is($result, 8080);

  $result
});

=example opts.3

Use C<unused> to get non-option arguments.

=example-1 opts.3

  package main;

  use Venus::Opts;

  local @ARGV = ('--name=test', 'file.txt');

  my $opts = Venus::Opts->new(
    specs => ['name|n=s'],
    named => { name => 'name' }
  );

  my $unused = $opts->unused;

  $unused->[0];

  # "file.txt"

=cut

$test->for('example', 1, 'opts.3', sub {
  my ($tryable) = @_;
  local @ARGV = ('--name=test', 'file.txt');
  my $result = $tryable->result;
  $test->is($result, 'file.txt');

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

$test->do('render', './topics/opts.pod')->done;
