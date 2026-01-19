# NAME

Venus - Booleans

# ABSTRACT

Boolean Values in Venus

# SYNOPSIS

    package main;

    use Venus;

    my $result = true && !false;

    # 1

# DESCRIPTION

Venus provides boolean values through [Venus::Boolean](https://metacpan.org/pod/Venus%3A%3ABoolean), [Venus::True](https://metacpan.org/pod/Venus%3A%3ATrue), and
[Venus::False](https://metacpan.org/pod/Venus%3A%3AFalse) classes, plus the convenient `true` and `false` keyword
functions exported from [Venus](https://metacpan.org/pod/Venus).

# EXAMPLES

The following are examples of boolean operations using Venus.

- boolean.0

    Use [Venus::Boolean](https://metacpan.org/pod/Venus%3A%3ABoolean) to create a boolean from any value.

    **example 1**

        package main;

        use Venus::Boolean;

        my $bool = Venus::Boolean->new('yes');

        my $result = $bool->is_true;

        # 1

- boolean.1

    Use [Venus::True](https://metacpan.org/pod/Venus%3A%3ATrue) for explicit true values.

    **example 1**

        package main;

        use Venus::True;

        my $bool = Venus::True->new;

        my $result = $bool && 'works';

        # "works"

- boolean.2

    Use [Venus::False](https://metacpan.org/pod/Venus%3A%3AFalse) for explicit false values.

    **example 1**

        package main;

        use Venus::False;

        my $bool = Venus::False->new;

        my $result = $bool || 'default';

        # "default"

- boolean.3

    Use `negate` to flip a boolean value.

    **example 1**

        package main;

        use Venus::Boolean;

        my $bool = Venus::Boolean->new(0);

        my $result = $bool->negate;

        # 1

- false.0

    Use `false` from Venus as a boolean false value.

    **example 1**

        package main;

        use Venus;

        my $value = false;

        my $result = $value ? 'yes' : 'no';

        # "no"

- true.0

    Use `true` from Venus as a boolean true value.

    **example 1**

        package main;

        use Venus;

        my $value = true;

        my $result = $value ? 'yes' : 'no';

        # "yes"
