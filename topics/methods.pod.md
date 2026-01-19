# NAME

Venus - Methods

# ABSTRACT

Methods in Venus

# SYNOPSIS

    package Calculator;

    use Venus::Class;

    sub add {
      my ($self, $a, $b) = @_;
      return $a + $b;
    }

    package main;

    my $calc = Calculator->new;

    $calc->add(2, 3);

    # 5

# DESCRIPTION

Methods in Venus classes are defined as regular Perl subroutines. Venus provides
patterns for method dispatch including the `try` method from
[Venus::Role::Tryable](https://metacpan.org/pod/Venus%3A%3ARole%3A%3ATryable) for safe method invocation.

# EXAMPLES

The following are examples of methods in Venus.

- method.0

    Define methods as regular subroutines.

    **example 1**

        package Greeter;

        use Venus::Class;

        attr 'name';

        sub greet {
          my ($self, $greeting) = @_;
          return "$greeting, " . $self->name . "!";
        }

        package main;

        my $greeter = Greeter->new(name => 'World');

        my $result = $greeter->greet('Hello');

        # "Hello, World!"

- method.1

    Use `can` to check if an object has a method.

    **example 1**

        package Checker;

        use Venus::Class;

        sub exists { 1 }

        package main;

        my $checker = Checker->new;

        my $result = $checker->can('exists') ? 'yes' : 'no';

        # "yes"

- method.2

    Use `try` from [Venus::Role::Tryable](https://metacpan.org/pod/Venus%3A%3ARole%3A%3ATryable), or `maybe` from
    [Venus::Role::Catchable](https://metacpan.org/pod/Venus%3A%3ARole%3A%3ACatchable) to safely invoke methods.

    **example 1**

        package Divider;

        use Venus::Class;

        with 'Venus::Role::Tryable';
        with 'Venus::Role::Catchable';

        sub divide {
          my ($self, $a, $b) = @_;
          die "Cannot divide by zero" if $b == 0;
          return $a / $b;
        }

        package main;

        my $divider = Divider->new;

        my $result = $divider->maybe('divide', 10, 2);

        # 5

- method.3

    Methods can call other methods on the same object.

    **example 1**

        package Account;

        use Venus::Class;

        attr 'balance';

        sub deposit {
          my ($self, $amount) = @_;
          $self->balance(($self->balance // 0) + $amount);
        }

        sub withdraw {
          my ($self, $amount) = @_;
          $self->balance(($self->balance // 0) - $amount);
        }

        sub transfer {
          my ($self, $amount, $target) = @_;
          $self->withdraw($amount);
          $target->deposit($amount);
          return $self->balance;
        }

        package main;

        my $source = Account->new(balance => 100);
        my $target = Account->new(balance => 50);

        my $result = $source->transfer(25, $target);

        # 75 (source balance after transfer)
