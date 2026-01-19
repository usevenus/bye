# NAME

Venus - Replace

# ABSTRACT

Replace in Venus

# SYNOPSIS

    package main;

    use Venus::Replace;

    my $replace = Venus::Replace->new(
      string => 'hello world',
      regexp => 'world',
      substr => 'Venus'
    );

    $replace->do('evaluate')->get;

    # "hello Venus"

# DESCRIPTION

[Venus::Replace](https://metacpan.org/pod/Venus%3A%3AReplace) provides regex-based string replacement. Set `string`,
`regexp`, and `substr` attributes, then call `evaluate` to perform the
replacement.

# EXAMPLES

The following are examples of string replacement in Venus.

- rep.0

    Basic string replacement.

    **example 1**

        package main;

        use Venus::Replace;

        my $replace = Venus::Replace->new(
          string => 'foo bar foo',
          regexp => 'foo',
          substr => 'baz'
        );

        $replace->do('evaluate')->get;

        # "baz bar foo"

- rep.1

    Global replacement with `flags`.

    **example 1**

        package main;

        use Venus::Replace;

        my $replace = Venus::Replace->new(
          string => 'foo bar foo',
          regexp => 'foo',
          substr => 'baz',
          flags => 'g'
        );

        $replace->do('evaluate')->get;

        # "baz bar baz"

- rep.2

    Case-insensitive replacement.

    **example 1**

        package main;

        use Venus::Replace;

        my $replace = Venus::Replace->new(
          string => 'Hello HELLO hello',
          regexp => 'hello',
          substr => 'hi',
          flags => 'gi'
        );

        $replace->do('evaluate')->get;

        # "hi hi hi"

- rep.3

    Use `count` to get the number of replacements.

    **example 1**

        package main;

        use Venus::Replace;

        my $replace = Venus::Replace->new(
          string => 'aaa',
          regexp => 'a',
          substr => 'b',
          flags => 'g'
        );

        $replace->evaluate;

        $replace->count;

        # 3
