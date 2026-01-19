# NAME

Venus - Values

# ABSTRACT

Value Objects in Venus

# SYNOPSIS

    package main;

    use Venus::String;

    my $string = Venus::String->new('hello world');

    print $string;

    # "hello world"

# DESCRIPTION

Venus provides value classes that wrap Perl primitives (strings, numbers,
arrays, hashes) in objects. These objects stringify and numify automatically,
and provide useful methods for manipulation.

# EXAMPLES

The following are examples of value objects in Venus.

- array.0

    [Venus::Array](https://metacpan.org/pod/Venus%3A%3AArray) wraps arrayrefs. Use `get` to retrieve the underlying data.

    **example 1**

        package main;

        use Venus::Array;

        my $array = Venus::Array->new([1, 2, 3]);

        my $data = $array->get;

        # [1, 2, 3]

- boolean.0

    [Venus::Boolean](https://metacpan.org/pod/Venus%3A%3ABoolean), [Venus::True](https://metacpan.org/pod/Venus%3A%3ATrue), and [Venus::False](https://metacpan.org/pod/Venus%3A%3AFalse) represent boolean values.

    **example 1**

        package main;

        use Venus::True;
        use Venus::False;

        my $true = Venus::True->new;
        my $false = Venus::False->new;

        my $result = $true && !$false;

        # 1

- boolean.1

    The `Venus` package automatically exports `true` and `false` keyword
    functions which provide fully backward-compatible boolean values.

    **example 1**

        package main;

        use Venus;

        my $result = true && !false;

        # 1

- hash.0

    [Venus::Hash](https://metacpan.org/pod/Venus%3A%3AHash) wraps hashrefs. Use `get` to retrieve the underlying data.

    **example 1**

        package main;

        use Venus::Hash;

        my $hash = Venus::Hash->new({ name => 'Venus' });

        my $data = $hash->get;

        # { name => 'Venus' }

- number.0

    [Venus::Number](https://metacpan.org/pod/Venus%3A%3ANumber) wraps numbers. It numifies automatically in numeric contexts.

    **example 1**

        package main;

        use Venus::Number;

        my $number = Venus::Number->new(42);

        my $result = $number + 8;

        # 50

- string.0

    [Venus::String](https://metacpan.org/pod/Venus%3A%3AString) wraps strings. It stringifies automatically when printed.

    **example 1**

        package main;

        use Venus::String;

        my $string = Venus::String->new('hello world');

        print $string;

        # prints "hello world"
