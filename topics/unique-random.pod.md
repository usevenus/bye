# NAME

Venus - Unique and Random

# ABSTRACT

Unique and Random in Venus

# SYNOPSIS

    package main;

    use Venus::Array;

    my $array = Venus::Array->new([1, 2, 2, 3, 3, 3]);

    my $unique = $array->unique;

    join(',', @$unique);

    # "1,2,3"

# DESCRIPTION

[Venus::Array](https://metacpan.org/pod/Venus%3A%3AArray) provides `unique` to remove duplicates and `random` to
select random elements. [Venus::Set](https://metacpan.org/pod/Venus%3A%3ASet) automatically maintains unique values.

# EXAMPLES

The following are examples of unique and random operations in Venus.

- random.0

    Use `random` to get a random element.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([10, 20, 30, 40, 50]);

        my $random = $array->random;

        $array->any(sub { $_[1] == $random }) ? 'valid' : 'invalid';

        # "valid"

- random.1

    Use `random` on `Venus::Set` for unique random selection.

    **example 1**

        package main;

        use Venus::Set;

        my $set = Venus::Set->new(['red', 'green', 'blue']);

        my $random = $set->random;

        $set->any(sub { $_[1] eq $random }) ? 'valid' : 'invalid';

        # "valid"

- unique.0

    Use `unique` to remove duplicate values.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new(['a', 'b', 'a', 'c', 'b', 'a']);

        my $unique = $array->unique;

        join(',', @$unique);

        # "a,b,c"

- unique.1

    Use `Venus::Set` for collections that are always unique.

    **example 1**

        package main;

        use Venus::Set;

        my $set = Venus::Set->new([1, 2, 2, 3, 3, 3, 4, 4, 4, 4]);

        $set->count;

        # 4
