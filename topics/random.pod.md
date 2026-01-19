# NAME

Venus - Random

# ABSTRACT

Random in Venus

# SYNOPSIS

    package main;

    use Venus::Random;

    my $random = Venus::Random->new(42);

    $random->digit;

    # 5

# DESCRIPTION

[Venus::Random](https://metacpan.org/pod/Venus%3A%3ARandom) provides methods for generating random data including numbers,
strings, UUIDs, and passwords.

# EXAMPLES

The following are examples of random generation in Venus.

- rand.0

    Use `number` to generate random integers.

    **example 1**

        package main;

        use Venus::Random;

        my $random = Venus::Random->new(42);

        my $num = $random->number(1, 100);

        $num >= 1 && $num <= 100 ? 'in range' : 'out of range';

        # "in range"

- rand.1

    Use `letter` to generate random letters.

    **example 1**

        package main;

        use Venus::Random;

        my $random = Venus::Random->new(42);

        my $letter = $random->letter;

        $letter =~ /[a-zA-Z]/ ? 'valid letter' : 'invalid';

        # "valid letter"

- rand.2

    Use `uuid` to generate UUIDs.

    **example 1**

        package main;

        use Venus::Random;

        my $random = Venus::Random->new(42);

        my $uuid = $random->uuid;

        $uuid =~ /^[0-9a-f-]+$/ ? 'valid uuid' : 'invalid';

        # "valid uuid"

- rand.3

    Use `select` to select random elements from a list.

    **example 1**

        package main;

        use Venus::Random;

        my $random = Venus::Random->new(42);

        my $item = $random->select(['a', 'b', 'c']);

        $item =~ /^[abc]$/ ? 'valid select' : 'invalid';

        # "valid select"
