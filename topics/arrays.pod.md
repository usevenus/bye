# NAME

Venus - Arrays

# ABSTRACT

Array Operations in Venus

# SYNOPSIS

    package main;

    use Venus::Array;

    my $array = Venus::Array->new([1, 2, 3]);

    $array->push(4, 5);

    $array->get;

    # [1, 2, 3, 4, 5]

# DESCRIPTION

[Venus::Array](https://metacpan.org/pod/Venus%3A%3AArray) wraps Perl arrayrefs and provides methods for common array
operations. Arrays deref automatically, so they work seamlessly with Perl's
built-in array operations.

# EXAMPLES

The following are examples of array operations using Venus.

- array.0

    Use `push` and `pop` to add and remove elements from the end.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3]);

        $array->push(4);

        my $result = $array->pop;

        # 4

- array.1

    Use `unshift` and `shift` to add and remove elements from the beginning.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([2, 3, 4]);

        $array->unshift(1);

        my $result = $array->shift;

        # 1

- array.2

    Use `count` and `length` to get the number of elements.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new(['a', 'b', 'c', 'd']);

        my $result = $array->count;

        # 4

- array.3

    Use `first` and `last` to access elements at the ends.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([10, 20, 30]);

        my $result = $array->first;

        # 10

- array.4

    Use `join` to concatenate elements into a string.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new(['a', 'b', 'c']);

        my $result = $array->join('-');

        # "a-b-c"

- array.5

    Use `reverse` to reverse the order of elements.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3]);

        my $result = $array->reverse;

        # [3, 2, 1]
