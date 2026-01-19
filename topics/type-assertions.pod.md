# NAME

Venus - Type Assertions

# ABSTRACT

Type Assertions in Venus

# SYNOPSIS

    package main;

    use Venus::Assert;

    my $assert = Venus::Assert->new('Example');

    $assert->accept('string');

    $assert->valid('hello');

    # 1

# DESCRIPTION

[Venus::Assert](https://metacpan.org/pod/Venus%3A%3AAssert) provides type assertions with detailed error messages. Unlike
[Venus::Check](https://metacpan.org/pod/Venus%3A%3ACheck), assertions include contextual information about what was
expected and what was received when validation fails.

# EXAMPLES

The following are examples of type assertions in Venus.

- assert.0

    Use `accept` to specify accepted types, then `valid` to check.

    **example 1**

        package main;

        use Venus::Assert;

        my $assert = Venus::Assert->new('Age');

        $assert->accept('number');

        my $result = $assert->valid(25);

        # 1

- assert.1

    Use `validate` to assert and return the value, throwing on failure.

    **example 1**

        package main;

        use Venus::Assert;

        my $assert = Venus::Assert->new('Name');

        $assert->accept('string');

        my $result = $assert->validate('Alice');

        # "Alice"

- assert.2

    Use `expression` to accept complex type expressions.

    **example 1**

        package main;

        use Venus::Assert;

        my $assert = Venus::Assert->new('OptionalId');

        $assert->expression('number | undef');

        my $result = $assert->valid(undef);

        # 1

- assert.3

    Use `expression` with the pipe operator to accept multiple types.

    **example 1**

        package main;

        use Venus::Assert;

        my $assert = Venus::Assert->new('StringOrNumber');

        $assert->expression('string | number');

        my $valid_str = $assert->valid('hello');
        my $valid_num = $assert->valid(42);

        my $result = $valid_str && $valid_num;

        # 1
