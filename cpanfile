requires "perl" => "5.018";
requires "Venus" => "5.00";

on 'test' => sub {
  requires "perl" => "5.018";
  requires "Venus" => "5.00";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};
