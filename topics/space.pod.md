# NAME

Venus - Space

# ABSTRACT

Space in Venus

# SYNOPSIS

    package main;

    use Venus::Space;

    my $space = Venus::Space->new('Venus::String');

    $space->loaded ? 'loaded' : 'not loaded';

    # "not loaded"

# DESCRIPTION

[Venus::Space](https://metacpan.org/pod/Venus%3A%3ASpace) provides package introspection and manipulation including
loading modules, checking inheritance, and accessing package metadata.

# EXAMPLES

The following are examples of package introspection in Venus.

- space.0

    Use `load` to load a module.

    **example 1**

        package main;

        use Venus::Space;

        my $space = Venus::Space->new('Venus::String');

        $space->load;

        $space->loaded ? 'loaded' : 'not loaded';

        # "loaded"

- space.1

    Use `package` to get the package name.

    **example 1**

        package main;

        use Venus::Space;

        my $space = Venus::Space->new('Venus::Array');

        $space->package;

        # "Venus::Array"

- space.2

    Use `parent` to get the parent package.

    **example 1**

        package main;

        use Venus::Space;

        my $space = Venus::Space->new('Venus::Array');

        $space->load;

        my $parent = $space->parent;

        $parent->package;

        # "Venus"

- space.3

    Use `child` to create a child package space.

    **example 1**

        package main;

        use Venus::Space;

        my $space = Venus::Space->new('Venus');

        my $child = $space->child('Array');

        $child->package;

        # "Venus::Array"
