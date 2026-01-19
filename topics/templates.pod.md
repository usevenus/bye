# NAME

Venus - Templates

# ABSTRACT

Templates in Venus

# SYNOPSIS

    package main;

    use Venus::Template;

    my $tmpl = Venus::Template->new(
      value => 'Hello, {{ name }}!',
      context => { name => 'World' }
    );

    $tmpl->render;

    # "Hello, World!"

# DESCRIPTION

[Venus::Template](https://metacpan.org/pod/Venus%3A%3ATemplate) provides simple template rendering with variable
interpolation, conditionals, and loops. Use `{{ var }}` for variables,
`{{ if var }}` for conditionals, and `{{ for items }}` for loops.

# EXAMPLES

The following are examples of templates in Venus.

- template.0

    Use `{{ var }}` for variable interpolation.

    **example 1**

        package main;

        use Venus::Template;

        my $tmpl = Venus::Template->new(
          value => 'User: {{ user }}, Role: {{ role }}',
          context => { user => 'alice', role => 'admin' }
        );

        $tmpl->render;

        # "User: alice, Role: admin"

- template.1

    Use `{{ if var }}` for conditional rendering.

    **example 1**

        package main;

        use Venus::Template;

        my $tmpl = Venus::Template->new(
          value => '{{ if premium }}Premium User{{ end premium }}',
          context => { premium => 1 }
        );

        $tmpl->render;

        # "Premium User"

- template.2

    Use `{{ if not var }}` for negated conditionals.

    **example 1**

        package main;

        use Venus::Template;

        my $tmpl = Venus::Template->new(
          value => '{{ if not logged_in }}Please log in{{ end logged_in }}',
          context => { logged_in => 0 }
        );

        $tmpl->render;

        # "Please log in"

- template.3

    Use `{{ for items }}` to loop over arrays.

    **example 1**

        package main;

        use Venus::Template;

        my $tmpl = Venus::Template->new(
          value => '{{ for users }}{{ name }} {{ end users }}',
          context => {
            users => [
              { name => 'Alice' },
              { name => 'Bob' }
            ]
          }
        );

        my $result = $tmpl->render;

        $result =~ /Alice/ && $result =~ /Bob/ ? 'valid' : 'invalid';

        # "valid"
