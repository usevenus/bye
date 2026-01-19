# NAME

Venus - Directories

# ABSTRACT

Directories in Venus

# SYNOPSIS

    package main;

    use Venus::Path;

    my $path = Venus::Path->new('/tmp/venus_dir_test');

    $path->mkdir;

    my $is_dir = $path->is_directory ? 'yes' : 'no';

    $path->rmdir;

    $is_dir;

    # "yes"

# DESCRIPTION

[Venus::Path](https://metacpan.org/pod/Venus%3A%3APath) provides methods for directory operations. Use `mkdir` to
create directories, `rmdir` to remove them, and `children` to list contents.

# EXAMPLES

The following are examples of directory operations in Venus.

- dir.0

    Use `mkdir` and `rmdir` for directory management.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp/venus_dir_0');

        $path->mkdir;

        my $exists = $path->exists ? 'exists' : 'missing';

        $path->rmdir;

        $exists;

        # "exists"

- dir.1

    Use `is_directory` to check if path is a directory.

    **example 1**

        package main;

        use Venus::Path;

        my $path = Venus::Path->new('/tmp');

        $path->is_directory ? 'directory' : 'not directory';

        # "directory"

- dir.2

    Use `children` to list directory contents.

    **example 1**

        package main;

        use Venus::Path;

        my $dir = Venus::Path->new('/tmp/venus_dir_2');

        $dir->mkdir;

        $dir->child('a.txt')->mkfile;

        $dir->child('b.txt')->mkfile;

        my $children = $dir->children;

        my $count = scalar @$children;

        $dir->child('a.txt')->unlink;

        $dir->child('b.txt')->unlink;

        $dir->rmdir;

        $count;

        # 2

- dir.3

    Use `glob` to find files matching patterns.

    **example 1**

        package main;

        use Venus::Path;

        my $dir = Venus::Path->new('/tmp/venus_dir_3');

        $dir->mkdir;

        $dir->child('test.txt')->mkfile;

        $dir->child('test.log')->mkfile;

        my $txt_files = $dir->glob('*.txt');

        my $count = scalar @$txt_files;

        $dir->child('test.txt')->unlink;

        $dir->child('test.log')->unlink;

        $dir->rmdir;

        $count;

        # 1
