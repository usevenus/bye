# NAME

Venus - Method Chaining

# ABSTRACT

Method Chaining in Venus

# SYNOPSIS

    package Task;

    use Venus::Class;

    with 'Venus::Role::Doable';

    attr 'status';

    sub start {
      my ($self) = @_;
      $self->status('running');
      return $self;
    }

    sub finish {
      my ($self) = @_;
      $self->status('done');
      return $self;
    }

    package main;

    my $task = Task->new;

    $task->do('start')->do('finish')->status;

    # "done"

# DESCRIPTION

[Venus::Role::Doable](https://metacpan.org/pod/Venus%3A%3ARole%3A%3ADoable) provides the `do` method for fluent method chaining.
The `do` method calls a method and returns the invocant, allowing multiple
method calls to be chained together.

# EXAMPLES

The following are examples of method chaining in Venus.

- do.0

    Use `do` to call a method and return the object for chaining.

    **example 1**

        package Builder;

        use Venus::Class;

        with 'Venus::Role::Doable';

        attr 'parts';

        sub BUILD {
          my ($self) = @_;
          $self->parts([]);
        }

        sub add {
          my ($self, $part) = @_;
          push @{$self->parts}, $part;
          return $self;
        }

        package main;

        my $builder = Builder->new;

        $builder->do('add', 'A')->do('add', 'B')->do('add', 'C');

        my $result = join '', @{$builder->parts};

        # "ABC"

- do.1

    The `do` method always returns the invocant, even if the called method returns something else.

    **example 1**

        package Counter;

        use Venus::Class;

        with 'Venus::Role::Doable';

        attr 'value';

        sub increment {
          my ($self) = @_;
          $self->value(($self->value // 0) + 1);
          return 'incremented';  # this return value is ignored by do
        }

        package main;

        my $counter = Counter->new;

        my $result = $counter->do('increment')->do('increment')->value;

        # 2

- do.2

    Chain `do` with regular method calls for flexible workflows.

    **example 1**

        package Pipeline;

        use Venus::Class;

        with 'Venus::Role::Doable';

        attr 'data';

        sub transform {
          my ($self, $code) = @_;
          $self->data($code->($self->data));
          return $self;
        }

        sub result {
          my ($self) = @_;
          return $self->data;
        }

        package main;

        my $pipeline = Pipeline->new(data => 5);

        my $result = $pipeline
          ->do('transform', sub { $_[0] * 2 })
          ->do('transform', sub { $_[0] + 3 })
          ->result;

        # 13 (5 * 2 + 3)
