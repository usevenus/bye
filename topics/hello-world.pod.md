# NAME

Venus - Hello World

# ABSTRACT

Getting to "Hello World"

# SYNOPSIS

    package main;

    use Venus 'log';

    log 'Hello World';

    # bless(..., "Venus::Log")

    # Prints "Hello World" to STDOUT

# DESCRIPTION

Venus is an object-orientation framework for Perl 5. This topic demonstrates
basic output using Venus.

# EXAMPLES

The following are examples of how to output information using Venus.

- log.0

    Use the `log` function to output a message to STDOUT. The `log` function
    returns a [Venus::Log](https://metacpan.org/pod/Venus%3A%3ALog) object.

    **example 1**

        package main;

        use Venus 'log';

        log 'Hello World';

        # bless(..., "Venus::Log")

        # Prints "Hello World" to STDOUT

- log.1

    Unlike `say`, the `log` function can output complex data structures like
    arrays, hashes, and objects.

    **example 1**

        package main;

        use Venus 'log';

        log { name => 'World', greeting => 'Hello' };

        # bless(..., "Venus::Log")

        # Prints '{greeting => "Hello", name => "World"}' to STDOUT

- say.0

    Venus value objects stringify automatically, so Perl's built-in `say` works
    naturally with them.

    **example 1**

        package main;

        use feature 'say';

        use Venus 'string';

        my $message = string 'Hello World';

        say $message;

        # "Hello World"

        $message
