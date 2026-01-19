# NAME

Venus - Roles

# ABSTRACT

Role Composition in Venus

# SYNOPSIS

    package Greetable;

    use Venus::Role;

    sub greet {
      my ($self) = @_;
      return 'Hello, ' . $self->name;
    }

    sub EXPORT {
      ['greet']
    }

    package Person;

    use Venus::Class;

    attr 'name';

    with 'Greetable';

    package main;

    my $person = Person->new(name => 'Alice');

    $person->greet;

    # "Hello, Alice"

# DESCRIPTION

[Venus::Role](https://metacpan.org/pod/Venus%3A%3ARole) provides a DSL for building roles. Roles are composable units of
behavior that can be mixed into classes using `with` or `role`. Use `EXPORT`
to declare which methods the role provides, and `AUDIT` to enforce interface
requirements on consumers.

# EXAMPLES

The following are examples of roles in Venus.

- role.0

    Use `with` to compose a role into a class.

    **example 1**

        package Printable;

        use Venus::Role;

        sub print_info {
          my ($self) = @_;
          return 'Info: ' . $self->info;
        }

        sub EXPORT {
          ['print_info']
        }

        package Document;

        use Venus::Class;

        attr 'info';

        with 'Printable';

        package main;

        my $doc = Document->new(info => 'README');

        my $result = $doc->print_info;

        # "Info: README"

- role.1

    Use `EXPORT` to declare which methods a role provides.

    **example 1**

        package Describable;

        use Venus::Role;

        sub describe {
          my ($self) = @_;
          return ref($self) . ' object';
        }

        sub internal_helper {
          return 'helper';
        }

        sub EXPORT {
          ['describe']  # internal_helper is NOT exported
        }

        package Widget;

        use Venus::Class;

        with 'Describable';

        package main;

        my $widget = Widget->new;

        my $result = $widget->can('describe') ? 'yes' : 'no';

        # "yes"

- role.2

    Use `AUDIT` to enforce interface requirements on consumers.

    **example 1**

        package Storable;

        use Venus::Role;

        sub AUDIT {
          my ($self, $from) = @_;
          die "$from must implement 'save'" unless $from->can('save');
          die "$from must implement 'load'" unless $from->can('load');
        }

        sub EXPORT {
          []
        }

        package Database;

        use Venus::Class;

        sub save { 'saved' }
        sub load { 'loaded' }

        test 'Storable';  # uses AUDIT

        package main;

        my $db = Database->new;

        my $result = $db->save;

        # "saved"

- role.3

    Roles can require attributes from the consuming class.

    **example 1**

        package Named;

        use Venus::Role;

        sub display_name {
          my ($self) = @_;
          return 'Name: ' . $self->name;
        }

        sub AUDIT {
          my ($self, $from) = @_;
          die "$from must have 'name' attribute" unless $from->can('name');
        }

        sub EXPORT {
          ['display_name']
        }

        package Employee;

        use Venus::Class;

        attr 'name';

        test 'Named';

        package main;

        my $emp = Employee->new(name => 'Bob');

        my $result = $emp->display_name;

        # "Name: Bob"

- role.4

    Roles can export private attributes via `mask`.

    **example 1**

        package HasSecret;

        use Venus::Role;

        mask 'secret';

        sub reveal {
          my ($self) = @_;
          return 'Secret: ' . ($self->secret // 'none');
        }

        sub EXPORT {
          ['secret', 'reveal']
        }

        package Vault;

        use Venus::Class;

        with 'HasSecret';

        sub BUILD {
          my ($self, $args) = @_;
          $self->secret($args->{secret}) if exists $args->{secret};
        }

        package main;

        my $vault = Vault->new(secret => 'treasure');

        my $result = $vault->reveal;

        # "Secret: treasure"

- role.5

    Use `@EXPORT` package variable as an alternative to the `EXPORT` subroutine.

    **example 1**

        package Timestamped;

        use Venus::Role;

        our @EXPORT = ('timestamp');

        sub timestamp {
          my ($self) = @_;
          return 'created at ' . time();
        }

        package Record;

        use Venus::Class;

        with 'Timestamped';

        package main;

        my $record = Record->new;

        my $result = $record->timestamp;

        # "created at 1234567890" (time varies)
