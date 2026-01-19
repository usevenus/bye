# NAME

Venus - CLI

# ABSTRACT

CLI in Venus

# SYNOPSIS

    package main;

    use Venus::Cli;

    my $cli = Venus::Cli->new(name => 'mycli');

    $cli->option('name', {
      help => 'Your name',
      type => 'string',
    });

    $cli->parse('--name', 'Alice');

    $cli->option_value('name');

    # "Alice"

# DESCRIPTION

[Venus::Cli](https://metacpan.org/pod/Venus%3A%3ACli) provides a framework for building command-line applications.
Define options with `option`, arguments with `argument`, and use `parse`
to process input.

# EXAMPLES

The following are examples of CLI applications in Venus.

- cli.0

    Define boolean options.

    **example 1**

        package main;

        use Venus::Cli;

        my $cli = Venus::Cli->new(name => 'mycli');

        $cli->option('verbose', {
          help => 'Verbose output',
          alias => 'v',
          type => 'boolean',
        });

        $cli->parse('--verbose');

        $cli->option_value('verbose') ? 'verbose' : 'quiet';

        # "verbose"

- cli.1

    Define numeric options.

    **example 1**

        package main;

        use Venus::Cli;

        my $cli = Venus::Cli->new(name => 'mycli');

        $cli->option('port', {
          help => 'Port number',
          type => 'number',
          default => 8080,
        });

        $cli->parse('--port', '3000');

        $cli->option_value('port');

        # 3000

- cli.2

    Define positional arguments.

    **example 1**

        package main;

        use Venus::Cli;

        my $cli = Venus::Cli->new(name => 'mycli');

        $cli->argument('file', {
          help => 'Input file',
          range => '0',
        });

        $cli->parse('input.txt');

        $cli->argument_value('file');

        # "input.txt"

- cli.3

    Use default values for options.

    **example 1**

        package main;

        use Venus::Cli;

        my $cli = Venus::Cli->new(name => 'mycli');

        $cli->option('host', {
          help => 'Server host',
          type => 'string',
          default => 'localhost',
        });

        $cli->parse;

        $cli->option_value('host');

        # "localhost"
