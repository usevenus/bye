# NAME

Venus - Data Validation

# ABSTRACT

Data Validation in Venus

# SYNOPSIS

    package main;

    use Venus::Validate;

    my $validate = Venus::Validate->new(input => { name => 'Alice' });

    $validate->required('name')->string;

    my $errors = $validate->errors;

    scalar @$errors == 0;

    # 1 (no errors)

# DESCRIPTION

Venus provides [Venus::Validate](https://metacpan.org/pod/Venus%3A%3AValidate) for validating data structures and
[Venus::Schema](https://metacpan.org/pod/Venus%3A%3ASchema) for defining reusable validation schemas.

# EXAMPLES

The following are examples of data validation in Venus.

- schema.0

    Use `Venus::Schema` to define reusable validation rules.

    **example 1**

        package main;

        use Venus::Schema;

        my $schema = Venus::Schema->new;

        $schema->rule({
          selector => 'name',
          presence => 'required',
          executes => [['string']]
        });

        $schema->rule({
          selector => 'age',
          presence => 'required',
          executes => [['number']]
        });

        my $errors = $schema->validate({ name => 'Alice', age => 30 });

        my $result = scalar @$errors == 0 ? 'valid' : 'invalid';

        # "valid"

- schema.1

    Schema validation returns errors for invalid data.

    **example 1**

        package main;

        use Venus::Schema;

        my $schema = Venus::Schema->new;

        $schema->rule({
          selector => 'count',
          presence => 'required',
          executes => [['number']]
        });

        my $errors = $schema->validate({ count => 'not a number' });

        my $result = scalar @$errors > 0 ? 'has errors' : 'no errors';

        # "has errors"

- validate.0

    Use `Venus::Validate` to validate input data.

    **example 1**

        package main;

        use Venus::Validate;

        my $validate = Venus::Validate->new(input => { age => 25 });

        $validate->required('age')->number;

        my $errors = $validate->errors;

        my $result = scalar @$errors == 0 ? 'valid' : 'invalid';

        # "valid"

- validate.1

    Use `optional` for fields that may be absent.

    **example 1**

        package main;

        use Venus::Validate;

        my $validate = Venus::Validate->new(input => { name => 'Bob' });

        $validate->required('name')->string;
        $validate->optional('email')->string;

        my $errors = $validate->errors;

        my $result = scalar @$errors == 0 ? 'valid' : 'invalid';

        # "valid" (email is optional)
