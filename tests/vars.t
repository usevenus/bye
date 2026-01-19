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

Vars

=cut

$test->for('tagline');

=abstract

Vars in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Vars;

  local %ENV = (HOME => '/home/user', PATH => '/usr/bin');

  my $vars = Venus::Vars->new(named => { home => 'HOME' });

  $vars->get('home');

  # "/home/user"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  local %ENV = (HOME => '/home/user', PATH => '/usr/bin');
  my $result = $tryable->result;
  $test->is($result, '/home/user');

  $result
});

=description

L<Venus::Vars> provides access to environment variables via C<%ENV>. Use
C<named> to map variable names and C<get> to retrieve values.

=cut

$test->for('description');

=examples

The following are examples of environment variable handling in Venus.

=cut

=example vars.0

Use C<get> to access environment variables.

=example-1 vars.0

  package main;

  use Venus::Vars;

  local %ENV = (USER => 'alice');

  my $vars = Venus::Vars->new(named => { user => 'USER' });

  $vars->get('user');

  # "alice"

=cut

$test->for('example', 1, 'vars.0', sub {
  my ($tryable) = @_;
  local %ENV = (USER => 'alice');
  my $result = $tryable->result;
  $test->is($result, 'alice');

  $result
});

=example vars.1

Use C<exists> to check if an environment variable is set.

=example-1 vars.1

  package main;

  use Venus::Vars;

  local %ENV = (DEBUG => '1');

  my $vars = Venus::Vars->new(named => { debug => 'DEBUG', verbose => 'VERBOSE' });

  $vars->exists('verbose') ? 'has verbose' : 'no verbose';

  # "no verbose"

=cut

$test->for('example', 1, 'vars.1', sub {
  my ($tryable) = @_;
  local %ENV = (DEBUG => '1');
  my $result = $tryable->result;
  $test->is($result, 'no verbose');

  $result
});

=example vars.2

Use C<set> to modify environment variables.

=example-1 vars.2

  package main;

  use Venus::Vars;

  local %ENV = ();

  my $vars = Venus::Vars->new(named => { api_key => 'API_KEY' });

  $vars->set('api_key', 'secret123');

  $vars->get('api_key');

  # "secret123"

=cut

$test->for('example', 1, 'vars.2', sub {
  my ($tryable) = @_;
  local %ENV = ();
  my $result = $tryable->result;
  $test->is($result, 'secret123');

  $result
});

=example vars.3

Access multiple environment variables.

=example-1 vars.3

  package main;

  use Venus::Vars;

  local %ENV = (HOST => 'localhost', PORT => '8080');

  my $vars = Venus::Vars->new(named => { host => 'HOST', port => 'PORT' });

  my $host = $vars->get('host');

  my $port = $vars->get('port');

  "$host:$port";

  # "localhost:8080"

=cut

$test->for('example', 1, 'vars.3', sub {
  my ($tryable) = @_;
  local %ENV = (HOST => 'localhost', PORT => '8080');
  my $result = $tryable->result;
  $test->is($result, 'localhost:8080');

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

$test->do('render', './topics/vars.pod')->done;
