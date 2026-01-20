package main;

use 5.018;

use strict;
use warnings;

use Venus 'catch';

use Venus::Test;

my $test = test(__FILE__);

my $okay = catch {Venus::json()->package} ? false : true;

=name

Venus

=cut

$test->for('name');

=tagline

JSON

=cut

$test->for('tagline');

=abstract

JSON in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Json;

  my $json = Venus::Json->new(value => { name => 'Alice' });

  my $encoded = $json->encode;

  $encoded =~ /Alice/ ? 'has name' : 'no name';

  # "has name"

=cut

$test->gate('has_json_package', sub{$okay})->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'has name');

  $result
});

=description

L<Venus::Json> provides JSON encoding and decoding. Pass data to C<value> and
call C<encode> to serialize. Call C<decode> with a JSON string to deserialize.

=cut

$test->for('description');

=examples

The following are examples of JSON handling in Venus.

=cut

=example json.0

Use C<encode> to convert data to JSON.

=example-1 json.0

  package main;

  use Venus::Json;

  my $json = Venus::Json->new(value => { count => 42 });

  my $encoded = $json->encode;

  $encoded =~ /"count"/ ? 'valid' : 'invalid';

  # "valid"

=cut

$test->gate('has_json_package', sub{$okay})->for('example', 1, 'json.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example json.1

Use C<decode> to parse JSON strings.

=example-1 json.1

  package main;

  use Venus::Json;

  my $json = Venus::Json->new;

  my $decoded = $json->decode('{"city":"NYC","zip":10001}');

  $decoded->{city};

  # "NYC"

=cut

$test->gate('has_json_package', sub{$okay})->for('example', 1, 'json.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'NYC');

  $result
});

=example json.2

Encode arrays to JSON.

=example-1 json.2

  package main;

  use Venus::Json;

  my $json = Venus::Json->new(value => [1, 2, 3]);

  my $encoded = $json->encode;

  $encoded =~ /\[/ ? 'is array' : 'not array';

  # "is array"

=cut

$test->gate('has_json_package', sub{$okay})->for('example', 1, 'json.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'is array');

  $result
});

=example json.3

Round-trip encoding and decoding.

=example-1 json.3

  package main;

  use Venus::Json;

  my $data = { items => ['a', 'b', 'c'], total => 3 };

  my $encoder = Venus::Json->new(value => $data);

  my $encoded = $encoder->encode;

  my $decoder = Venus::Json->new;

  my $decoded = $decoder->decode($encoded);

  $decoded->{total};

  # 3

=cut

$test->gate('has_json_package', sub{$okay})->for('example', 1, 'json.3', sub {
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

$test->do('render', './topics/json.pod')->done;
