# NAME

Venus - Regular Expressions

# ABSTRACT

Regular Expressions in Venus

# SYNOPSIS

    package main;

    use Venus::Regexp;

    my $regexp = Venus::Regexp->new(qr/\d+/);

    $regexp->search('abc 123 xyz');

    # bless(..., "Venus::Search")

# DESCRIPTION

Venus provides [Venus::Regexp](https://metacpan.org/pod/Venus%3A%3ARegexp) for working with regular expressions,
[Venus::Search](https://metacpan.org/pod/Venus%3A%3ASearch) for search results, and [Venus::Replace](https://metacpan.org/pod/Venus%3A%3AReplace) for replacements.

# EXAMPLES

The following are examples of regular expressions in Venus.

- regexp.0

    Use [Venus::Regexp](https://metacpan.org/pod/Venus%3A%3ARegexp) to wrap a compiled regex and search strings.

    **example 1**

        package main;

        use Venus::Regexp;

        my $regexp = Venus::Regexp->new(qr/(\w+)/);

        my $search = $regexp->search('hello world');

        my $result = $search->matched;

        # "hello"

- replace.0

    Use `replace` to substitute matched text.

    **example 1**

        package main;

        use Venus::Regexp;

        my $regexp = Venus::Regexp->new(qr/world/);

        my $replace = $regexp->replace('hello world', 'Venus');

        my $result = $replace->get;

        # "hello Venus"

- replace.1

    Use the global flag to replace all occurrences.

    **example 1**

        package main;

        use Venus::Regexp;

        my $regexp = Venus::Regexp->new(qr/o/);

        my $replace = $regexp->replace('foo bar boo', 'x', 'g');

        my $result = $replace->get;

        # "fxx bar bxx"

- search.0

    Use `captures` to get captured groups from a search.

    **example 1**

        package main;

        use Venus::Regexp;

        my $regexp = Venus::Regexp->new(qr/(\d+)-(\d+)/);

        my $search = $regexp->search('Phone: 555-1234');

        my $result = $search->captures;

        # ["555", "1234"]

- search.1

    Use `count` to check how many matches were found.

    **example 1**

        package main;

        use Venus::Regexp;

        my $regexp = Venus::Regexp->new(qr/\d+/);

        my $search = $regexp->search('a1 b2 c3');

        my $result = $search->count;

        # 1
