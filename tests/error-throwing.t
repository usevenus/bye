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

Error Throwing

=cut

$test->for('tagline');

=abstract

Error Throwing in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Throw;

  my $throw = Venus::Throw->new(package => 'Example');

  $throw->message('Something went wrong');

  # bless(..., "Venus::Throw")

  # $throw->error; # would die with Venus::Error

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Something went wrong');

  $result
});

=description

L<Venus::Throw> provides a mechanism for throwing structured exceptions.
L<Venus::Role::Throwable> adds throwing capabilities to classes via the
C<throw> method.

=cut

$test->for('description');

=examples

The following are examples of error throwing in Venus.

=cut

=example throw.0

Use C<Venus::Throw> to create and throw errors.

=example-1 throw.0

  package main;

  use Venus::Throw;

  my $throw = Venus::Throw->new;

  $throw->message('File not found');

  my $result = $throw->message;

  # "File not found"

=cut

$test->for('example', 1, 'throw.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'File not found');

  $result
});

=example throw.1

Use C<name> to categorize errors.

=example-1 throw.1

  package main;

  use Venus::Throw;

  my $throw = Venus::Throw->new;

  $throw->name('on.validation.error');

  $throw->message('Invalid data');

  my $result = $throw->name;

  # "on.validation.error"

=cut

$test->for('example', 1, 'throw.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'on.validation.error');

  $result
});

=example throwable.0

Use C<Venus::Role::Throwable> to add C<throw> to classes.

=example-1 throwable.0

  package Account;

  use Venus::Class;

  with 'Venus::Role::Throwable';

  sub withdraw {
    my ($self, $amount) = @_;
    $self->throw->message('Insufficient funds')->error if $amount > 100;
    return $amount;
  }

  package main;

  use Venus::Try;

  my $account = Account->new;

  my $try = Venus::Try->new;

  $try->call(sub { $account->withdraw(200) });

  $try->default(sub { 'caught' });

  my $result = $try->result;

  # "caught"

=cut

$test->for('example', 1, 'throwable.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'caught');

  $result
});

=example throwable.1

Use C<stash> to attach context to thrown errors.

=example-1 throwable.1

  package main;

  use Venus::Throw;

  my $throw = Venus::Throw->new;

  $throw->message('Request failed');

  $throw->stash(code => 500);

  $throw->stash(endpoint => '/api/users');

  my $result = $throw->stash('code');

  # 500

=cut

$test->for('example', 1, 'throwable.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 500);

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

$test->do('render', './topics/error-throwing.pod')->done;
