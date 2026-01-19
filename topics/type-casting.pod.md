# NAME

Venus - Type Casting

# ABSTRACT

Type Casting in Venus

# SYNOPSIS

    package main;

    use Venus 'cast';

    my $object = cast('hello');

    $object->isa('Venus::String');

    # 1

# DESCRIPTION

Venus provides the `cast` function to convert Perl primitives into Venus
value objects. The function automatically detects the type and wraps it in
the appropriate Venus class.

# EXAMPLES

The following are examples of type casting in Venus.

- cast.0

    Use `cast` to convert a string to a Venus::String.

    **example 1**

        package main;

        use Venus 'cast';

        my $object = cast('hello world');

        my $result = $object->uppercase;

        # "HELLO WORLD"

- cast.1

    Use `cast` to convert a number to a Venus::Number.

    **example 1**

        package main;

        use Venus 'cast';

        my $object = cast(42);

        my $result = $object->add(8);

        # 50

- cast.2

    Use `cast` to convert an arrayref to a Venus::Array.

    **example 1**

        package main;

        use Venus 'cast';

        my $object = cast([1, 2, 3]);

        my $result = $object->count;

        # 3

- cast.3

    Use `cast` to convert a hashref to a Venus::Hash.

    **example 1**

        package main;

        use Venus 'cast';

        my $object = cast({ name => 'Venus' });

        my $result = $object->get('name');

        # "Venus"
