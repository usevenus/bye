{
  data => {
    ECHO => 1,
  },
  exec => {
    brew => "perlbrew",
    cpan => "\$CPAN",
    deps => "cpan --installdeps .",
    docs => "perldoc",
    each => "\$PERL -MVenus=true,false,log -nE",
    edit => "\$EDITOR \$VENUS_FILE",
    eval => "\$PERL -MVenus=true,false,log -E",
    exec => "\$PERL",
    faqs => "docs -q",
    info => "\$PERL -V",
    lint => "perlcritic --profile .perlcriticrc",
    okay => "\$PERL -c",
    once => "repl -MVenus -e '#e'",
    read => "less README.md",
    reup => "cpan Venus",
    tidy => "perltidy",
    vars => "docs -v"
  },
  flow => {
    setup => [
      "setup-perl",
      "setup-repl",
    ],
    "setup-perl" => [
      "cpan Cpanel::JSON::XS",
      "cpan Perl::Critic",
      "cpan Perl::Tidy",
      "cpan YAML::XS"
    ],
    "setup-repl" => [
      "cpan Reply",
      "cpan App::Nopaste",
      "cpan B::Keywords",
      "cpan Class::Refresh",
      "cpan IO::Pager",
      "cpan Proc::InvokeEditor",
      "cpan Term::ReadKey",
      "cpan Term::ReadLine::Gnu"
    ],
    tests => [
      "lint tests",
      "test tests",
    ]
  },
  libs => [
    "-Ilib",
    "-Ilocal/lib/perl5"
  ],
  path => [
    "./bin",
    "./dev",
    "./local/bin"
  ],
  perl => {
    dbgr => "\$PERL -dE0",
    perl => "perl",
    repl => "reply --cfg .replyrc",
    test => "prove",
    prove => "prove",
  },
  vars => {
    CPAN => "cpanm -llocal -qn",
    PERL => "perl",
    TEST => "test"
  }
}
