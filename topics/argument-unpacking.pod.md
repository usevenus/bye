# NAME

Venus - Argument Unpacking

# ABSTRACT

Typed Argument Unpacking

# SYNOPSIS

    package main;

    use Venus 'unpack';

    my ($name, $age) = unpack('Alice', 30)->args;

    # ("Alice", 30)

# DESCRIPTION

Venus provides the `unpack` function and [Venus::Unpack](https://metacpan.org/pod/Venus%3A%3AUnpack) class for unpacking
and validating subroutine arguments with type coercion and constraints.

# EXAMPLES

The following are examples of argument unpacking using Venus.

- unpack.0

    Use `unpack` with `args` to extract arguments as a list.

    **example 1**

        package main;

        use Venus 'unpack';

        my ($x, $y) = unpack(10, 20)->args;

        # (10, 20)

- unpack.1

    Use `into` to coerce arguments into specific Venus types.

    **example 1**

        package main;

        use Venus 'unpack';

        my ($name) = unpack('alice')->into('Venus::String');

        $name->titlecase;

        # "Alice"

- unpack.2

    Use `signature` to validate arguments against type expressions.

    **example 1**

        package main;

        use Venus 'unpack';

        my ($name, $age) = unpack('Bob', 25)->signature('string', 'number');

        # ("Bob", 25)

- unpack.3

    Use `cast` to auto-deduce arguments to their Venus types.

    **example 1**

        package main;

        use Venus 'unpack';

        my ($data) = unpack([1, 2, 3])->cast;

        $data->count;

        # 3
