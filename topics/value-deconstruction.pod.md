# NAME

Venus - Value Deconstruction

# ABSTRACT

Extracting Nested Values

# SYNOPSIS

    package main;

    use Venus 'gets';

    my $data = { user => { name => 'Alice' } };

    my ($name) = gets $data, 'user.name';

    # "Alice"

# DESCRIPTION

Venus provides the `gets` function for extracting nested values from data
structures using dot-notation paths.

# EXAMPLES

The following are examples of value deconstruction using Venus.

- gets.0

    Use `gets` with dot-notation to extract a nested hash value.

    **example 1**

        package main;

        use Venus 'gets';

        my $data = { user => { name => 'Alice', age => 30 } };

        my ($name) = gets $data, 'user.name';

        # "Alice"

- gets.1

    Use numeric indices in dot-notation to extract from arrays.

    **example 1**

        package main;

        use Venus 'gets';

        my $data = { users => ['Alice', 'Bob', 'Eve'] };

        my ($first) = gets $data, 'users.0';

        # "Alice"

- gets.2

    Use `gets` with multiple paths to extract multiple values at once.

    **example 1**

        package main;

        use Venus 'gets';

        my $data = { name => 'Alice', age => 30, city => 'NYC' };

        my ($name, $city) = gets $data, 'name', 'city';

        # ("Alice", "NYC")

- gets.3

    Combine `gets` with `list` to reorder and flatten extracted values.

    **example 1**

        package main;

        use Venus 'gets', 'list';

        my $tuple = ['device', ['0.0.0.0', '127.0.0.1'], 'root'];

        my ($user, $device, @ips) = map list($_), gets $tuple, '2', '0', '1';

        # ("root", "device", "0.0.0.0", "127.0.0.1")
