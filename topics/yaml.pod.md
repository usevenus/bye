# NAME

Venus - YAML

# ABSTRACT

YAML in Venus

# SYNOPSIS

    package main;

    use Venus::Yaml;

    my $yaml = Venus::Yaml->new(value => { name => 'Alice' });

    my $encoded = $yaml->encode;

    $encoded =~ /name: Alice/ ? 'valid' : 'invalid';

    # "valid"

# DESCRIPTION

[Venus::Yaml](https://metacpan.org/pod/Venus%3A%3AYaml) provides YAML encoding and decoding. Pass data to `value` and
call `encode` to serialize. Call `decode` with a YAML string to deserialize.

# EXAMPLES

The following are examples of YAML handling in Venus.

- yaml.0

    Use `encode` to convert data to YAML.

    **example 1**

        package main;

        use Venus::Yaml;

        my $yaml = Venus::Yaml->new(value => { host => 'localhost', port => 8080 });

        my $encoded = $yaml->encode;

        $encoded =~ /host: localhost/ ? 'valid' : 'invalid';

        # "valid"

- yaml.1

    Use `decode` to parse YAML strings.

    **example 1**

        package main;

        use Venus::Yaml;

        my $yaml = Venus::Yaml->new;

        my $decoded = $yaml->decode("---\ncity: NYC\nzip: 10001\n");

        $decoded->{city};

        # "NYC"

- yaml.2

    Encode nested structures to YAML.

    **example 1**

        package main;

        use Venus::Yaml;

        my $yaml = Venus::Yaml->new(value => {
          database => { host => 'db.local', port => 5432 }
        });

        my $encoded = $yaml->encode;

        $encoded =~ /database:/ ? 'has nested' : 'no nested';

        # "has nested"

- yaml.3

    Round-trip encoding and decoding.

    **example 1**

        package main;

        use Venus::Yaml;

        my $data = { items => ['x', 'y', 'z'], count => 3 };

        my $encoder = Venus::Yaml->new(value => $data);

        my $encoded = $encoder->encode;

        my $decoder = Venus::Yaml->new;

        my $decoded = $decoder->decode($encoded);

        $decoded->{count};

        # 3
