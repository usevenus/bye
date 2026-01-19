# NAME

Venus - Value Assignment

# ABSTRACT

Setting Nested Values

# SYNOPSIS

    package main;

    use Venus 'sets';

    my $data = { user => { name => 'Elliot' } };

    sets $data, 'user.age' => 30;

    # $data is now { user => { name => 'Elliot', age => 30 } }

    $data

# DESCRIPTION

Venus provides the `sets` function for setting nested values in data
structures using dot-notation paths. The function mutates the original data
structure.

**Important:** The `sets` function will only set a value if its parent node
exists. For example, `sets $data, 'user.auth.login' => 'x'` will fail if
there is no `user.auth` node to traverse.

# EXAMPLES

The following are examples of value assignment using Venus.

- sets.0

    Use `sets` to add a new key to an existing nested hash.

    **example 1**

        package main;

        use Venus 'sets';

        my $data = { user => { name => 'Elliot' } };

        sets $data, 'user.age' => 25;

        # $data is now { user => { name => 'Elliot', age => 25 } }

        $data

- sets.1

    Use `sets` with numeric indices to modify array elements.

    **example 1**

        package main;

        use Venus 'sets';

        my $data = { items => ['apple', 'banana', 'cherry'] };

        sets $data, 'items.1' => 'blueberry';

        # $data is now { items => ['apple', 'blueberry', 'cherry'] }

        $data

- sets.2

    Use `sets` with multiple path-value pairs to set several values at once.

    **example 1**

        package main;

        use Venus 'sets';

        my $data = { user => { name => 'Elliot' } };

        sets $data, 'user.age' => 25, 'user.city' => 'NYC';

        # $data is now { user => { name => 'Elliot', age => 25, city => 'NYC' } }

        $data
