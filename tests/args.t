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

Args

=cut

$test->for('tagline');

=abstract

Args in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Args;

  local @ARGV = ('--name', 'Alice', 'file.txt');

  my $args = Venus::Args->new(named => { name => 1 });

  $args->get($args->name('name'));

  # "Alice"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  local @ARGV = ('--name', 'Alice', 'file.txt');
  my $result = $tryable->result;
  $test->is($result, 'Alice');

  $result
});

=description

L<Venus::Args> provides access to command-line arguments via C<@ARGV>. Use
C<named> to map argument names to indices, C<get> to retrieve values by index,
and C<exists> to check for named arguments.

=cut

$test->for('description');

=examples

The following are examples of argument handling in Venus.

=cut

=example args.0

Use C<get> to access arguments by index.

=example-1 args.0

  package main;

  use Venus::Args;

  local @ARGV = ('input.txt', 'output.txt');

  my $args = Venus::Args->new;

  $args->get(0);

  # "input.txt"

=cut

$test->for('example', 1, 'args.0', sub {
  my ($tryable) = @_;
  local @ARGV = ('input.txt', 'output.txt');
  my $result = $tryable->result;
  $test->is($result, 'input.txt');

  $result
});

=example args.1

Use C<named> to map names to argument indices.

=example-1 args.1

  package main;

  use Venus::Args;

  local @ARGV = ('--host', 'localhost', '--port', '8080');

  my $args = Venus::Args->new(named => { host => 1, port => 3 });

  $args->get($args->name('port'));

  # "8080"

=cut

$test->for('example', 1, 'args.1', sub {
  my ($tryable) = @_;
  local @ARGV = ('--host', 'localhost', '--port', '8080');
  my $result = $tryable->result;
  $test->is($result, '8080');

  $result
});

=example args.2

Use C<exists> to check if a named argument is defined.

=example-1 args.2

  package main;

  use Venus::Args;

  local @ARGV = ('--verbose', '--debug');

  my $args = Venus::Args->new(named => { verbose => 0, debug => 1 });

  $args->exists('verbose') ? 'has verbose' : 'no verbose';

  # "has verbose"

=cut

$test->for('example', 1, 'args.2', sub {
  my ($tryable) = @_;
  local @ARGV = ('--verbose', '--debug');
  my $result = $tryable->result;
  $test->is($result, 'has verbose');

  $result
});

=example args.3

Use C<indexed> to get a hash of index-value pairs.

=example-1 args.3

  package main;

  use Venus::Args;

  local @ARGV = ('a', 'b', 'c');

  my $args = Venus::Args->new;

  my $indexed = $args->indexed;

  $indexed->{1};

  # "b"

=cut

$test->for('example', 1, 'args.3', sub {
  my ($tryable) = @_;
  local @ARGV = ('a', 'b', 'c');
  my $result = $tryable->result;
  $test->is($result, 'b');

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

$test->do('render', './topics/args.pod')->done;
