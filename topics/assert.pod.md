# NAME

Venus - Assert

# ABSTRACT

Assert in Venus

# SYNOPSIS

    package main;

    use Venus::Assert;

    my $assert = Venus::Assert->new('string');

    $assert->check('hello') ? 'valid' : 'invalid';

    # "valid"

# DESCRIPTION

[Venus::Assert](https://metacpan.org/pod/Venus%3A%3AAssert) provides type assertions with coercions. Create an assertion
with a type expression and use `check` to validate or `coerce` to transform.

# EXAMPLES

The following are examples of type assertions in Venus.

- assert.0

    Use `check` to validate types.

    **example 1**

        package main;

        use Venus::Assert;

        my $assert = Venus::Assert->new('number');

        $assert->check(42) ? 'valid' : 'invalid';

        # "valid"

- assert.1

    Check array types.

    **example 1**

        package main;

        use Venus::Assert;

        my $assert = Venus::Assert->new('arrayref');

        $assert->check([1, 2, 3]) ? 'valid' : 'invalid';

        # "valid"

- assert.2

    Use `maybe` for optional values.

    **example 1**

        package main;

        use Venus::Assert;

        my $assert = Venus::Assert->new('maybe[string]');

        my $valid_undef = $assert->check(undef) ? 'ok' : 'fail';

        my $valid_str = $assert->check('hello') ? 'ok' : 'fail';

        "$valid_undef-$valid_str";

        # "ok-ok"

- assert.3

    Use `either` for union types.

    **example 1**

        package main;

        use Venus::Assert;

        my $assert = Venus::Assert->new('string | number');

        my $check_str = $assert->check('hello');

        my $check_num = $assert->check(42);

        $check_str && $check_num ? 'both valid' : 'failed';

        # "both valid"
