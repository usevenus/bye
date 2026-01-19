# NAME

Venus - Joining

# ABSTRACT

Joining in Venus

# SYNOPSIS

    package main;

    use Venus::Array;

    my $array = Venus::Array->new(['a', 'b', 'c']);

    my $joined = $array->join(', ');

    $joined;

    # "a, b, c"

# DESCRIPTION

[Venus::Array](https://metacpan.org/pod/Venus%3A%3AArray), [Venus::Map](https://metacpan.org/pod/Venus%3A%3AMap), and [Venus::Set](https://metacpan.org/pod/Venus%3A%3ASet) all provide a `join` method
for combining elements into a string with a specified separator.

# EXAMPLES

The following are examples of joining in Venus.

- join.0

    Use `join` on `Venus::Array` to combine elements.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3, 4, 5]);

        my $result = $array->join('-');

        $result;

        # "1-2-3-4-5"

- join.1

    Use `join` on `Venus::Map` to combine hash values.

    **example 1**

        package main;

        use Venus::Map;

        my $map = Venus::Map->new({ x => 10, y => 20, z => 30 });

        my $result = $map->join(' + ');

        $result;

        # "10 + 20 + 30"

- join.2

    Use `join` on `Venus::Set` which contains unique values only.

    **example 1**

        package main;

        use Venus::Set;

        my $set = Venus::Set->new([1, 2, 2, 3, 3, 3]);

        my $result = $set->join(', ');

        $result;

        # "1, 2, 3"

- join.3

    Use `join` with an empty separator to concatenate.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new(['h', 'e', 'l', 'l', 'o']);

        my $result = $array->join('');

        $result;

        # "hello"
