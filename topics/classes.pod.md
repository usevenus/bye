# NAME

Venus - Classes

# ABSTRACT

Class Building in Venus

# SYNOPSIS

    package Person;

    use Venus::Class;

    attr 'name';
    attr 'age';

    package main;

    my $person = Person->new(name => 'Alice', age => 30);

    $person->name;

    # "Alice"

# DESCRIPTION

[Venus::Class](https://metacpan.org/pod/Venus%3A%3AClass) provides a DSL for building classes. It automatically sets up
strict/warnings, enables Perl 5.18 features, and provides functions like
`attr` for declaring attributes and `base` for inheritance.

# EXAMPLES

The following are examples of class building using Venus.

- class.0

    Use `attr` to declare object attributes with automatic accessors.

    **example 1**

        package Counter;

        use Venus::Class;

        attr 'count';

        sub increment {
          my ($self) = @_;
          $self->count(($self->count // 0) + 1);
        }

        package main;

        my $counter = Counter->new;

        $counter->increment;

        my $result = $counter->count;

        # 1

- class.1

    Use `base` to inherit from another class.

    **example 1**

        package Animal;

        use Venus::Class;

        attr 'name';

        sub speak {
          my ($self) = @_;
          return $self->name . ' speaks';
        }

        package Dog;

        use Venus::Class;

        base 'Animal';

        sub speak {
          my ($self) = @_;
          return $self->name . ' barks';
        }

        package main;

        my $dog = Dog->new(name => 'Rex');

        my $result = $dog->speak;

        # "Rex barks"

- class.2

    Classes get a default constructor that accepts a hash or hashref.

    **example 1**

        package Point;

        use Venus::Class;

        attr 'x';
        attr 'y';

        package main;

        my $point = Point->new({ x => 10, y => 20 });

        my $result = $point->x + $point->y;

        # 30

- class.3

    Use `BUILD` to run initialization code after construction.

    **example 1**

        package Logger;

        use Venus::Class;

        attr 'messages';

        sub BUILD {
          my ($self) = @_;
          $self->messages([]);
        }

        sub log {
          my ($self, $msg) = @_;
          push @{$self->messages}, $msg;
        }

        package main;

        my $logger = Logger->new;

        $logger->log('Started');

        my $result = $logger->messages;

        # ["Started"]
