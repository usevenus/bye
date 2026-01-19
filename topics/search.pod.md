# NAME

Venus - Search

# ABSTRACT

Search in Venus

# SYNOPSIS

    package main;

    use Venus::Search;

    my $search = Venus::Search->new(
      string => 'hello world',
      regexp => 'world'
    );

    $search->evaluate;

    $search->matched ? 'found' : 'not found';

    # "found"

# DESCRIPTION

[Venus::Search](https://metacpan.org/pod/Venus%3A%3ASearch) provides regex-based string searching. Set `string` and
`regexp` attributes, then call `evaluate` to find matches.

# EXAMPLES

The following are examples of string searching in Venus.

- search.0

    Check if a pattern matches.

    **example 1**

        package main;

        use Venus::Search;

        my $search = Venus::Search->new(
          string => 'hello world',
          regexp => 'hello'
        );

        $search->evaluate;

        $search->matched ? 'found' : 'not found';

        # "found"

- search.1

    Get captured groups.

    **example 1**

        package main;

        use Venus::Search;

        my $search = Venus::Search->new(
          string => 'hello world',
          regexp => '(\\w+) (\\w+)'
        );

        $search->evaluate;

        my $captures = $search->captures;

        $captures->[0];

        # "hello"

- search.2

    Use `count` to get the number of matches.

    **example 1**

        package main;

        use Venus::Search;

        my $search = Venus::Search->new(
          string => 'aaa bbb aaa',
          regexp => 'aaa',
          flags => 'g'
        );

        $search->evaluate;

        $search->count;

        # 1

- search.3

    Case-insensitive matching.

    **example 1**

        package main;

        use Venus::Search;

        my $search = Venus::Search->new(
          string => 'HELLO world',
          regexp => 'hello',
          flags => 'i'
        );

        $search->evaluate;

        $search->matched ? 'found' : 'not found';

        # "found"
