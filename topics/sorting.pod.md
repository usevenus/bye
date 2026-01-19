# NAME

Venus - Sorting

# ABSTRACT

Sorting in Venus

# SYNOPSIS

    package main;

    use Venus::Array;

    my $array = Venus::Array->new([3, 1, 4, 1, 5]);

    my $sorted = $array->sort;

    join(',', @$sorted);

    # "1,1,3,4,5"

# DESCRIPTION

[Venus::Array](https://metacpan.org/pod/Venus%3A%3AArray) provides `sort` and `rsort` methods for sorting arrays.
The `sort` method sorts in ascending order, while `rsort` sorts in
descending order.

# EXAMPLES

The following are examples of sorting in Venus.

- sort.0

    Use `sort` to sort numbers in ascending order.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([5, 2, 8, 1, 9]);

        my $sorted = $array->sort;

        join(',', @$sorted);

        # "1,2,5,8,9"

- sort.1

    Use `rsort` to sort in descending order.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([5, 2, 8, 1, 9]);

        my $sorted = $array->rsort;

        join(',', @$sorted);

        # "9,8,5,2,1"

- sort.2

    Use `sort` to sort strings alphabetically.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new(['banana', 'apple', 'cherry']);

        my $sorted = $array->sort;

        join(',', @$sorted);

        # "apple,banana,cherry"

- sort.3

    Use `reverse` to reverse array order.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3, 4, 5]);

        my $reversed = $array->reverse;

        join(',', @$reversed);

        # "5,4,3,2,1"
