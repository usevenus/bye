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

YAML

=cut

$test->for('tagline');

=abstract

YAML in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Yaml;

  my $yaml = Venus::Yaml->new(value => { name => 'Alice' });

  my $encoded = $yaml->encode;

  $encoded =~ /name: Alice/ ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=description

L<Venus::Yaml> provides YAML encoding and decoding. Pass data to C<value> and
call C<encode> to serialize. Call C<decode> with a YAML string to deserialize.

=cut

$test->for('description');

=examples

The following are examples of YAML handling in Venus.

=cut

=example yaml.0

Use C<encode> to convert data to YAML.

=example-1 yaml.0

  package main;

  use Venus::Yaml;

  my $yaml = Venus::Yaml->new(value => { host => 'localhost', port => 8080 });

  my $encoded = $yaml->encode;

  $encoded =~ /host: localhost/ ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'yaml.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example yaml.1

Use C<decode> to parse YAML strings.

=example-1 yaml.1

  package main;

  use Venus::Yaml;

  my $yaml = Venus::Yaml->new;

  my $decoded = $yaml->decode("---\ncity: NYC\nzip: 10001\n");

  $decoded->{city};

  # "NYC"

=cut

$test->for('example', 1, 'yaml.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'NYC');

  $result
});

=example yaml.2

Encode nested structures to YAML.

=example-1 yaml.2

  package main;

  use Venus::Yaml;

  my $yaml = Venus::Yaml->new(value => {
    database => { host => 'db.local', port => 5432 }
  });

  my $encoded = $yaml->encode;

  $encoded =~ /database:/ ? 'has nested' : 'no nested';

  # "has nested"

=cut

$test->for('example', 1, 'yaml.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'has nested');

  $result
});

=example yaml.3

Round-trip encoding and decoding.

=example-1 yaml.3

  package main;

  use Venus::Yaml;

  my $data = { items => ['x', 'y', 'z'], count => 3 };

  my $encoder = Venus::Yaml->new(value => $data);

  my $encoded = $encoder->encode;

  my $decoder = Venus::Yaml->new;

  my $decoded = $decoder->decode($encoded);

  $decoded->{count};

  # 3

=cut

$test->for('example', 1, 'yaml.3', sub {
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

$test->do('render', './topics/yaml.pod')->done;
