# NAME

Venus - Dispatching

# ABSTRACT

Construct and Call in One Step

# SYNOPSIS

    package main;

    use Venus 'string';

    my $result = string 'hello', 'uppercase';

    # "HELLO"

# DESCRIPTION

Venus constructor functions accept an optional method name and arguments,
allowing you to create an object and call a method in a single expression.

# EXAMPLES

The following are examples of dispatching methods via constructor functions.

- array.0

    Use the `array` function with a method name to construct and query an array.

    **example 1**

        package main;

        use Venus 'array';

        my $result = array [1, 2, 3], 'count';

        # 3

- path.0

    Use the `path` function with a method name to check path properties.

    **example 1**

        package main;

        use Venus 'path';

        my $result = path '.', 'exists';

        # 1

- space.0

    Use the `space` function with a method name to load a package dynamically.

    **example 1**

        package main;

        use Venus 'space';

        my $result = space 'Venus::String', 'load';

        # "Venus::String"

- string.0

    Use the `string` function with a method name to transform a string.

    **example 1**

        package main;

        use Venus 'string';

        my $result = string 'hello', 'uppercase';

        # "HELLO"
