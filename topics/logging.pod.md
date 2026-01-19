# NAME

Venus - Logging

# ABSTRACT

Logging in Venus

# SYNOPSIS

    package main;

    use Venus::Log;

    my $log = Venus::Log->new;

    $log->level('debug');

    $log->debug("Test message");

    # bless(..., "Venus::Log")

# DESCRIPTION

[Venus::Log](https://metacpan.org/pod/Venus%3A%3ALog) provides logging with configurable levels. Methods include
`debug`, `info`, `warn`, `error`, and `fatal`. Use `level` to set
the minimum log level.

# EXAMPLES

The following are examples of logging in Venus.

- log.0

    Use `info` to log informational messages.

    **example 1**

        package main;

        use Venus::Log;

        my $log = Venus::Log->new;

        $log->level('info');

        $log->info("Application started");

        # bless(..., "Venus::Log")

- log.1

    Use `warn` to log warning messages.

    **example 1**

        package main;

        use Venus::Log;

        my $log = Venus::Log->new;

        $log->level('warn');

        $log->warn("Resource running low");

        # bless(..., "Venus::Log")

- log.2

    Use `error` to log error messages.

    **example 1**

        package main;

        use Venus::Log;

        my $log = Venus::Log->new;

        $log->level('error');

        $log->error("Operation failed");

        # bless(..., "Venus::Log")

- log.3

    Use `level_name` to get the current log level name.

    **example 1**

        package main;

        use Venus::Log;

        my $log = Venus::Log->new;

        $log->level('debug');

        $log->level_name;

        # "debug"
