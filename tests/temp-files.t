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

Temp Files

=cut

$test->for('tagline');

=abstract

Temp Files in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Path;

  my $tmp = Venus::Path->new('/tmp');

  my $file = $tmp->mktemp_file;

  my $is_file = $file->is_file ? 'yes' : 'no';

  $file->unlink;

  $is_file;

  # "yes"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "yes");

  $result
});

=description

L<Venus::Path> provides methods for creating temporary files and directories.
Use C<mktemp_file> to create a temporary file and C<mktemp_dir> to create a
temporary directory.

=cut

$test->for('description');

=examples

The following are examples of temporary file operations in Venus.

=cut

=example temp.0

Use C<mktemp_file> to create a temporary file.

=example-1 temp.0

  package main;

  use Venus::Path;

  my $tmp = Venus::Path->new('/tmp');

  my $file = $tmp->mktemp_file;

  $file->write("temp content");

  my $content = $file->read;

  $file->unlink;

  $content =~ /temp/ ? 'has content' : 'no content';

  # "has content"

=cut

$test->for('example', 1, 'temp.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'has content');

  $result
});

=example temp.1

Use C<mktemp_dir> to create a temporary directory.

=example-1 temp.1

  package main;

  use Venus::Path;

  my $tmp = Venus::Path->new('/tmp');

  my $dir = $tmp->mktemp_dir;

  my $is_dir = $dir->is_directory ? 'yes' : 'no';

  $dir->rmdir;

  $is_dir;

  # "yes"

=cut

$test->for('example', 1, 'temp.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'yes');

  $result
});

=example temp.2

Create files inside a temporary directory.

=example-1 temp.2

  package main;

  use Venus::Path;

  my $tmp = Venus::Path->new('/tmp');

  my $dir = $tmp->mktemp_dir;

  my $file = $dir->child('data.txt');

  $file->write("data");

  my $exists = $file->exists ? 'exists' : 'missing';

  $file->unlink;

  $dir->rmdir;

  $exists;

  # "exists"

=cut

$test->for('example', 1, 'temp.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'exists');

  $result
});

=example temp.3

Temporary file names are unique.

=example-1 temp.3

  package main;

  use Venus::Path;

  my $tmp = Venus::Path->new('/tmp');

  my $file1 = $tmp->mktemp_file;

  my $file2 = $tmp->mktemp_file;

  my $different = "$file1" ne "$file2" ? 'unique' : 'same';

  $file1->unlink;

  $file2->unlink;

  $different;

  # "unique"

=cut

$test->for('example', 1, 'temp.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'unique');

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

$test->do('render', './topics/temp-files.pod')->done;
