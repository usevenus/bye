# NAME

Venus - Collection Iteration

# ABSTRACT

Collection Iteration in Venus

# SYNOPSIS

    package main;

    use Venus::Array;

    my $array = Venus::Array->new([1, 2, 3, 4, 5]);

    my $total = 0;

    $array->each(sub { $total += $_ });

    $total;

    # 15

# DESCRIPTION

Venus provides iteration methods on [Venus::Array](https://metacpan.org/pod/Venus%3A%3AArray) and [Venus::Hash](https://metacpan.org/pod/Venus%3A%3AHash) for
traversing collections. Methods like `each`, `map`, `grep`, and `first`
enable functional-style data processing.

# EXAMPLES

The following are examples of collection iteration in Venus.

- each.0

    Use `each` to iterate over array elements.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new(['a', 'b', 'c']);

        my @items;

        $array->each(sub { push @items, $_ });

        join(',', @items);

        # "a,b,c"

- each.1

    Use `each` to iterate over hash key-value pairs.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ a => 1, b => 2 });

        my $sum = 0;

        $hash->each(sub { $sum += $_ });

        $sum;

        # 3

- first.0

    Use `first` to get the first element of an array.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([10, 20, 30, 40]);

        my $first = $array->first;

        $first;

        # 10

- grep.0

    Use `grep` to filter array elements.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3, 4, 5, 6]);

        my $evens = $array->grep(sub { $_ % 2 == 0 });

        join(',', @$evens);

        # "2,4,6"

- map.0

    Use `map` to transform array elements.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3]);

        my $mapped = $array->map(sub { $_ * 10 });

        join(',', @$mapped);

        # "10,20,30"
