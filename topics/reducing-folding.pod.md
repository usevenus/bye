# NAME

Venus - Gathering and Reducing

# ABSTRACT

Gathering and Reducing in Venus

# SYNOPSIS

    package main;

    use Venus::Gather;

    my $gather = Venus::Gather->new([1, 2, 3, 4, 5]);

    $gather->when(sub { $_ % 2 == 0 })->then(sub { $_ * 10 });

    $gather->none(sub { [] });

    my $result = $gather->result;

    join(',', @$result);

    # "20,40"

# DESCRIPTION

[Venus::Gather](https://metacpan.org/pod/Venus%3A%3AGather) provides pattern matching on collections. Use `when` and
`then` to define conditions and transformations. Items matching a condition
are transformed by the corresponding `then` block.

# EXAMPLES

The following are examples of gathering and reducing in Venus.

- gather.0

    Use `when` and `then` to transform matching items.

    **example 1**

        package main;

        use Venus::Gather;

        my $gather = Venus::Gather->new(['apple', 'banana', 'cherry']);

        $gather->when(sub { /^a/ })->then(sub { uc $_ });
        $gather->when(sub { /^b/ })->then(sub { "fruit:$_" });

        $gather->none(sub { [] });

        my $result = $gather->result;

        join(',', @$result);

        # "APPLE,fruit:banana"

- gather.1

    Use `take` to include matching items unchanged.

    **example 1**

        package main;

        use Venus::Gather;

        my $gather = Venus::Gather->new([1, 2, 3, 4, 5, 6]);

        $gather->when(sub { $_ > 3 })->take;

        $gather->none(sub { [] });

        my $result = $gather->result;

        join(',', @$result);

        # "4,5,6"

- gather.2

    Use `skip` to exclude matching items.

    **example 1**

        package main;

        use Venus::Gather;

        my $gather = Venus::Gather->new([1, 2, 3, 4, 5]);

        $gather->when(sub { $_ % 2 == 0 })->skip;
        $gather->when(sub { 1 })->take;

        $gather->none(sub { [] });

        my $result = $gather->result;

        join(',', @$result);

        # "1,3,5"

- gather.3

    Use `just` to match exact values.

    **example 1**

        package main;

        use Venus::Gather;

        my $gather = Venus::Gather->new(['red', 'green', 'blue']);

        $gather->just('red')->then(sub { '#FF0000' });
        $gather->just('green')->then(sub { '#00FF00' });
        $gather->just('blue')->then(sub { '#0000FF' });

        my $result = $gather->result;

        join(',', @$result);

        # "#FF0000,#00FF00,#0000FF"
