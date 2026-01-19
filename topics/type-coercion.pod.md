# NAME

Venus - Type Coercion

# ABSTRACT

Type Coercion in Venus

# SYNOPSIS

    package main;

    use Venus::Coercion;

    my $coercion = Venus::Coercion->new;

    $coercion->accept('string');

    $coercion->format(sub { uc $_ });

    $coercion->result('hello');

    # "HELLO"

# DESCRIPTION

[Venus::Coercion](https://metacpan.org/pod/Venus%3A%3ACoercion) transforms values from one form to another. It accepts type
constraints and applies formatters to coerce values into the desired shape.

# EXAMPLES

The following are examples of type coercion in Venus.

- coercion.0

    Use `accept` and `format` to define a coercion.

    **example 1**

        package main;

        use Venus::Coercion;

        my $coercion = Venus::Coercion->new;

        $coercion->accept('number');

        $coercion->format(sub { $_ * 2 });

        my $result = $coercion->result(5);

        # 10

- coercion.1

    Chain multiple formatters for complex transformations.

    **example 1**

        package main;

        use Venus::Coercion;

        my $coercion = Venus::Coercion->new;

        $coercion->accept('string');

        $coercion->format(sub { $_ . '!' });

        $coercion->format(sub { uc $_ });

        my $result = $coercion->result('hello');

        # "HELLO!"

- coercion.2

    Use `Venus::Type` to create coercions from type expressions.

    **example 1**

        package main;

        use Venus::Type;

        my $type = Venus::Type->new;

        my $coercion = $type->coercion('arrayref');

        $coercion->format(sub { scalar @{$_} });

        my $result = $coercion->result([1, 2, 3]);

        # 3
