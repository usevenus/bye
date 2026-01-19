# NAME

Venus - Searching

# ABSTRACT

Searching in Venus

# SYNOPSIS

    package main;

    use Venus::Array;

    my $array = Venus::Array->new([10, 20, 30, 40, 50]);

    my $found = $array->grep(sub { $_[1] > 25 });

    join(',', @$found);

    # "30,40,50"

# DESCRIPTION

Venus provides methods for searching collections. Use `grep` to filter by
condition, `any`/`all`/`none` for boolean checks, `exists` to check for
keys/indices, and `find` for path-based access to nested structures.

# EXAMPLES

The following are examples of searching in Venus.

- search.0

    Use `any` to check if any element matches.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3, 4, 5]);

        my $result = $array->any(sub { $_[1] > 3 }) ? 'found' : 'none';

        $result;

        # "found"

- search.1

    Use `all` to check if all elements match.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([2, 4, 6, 8]);

        my $result = $array->all(sub { $_[1] % 2 == 0 }) ? 'all even' : 'not all';

        $result;

        # "all even"

- search.2

    Use `none` to check if no elements match.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 3, 5, 7]);

        my $result = $array->none(sub { $_[1] % 2 == 0 }) ? 'no evens' : 'has evens';

        $result;

        # "no evens"

- search.3

    Use `exists` to check for keys in a hash.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ name => 'Alice', age => 30 });

        my $result = $hash->exists('name') ? 'has name' : 'no name';

        $result;

        # "has name"

- search.4

    Use `find` for path-based access to nested data.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({
          user => { profile => { city => 'NYC' } }
        });

        my $result = $hash->find('user', 'profile', 'city');

        $result;

        # "NYC"

- search.5

    Use `one` to check if exactly one element matches.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3, 4, 5]);

        my $result = $array->one(sub { $_[1] == 3 }) ? 'one match' : 'not one';

        $result;

        # "one match"
