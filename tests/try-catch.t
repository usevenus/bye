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

Try Catch

=cut

$test->for('tagline');

=abstract

Exception Handling in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Try;

  my $try = Venus::Try->new;

  $try->call(sub { die 'Oops!' });

  $try->catch('Venus::Error', sub { 'caught' });

  $try->default(sub { 'default' });

  $try->result;

  # "default"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'default');

  $result
});

=description

Venus provides L<Venus::Try> for exception handling, L<Venus::Role::Tryable>
for adding C<try> to classes, and L<Venus::Role::Catchable> for C<catch> and
C<maybe> methods.

=cut

$test->for('description');

=examples

The following are examples of exception handling in Venus.

=cut

=example try.0

Use C<Venus::Try> to wrap code that might fail.

=example-1 try.0

  package main;

  use Venus::Try;

  my $try = Venus::Try->new;

  $try->call(sub { 10 / 2 });

  my $result = $try->result;

  # 5

=cut

$test->for('example', 1, 'try.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 5);

  $result
});

=example try.1

Use C<default> to handle any exception.

=example-1 try.1

  package main;

  use Venus::Try;

  my $try = Venus::Try->new;

  $try->call(sub { die 'Error!' });

  $try->default(sub { 'recovered' });

  my $result = $try->result;

  # "recovered"

=cut

$test->for('example', 1, 'try.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'recovered');

  $result
});

=example tryable.0

Use C<Venus::Role::Tryable> to add C<try> to your classes.

=example-1 tryable.0

  package Calculator;

  use Venus::Class;

  with 'Venus::Role::Tryable';

  sub divide {
    my ($self, $a, $b) = @_;
    die 'Division by zero' if $b == 0;
    return $a / $b;
  }

  package main;

  my $calc = Calculator->new;

  my $result = $calc->try('divide', 10, 2)->result;

  # 5

=cut

$test->for('example', 1, 'tryable.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 5);

  $result
});

=example catchable.0

Use C<maybe> from C<Venus::Role::Catchable> to return undef on failure.

=example-1 catchable.0

  package Parser;

  use Venus::Class;

  with 'Venus::Role::Tryable';
  with 'Venus::Role::Catchable';

  sub parse {
    my ($self, $input) = @_;
    die 'Invalid input' unless defined $input;
    return "parsed: $input";
  }

  package main;

  my $parser = Parser->new;

  my $result = $parser->maybe('parse', undef) // 'failed';

  # "failed"

=cut

$test->for('example', 1, 'catchable.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'failed');

  $result
});

=example catchable.1

Use C<catch> from C<Venus::Role::Catchable> to get the error object.

=example-1 catchable.1

  package Validator;

  use Venus::Class;

  with 'Venus::Role::Tryable';
  with 'Venus::Role::Catchable';

  sub validate {
    my ($self, $value) = @_;
    die 'Empty value' unless $value;
    return $value;
  }

  package main;

  my $validator = Validator->new;

  my $error = $validator->catch('validate', '');

  my $result = defined $error ? 'has error' : 'no error';

  # "has error"

=cut

$test->for('example', 1, 'catchable.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'has error');

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

$test->do('render', './topics/try-catch.pod')->done;
