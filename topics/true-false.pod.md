# NAME

Venus - True False

# ABSTRACT

True False in Venus

# SYNOPSIS

    package main;

    use Venus::True;
    use Venus::False;

    my $true = Venus::True->new;

    my $false = Venus::False->new;

    $true ? 'yes' : 'no';

    # "yes"

# DESCRIPTION

[Venus::True](https://metacpan.org/pod/Venus%3A%3ATrue) and [Venus::False](https://metacpan.org/pod/Venus%3A%3AFalse) provide boolean singleton values for
representing true and false in Venus.

# EXAMPLES

The following are examples of boolean values in Venus.

- bool.0

    Use Venus::True for true values.

    **example 1**

        package main;

        use Venus::True;

        my $true = Venus::True->new;

        $true ? 'truthy' : 'falsy';

        # "truthy"

- bool.1

    Use Venus::False for false values.

    **example 1**

        package main;

        use Venus::False;

        my $false = Venus::False->new;

        $false ? 'truthy' : 'falsy';

        # "falsy"

- bool.2

    Compare boolean values.

    **example 1**

        package main;

        use Venus::True;
        use Venus::False;

        my $true = Venus::True->new;

        my $false = Venus::False->new;

        $true && !$false ? 'logic works' : 'logic broken';

        # "logic works"

- bool.3

    Use boolean in conditionals.

    **example 1**

        package main;

        use Venus::True;

        my $enabled = Venus::True->new;

        my $status = $enabled ? 'on' : 'off';

        $status;

        # "on"
