# NAME

Venus - Type Checking

# ABSTRACT

Type Checking in Venus

# SYNOPSIS

    package main;

    use Venus::Check;

    my $check = Venus::Check->new;

    $check->string;

    $check->eval('hello');

    # 1

# DESCRIPTION

Venus provides [Venus::Check](https://metacpan.org/pod/Venus%3A%3ACheck) for type validation and [Venus::Type](https://metacpan.org/pod/Venus%3A%3AType) for
parsing type expressions. These tools help ensure data conforms to expected
types.

# EXAMPLES

The following are examples of type checking in Venus.

- check.0

    Use `Venus::Check` to validate values against types.

    **example 1**

        package main;

        use Venus::Check;

        my $check = Venus::Check->new;

        $check->number;

        my $result = $check->eval(42);

        # 1

- check.1

    Use `maybe` to allow a type or undef.

    **example 1**

        package main;

        use Venus::Check;

        my $check = Venus::Check->new;

        $check->maybe('string');

        my $result = $check->eval(undef);

        # 1

- check.2

    Use `either` to allow multiple types.

    **example 1**

        package main;

        use Venus::Check;

        my $check = Venus::Check->new;

        $check->either('string', 'number');

        my $result = $check->eval(42);

        # 1

- check.3

    Use `result` to validate and return the value, or throw on failure.

    **example 1**

        package main;

        use Venus::Check;

        my $check = Venus::Check->new;

        $check->arrayref;

        my $result = $check->result([1, 2, 3]);

        # [1, 2, 3]

- type.0

    Use `Venus::Type` to create checks from type expressions.

    **example 1**

        package main;

        use Venus::Type;

        my $type = Venus::Type->new;

        my $check = $type->check('string | number');

        my $result = $check->eval('hello');

        # 1

- type.1

    Use `within` to check array contents.

    **example 1**

        package main;

        use Venus::Check;

        my $check = Venus::Check->new;

        $check->within('arrayref', 'string');

        my $result = $check->eval(['a', 'b', 'c']);

        # 1
