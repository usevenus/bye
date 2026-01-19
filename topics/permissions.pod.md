# NAME

Venus - Permissions

# ABSTRACT

Permissions in Venus

# SYNOPSIS

    package main;

    use Venus::Path;

    my $path = Venus::Path->new('/tmp/venus_perm_test.txt');

    $path->write("test");

    $path->chmod(0644);

    my $mode = (stat "$path")[2] & 07777;

    $path->unlink;

    sprintf('%04o', $mode);

    # "0644"

# DESCRIPTION

[Venus::Path](https://metacpan.org/pod/Venus%3A%3APath) provides methods for file permissions. Use `chmod` to change
file mode and `test` to check file attributes.

# EXAMPLES

The following are examples of permission operations in Venus.

- perm.0

    Use `chmod` to set file permissions.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_perm_0.txt');

        $path->write("content");

        $path->chmod(0600);

        my $mode = (stat "$path")[2] & 07777;

        $path->unlink;

        $mode == 0600 ? 'correct' : 'incorrect';

        # "correct"

- perm.1

    Use `test` to check if a file is readable.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_perm_1.txt');

        $path->write("content");

        my $readable = $path->test('r') ? 'readable' : 'not readable';

        $path->unlink;

        $readable;

        # "readable"

- perm.2

    Use `test` to check if a file is writable.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_perm_2.txt');

        $path->write("content");

        my $writable = $path->test('w') ? 'writable' : 'not writable';

        $path->unlink;

        $writable;

        # "writable"

- perm.3

    Use `test` to check if a file is executable.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_perm_3.sh');

        $path->write("#!/bin/bash\necho hello");

        $path->chmod(0755);

        my $executable = $path->test('x') ? 'executable' : 'not executable';

        $path->unlink;

        $executable;

        # "executable"
