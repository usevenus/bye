# NAME

Venus - Match

# ABSTRACT

Match in Venus

# SYNOPSIS

    package main;

    use Venus::Match;

    my $match = Venus::Match->new('hello');

    $match->just('hello')->then('greeting');

    $match->none('unknown');

    $match->result;

    # "greeting"

# DESCRIPTION

[Venus::Match](https://metacpan.org/pod/Venus%3A%3AMatch) provides pattern matching with `just`/`then` clauses.
Match values or use callbacks for complex conditions.

# EXAMPLES

The following are examples of pattern matching in Venus.

- match.0

    Use `just` and `then` for exact matches.

    **example 1**

        package main;

        use Venus::Match;

        my $match = Venus::Match->new('red');

        $match->just('red')->then('stop');

        $match->just('green')->then('go');

        $match->none('wait');

        $match->result;

        # "stop"

- match.1

    Use `none` for default values.

    **example 1**

        package main;

        use Venus::Match;

        my $match = Venus::Match->new('yellow');

        $match->just('red')->then('stop');

        $match->just('green')->then('go');

        $match->none('caution');

        $match->result;

        # "caution"

- match.2

    Use callbacks for dynamic results.

    **example 1**

        package main;

        use Venus::Match;

        my $match = Venus::Match->new(10);

        $match->when(sub { $_[0] > 5 })->then('big');

        $match->none('small');

        $match->result;

        # "big"

- match.3

    Use `then` with callbacks for computed values.

    **example 1**

        package main;

        use Venus::Match;

        my $match = Venus::Match->new(5);

        $match->just(5)->then(sub { $_[0] * 2 });

        $match->none(0);

        $match->result;

        # 10
