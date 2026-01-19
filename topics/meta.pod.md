# NAME

Venus - Meta

# ABSTRACT

Meta in Venus

# SYNOPSIS

    package main;

    use Venus::Meta;

    my $meta = Venus::Meta->new(name => 'Venus::String');

    my $attrs = $meta->attrs;

    ref $attrs;

    # "ARRAY"

# DESCRIPTION

[Venus::Meta](https://metacpan.org/pod/Venus%3A%3AMeta) provides package introspection for examining attributes, bases,
roles, and methods of a package.

# EXAMPLES

The following are examples of package introspection in Venus.

- meta.0

    Use `attrs` to list package attributes.

    **example 1**

        package main;

        use Venus::Meta;

        my $meta = Venus::Meta->new(name => 'Venus::Array');

        my $attrs = $meta->attrs;

        ref $attrs;

        # "ARRAY"

- meta.1

    Use `bases` to list base classes.

    **example 1**

        package main;

        use Venus::Meta;

        my $meta = Venus::Meta->new(name => 'Venus::Path');

        my $bases = $meta->bases;

        ref $bases;

        # "ARRAY"

- meta.2

    Use `roles` to list composed roles.

    **example 1**

        package main;

        use Venus::Meta;

        my $meta = Venus::Meta->new(name => 'Venus::String');

        my $roles = $meta->roles;

        ref $roles;

        # "ARRAY"

- meta.3

    Use `subs` to list package methods.

    **example 1**

        package main;

        use Venus::Meta;

        my $meta = Venus::Meta->new(name => 'Venus::Array');

        my $subs = $meta->subs;

        ref $subs;

        # "ARRAY"
