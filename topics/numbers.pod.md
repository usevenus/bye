# NAME

Venus - Numbers

# ABSTRACT

Numeric Operations in Venus

# SYNOPSIS

    package main;

    use Venus::Number;

    my $number = Venus::Number->new(10);

    $number->add(5);

    # 15

# DESCRIPTION

[Venus::Number](https://metacpan.org/pod/Venus%3A%3ANumber) and [Venus::Float](https://metacpan.org/pod/Venus%3A%3AFloat) provide methods for numeric operations.
Numbers auto-numify, so they work seamlessly with Perl's built-in operators.

# EXAMPLES

The following are examples of numeric operations using Venus.

- float.0

    Use [Venus::Float](https://metacpan.org/pod/Venus%3A%3AFloat) for decimal number operations.

    **example 1**

        package main;

        use Venus::Float;

        my $float = Venus::Float->new(3.14159);

        my $result = $float->multi(2);

        # 6.28318

- number.0

    Use `add`, `sub`, and `multi` for basic arithmetic.

    **example 1**

        package main;

        use Venus::Number;

        my $number = Venus::Number->new(10);

        my $result = $number->multi(3);

        # 30

- number.1

    Use `gt`, `lt`, and `eq` for comparisons.

    **example 1**

        package main;

        use Venus::Number;

        my $number = Venus::Number->new(10);

        my $result = $number->gt(5);

        # 1

- number.2

    Use `abs`, `sqrt`, and `pow` for math operations.

    **example 1**

        package main;

        use Venus::Number;

        my $number = Venus::Number->new(16);

        my $result = $number->sqrt;

        # 4
