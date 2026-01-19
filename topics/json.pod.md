# NAME

Venus - JSON

# ABSTRACT

JSON in Venus

# SYNOPSIS

    package main;

    use Venus::Json;

    my $json = Venus::Json->new(value => { name => 'Alice' });

    my $encoded = $json->encode;

    $encoded =~ /Alice/ ? 'has name' : 'no name';

    # "has name"

# DESCRIPTION

[Venus::Json](https://metacpan.org/pod/Venus%3A%3AJson) provides JSON encoding and decoding. Pass data to `value` and
call `encode` to serialize. Call `decode` with a JSON string to deserialize.

# EXAMPLES

The following are examples of JSON handling in Venus.

- json.0

    Use `encode` to convert data to JSON.

    **example 1**

        package main;

        use Venus::Json;

        my $json = Venus::Json->new(value => { count => 42 });

        my $encoded = $json->encode;

        $encoded =~ /"count"/ ? 'valid' : 'invalid';

        # "valid"

- json.1

    Use `decode` to parse JSON strings.

    **example 1**

        package main;

        use Venus::Json;

        my $json = Venus::Json->new;

        my $decoded = $json->decode('{"city":"NYC","zip":10001}');

        $decoded->{city};

        # "NYC"

- json.2

    Encode arrays to JSON.

    **example 1**

        package main;

        use Venus::Json;

        my $json = Venus::Json->new(value => [1, 2, 3]);

        my $encoded = $json->encode;

        $encoded =~ /\[/ ? 'is array' : 'not array';

        # "is array"

- json.3

    Round-trip encoding and decoding.

    **example 1**

        package main;

        use Venus::Json;

        my $data = { items => ['a', 'b', 'c'], total => 3 };

        my $encoder = Venus::Json->new(value => $data);

        my $encoded = $encoder->encode;

        my $decoder = Venus::Json->new;

        my $decoded = $decoder->decode($encoded);

        $decoded->{total};

        # 3
