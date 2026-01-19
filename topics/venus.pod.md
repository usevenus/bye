# NAME

Venus - Bootstrap

# ABSTRACT

Bootstrapping in Venus

# SYNOPSIS

    package main;

    use Venus qw(box cast array hash string);

    my $result = box("  hello world  ")->trim->uppercase->unbox->value;

    $result;

    # "HELLO WORLD"

# DESCRIPTION

The real ergonomics and productivity boosts in Venus come from combining its
various abilities. The [Venus](https://metacpan.org/pod/Venus) module can export a laundry list of constructor
functions like `string`, `array`, `hash`, `box`, and `cast` that create
(i.e., bootstrap) Venus objects from Perl values. Use `box` for fluent method
chaining across transformations, `cast` for automatic type detection, and
constructor functions for readable object creation.

# EXAMPLES

The following examples show how combining Venus features creates powerful,
expressive code.

- venus.0

    Use `box` for fluent method chaining across multiple transformations.

    **example 1**

        package main;

        use Venus qw(box);

        my $result = box([5, 3, 1, 4, 1, 5, 9, 2, 6])
          ->unique
          ->sort
          ->unbox
          ->value;

        join ",", @$result;

        # "1,2,3,4,5,6,9"

- venus.1

    Use `cast` to automatically detect types and create the appropriate object.

    **example 1**

        package main;

        use Venus qw(cast);

        my $str = cast("hello");

        my $arr = cast([1, 2, 3]);

        my $hsh = cast({a => 1});

        join "-", ref($str), ref($arr), ref($hsh);

        # "Venus::String-Venus::Array-Venus::Hash"

- venus.2

    Use constructor functions for clear, readable object creation.

    **example 1**

        package main;

        use Venus qw(array hash);

        my $users = array([
          hash({name => 'alice', role => 'admin'}),
          hash({name => 'bob', role => 'user'}),
        ]);

        $users->count;

        # 2

- venus.3

    Combine `array` operations with callbacks for data processing pipelines.

    **example 1**

        package main;

        use Venus qw(array);

        my $numbers = array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

        my $evens = $numbers->grep(sub { $_ % 2 == 0 });

        array($evens)->join(", ");

        # "2, 4, 6, 8, 10"
