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

Data Validation

=cut

$test->for('tagline');

=abstract

Data Validation in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Validate;

  my $validate = Venus::Validate->new(input => { name => 'Alice' });

  $validate->required('name')->string;

  my $errors = $validate->errors;

  scalar @$errors == 0;

  # 1 (no errors)

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=description

Venus provides L<Venus::Validate> for validating data structures and
L<Venus::Schema> for defining reusable validation schemas.

=cut

$test->for('description');

=examples

The following are examples of data validation in Venus.

=cut

=example validate.0

Use C<Venus::Validate> to validate input data.

=example-1 validate.0

  package main;

  use Venus::Validate;

  my $validate = Venus::Validate->new(input => { age => 25 });

  $validate->required('age')->number;

  my $errors = $validate->errors;

  my $result = scalar @$errors == 0 ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'validate.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example validate.1

Use C<optional> for fields that may be absent.

=example-1 validate.1

  package main;

  use Venus::Validate;

  my $validate = Venus::Validate->new(input => { name => 'Bob' });

  $validate->required('name')->string;
  $validate->optional('email')->string;

  my $errors = $validate->errors;

  my $result = scalar @$errors == 0 ? 'valid' : 'invalid';

  # "valid" (email is optional)

=cut

$test->for('example', 1, 'validate.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example schema.0

Use C<Venus::Schema> to define reusable validation rules.

=example-1 schema.0

  package main;

  use Venus::Schema;

  my $schema = Venus::Schema->new;

  $schema->rule({
    selector => 'name',
    presence => 'required',
    executes => [['string']]
  });

  $schema->rule({
    selector => 'age',
    presence => 'required',
    executes => [['number']]
  });

  my $errors = $schema->validate({ name => 'Alice', age => 30 });

  my $result = scalar @$errors == 0 ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'schema.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'valid');

  $result
});

=example schema.1

Schema validation returns errors for invalid data.

=example-1 schema.1

  package main;

  use Venus::Schema;

  my $schema = Venus::Schema->new;

  $schema->rule({
    selector => 'count',
    presence => 'required',
    executes => [['number']]
  });

  my $errors = $schema->validate({ count => 'not a number' });

  my $result = scalar @$errors > 0 ? 'has errors' : 'no errors';

  # "has errors"

=cut

$test->for('example', 1, 'schema.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'has errors');

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

$test->do('render', './topics/data-validation.pod')->done;
