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

Regular Expressions

=cut

$test->for('tagline');

=abstract

Regular Expressions in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Regexp;

  my $regexp = Venus::Regexp->new(qr/\d+/);

  $regexp->search('abc 123 xyz');

  # bless(..., "Venus::Search")

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->ok($result->isa('Venus::Search'));

  $result
});

=description

Venus provides L<Venus::Regexp> for working with regular expressions,
L<Venus::Search> for search results, and L<Venus::Replace> for replacements.

=cut

$test->for('description');

=examples

The following are examples of regular expressions in Venus.

=cut

=example regexp.0

Use L<Venus::Regexp> to wrap a compiled regex and search strings.

=example-1 regexp.0

  package main;

  use Venus::Regexp;

  my $regexp = Venus::Regexp->new(qr/(\w+)/);

  my $search = $regexp->search('hello world');

  my $result = $search->matched;

  # "hello"

=cut

$test->for('example', 1, 'regexp.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'hello');

  $result
});

=example search.0

Use C<captures> to get captured groups from a search.

=example-1 search.0

  package main;

  use Venus::Regexp;

  my $regexp = Venus::Regexp->new(qr/(\d+)-(\d+)/);

  my $search = $regexp->search('Phone: 555-1234');

  my $result = $search->captures;

  # ["555", "1234"]

=cut

$test->for('example', 1, 'search.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, ['555', '1234']);

  1
});

=example search.1

Use C<count> to check how many matches were found.

=example-1 search.1

  package main;

  use Venus::Regexp;

  my $regexp = Venus::Regexp->new(qr/\d+/);

  my $search = $regexp->search('a1 b2 c3');

  my $result = $search->count;

  # 1

=cut

$test->for('example', 1, 'search.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example replace.0

Use C<replace> to substitute matched text.

=example-1 replace.0

  package main;

  use Venus::Regexp;

  my $regexp = Venus::Regexp->new(qr/world/);

  my $replace = $regexp->replace('hello world', 'Venus');

  my $result = $replace->get;

  # "hello Venus"

=cut

$test->for('example', 1, 'replace.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'hello Venus');

  $result
});

=example replace.1

Use the global flag to replace all occurrences.

=example-1 replace.1

  package main;

  use Venus::Regexp;

  my $regexp = Venus::Regexp->new(qr/o/);

  my $replace = $regexp->replace('foo bar boo', 'x', 'g');

  my $result = $replace->get;

  # "fxx bar bxx"

=cut

$test->for('example', 1, 'replace.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'fxx bar bxx');

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

$test->do('render', './topics/regular-expressions.pod')->done;
