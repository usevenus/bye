# NAME

Venus - Constructor Functions

# ABSTRACT

Creating Venus Objects

# SYNOPSIS

    package main;

    use Venus 'array';

    my $data = array [1, 2, 3];

    # bless(..., "Venus::Array")

# DESCRIPTION

Venus exports constructor functions for creating value objects. These functions
provide a concise way to wrap Perl data types in Venus objects.

# EXAMPLES

The following are examples of constructor functions for creating Venus objects.

- array.0

    Use the `array` function to create a [Venus::Array](https://metacpan.org/pod/Venus%3A%3AArray) object from an arrayref.

    **example 1**

        package main;

        use Venus 'array';

        my $data = array [1, 2, 3];

        # bless(..., "Venus::Array")

- hash.0

    Use the `hash` function to create a [Venus::Hash](https://metacpan.org/pod/Venus%3A%3AHash) object from a hashref.

    **example 1**

        package main;

        use Venus 'hash';

        my $data = hash { name => 'Venus', type => 'framework' };

        # bless(..., "Venus::Hash")

- number.0

    Use the `number` function to create a [Venus::Number](https://metacpan.org/pod/Venus%3A%3ANumber) object from a number.

    **example 1**

        package main;

        use Venus 'number';

        my $data = number 42;

        # bless(..., "Venus::Number")

- path.0

    Use the `path` function to create a [Venus::Path](https://metacpan.org/pod/Venus%3A%3APath) object from a path string.

    **example 1**

        package main;

        use Venus 'path';

        my $data = path '/home/user';

        # bless(..., "Venus::Path")

- string.0

    Use the `string` function to create a [Venus::String](https://metacpan.org/pod/Venus%3A%3AString) object from a string.

    **example 1**

        package main;

        use Venus 'string';

        my $data = string 'hello world';

        # bless(..., "Venus::String")
