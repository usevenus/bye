# NAME

Venus - Hashes

# ABSTRACT

Hash Operations in Venus

# SYNOPSIS

    package main;

    use Venus::Hash;

    my $hash = Venus::Hash->new({ name => 'Venus', type => 'planet' });

    $hash->keys;

    # ["name", "type"]

# DESCRIPTION

[Venus::Hash](https://metacpan.org/pod/Venus%3A%3AHash) wraps Perl hashrefs and provides methods for common hash
operations. Hashes deref automatically, so they work seamlessly with Perl's
built-in hash operations.

# EXAMPLES

The following are examples of hash operations using Venus.

- hash.0

    Use `keys` and `values` to list hash contents.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ a => 1, b => 2 });

        my $result = $hash->values;

        # [1, 2] (order may vary)

- hash.1

    Use `exists` to check for key presence.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ name => 'Venus' });

        my $result = $hash->exists('name');

        # 1

- hash.2

    Use `delete` to remove a key and return its value.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ a => 1, b => 2, c => 3 });

        my $result = $hash->delete('b');

        # 2

- hash.3

    Use `count` to get the number of key-value pairs.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ a => 1, b => 2, c => 3 });

        my $result = $hash->count;

        # 3

- hash.4

    Use `merge` to combine hashes, with later values overwriting earlier ones.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ a => 1, b => 2 });

        my $result = $hash->merge({ b => 3, c => 4 });

        # { a => 1, b => 3, c => 4 }

- hash.5

    Use `pairs` to get key-value pairs as an array of arrays.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ x => 10, y => 20 });

        my $result = $hash->pairs;

        # [["x", 10], ["y", 20]] (order may vary)
