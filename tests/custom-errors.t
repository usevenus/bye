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

Custom Errors

=cut

$test->for('tagline');

=abstract

Custom Errors in Venus

=cut

$test->for('abstract');

=synopsis

  package MyApp::Error;

  use Venus::Class;

  base 'Venus::Error';

  attr 'code';

  package main;

  my $error = MyApp::Error->new(
    message => 'Something failed',
    code => 500
  );

  $error->code;

  # 500

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 500);

  $result
});

=description

Venus allows creating custom error classes by extending L<Venus::Error>. Custom
errors can have additional attributes and specialized behavior for different
error types.

=cut

$test->for('description');

=examples

The following are examples of custom errors in Venus.

=cut

=example custom.0

Extend C<Venus::Error> to create custom error types.

=example-1 custom.0

  package NotFoundError;

  use Venus::Class;

  base 'Venus::Error';

  attr 'resource';

  package main;

  my $error = NotFoundError->new(
    message => 'Resource not found',
    resource => 'user'
  );

  my $result = $error->resource;

  # "user"

=cut

$test->for('example', 1, 'custom.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'user');

  $result
});

=example custom.1

Create error hierarchies with multiple custom types.

=example-1 custom.1

  package ValidationError;

  use Venus::Class;

  base 'Venus::Error';

  attr 'field';

  package AuthError;

  use Venus::Class;

  base 'Venus::Error';

  attr 'realm';

  package main;

  my $val_error = ValidationError->new(
    message => 'Invalid email',
    field => 'email'
  );

  my $auth_error = AuthError->new(
    message => 'Access denied',
    realm => 'admin'
  );

  my $result = $val_error->isa('Venus::Error')
    && $auth_error->isa('Venus::Error');

  # 1

=cut

$test->for('example', 1, 'custom.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 1);

  $result
});

=example custom.2

Add helper methods to custom errors.

=example-1 custom.2

  package HttpError;

  use Venus::Class;

  base 'Venus::Error';

  attr 'status';

  sub is_client_error {
    my ($self) = @_;
    my $status = $self->status // 0;
    return $status >= 400 && $status < 500;
  }

  package main;

  my $error = HttpError->new(
    message => 'Not Found',
    status => 404
  );

  my $result = $error->is_client_error ? 'client' : 'server';

  # "client"

=cut

$test->for('example', 1, 'custom.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'client');

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

$test->do('render', './topics/custom-errors.pod')->done;
