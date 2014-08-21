use Test::More;
use Test::Mojo;

use FindBin;
require "$FindBin::Bin/../evening-wildwood";

my $t = Test::Mojo->new;

$t->get_ok('/new-op')->status_is(200)
  ->content_like(qr/Trust Required/, 'Trust Required');
$t->get_ok('/new-op' => {eve_trusted => 'Yes'})->status_is(200)
  ->content_like(qr/Bad Pilot/);
$t->get_ok(
  '/new-op' => {
    eve_trusted  => 'Yes',
    eve_charid   => '1234123412',
    eve_charname => 'Samwise Dagordae'
  }
)->status_is(200)->content_like(qr/Bad Pilot/);
$t->get_ok(
  '/new-op' => {
    eve_trusted  => 'Yes',
    eve_charid   => '94495442',
    eve_charname => 'Samwise Dagordae'
  }
)->status_is(302);

done_testing();
