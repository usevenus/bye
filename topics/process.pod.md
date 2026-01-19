# NAME

Venus - Process

# ABSTRACT

Process in Venus

# SYNOPSIS

    package main;

    use Venus::Process;

    my $process = Venus::Process->new;

    $process->pid > 0 ? 'has pid' : 'no pid';

    # "has pid"

# DESCRIPTION

[Venus::Process](https://metacpan.org/pod/Venus%3A%3AProcess) provides methods for process management including forking,
communication between processes, and lifecycle management.

# EXAMPLES

The following are examples of process operations in Venus.

- proc.0

    Use `pid` to get the current process ID.

    **example 1**

        package main;

        use Venus::Process;

        my $process = Venus::Process->new;

        $process->pid > 0 ? 'valid pid' : 'invalid pid';

        # "valid pid"

- proc.1

    Check if a process is registered (active).

    **example 1**

        package main;

        use Venus::Process;

        my $process = Venus::Process->new;

        $process->is_registered ? 'registered' : 'not registered';

        # "not registered"

- proc.2

    Use `trap` to set a signal handler.

    **example 1**

        package main;

        use Venus::Process;

        my $process = Venus::Process->new;

        $process->trap(USR1 => sub { });

        $process->untrap('USR1');

        'signal setup';

        # "signal setup"

- proc.3

    Use `exit` to terminate the process with a code.

    **example 1**

        package main;

        use Venus::Process;

        my $process = Venus::Process->new;

        # In practice: $process->exit(0);

        'exit available';

        # "exit available"
