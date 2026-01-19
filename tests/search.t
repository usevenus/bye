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

Search

=cut

$test->for('tagline');

=abstract

Search in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Search;

  my $search = Venus::Search->new(
    string => 'hello world',
    regexp => 'world'
  );

  $search->evaluate;

  $search->matched ? 'found' : 'not found';

  # "found"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "found");

  $result
});

=description

L<Venus::Search> provides regex-based string searching. Set C<string> and
C<regexp> attributes, then call C<evaluate> to find matches.

=cut

$test->for('description');

=examples

The following are examples of string searching in Venus.

=cut

=example search.0

Check if a pattern matches.

=example-1 search.0

  package main;

  use Venus::Search;

  my $search = Venus::Search->new(
    string => 'hello world',
    regexp => 'hello'
  );

  $search->evaluate;

  $search->matched ? 'found' : 'not found';

  # "found"

=cut

$test->for('example', 1, 'search.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'found');

  $result
});

=example search.1

Get captured groups.

=example-1 search.1

  package main;

  use Venus::Search;

  my $search = Venus::Search->new(
    string => 'hello world',
    regexp => '(\\w+) (\\w+)'
  );

  $search->evaluate;

  my $captures = $search->captures;

  $captures->[0];

  # "hello"

=cut

$test->for('example', 1, 'search.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'hello');

  $result
});

=example search.2

Use C<count> to get the number of matches.

=example-1 search.2

  package main;

  use Venus::Search;

  my $search = Venus::Search->new(
    string => 'aaa bbb aaa',
    regexp => 'aaa',
    flags => 'g'
  );

  $search->evaluate;

  $search->count;

  # 1

=cut

$test->for('example', 1, 'search.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example search.3

Case-insensitive matching.

=example-1 search.3

  package main;

  use Venus::Search;

  my $search = Venus::Search->new(
    string => 'HELLO world',
    regexp => 'hello',
    flags => 'i'
  );

  $search->evaluate;

  $search->matched ? 'found' : 'not found';

  # "found"

=cut

$test->for('example', 1, 'search.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'found');

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

$test->do('render', './topics/search.pod')->done;
