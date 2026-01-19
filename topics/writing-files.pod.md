# NAME

Venus - Writing Files

# ABSTRACT

Writing Files in Venus

# SYNOPSIS

    package main;

    use Venus::Path;

    my $path = Venus::Path->new('/tmp/venus_write_test.txt');

    $path->write("Hello, Venus!");

    my $content = $path->read;

    $path->unlink;

    $content;

    # "Hello, Venus!"

# DESCRIPTION

[Venus::Path](https://metacpan.org/pod/Venus%3A%3APath) provides methods for writing file contents. Use `write` to
overwrite a file, `append` to add content, and `mkfile` to create files.

# EXAMPLES

The following are examples of writing files in Venus.

- write.0

    Use `write` to create or overwrite a file.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_write_0.txt');

        $path->write("First write");

        $path->write("Second write");

        my $content = $path->read;

        $path->unlink;

        $content;

        # "Second write"

- write.1

    Use `mkfile` to create an empty file.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_write_1.txt');

        $path->mkfile;

        my $exists = $path->exists ? 'created' : 'missing';

        $path->unlink;

        $exists;

        # "created"

- write.2

    Write multi-line content to a file.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_write_2.txt');

        $path->write("Line 1\nLine 2\nLine 3");

        my $lines = $path->lines;

        $path->unlink;

        scalar @$lines;

        # 3

- write.3

    Create a directory and write a file using `mkdir` and `child`.

    **example 1**

        package main;

        use Venus::Path;

        my $dir = Venus::Path->new('/tmp/venus_write_test_dir');

        $dir->mkdir;

        my $file = $dir->child('file.txt');

        $file->write("test content");

        my $exists = $file->exists ? 'created' : 'missing';

        $file->unlink;

        $dir->rmdir;

        $exists;

        # "created"
