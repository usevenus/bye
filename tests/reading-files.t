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

Reading Files

=cut

$test->for('tagline');

=abstract

Reading Files in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_read_test.txt');

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

L<Venus::Path> provides methods for reading file contents. Use C<read> to get
the entire file as a string and C<lines> to get an array of lines.

=cut

$test->for('description');

=examples

The following are examples of reading files in Venus.

=cut

=example read.0

Use C<read> to get file contents as a string.

=example-1 read.0

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_read_0.txt');

  $path->write("Line 1\nLine 2\nLine 3");

  my $content = $path->read;

  $path->unlink;

  $content =~ /Line 2/ ? 'found' : 'missing';

  # "found"

=cut

$test->for('example', 1, 'read.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'found');

  $result
});

=example read.1

Use C<lines> to get file contents as an array.

=example-1 read.1

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_read_1.txt');

  $path->write("apple\nbanana\ncherry");

  my $lines = $path->lines;

  $path->unlink;

  scalar @$lines;

  # 3

=cut

$test->for('example', 1, 'read.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3);

  $result
});

=example read.2

Check if a file exists before reading.

=example-1 read.2

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_read_2.txt');

  $path->write("test content");

  my $result = $path->exists ? $path->read : 'missing';

  $path->unlink;

  $result;

  # "test content"

=cut

$test->for('example', 1, 'read.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'test content');

  $result
});

=example read.3

Read and process lines with iteration.

=example-1 read.3

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_read_3.txt');

  $path->write("10\n20\n30");

  my $sum = 0;

  $sum += $_ for @{$path->lines};

  $path->unlink;

  $sum;

  # 60

=cut

$test->for('example', 1, 'read.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 60);

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

$test->do('render', './topics/reading-files.pod')->done;
