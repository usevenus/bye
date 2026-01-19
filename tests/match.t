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

Match

=cut

$test->for('tagline');

=abstract

Match in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Match;

  my $match = Venus::Match->new('hello');

  $match->just('hello')->then('greeting');

  $match->none('unknown');

  $match->result;

  # "greeting"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "greeting");

  $result
});

=description

L<Venus::Match> provides pattern matching with C<just>/C<then> clauses.
Match values or use callbacks for complex conditions.

=cut

$test->for('description');

=examples

The following are examples of pattern matching in Venus.

=cut

=example match.0

Use C<just> and C<then> for exact matches.

=example-1 match.0

  package main;

  use Venus::Match;

  my $match = Venus::Match->new('red');

  $match->just('red')->then('stop');

  $match->just('green')->then('go');

  $match->none('wait');

  $match->result;

  # "stop"

=cut

$test->for('example', 1, 'match.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'stop');

  $result
});

=example match.1

Use C<none> for default values.

=example-1 match.1

  package main;

  use Venus::Match;

  my $match = Venus::Match->new('yellow');

  $match->just('red')->then('stop');

  $match->just('green')->then('go');

  $match->none('caution');

  $match->result;

  # "caution"

=cut

$test->for('example', 1, 'match.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'caution');

  $result
});

=example match.2

Use callbacks for dynamic results.

=example-1 match.2

  package main;

  use Venus::Match;

  my $match = Venus::Match->new(10);

  $match->when(sub { $_[0] > 5 })->then('big');

  $match->none('small');

  $match->result;

  # "big"

=cut

$test->for('example', 1, 'match.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'big');

  $result
});

=example match.3

Use C<then> with callbacks for computed values.

=example-1 match.3

  package main;

  use Venus::Match;

  my $match = Venus::Match->new(5);

  $match->just(5)->then(sub { $_[0] * 2 });

  $match->none(0);

  $match->result;

  # 10

=cut

$test->for('example', 1, 'match.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 10);

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

$test->do('render', './topics/match.pod')->done;
