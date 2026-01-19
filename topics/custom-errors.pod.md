# NAME

Venus - Custom Errors

# ABSTRACT

Custom Errors in Venus

# SYNOPSIS

    package MyApp::Error;

    use Venus::Class;

    base 'Venus::Error';

    attr 'code';

    package main;

    my $error = MyApp::Error->new(
      message => 'Something failed',
      code => 500
    );

    $error->code;

    # 500

# DESCRIPTION

Venus allows creating custom error classes by extending [Venus::Error](https://metacpan.org/pod/Venus%3A%3AError). Custom
errors can have additional attributes and specialized behavior for different
error types.

# EXAMPLES

The following are examples of custom errors in Venus.

- custom.0

    Extend `Venus::Error` to create custom error types.

    **example 1**

        package NotFoundError;

        use Venus::Class;

        base 'Venus::Error';

        attr 'resource';

        package main;

        my $error = NotFoundError->new(
          message => 'Resource not found',
          resource => 'user'
        );

        my $result = $error->resource;

        # "user"

- custom.1

    Create error hierarchies with multiple custom types.

    **example 1**

        package ValidationError;

        use Venus::Class;

        base 'Venus::Error';

        attr 'field';

        package AuthError;

        use Venus::Class;

        base 'Venus::Error';

        attr 'realm';

        package main;

        my $val_error = ValidationError->new(
          message => 'Invalid email',
          field => 'email'
        );

        my $auth_error = AuthError->new(
          message => 'Access denied',
          realm => 'admin'
        );

        my $result = $val_error->isa('Venus::Error')
          && $auth_error->isa('Venus::Error');

        # 1

- custom.2

    Add helper methods to custom errors.

    **example 1**

        package HttpError;

        use Venus::Class;

        base 'Venus::Error';

        attr 'status';

        sub is_client_error {
          my ($self) = @_;
          my $status = $self->status // 0;
          return $status >= 400 && $status < 500;
        }

        package main;

        my $error = HttpError->new(
          message => 'Not Found',
          status => 404
        );

        my $result = $error->is_client_error ? 'client' : 'server';

        # "client"
