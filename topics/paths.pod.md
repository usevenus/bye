# NAME

Venus - Paths

# ABSTRACT

Paths in Venus

# SYNOPSIS

    package main;

    use Venus::Path;

    my $path = Venus::Path->new('/home/user/file.txt');

    $path->basename;

    # "file.txt"

# DESCRIPTION

[Venus::Path](https://metacpan.org/pod/Venus%3A%3APath) provides an object-oriented interface for file and directory
paths. It offers methods for path manipulation, traversal, and common
filesystem operations.

# EXAMPLES

The following are examples of path operations in Venus.

- path.0

    Use `basename` to get the filename.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/var/log/app.log');

        $path->basename;

        # "app.log"

- path.1

    Use `parent` to get the parent directory.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/home/user/docs/report.pdf');

        $path->parent->value;

        # "/home/user/docs"

- path.2

    Use `child` to create a subpath.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/home/user');

        my $child = $path->child('projects/app');

        "$child";

        # "/home/user/projects/app"

- path.3

    Use `absolute` to get the absolute path.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/../tmp/file');

        my $abs = $path->absolute;

        $abs =~ /tmp/ ? 'valid' : 'invalid';

        # "valid"

- path.4

    Use `exists` to check if a path exists.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp');

        $path->exists ? 'exists' : 'missing';

        # "exists"
