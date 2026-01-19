# NAME

Venus - Strings

# ABSTRACT

String Operations in Venus

# SYNOPSIS

    package main;

    use Venus::String;

    my $string = Venus::String->new('hello world');

    $string->uppercase;

    # "HELLO WORLD"

# DESCRIPTION

[Venus::String](https://metacpan.org/pod/Venus%3A%3AString) provides methods for manipulating string data. Strings
auto-stringify, so they work seamlessly with Perl's built-in string operators.

# EXAMPLES

The following are examples of string operations using Venus.

- string.0

    Use `uppercase` and `lowercase` to change case.

    **example 1**

        package main;

        use Venus::String;

        my $string = Venus::String->new('Hello World');

        my $upper = $string->uppercase;

        # "HELLO WORLD"

- string.1

    Use `camelcase` and `snakecase` for identifier transformations.

    **example 1**

        package main;

        use Venus::String;

        my $string = Venus::String->new('hello world');

        my $camel = $string->camelcase;

        # "helloWorld"

- string.2

    Use `contains` and `index` to search within strings.

    **example 1**

        package main;

        use Venus::String;

        my $string = Venus::String->new('hello world');

        my $found = $string->contains('world');

        # 1

- string.3

    Use `append`, `prepend`, and `trim` for string manipulation.

    **example 1**

        package main;

        use Venus::String;

        my $string = Venus::String->new('  hello  ');

        my $trimmed = $string->trim;

        # "hello"
