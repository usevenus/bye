# NAME

Venus - Date Formatting

# ABSTRACT

Date Formatting in Venus

# SYNOPSIS

    package main;

    use Venus::Date;

    my $date = Venus::Date->new(0);

    $date->rfc822;

    # "Thu, 01 Jan 1970 00:00:00 +0000"

# DESCRIPTION

[Venus::Date](https://metacpan.org/pod/Venus%3A%3ADate) provides multiple formatting methods including `rfc822`,
`rfc3339`, `iso8601`, and custom `format` strings.

# EXAMPLES

The following are examples of date formatting in Venus.

- fmt.0

    Use `hms` to get hours, minutes, seconds.

    **example 1**

        package main;

        use Venus::Date;

        my $date = Venus::Date->new(3661);

        $date->hms;

        # "01:01:01"

- fmt.1

    Use `mdy` to get month, day, year.

    **example 1**

        package main;

        use Venus::Date;

        my $date = Venus::Date->new(0);

        $date->mdy;

        # "01-01-1970"

- fmt.2

    Use `rfc3339` for RFC 3339 format.

    **example 1**

        package main;

        use Venus::Date;

        my $date = Venus::Date->new(0);

        my $rfc = $date->rfc3339;

        $rfc =~ /1970-01-01/ ? 'valid' : 'invalid';

        # "valid"

- fmt.3

    Use `string` for ISO 8601 string format.

    **example 1**

        package main;

        use Venus::Date;

        my $date = Venus::Date->new(0);

        my $str = $date->string;

        $str =~ /1970-01-01/ ? 'valid' : 'invalid';

        # "valid"
