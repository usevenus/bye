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

Mixins

=cut

$test->for('tagline');

=abstract

Mixins in Venus

=cut

$test->for('abstract');

=synopsis

  package Logging;

  use Venus::Mixin;

  sub log {
    my ($self, $msg) = @_;
    return "[LOG] $msg";
  }

  sub EXPORT {
    ['log']
  }

  package App;

  use Venus::Class;

  sub log {
    return 'original';
  }

  mixin 'Logging';  # overrides existing log method

  package main;

  my $app = App->new;

  $app->log('hello');

  # "[LOG] hello"

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '[LOG] hello');

  $result
});

=description

L<Venus::Mixin> provides a DSL for building mixins. Unlike roles, mixins always
override existing methods in the consuming class. This makes mixins useful when
you want to forcefully inject or replace behavior.

=cut

$test->for('description');

=examples

The following are examples of mixins in Venus.

=cut

=example mixin.0

Mixins override existing methods, unlike roles which skip them.

=example-1 mixin.0

  package Formatter;

  use Venus::Mixin;

  sub format {
    my ($self, $text) = @_;
    return "<<$text>>";
  }

  sub EXPORT {
    ['format']
  }

  package Printer;

  use Venus::Class;

  sub format {
    my ($self, $text) = @_;
    return "[$text]";
  }

  mixin 'Formatter';  # overrides format

  package main;

  my $printer = Printer->new;

  my $result = $printer->format('test');

  # "<<test>>"

=cut

$test->for('example', 1, 'mixin.0', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '<<test>>');

  $result
});

=example mixin.1

Multiple mixins apply in order; last one wins.

=example-1 mixin.1

  package StyleA;

  use Venus::Mixin;

  sub style { 'A' }

  sub EXPORT { ['style'] }

  package StyleB;

  use Venus::Mixin;

  sub style { 'B' }

  sub EXPORT { ['style'] }

  package Styled;

  use Venus::Class;

  mixin 'StyleA';
  mixin 'StyleB';  # StyleB wins

  package main;

  my $styled = Styled->new;

  my $result = $styled->style;

  # "B"

=cut

$test->for('example', 1, 'mixin.1', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'B');

  $result
});

=example mixin.2

Mixins can export private attributes via C<mask>.

=example-1 mixin.2

  package HasCache;

  use Venus::Mixin;

  mask 'cache';

  sub get_cache {
    my ($self, $key) = @_;
    my $c = $self->cache // {};
    return $c->{$key};
  }

  sub set_cache {
    my ($self, $key, $val) = @_;
    my $c = $self->cache // {};
    $c->{$key} = $val;
    $self->cache($c);
    return $val;
  }

  sub EXPORT {
    ['cache', 'get_cache', 'set_cache']
  }

  package Service;

  use Venus::Class;

  mixin 'HasCache';

  package main;

  my $svc = Service->new;

  $svc->set_cache('key', 'value');

  my $result = $svc->get_cache('key');

  # "value"

=cut

$test->for('example', 1, 'mixin.2', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, 'value');

  $result
});

=example mixin.3

Use C<@EXPORT> package variable as an alternative to the C<EXPORT> subroutine.

=example-1 mixin.3

  package Debuggable;

  use Venus::Mixin;

  our @EXPORT = ('debug');

  sub debug {
    my ($self, $msg) = @_;
    return "[DEBUG] $msg";
  }

  package Worker;

  use Venus::Class;

  mixin 'Debuggable';

  package main;

  my $worker = Worker->new;

  my $result = $worker->debug('starting');

  # "[DEBUG] starting"

=cut

$test->for('example', 1, 'mixin.3', sub {
  my ($tryable) = @_;
  my $result = $tryable->result;
  $test->is($result, '[DEBUG] starting');

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

$test->do('render', './topics/mixins.pod')->done;
