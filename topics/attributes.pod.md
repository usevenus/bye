# NAME

Venus - Attributes

# ABSTRACT

Object Attributes in Venus

# SYNOPSIS

    package User;

    use Venus::Class;

    attr 'name';
    attr 'email';

    package main;

    my $user = User->new(name => 'Alice');

    $user->email('alice@example.com');

    $user->email;

    # "alice@example.com"

# DESCRIPTION

Venus provides the `attr` function for declaring attributes. Each attribute
gets an accessor method that works as both a getter and setter.

# EXAMPLES

The following are examples of attributes in Venus.

- attr.0

    Use `attr` to declare attributes with auto-generated accessors.

    **example 1**

        package Config;

        use Venus::Class;

        attr 'host';
        attr 'port';

        package main;

        my $config = Config->new(host => 'localhost', port => 8080);

        my $result = $config->host . ':' . $config->port;

        # "localhost:8080"

- attr.1

    Accessors act as both getters and setters.

    **example 1**

        package Toggle;

        use Venus::Class;

        attr 'state';

        package main;

        my $toggle = Toggle->new;

        $toggle->state('on');

        my $result = $toggle->state;

        # "on"

- attr.2

    Setters return the assigned value.

    **example 1**

        package Box;

        use Venus::Class;

        attr 'width';
        attr 'height';

        package main;

        my $box = Box->new(width => 10, height => 20);

        my $result = $box->width * $box->height;

        # 200

- mask.0

    Use `mask` to declare private attributes accessible only within the class.

    **example 1**

        package Secret;

        use Venus::Class;

        attr 'name';
        mask 'password';

        sub BUILD {
          my ($self, $args) = @_;
          $self->password($args->{password}) if exists $args->{password};
        }

        sub authenticate {
          my ($self, $input) = @_;
          return $self->password eq $input ? 'granted' : 'denied';
        }

        package main;

        my $secret = Secret->new(name => 'admin', password => 's3cr3t');

        my $result = $secret->authenticate('s3cr3t');

        # "granted"

- mask.1

    Masked attributes are not visible via introspection.

    **example 1**

        package Credentials;

        use Venus::Class;

        attr 'username';
        mask 'token';

        package main;

        use Venus::Meta;

        my $meta = Venus::Meta->new(name => 'Credentials');

        my $result = join ', ', sort @{$meta->attrs};

        # "username" (token is not listed)

    **example 2**

        package Credentials;

        use Venus::Class;

        attr 'username';
        mask 'token';

        package main;

        use Venus::Meta;

        my $meta = Venus::Meta->new(name => 'Credentials');

        my $result = join ', ', sort @{$meta->masks};

        # "token" (username is not listed)
