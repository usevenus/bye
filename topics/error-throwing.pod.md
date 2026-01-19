# NAME

Venus - Error Throwing

# ABSTRACT

Error Throwing in Venus

# SYNOPSIS

    package main;

    use Venus::Throw;

    my $throw = Venus::Throw->new(package => 'Example');

    $throw->message('Something went wrong');

    # bless(..., "Venus::Throw")

    # $throw->error; # would die with Venus::Error

# DESCRIPTION

[Venus::Throw](https://metacpan.org/pod/Venus%3A%3AThrow) provides a mechanism for throwing structured exceptions.
[Venus::Role::Throwable](https://metacpan.org/pod/Venus%3A%3ARole%3A%3AThrowable) adds throwing capabilities to classes via the
`throw` method.

# EXAMPLES

The following are examples of error throwing in Venus.

- throw.0

    Use `Venus::Throw` to create and throw errors.

    **example 1**

        package main;

        use Venus::Throw;

        my $throw = Venus::Throw->new;

        $throw->message('File not found');

        my $result = $throw->message;

        # "File not found"

- throw.1

    Use `name` to categorize errors.

    **example 1**

        package main;

        use Venus::Throw;

        my $throw = Venus::Throw->new;

        $throw->name('on.validation.error');

        $throw->message('Invalid data');

        my $result = $throw->name;

        # "on.validation.error"

- throwable.0

    Use `Venus::Role::Throwable` to add `throw` to classes.

    **example 1**

        package Account;

        use Venus::Class;

        with 'Venus::Role::Throwable';

        sub withdraw {
          my ($self, $amount) = @_;
          $self->throw->message('Insufficient funds')->error if $amount > 100;
          return $amount;
        }

        package main;

        use Venus::Try;

        my $account = Account->new;

        my $try = Venus::Try->new;

        $try->call(sub { $account->withdraw(200) });

        $try->default(sub { 'caught' });

        my $result = $try->result;

        # "caught"

- throwable.1

    Use `stash` to attach context to thrown errors.

    **example 1**

        package main;

        use Venus::Throw;

        my $throw = Venus::Throw->new;

        $throw->message('Request failed');

        $throw->stash(code => 500);

        $throw->stash(endpoint => '/api/users');

        my $result = $throw->stash('code');

        # 500
