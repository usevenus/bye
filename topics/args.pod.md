# NAME

Venus - Args

# ABSTRACT

Args in Venus

# SYNOPSIS

    package main;

    use Venus::Args;

    local @ARGV = ('--name', 'Alice', 'file.txt');

    my $args = Venus::Args->new(named => { name => 1 });

    $args->get($args->name('name'));

    # "Alice"

# DESCRIPTION

[Venus::Args](https://metacpan.org/pod/Venus%3A%3AArgs) provides access to command-line arguments via `@ARGV`. Use
`named` to map argument names to indices, `get` to retrieve values by index,
and `exists` to check for named arguments.

# EXAMPLES

The following are examples of argument handling in Venus.

- args.0

    Use `get` to access arguments by index.

    **example 1**

        package main;

        use Venus::Args;

        local @ARGV = ('input.txt', 'output.txt');

        my $args = Venus::Args->new;

        $args->get(0);

        # "input.txt"

- args.1

    Use `named` to map names to argument indices.

    **example 1**

        package main;

        use Venus::Args;

        local @ARGV = ('--host', 'localhost', '--port', '8080');

        my $args = Venus::Args->new(named => { host => 1, port => 3 });

        $args->get($args->name('port'));

        # "8080"

- args.2

    Use `exists` to check if a named argument is defined.

    **example 1**

        package main;

        use Venus::Args;

        local @ARGV = ('--verbose', '--debug');

        my $args = Venus::Args->new(named => { verbose => 0, debug => 1 });

        $args->exists('verbose') ? 'has verbose' : 'no verbose';

        # "has verbose"

- args.3

    Use `indexed` to get a hash of index-value pairs.

    **example 1**

        package main;

        use Venus::Args;

        local @ARGV = ('a', 'b', 'c');

        my $args = Venus::Args->new;

        my $indexed = $args->indexed;

        $indexed->{1};

        # "b"
