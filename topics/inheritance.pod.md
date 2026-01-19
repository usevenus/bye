# NAME

Venus - Inheritance

# ABSTRACT

Class Inheritance in Venus

# SYNOPSIS

    package Animal;

    use Venus::Class;

    attr 'name';

    sub speak { 'generic sound' }

    package Cat;

    use Venus::Class;

    base 'Animal';

    sub speak { 'meow' }

    package main;

    my $cat = Cat->new(name => 'Whiskers');

    $cat->speak;

    # "meow"

# DESCRIPTION

Venus provides `base` for class inheritance. Child classes inherit attributes
and methods from parent classes. Use `from` when you want to inherit with
interface auditing via the parent's `AUDIT` method.

# EXAMPLES

The following are examples of inheritance in Venus.

- base.0

    Use `base` to inherit from a parent class.

    **example 1**

        package Vehicle;

        use Venus::Class;

        attr 'speed';

        sub move { 'moving' }

        package Car;

        use Venus::Class;

        base 'Vehicle';

        sub honk { 'beep' }

        package main;

        my $car = Car->new(speed => 60);

        my $result = $car->move . ' at ' . $car->speed . ' mph';

        # "moving at 60 mph"

- base.1

    Child classes can override parent methods, even if they're attributes.

    **example 1**

        package Shape;

        use Venus::Class;

        attr 'area';

        package Square;

        use Venus::Class;

        base 'Shape';

        attr 'side';

        sub area {
          my ($self) = @_;
          return $self->side ** 2;
        }

        package main;

        my $square = Square->new(side => 5);

        my $result = $square->area;

        # 25

- base.2

    Use `SUPER::` to call the parent's method, or `super` from
    [Venus::Role::Superable](https://metacpan.org/pod/Venus%3A%3ARole%3A%3ASuperable).

    **example 1**

        package Logger;

        use Venus::Class;

        sub log {
          my ($self, $msg) = @_;
          return "[LOG] $msg";
        }

        package TimestampLogger;

        use Venus::Class;

        base 'Logger';
        with 'Venus::Role::Superable';

        sub log {
          my ($self, $msg) = @_;
          my $base = $self->super($msg);
          return "[" . time() . "] $base";
        }

        package main;

        my $logger = TimestampLogger->new;

        my $result = $logger->log('test');

        # "[1234567890] [LOG] test" (timestamp varies)

- from.0

    Use `from` to inherit with interface auditing.

    **example 1**

        package Serializable;

        use Venus::Class;

        sub AUDIT {
          my ($self, $from) = @_;
          die "$from must implement 'encode'" unless $from->can('encode');
        }

        package JsonSerializable;

        use Venus::Class;

        from 'Serializable';

        sub encode {
          my ($self, $data) = @_;
          return '{"ok":1}';
        }

        package main;

        my $json = JsonSerializable->new;

        my $result = $json->encode({ ok => 1 });

        # '{"ok":1}'
