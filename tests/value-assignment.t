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

Value Assignment

=cut

$test->for('tagline');

=abstract

Setting Nested Values

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus 'sets';

  my $data = { user => { name => 'Elliot' } };

  sets $data, 'user.age' => 30;

  # $data is now { user => { name => 'Elliot', age => 30 } }

  $data

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, { user => { name => 'Elliot', age => 30 } });

  $result
});

=description

Venus provides the C<sets> function for setting nested values in data
structures using dot-notation paths. The function mutates the original data
structure.

B<Important:> The C<sets> function will only set a value if its parent node
exists. For example, C<sets $data, 'user.auth.login' =E<gt> 'x'> will fail if
there is no C<user.auth> node to traverse.

=cut

$test->for('description');

=examples

The following are examples of value assignment using Venus.

=cut

=example sets.0

Use C<sets> to add a new key to an existing nested hash.

=example-1 sets.0

  package main;

  use Venus 'sets';

  my $data = { user => { name => 'Elliot' } };

  sets $data, 'user.age' => 25;

  # $data is now { user => { name => 'Elliot', age => 25 } }

  $data

=cut

$test->for('example', 1, 'sets.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, { user => { name => 'Elliot', age => 25 } });

  $result
});

=example sets.1

Use C<sets> with numeric indices to modify array elements.

=example-1 sets.1

  package main;

  use Venus 'sets';

  my $data = { items => ['apple', 'banana', 'cherry'] };

  sets $data, 'items.1' => 'blueberry';

  # $data is now { items => ['apple', 'blueberry', 'cherry'] }

  $data

=cut

$test->for('example', 1, 'sets.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, { items => ['apple', 'blueberry', 'cherry'] });

  $result
});

=example sets.2

Use C<sets> with multiple path-value pairs to set several values at once.

=example-1 sets.2

  package main;

  use Venus 'sets';

  my $data = { user => { name => 'Elliot' } };

  sets $data, 'user.age' => 25, 'user.city' => 'NYC';

  # $data is now { user => { name => 'Elliot', age => 25, city => 'NYC' } }

  $data

=cut

$test->for('example', 1, 'sets.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->same($result, { user => { name => 'Elliot', age => 25, city => 'NYC' } });

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

$test->do('render', './topics/value-assignment.pod')->done;
