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

Schema

=cut

$test->for('tagline');

=abstract

Schema in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Schema;

  my $schema = Venus::Schema->new({
    name => 'string',
    age => 'number'
  });

  my $data = { name => 'Alice', age => 30 };

  my $errors = $schema->validate($data);

  @$errors ? 'invalid' : 'valid';

  # "valid"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, "valid");

  $result
});

=description

L<Venus::Schema> provides data validation against a schema definition.
Define expected types and use C<validate> to check data. Returns an empty
array on success or an array of errors on failure.

=cut

$test->for('description');

=examples

The following are examples of schema validation in Venus.

=cut

=example schema.0

Validate string types.

=example-1 schema.0

  package main;

  use Venus::Schema;

  my $schema = Venus::Schema->new({
    name => 'string'
  });

  my $errors = $schema->validate({ name => 'Bob' });

  @$errors ? 'invalid' : 'valid';

  # "valid"

=cut

$test->for('example', 1, 'schema.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example schema.1

Validate number types.

=example-1 schema.1

  package main;

  use Venus::Schema;

  my $schema = Venus::Schema->new({
    count => 'number'
  });

  my $errors = $schema->validate({ count => 42 });

  @$errors ? 'invalid' : 'valid';

  # "valid"

=cut

$test->for('example', 1, 'schema.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example schema.2

Validate nested structures.

=example-1 schema.2

  package main;

  use Venus::Schema;

  my $schema = Venus::Schema->new({
    user => {
      name => 'string',
      age => 'number'
    }
  });

  my $errors = $schema->validate({ user => { name => 'Alice', age => 30 } });

  @$errors ? 'invalid' : 'valid';

  # "valid"

=cut

$test->for('example', 1, 'schema.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example schema.3

Validate arrays with schema.

=example-1 schema.3

  package main;

  use Venus::Schema;

  my $schema = Venus::Schema->new({
    items => 'arrayref'
  });

  my $errors = $schema->validate({ items => [1, 2, 3] });

  @$errors ? 'invalid' : 'valid';

  # "valid"

=cut

$test->for('example', 1, 'schema.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

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

$test->do('render', './topics/schema.pod')->done;
