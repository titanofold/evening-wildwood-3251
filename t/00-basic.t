use Test::More;
use Test::Mojo;
use Try::Tiny;

use FindBin;
require "$FindBin::Bin/../evening-wildwood";

# Start with a clean database
try {
  my $revert = App::Sqitch::Command->load(
    {
      sqitch  => App::Sqitch->new,
      config  => App::Sqitch::Config->new,
      command => 'revert',
      args    => ['-y', '-t', $ENV{DATABASE_URL}]
    }
  );
  $revert->execute;
};

my $deploy_db = sub {
  my ($t) = @_;
  my $s = try {
    my $deploy = App::Sqitch::Command->load(
      {
        sqitch  => App::Sqitch->new,
        config  => App::Sqitch::Config->new,
        command => 'deploy',
        args    => ['-t', $ENV{DATABASE_URL}]
      }
    );
    $deploy->execute or die;
    return 1;
  }
  catch { return; };

  return $t->success($s);
};


my $t = Test::Mojo->new;

$t->$deploy_db->get_ok('/')->status_is(200);

done_testing();
