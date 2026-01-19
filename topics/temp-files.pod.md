# NAME

Venus - Temp Files

# ABSTRACT

Temp Files in Venus

# SYNOPSIS

    package main;

    use Venus::Path;

    my $tmp = Venus::Path->new('/tmp');

    my $file = $tmp->mktemp_file;

    my $is_file = $file->is_file ? 'yes' : 'no';

    $file->unlink;

    $is_file;

    # "yes"

# DESCRIPTION

[Venus::Path](https://metacpan.org/pod/Venus%3A%3APath) provides methods for creating temporary files and directories.
Use `mktemp_file` to create a temporary file and `mktemp_dir` to create a
temporary directory.

# EXAMPLES

The following are examples of temporary file operations in Venus.

- temp.0

    Use `mktemp_file` to create a temporary file.

    **example 1**

        package main;

        use Venus::Path;

        my $tmp = Venus::Path->new('/tmp');

        my $file = $tmp->mktemp_file;

        $file->write("temp content");

        my $content = $file->read;

        $file->unlink;

        $content =~ /temp/ ? 'has content' : 'no content';

        # "has content"

- temp.1

    Use `mktemp_dir` to create a temporary directory.

    **example 1**

        package main;

        use Venus::Path;

        my $tmp = Venus::Path->new('/tmp');

        my $dir = $tmp->mktemp_dir;

        my $is_dir = $dir->is_directory ? 'yes' : 'no';

        $dir->rmdir;

        $is_dir;

        # "yes"

- temp.2

    Create files inside a temporary directory.

    **example 1**

        package main;

        use Venus::Path;

        my $tmp = Venus::Path->new('/tmp');

        my $dir = $tmp->mktemp_dir;

        my $file = $dir->child('data.txt');

        $file->write("data");

        my $exists = $file->exists ? 'exists' : 'missing';

        $file->unlink;

        $dir->rmdir;

        $exists;

        # "exists"

- temp.3

    Temporary file names are unique.

    **example 1**

        package main;

        use Venus::Path;

        my $tmp = Venus::Path->new('/tmp');

        my $file1 = $tmp->mktemp_file;

        my $file2 = $tmp->mktemp_file;

        my $different = "$file1" ne "$file2" ? 'unique' : 'same';

        $file1->unlink;

        $file2->unlink;

        $different;

        # "unique"
