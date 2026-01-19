# NAME

Venus - Mixins

# ABSTRACT

Mixins in Venus

# SYNOPSIS

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

# DESCRIPTION

[Venus::Mixin](https://metacpan.org/pod/Venus%3A%3AMixin) provides a DSL for building mixins. Unlike roles, mixins always
override existing methods in the consuming class. This makes mixins useful when
you want to forcefully inject or replace behavior.

# EXAMPLES

The following are examples of mixins in Venus.

- mixin.0

    Mixins override existing methods, unlike roles which skip them.

    **example 1**

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

- mixin.1

    Multiple mixins apply in order; last one wins.

    **example 1**

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

- mixin.2

    Mixins can export private attributes via `mask`.

    **example 1**

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

- mixin.3

    Use `@EXPORT` package variable as an alternative to the `EXPORT` subroutine.

    **example 1**

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
