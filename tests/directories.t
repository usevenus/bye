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

Directories

=cut

$test->for('tagline');

=abstract

Directories in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_dir_test');

  $path->mkdir;

  my $is_dir = $path->is_directory ? 'yes' : 'no';

  $path->rmdir;

  $is_dir;

  # "yes"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "yes");

  $result
});

=description

L<Venus::Path> provides methods for directory operations. Use C<mkdir> to
create directories, C<rmdir> to remove them, and C<children> to list contents.

=cut

$test->for('description');

=examples

The following are examples of directory operations in Venus.

=cut

=example dir.0

Use C<mkdir> and C<rmdir> for directory management.

=example-1 dir.0

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_dir_0');

  $path->mkdir;

  my $exists = $path->exists ? 'exists' : 'missing';

  $path->rmdir;

  $exists;

  # "exists"

=cut

$test->for('example', 1, 'dir.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'exists');

  $result
});

=example dir.1

Use C<is_directory> to check if path is a directory.

=example-1 dir.1

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp');

  $path->is_directory ? 'directory' : 'not directory';

  # "directory"

=cut

$test->for('example', 1, 'dir.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'directory');

  $result
});

=example dir.2

Use C<children> to list directory contents.

=example-1 dir.2

  package main;

  use Venus::Path;

  my $dir = Venus::Path->new('/tmp/venus_dir_2');

  $dir->mkdir;

  $dir->child('a.txt')->mkfile;

  $dir->child('b.txt')->mkfile;

  my $children = $dir->children;

  my $count = scalar @$children;

  $dir->child('a.txt')->unlink;

  $dir->child('b.txt')->unlink;

  $dir->rmdir;

  $count;

  # 2

=cut

$test->for('example', 1, 'dir.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 2);

  $result
});

=example dir.3

Use C<glob> to find files matching patterns.

=example-1 dir.3

  package main;

  use Venus::Path;

  my $dir = Venus::Path->new('/tmp/venus_dir_3');

  $dir->mkdir;

  $dir->child('test.txt')->mkfile;

  $dir->child('test.log')->mkfile;

  my $txt_files = $dir->glob('*.txt');

  my $count = scalar @$txt_files;

  $dir->child('test.txt')->unlink;

  $dir->child('test.log')->unlink;

  $dir->rmdir;

  $count;

  # 1

=cut

$test->for('example', 1, 'dir.3', sub {
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

$test->do('render', './topics/directories.pod')->done;
