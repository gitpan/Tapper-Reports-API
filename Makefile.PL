
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Tapper - Remote network API for result evaluation",
  "AUTHOR" => "AMD OSRC Tapper Team <tapper\@amd64.org>",
  "BUILD_REQUIRES" => {
    "Class::C3" => 0,
    "Cwd" => 0,
    "File::Slurp" => 0,
    "MRO::Compat" => 0,
    "Tapper::Config" => 0,
    "Tapper::Schema::TestTools" => 0,
    "Test::Deep" => 0,
    "Test::Fixture::DBIC::Schema" => 0,
    "Test::MockModule" => 0,
    "Test::More" => 0,
    "subs" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Tapper-Reports-API",
  "EXE_FILES" => [
    "bin/tapper-reports-api-daemon",
    "bin/tapper-reports-api"
  ],
  "LICENSE" => "open_source",
  "NAME" => "Tapper::Reports::API",
  "PREREQ_PM" => {
    "Data::Dumper" => 0,
    "Moose" => 0,
    "MooseX::Daemonize" => 0,
    "Net::Server::Fork" => 0,
    "Tapper::Model" => 0,
    "Tapper::Reports::DPath::Mason" => 0,
    "Tapper::Reports::DPath::TT" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "4.0.1",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



