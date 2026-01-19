# NAME

Venus - Try

# ABSTRACT

Try in Venus

# SYNOPSIS

    package main;

    use Venus::Try;

    my $try = Venus::Try->new;

    my $result = $try->call(sub { "success" })->result;

    $result;

    # "success"

# DESCRIPTION

[Venus::Try](https://metacpan.org/pod/Venus%3A%3ATry) provides try-catch-finally functionality for exception handling.
Use `call` to define the code, `default` for error handling, and `finally`
for cleanup.

# EXAMPLES

The following are examples of exception handling in Venus.

- try.0

    Use `call` to execute code that might fail.

    **example 1**

        package main;

        use Venus::Try;

        my $try = Venus::Try->new;

        my $result = $try->call(sub { 10 + 20 })->result;

        $result;

        # 30

- try.1

    Use `default` to handle any errors.

    **example 1**

        package main;

        use Venus::Try;

        my $try = Venus::Try->new;

        my $result = $try->call(sub { die "oops!" })->default(sub { "recovered" })->result;

        $result;

        # "recovered"

- try.2

    Use `maybe` to return undef on errors.

    **example 1**

        package main;

        use Venus::Try;

        my $try = Venus::Try->new;

        my $result = $try->call(sub { die "fail!" })->maybe->result;

        defined $result ? 'defined' : 'undef';

        # "undef"

- try.3

    Use `finally` for cleanup code.

    **example 1**

        package main;

        use Venus::Try;

        my $cleaned = 0;

        my $try = Venus::Try->new;

        my $result = $try->call(sub { "done" })->finally(sub { $cleaned = 1 })->result;

        "$result-$cleaned";

        # "done-1"
