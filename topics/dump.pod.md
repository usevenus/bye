# NAME

Venus - Dump

# ABSTRACT

Dump in Venus

# SYNOPSIS

    package main;

    use Venus::Dump;

    my $dump = Venus::Dump->new({ name => 'Alice', age => 30 });

    my $encoded = $dump->encode;

    $encoded =~ /name/ ? 'valid' : 'invalid';

    # "valid"

# DESCRIPTION

[Venus::Dump](https://metacpan.org/pod/Venus%3A%3ADump) provides Perl data serialization using Data::Dumper style
format. Use `encode` to serialize and `decode` to deserialize.

# EXAMPLES

The following are examples of data dumping in Venus.

- dump.0

    Use `encode` to serialize Perl data.

    **example 1**

        package main;

        use Venus::Dump;

        my $dump = Venus::Dump->new([1, 2, 3]);

        my $encoded = $dump->encode;

        $encoded =~ /1/ ? 'has data' : 'empty';

        # "has data"

- dump.1

    Use `decode` to deserialize dumped data.

    **example 1**

        package main;

        use Venus::Dump;

        my $dump = Venus::Dump->new;

        my $decoded = $dump->decode("{foo => 'bar'}");

        $decoded->{foo};

        # "bar"

- dump.2

    Encode nested data structures.

    **example 1**

        package main;

        use Venus::Dump;

        my $dump = Venus::Dump->new({
          user => { name => 'Bob', scores => [10, 20] }
        });

        my $encoded = $dump->encode;

        $encoded =~ /scores/ ? 'has nested' : 'flat';

        # "has nested"

- dump.3

    Round-trip encoding and decoding.

    **example 1**

        package main;

        use Venus::Dump;

        my $data = { x => 1, y => 2 };

        my $encoder = Venus::Dump->new($data);

        my $encoded = $encoder->encode;

        my $decoder = Venus::Dump->new;

        my $decoded = $decoder->decode($encoded);

        $decoded->{x} + $decoded->{y};

        # 3
