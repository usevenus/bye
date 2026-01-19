# NAME

Venus - Try Catch

# ABSTRACT

Exception Handling in Venus

# SYNOPSIS

    package main;

    use Venus::Try;

    my $try = Venus::Try->new;

    $try->call(sub { die 'Oops!' });

    $try->catch('Venus::Error', sub { 'caught' });

    $try->default(sub { 'default' });

    $try->result;

    # "default"

# DESCRIPTION

Venus provides [Venus::Try](https://metacpan.org/pod/Venus%3A%3ATry) for exception handling, [Venus::Role::Tryable](https://metacpan.org/pod/Venus%3A%3ARole%3A%3ATryable)
for adding `try` to classes, and [Venus::Role::Catchable](https://metacpan.org/pod/Venus%3A%3ARole%3A%3ACatchable) for `catch` and
`maybe` methods.

# EXAMPLES

The following are examples of exception handling in Venus.

- catchable.0

    Use `maybe` from `Venus::Role::Catchable` to return undef on failure.

    **example 1**

        package Parser;

        use Venus::Class;

        with 'Venus::Role::Tryable';
        with 'Venus::Role::Catchable';

        sub parse {
          my ($self, $input) = @_;
          die 'Invalid input' unless defined $input;
          return "parsed: $input";
        }

        package main;

        my $parser = Parser->new;

        my $result = $parser->maybe('parse', undef) // 'failed';

        # "failed"

- catchable.1

    Use `catch` from `Venus::Role::Catchable` to get the error object.

    **example 1**

        package Validator;

        use Venus::Class;

        with 'Venus::Role::Tryable';
        with 'Venus::Role::Catchable';

        sub validate {
          my ($self, $value) = @_;
          die 'Empty value' unless $value;
          return $value;
        }

        package main;

        my $validator = Validator->new;

        my $error = $validator->catch('validate', '');

        my $result = defined $error ? 'has error' : 'no error';

        # "has error"

- try.0

    Use `Venus::Try` to wrap code that might fail.

    **example 1**

        package main;

        use Venus::Try;

        my $try = Venus::Try->new;

        $try->call(sub { 10 / 2 });

        my $result = $try->result;

        # 5

- try.1

    Use `default` to handle any exception.

    **example 1**

        package main;

        use Venus::Try;

        my $try = Venus::Try->new;

        $try->call(sub { die 'Error!' });

        $try->default(sub { 'recovered' });

        my $result = $try->result;

        # "recovered"

- tryable.0

    Use `Venus::Role::Tryable` to add `try` to your classes.

    **example 1**

        package Calculator;

        use Venus::Class;

        with 'Venus::Role::Tryable';

        sub divide {
          my ($self, $a, $b) = @_;
          die 'Division by zero' if $b == 0;
          return $a / $b;
        }

        package main;

        my $calc = Calculator->new;

        my $result = $calc->try('divide', 10, 2)->result;

        # 5
