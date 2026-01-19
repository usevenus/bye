# NAME

Venus - Unpack

# ABSTRACT

Unpack in Venus

# SYNOPSIS

    package main;

    use Venus::Unpack;

    my $unpack = Venus::Unpack->new(['hello', 123]);

    $unpack->arg(0);

    # "hello"

# DESCRIPTION

[Venus::Unpack](https://metacpan.org/pod/Venus%3A%3AUnpack) provides argument unpacking with type checking. Use `arg`
to select arguments by index and `all` to get all arguments.

# EXAMPLES

The following are examples of argument unpacking in Venus.

- unpack.0

    Use `arg` to select arguments by index.

    **example 1**

        package main;

        use Venus::Unpack;

        my $unpack = Venus::Unpack->new(['a', 'b', 'c']);

        $unpack->arg(1);

        # "b"

- unpack.1

    Access last argument.

    **example 1**

        package main;

        use Venus::Unpack;

        my $unpack = Venus::Unpack->new([1, 2, 3]);

        $unpack->arg(2);

        # 3

- unpack.2

    Access first argument.

    **example 1**

        package main;

        use Venus::Unpack;

        my $unpack = Venus::Unpack->new(['x', 'y', 'z']);

        $unpack->arg(0);

        # "x"

- unpack.3

    Get arguments by position.

    **example 1**

        package main;

        use Venus::Unpack;

        my $unpack = Venus::Unpack->new(['first', 'second']);

        my $a = $unpack->arg(0);

        my $b = $unpack->arg(1);

        "$a-$b";

        # "first-second"
