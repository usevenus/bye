# NAME

Venus - Vars

# ABSTRACT

Vars in Venus

# SYNOPSIS

    package main;

    use Venus::Vars;

    local %ENV = (HOME => '/home/user', PATH => '/usr/bin');

    my $vars = Venus::Vars->new(named => { home => 'HOME' });

    $vars->get('home');

    # "/home/user"

# DESCRIPTION

[Venus::Vars](https://metacpan.org/pod/Venus%3A%3AVars) provides access to environment variables via `%ENV`. Use
`named` to map variable names and `get` to retrieve values.

# EXAMPLES

The following are examples of environment variable handling in Venus.

- vars.0

    Use `get` to access environment variables.

    **example 1**

        package main;

        use Venus::Vars;

        local %ENV = (USER => 'alice');

        my $vars = Venus::Vars->new(named => { user => 'USER' });

        $vars->get('user');

        # "alice"

- vars.1

    Use `exists` to check if an environment variable is set.

    **example 1**

        package main;

        use Venus::Vars;

        local %ENV = (DEBUG => '1');

        my $vars = Venus::Vars->new(named => { debug => 'DEBUG', verbose => 'VERBOSE' });

        $vars->exists('verbose') ? 'has verbose' : 'no verbose';

        # "no verbose"

- vars.2

    Use `set` to modify environment variables.

    **example 1**

        package main;

        use Venus::Vars;

        local %ENV = ();

        my $vars = Venus::Vars->new(named => { api_key => 'API_KEY' });

        $vars->set('api_key', 'secret123');

        $vars->get('api_key');

        # "secret123"

- vars.3

    Access multiple environment variables.

    **example 1**

        package main;

        use Venus::Vars;

        local %ENV = (HOST => 'localhost', PORT => '8080');

        my $vars = Venus::Vars->new(named => { host => 'HOST', port => 'PORT' });

        my $host = $vars->get('host');

        my $port = $vars->get('port');

        "$host:$port";

        # "localhost:8080"
