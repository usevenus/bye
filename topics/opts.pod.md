# NAME

Venus - Opts

# ABSTRACT

Opts in Venus

# SYNOPSIS

    package main;

    use Venus::Opts;

    local @ARGV = ('--name=Alice');

    my $opts = Venus::Opts->new(
      specs => ['name|n=s'],
      named => { name => 'name' }
    );

    $opts->get('name');

    # "Alice"

# DESCRIPTION

[Venus::Opts](https://metacpan.org/pod/Venus%3A%3AOpts) provides command-line option parsing using Getopt::Long specs.
Define options with `specs`, map names with `named`, and retrieve values
with `get`.

# EXAMPLES

The following are examples of command-line option parsing in Venus.

- opts.0

    Use `specs` to define option types.

    **example 1**

        package main;

        use Venus::Opts;

        local @ARGV = ('--verbose');

        my $opts = Venus::Opts->new(
          specs => ['verbose|v'],
          named => { verbose => 'verbose' }
        );

        $opts->get('verbose') ? 'verbose on' : 'verbose off';

        # "verbose on"

- opts.1

    Use `exists` to check if an option was provided.

    **example 1**

        package main;

        use Venus::Opts;

        local @ARGV = ('--debug');

        my $opts = Venus::Opts->new(
          specs => ['debug|d', 'quiet|q'],
          named => { debug => 'debug', quiet => 'quiet' }
        );

        $opts->exists('quiet') ? 'has quiet' : 'no quiet';

        # "no quiet"

- opts.2

    Parse numeric option values.

    **example 1**

        package main;

        use Venus::Opts;

        local @ARGV = ('--port=8080');

        my $opts = Venus::Opts->new(
          specs => ['port|p=i'],
          named => { port => 'port' }
        );

        $opts->get('port');

        # 8080

- opts.3

    Use `unused` to get non-option arguments.

    **example 1**

        package main;

        use Venus::Opts;

        local @ARGV = ('--name=test', 'file.txt');

        my $opts = Venus::Opts->new(
          specs => ['name|n=s'],
          named => { name => 'name' }
        );

        my $unused = $opts->unused;

        $unused->[0];

        # "file.txt"
