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

Paths

=cut

$test->for('tagline');

=abstract

Paths in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/home/user/file.txt');

  $path->basename;

  # "file.txt"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'file.txt');

  $result
});

=description

L<Venus::Path> provides an object-oriented interface for file and directory
paths. It offers methods for path manipulation, traversal, and common
filesystem operations.

=cut

$test->for('description');

=examples

The following are examples of path operations in Venus.

=cut

=example path.0

Use C<basename> to get the filename.

=example-1 path.0

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/var/log/app.log');

  $path->basename;

  # "app.log"

=cut

$test->for('example', 1, 'path.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'app.log');

  $result
});

=example path.1

Use C<parent> to get the parent directory.

=example-1 path.1

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/home/user/docs/report.pdf');

  $path->parent->value;

  # "/home/user/docs"

=cut

$test->for('example', 1, 'path.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '/home/user/docs');

  $result
});

=example path.2

Use C<child> to create a subpath.

=example-1 path.2

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/home/user');

  my $child = $path->child('projects/app');

  "$child";

  # "/home/user/projects/app"

=cut

$test->for('example', 1, 'path.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '/home/user/projects/app');

  $result
});

=example path.3

Use C<absolute> to get the absolute path.

=example-1 path.3

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/../tmp/file');

  my $abs = $path->absolute;

  $abs =~ /tmp/ ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'path.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example path.4

Use C<exists> to check if a path exists.

=example-1 path.4

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp');

  $path->exists ? 'exists' : 'missing';

  # "exists"

=cut

$test->for('example', 1, 'path.4', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'exists');

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

$test->do('render', './topics/paths.pod')->done;
