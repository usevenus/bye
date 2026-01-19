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

Permissions

=cut

$test->for('tagline');

=abstract

Permissions in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_perm_test.txt');

  $path->write("test");

  $path->chmod(0644);

  my $mode = (stat "$path")[2] & 07777;

  $path->unlink;

  sprintf('%04o', $mode);

  # "0644"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "0644");

  $result
});

=description

L<Venus::Path> provides methods for file permissions. Use C<chmod> to change
file mode and C<test> to check file attributes.

=cut

$test->for('description');

=examples

The following are examples of permission operations in Venus.

=cut

=example perm.0

Use C<chmod> to set file permissions.

=example-1 perm.0

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_perm_0.txt');

  $path->write("content");

  $path->chmod(0600);

  my $mode = (stat "$path")[2] & 07777;

  $path->unlink;

  $mode == 0600 ? 'correct' : 'incorrect';

  # "correct"

=cut

$test->for('example', 1, 'perm.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'correct');

  $result
});

=example perm.1

Use C<test> to check if a file is readable.

=example-1 perm.1

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_perm_1.txt');

  $path->write("content");

  my $readable = $path->test('r') ? 'readable' : 'not readable';

  $path->unlink;

  $readable;

  # "readable"

=cut

$test->for('example', 1, 'perm.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'readable');

  $result
});

=example perm.2

Use C<test> to check if a file is writable.

=example-1 perm.2

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_perm_2.txt');

  $path->write("content");

  my $writable = $path->test('w') ? 'writable' : 'not writable';

  $path->unlink;

  $writable;

  # "writable"

=cut

$test->for('example', 1, 'perm.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'writable');

  $result
});

=example perm.3

Use C<test> to check if a file is executable.

=example-1 perm.3

  package main;

  use Venus::Path;

  my $path = Venus::Path->new('/tmp/venus_perm_3.sh');

  $path->write("#!/bin/bash\necho hello");

  $path->chmod(0755);

  my $executable = $path->test('x') ? 'executable' : 'not executable';

  $path->unlink;

  $executable;

  # "executable"

=cut

$test->for('example', 1, 'perm.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'executable');

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

$test->do('render', './topics/permissions.pod')->done;
