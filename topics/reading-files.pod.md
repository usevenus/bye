# NAME

Venus - Reading Files

# ABSTRACT

Reading Files in Venus

# SYNOPSIS

    package main;

    use Venus::Path;

    my $path = Venus::Path->new('/tmp/venus_read_test.txt');

    $path->write("Hello, Venus!");

    my $content = $path->read;

    $path->unlink;

    $content;

    # "Hello, Venus!"

# DESCRIPTION

[Venus::Path](https://metacpan.org/pod/Venus%3A%3APath) provides methods for reading file contents. Use `read` to get
the entire file as a string and `lines` to get an array of lines.

# EXAMPLES

The following are examples of reading files in Venus.

- read.0

    Use `read` to get file contents as a string.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_read_0.txt');

        $path->write("Line 1\nLine 2\nLine 3");

        my $content = $path->read;

        $path->unlink;

        $content =~ /Line 2/ ? 'found' : 'missing';

        # "found"

- read.1

    Use `lines` to get file contents as an array.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_read_1.txt');

        $path->write("apple\nbanana\ncherry");

        my $lines = $path->lines;

        $path->unlink;

        scalar @$lines;

        # 3

- read.2

    Check if a file exists before reading.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_read_2.txt');

        $path->write("test content");

        my $result = $path->exists ? $path->read : 'missing';

        $path->unlink;

        $result;

        # "test content"

- read.3

    Read and process lines with iteration.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_read_3.txt');

        $path->write("10\n20\n30");

        my $sum = 0;

        $sum += $_ for @{$path->lines};

        $path->unlink;

        $sum;

        # 60
