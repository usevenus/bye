# NAME

Venus - Boxing

# ABSTRACT

Boxing Values in Venus

# SYNOPSIS

    package main;

    use Venus::Box;

    my $box = Venus::Box->new(value => 'hello');

    $box->uppercase->unbox;

    # "HELLO"

# DESCRIPTION

[Venus::Box](https://metacpan.org/pod/Venus%3A%3ABox) wraps any value and provides a fluent interface for chaining
method calls. Each method call returns a new box containing the result,
allowing transformations to be composed elegantly.

# EXAMPLES

The following are examples of boxing in Venus.

- box.0

    Use `Venus::Box` to wrap a value and chain transformations.

    **example 1**

        package main;

        use Venus::Box;

        my $box = Venus::Box->new(value => [3, 1, 4, 1, 5]);

        my $result = $box->sort->join('-')->unbox;

        # "1-1-3-4-5"

- box.1

    Methods are proxied to the underlying value and return a new box.

    **example 1**

        package main;

        use Venus::Box;

        my $box = Venus::Box->new(value => 42);

        my $result = $box->add(8)->unbox;

        # 50

- box.2

    Use `unbox` to extract the final value from a box.

    **example 1**

        package main;

        use Venus::Box;

        my $box = Venus::Box->new(value => { name => 'venus' });

        my $result = $box->get('name')->unbox;

        # "venus"

- box.3

    Use the `box` function from Venus for convenient boxing.

    **example 1**

        package main;

        use Venus 'box';

        my $result = box('hello world')->split(' ')->count->unbox;

        # 2
