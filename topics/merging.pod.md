# NAME

Venus - Merging

# ABSTRACT

Merging in Venus

# SYNOPSIS

    package main;

    use Venus 'merge_swap';

    my $result = merge_swap(
      { a => 1, b => 2 },
      { b => 20, c => 3 },
      { c => 30, d => 4 }
    );

    $result->{b} + $result->{c};

    # 50

# DESCRIPTION

Venus provides multiple merge strategies as functions. All merge functions
accept multiple arguments and process them left to right. Strategies include
`merge_keep` (preserve original), `merge_swap` (overwrite), `merge_join`
(combine arrays), and `merge_take` (deep merge). Each has a `_mutate`
variant that modifies in place.

# EXAMPLES

The following are examples of merging in Venus.

- merge.0

    Use `merge_swap` to overwrite values (later values win).

    **example 1**

        package main;

        use Venus 'merge_swap';

        my $result = merge_swap(
          { name => 'Alice', age => 25 },
          { age => 30, city => 'NYC' }
        );

        $result->{age};

        # 30

- merge.1

    Use `merge_keep` to preserve original values on conflicts.

    **example 1**

        package main;

        use Venus 'merge_keep';

        my $result = merge_keep(
          { name => 'Alice', age => 25 },
          { age => 30, city => 'NYC' }
        );

        $result->{age};

        # 25

- merge.2

    Use `merge_join` to combine array values.

    **example 1**

        package main;

        use Venus 'merge_join';

        my $result = merge_join(
          { tags => ['a', 'b'] },
          { tags => ['c', 'd'] }
        );

        join(',', @{$result->{tags}});

        # "a,b,c,d"

- merge.3

    Use `merge_take` for deep recursive merging.

    **example 1**

        package main;

        use Venus 'merge_take';

        my $result = merge_take(
          { user => { name => 'Bob' } },
          { user => { age => 30 } }
        );

        $result->{user}{name} . ':' . $result->{user}{age};

        # "Bob:30"

- merge.4

    Merge multiple values in one call.

    **example 1**

        package main;

        use Venus 'merge_swap';

        my $result = merge_swap(
          { a => 1 },
          { b => 2 },
          { c => 3 },
          { d => 4 }
        );

        join(',', sort keys %$result);

        # "a,b,c,d"

- merge.5

    Use `Venus::Hash` `merge` method (uses `merge_swap` internally).

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ a => 1, b => 2 });

        my $result = $hash->merge({ b => 20 }, { c => 3 });

        $result->{a} + $result->{b} + $result->{c};

        # 24

- merge.6

    Use `Venus::Array` `merge` method to replace array contents.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3]);

        my $result = $array->merge([4, 5], [6, 7, 8]);

        join(',', @$result);

        # "6,7,8"

- merge.7

    Chain `merge` calls on `Venus::Map`.

    **example 1**

        package main;

        use Venus::Map;

        my $map = Venus::Map->new({ x => 1 });

        $map->merge({ y => 2 })->merge({ z => 3 });

        $map->count;

        # 3
