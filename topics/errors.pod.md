# NAME

Venus - Errors

# ABSTRACT

Errors in Venus

# SYNOPSIS

    package main;

    use Venus::Error;

    my $error = Venus::Error->new(message => 'Something went wrong');

    $error->message;

    # "Something went wrong"

# DESCRIPTION

[Venus::Error](https://metacpan.org/pod/Venus%3A%3AError) provides a structured error class with support for messages,
context, and stack traces. Errors can be thrown and caught using Venus's
exception handling mechanisms.

# EXAMPLES

The following are examples of errors in Venus.

- error.0

    Create an error with a message.

    **example 1**

        package main;

        use Venus::Error;

        my $error = Venus::Error->new(message => 'File not found');

        my $result = $error->message;

        # "File not found"

- error.1

    Use `name` to identify error types.

    **example 1**

        package main;

        use Venus::Error;

        my $error = Venus::Error->new(
          name => 'on.file.missing',
          message => 'File not found'
        );

        my $result = $error->name;

        # "on.file.missing"

- error.2

    Use `stash` to attach additional context to errors.

    **example 1**

        package main;

        use Venus::Error;

        my $error = Venus::Error->new(message => 'Invalid input');

        $error->stash(field => 'email');

        my $result = $error->stash('field');

        # "email"

- error.3

    Errors stringify to their message for easy display.

    **example 1**

        package main;

        use Venus::Error;

        my $error = Venus::Error->new(message => 'Connection failed');

        my $result = "$error";

        # includes "Connection failed"
