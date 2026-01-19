# NAME

Venus - Date Time

# ABSTRACT

Date Time in Venus

# SYNOPSIS

    package main;

    use Venus::Date;

    my $date = Venus::Date->new(0);

    $date->format('%Y-%m-%d');

    # "1970-01-01"

# DESCRIPTION

[Venus::Date](https://metacpan.org/pod/Venus%3A%3ADate) provides date and time manipulation. Use `format` for custom
formatting, `add_*` and `sub_*` for arithmetic, and `iso8601` for standard
formats.

# EXAMPLES

The following are examples of date and time operations in Venus.

- date.0

    Use `format` to customize date output.

    **example 1**

        package main;

        use Venus::Date;

        my $date = Venus::Date->new(0);

        $date->format('%H:%M:%S');

        # "00:00:00"

- date.1

    Use `add_days` to add days to a date.

    **example 1**

        package main;

        use Venus::Date;

        my $date = Venus::Date->new(0);

        $date->add_days(1);

        $date->format('%Y-%m-%d');

        # "1970-01-02"

- date.2

    Use `epoch` to get the Unix timestamp.

    **example 1**

        package main;

        use Venus::Date;

        my $date = Venus::Date->new(86400);

        $date->epoch;

        # 86400

- date.3

    Use `iso8601` for ISO 8601 formatted dates.

    **example 1**

        package main;

        use Venus::Date;

        my $date = Venus::Date->new(0);

        my $iso = $date->iso8601;

        $iso =~ /1970-01-01/ ? 'valid iso' : 'invalid iso';

        # "valid iso"
