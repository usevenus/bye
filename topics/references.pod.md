# NAME

Venus - References

# ABSTRACT

Reference Types in Venus

# SYNOPSIS

    package main;

    use Venus::Code;

    my $code = Venus::Code->new(sub { $_[0] * 2 });

    $code->call(5);

    # 10

# DESCRIPTION

Venus provides wrapper classes for Perl's reference types: [Venus::Scalar](https://metacpan.org/pod/Venus%3A%3AScalar) for
scalar references and [Venus::Code](https://metacpan.org/pod/Venus%3A%3ACode) for code references (subroutines).

# EXAMPLES

The following are examples of reference types in Venus.

- code.0

    Use [Venus::Code](https://metacpan.org/pod/Venus%3A%3ACode) to wrap a code reference and call it.

    **example 1**

        package main;

        use Venus::Code;

        my $code = Venus::Code->new(sub { shift() + 10 });

        my $result = $code->call(5);

        # 15

- code.1

    Use `curry` to create a new coderef with pre-applied arguments.

    **example 1**

        package main;

        use Venus::Code;

        my $add = Venus::Code->new(sub { $_[0] + $_[1] });

        my $add5 = $add->curry(5);

        my $result = $add5->(3);

        # 8

- code.2

    Use `compose` to chain multiple coderefs together.

    **example 1**

        package main;

        use Venus::Code;

        my $double = Venus::Code->new(sub { $_[0] * 2 });

        my $add1 = sub { $_[0] + 1 };

        my $composed = $double->compose($add1);

        my $result = $composed->(5);

        # 11 (5 * 2 + 1)

- code.3

    Use `rcurry` to create a coderef with arguments appended (right curry).

    **example 1**

        package main;

        use Venus::Code;

        my $greet = Venus::Code->new(sub { "$_[0], $_[1]!" });

        my $hello = $greet->rcurry('World');

        my $result = $hello->('Hello');

        # "Hello, World!"

- scalar.0

    Use [Venus::Scalar](https://metacpan.org/pod/Venus%3A%3AScalar) to wrap a scalar reference.

    **example 1**

        package main;

        use Venus::Scalar;

        my $scalar = Venus::Scalar->new(\my $value);

        ${ $scalar->get } = 'hello';

        my $result = ${ $scalar->get };

        # "hello"
