# NAME

Venus - Slicing

# ABSTRACT

Slicing in Venus

# SYNOPSIS

    package main;

    use Venus::Array;

    my $array = Venus::Array->new([1, 2, 3, 4, 5]);

    my $slice = $array->range(1, 2, 3);

    join(',', @$slice);

    # "2,3,4"

# DESCRIPTION

Venus provides methods for extracting portions of arrays. Use `range` to
get elements at specific indices, `head` for the beginning, and `tail` for
the end of an array.

# EXAMPLES

The following are examples of slicing in Venus.

- slice.0

    Use `range` to extract elements at specific indices.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new(['a', 'b', 'c', 'd', 'e']);

        my $slice = $array->range(0, 1, 2);

        join(',', @$slice);

        # "a,b,c"

- slice.1

    Use `head` to get the first N elements.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3, 4, 5]);

        my $head = $array->head(3);

        join(',', @$head);

        # "1,2,3"

- slice.2

    Use `tail` to get the last N elements.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3, 4, 5]);

        my $tail = $array->tail(2);

        join(',', @$tail);

        # "4,5"

- slice.3

    Use `part` to split an array by a condition.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3, 4, 5, 6]);

        my $parts = $array->part(sub { $_[1] % 2 == 0 });

        my $evens = join(',', @{$parts->[0]});

        # "2,4,6"
