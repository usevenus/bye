# NAME

Venus - Schema

# ABSTRACT

Schema in Venus

# SYNOPSIS

    package main;

    use Venus::Schema;

    my $schema = Venus::Schema->new({
      name => 'string',
      age => 'number'
    });

    my $data = { name => 'Alice', age => 30 };

    my $errors = $schema->validate($data);

    @$errors ? 'invalid' : 'valid';

    # "valid"

# DESCRIPTION

[Venus::Schema](https://metacpan.org/pod/Venus%3A%3ASchema) provides data validation against a schema definition.
Define expected types and use `validate` to check data. Returns an empty
array on success or an array of errors on failure.

# EXAMPLES

The following are examples of schema validation in Venus.

- schema.0

    Validate string types.

    **example 1**

        package main;

        use Venus::Schema;

        my $schema = Venus::Schema->new({
          name => 'string'
        });

        my $errors = $schema->validate({ name => 'Bob' });

        @$errors ? 'invalid' : 'valid';

        # "valid"

- schema.1

    Validate number types.

    **example 1**

        package main;

        use Venus::Schema;

        my $schema = Venus::Schema->new({
          count => 'number'
        });

        my $errors = $schema->validate({ count => 42 });

        @$errors ? 'invalid' : 'valid';

        # "valid"

- schema.2

    Validate nested structures.

    **example 1**

        package main;

        use Venus::Schema;

        my $schema = Venus::Schema->new({
          user => {
            name => 'string',
            age => 'number'
          }
        });

        my $errors = $schema->validate({ user => { name => 'Alice', age => 30 } });

        @$errors ? 'invalid' : 'valid';

        # "valid"

- schema.3

    Validate arrays with schema.

    **example 1**

        package main;

        use Venus::Schema;

        my $schema = Venus::Schema->new({
          items => 'arrayref'
        });

        my $errors = $schema->validate({ items => [1, 2, 3] });

        @$errors ? 'invalid' : 'valid';

        # "valid"
