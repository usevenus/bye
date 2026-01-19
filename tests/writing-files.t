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

Writing Files

=cut

$test->for('tagline');

=abstract

Writing Files in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_write_test.txt');

  $path->write("Hello, Venus!");

  my $content = $path->read;

  $path->unlink;

  $content;

  # "Hello, Venus!"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "Hello, Venus!");

  $result
});

=description

L<Venus::Path> provides methods for writing file contents. Use C<write> to
overwrite a file, C<append> to add content, and C<mkfile> to create files.

=cut

$test->for('description');

=examples

The following are examples of writing files in Venus.

=cut

=example write.0

Use C<write> to create or overwrite a file.

=example-1 write.0

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_write_0.txt');

  $path->write("First write");

  $path->write("Second write");

  my $content = $path->read;

  $path->unlink;

  $content;

  # "Second write"

=cut

$test->for('example', 1, 'write.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Second write');

  $result
});

=example write.1

Use C<mkfile> to create an empty file.

=example-1 write.1

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_write_1.txt');

  $path->mkfile;

  my $exists = $path->exists ? 'created' : 'missing';

  $path->unlink;

  $exists;

  # "created"

=cut

$test->for('example', 1, 'write.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'created');

  $result
});

=example write.2

Write multi-line content to a file.

=example-1 write.2

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_write_2.txt');

  $path->write("Line 1\nLine 2\nLine 3");

  my $lines = $path->lines;

  $path->unlink;

  scalar @$lines;

  # 3

=cut

$test->for('example', 1, 'write.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3);

  $result
});

=example write.3

Create a directory and write a file using C<mkdir> and C<child>.

=example-1 write.3

  package main;

  use Venus::Path;

  my $dir = Venus::Path->new('/tmp/venus_write_test_dir');

  $dir->mkdir;

  my $file = $dir->child('file.txt');

  $file->write("test content");

  my $exists = $file->exists ? 'created' : 'missing';

  $file->unlink;

  $dir->rmdir;

  $exists;

  # "created"

=cut

$test->for('example', 1, 'write.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'created');

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

$test->do('render', './topics/writing-files.pod')->done;
