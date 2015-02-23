use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  VERSION => '0.01',
  PREREQ_PM =>
    {'Mojolicious' => '5.28', 'Mojo::Pg' => 0, 'Number::Format' => 0,},
  test => {TESTS => 't/*.t'}
);
