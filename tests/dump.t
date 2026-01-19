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

Dump

=cut

$test->for('tagline');

=abstract

Dump in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Dump;

  my $dump = Venus::Dump->new({ name => 'Alice', age => 30 });

  my $encoded = $dump->encode;

  $encoded =~ /name/ ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "valid");

  $result
});

=description

L<Venus::Dump> provides Perl data serialization using Data::Dumper style
format. Use C<encode> to serialize and C<decode> to deserialize.

=cut

$test->for('description');

=examples

The following are examples of data dumping in Venus.

=cut

=example dump.0

Use C<encode> to serialize Perl data.

=example-1 dump.0

  package main;

  use Venus::Dump;

  my $dump = Venus::Dump->new([1, 2, 3]);

  my $encoded = $dump->encode;

  $encoded =~ /1/ ? 'has data' : 'empty';

  # "has data"

=cut

$test->for('example', 1, 'dump.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'has data');

  $result
});

=example dump.1

Use C<decode> to deserialize dumped data.

=example-1 dump.1

  package main;

  use Venus::Dump;

  my $dump = Venus::Dump->new;

  my $decoded = $dump->decode("{foo => 'bar'}");

  $decoded->{foo};

  # "bar"

=cut

$test->for('example', 1, 'dump.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'bar');

  $result
});

=example dump.2

Encode nested data structures.

=example-1 dump.2

  package main;

  use Venus::Dump;

  my $dump = Venus::Dump->new({
    user => { name => 'Bob', scores => [10, 20] }
  });

  my $encoded = $dump->encode;

  $encoded =~ /scores/ ? 'has nested' : 'flat';

  # "has nested"

=cut

$test->for('example', 1, 'dump.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'has nested');

  $result
});

=example dump.3

Round-trip encoding and decoding.

=example-1 dump.3

  package main;

  use Venus::Dump;

  my $data = { x => 1, y => 2 };

  my $encoder = Venus::Dump->new($data);

  my $encoded = $encoder->encode;

  my $decoder = Venus::Dump->new;

  my $decoded = $decoder->decode($encoded);

  $decoded->{x} + $decoded->{y};

  # 3

=cut

$test->for('example', 1, 'dump.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 3);

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

$test->do('render', './topics/dump.pod')->done;
