# NAME

Venus - Result Monad

# ABSTRACT

Result Monad in Venus

# SYNOPSIS

    package main;

    use Venus::Result;

    my $valid = Venus::Result->new(value => 'success');

    my $invalid = Venus::Result->new(issue => 'failure');

    $valid->is_valid && $invalid->is_invalid;

    # 1

# DESCRIPTION

[Venus::Result](https://metacpan.org/pod/Venus%3A%3AResult) represents the outcome of an operation that can succeed or
fail. Use the `value` attribute for success and `issue` attribute for
failure. Check status with `is_valid` and `is_invalid`.

# EXAMPLES

The following are examples of result monads in Venus.

- result.0

    Use `value` to create a valid result.

    **example 1**

        package main;

        use Venus::Result;

        my $result = Venus::Result->new(value => 42);

        $result->is_valid ? $result->value : 'error';

        # 42

- result.1

    Use `issue` to create an invalid result.

    **example 1**

        package main;

        use Venus::Result;

        my $result = Venus::Result->new(issue => 'Not found');

        $result->is_invalid ? $result->issue : 'ok';

        # "Not found"

- result.2

    Use `on_valid` to handle successful results.

    **example 1**

        package main;

        use Venus::Result;

        my $result = Venus::Result->new(value => 10);

        my $output;

        $result->on_valid(sub { $output = $_[0]->value * 2 });

        $output;

        # 20

- result.3

    Use `on_invalid` to handle failed results.

    **example 1**

        package main;

        use Venus::Result;

        my $result = Venus::Result->new(issue => 'Failed');

        my $output = 'default';

        $result->on_invalid(sub { $output = "Error: " . $_[0]->issue });

        $output;

        # "Error: Failed"
