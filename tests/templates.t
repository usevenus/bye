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

Templates

=cut

$test->for('tagline');

=abstract

Templates in Venus

=cut

$test->for('abstract');

=synopsis

  package main;

  use Venus::Template;

  my $tmpl = Venus::Template->new(
    value => 'Hello, {{ name }}!',
    context => { name => 'World' }
  );

  $tmpl->render;

  # "Hello, World!"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Hello, World!');

  $result
});

=description

L<Venus::Template> provides simple template rendering with variable
interpolation, conditionals, and loops. Use C<{{ var }}> for variables,
C<{{ if var }}> for conditionals, and C<{{ for items }}> for loops.

=cut

$test->for('description');

=examples

The following are examples of templates in Venus.

=cut

=example template.0

Use C<{{ var }}> for variable interpolation.

=example-1 template.0

  package main;

  use Venus::Template;

  my $tmpl = Venus::Template->new(
    value => 'User: {{ user }}, Role: {{ role }}',
    context => { user => 'alice', role => 'admin' }
  );

  $tmpl->render;

  # "User: alice, Role: admin"

=cut

$test->for('example', 1, 'template.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'User: alice, Role: admin');

  $result
});

=example template.1

Use C<{{ if var }}> for conditional rendering.

=example-1 template.1

  package main;

  use Venus::Template;

  my $tmpl = Venus::Template->new(
    value => '{{ if premium }}Premium User{{ end premium }}',
    context => { premium => 1 }
  );

  $tmpl->render;

  # "Premium User"

=cut

$test->for('example', 1, 'template.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Premium User');

  $result
});

=example template.2

Use C<{{ if not var }}> for negated conditionals.

=example-1 template.2

  package main;

  use Venus::Template;

  my $tmpl = Venus::Template->new(
    value => '{{ if not logged_in }}Please log in{{ end logged_in }}',
    context => { logged_in => 0 }
  );

  $tmpl->render;

  # "Please log in"

=cut

$test->for('example', 1, 'template.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'Please log in');

  $result
});

=example template.3

Use C<{{ for items }}> to loop over arrays.

=example-1 template.3

  package main;

  use Venus::Template;

  my $tmpl = Venus::Template->new(
    value => '{{ for users }}{{ name }} {{ end users }}',
    context => {
      users => [
        { name => 'Alice' },
        { name => 'Bob' }
      ]
    }
  );

  my $result = $tmpl->render;

  $result =~ /Alice/ && $result =~ /Bob/ ? 'valid' : 'invalid';

  # "valid"

=cut

$test->for('example', 1, 'template.3', sub {
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

$test->do('render', './topics/templates.pod')->done;
