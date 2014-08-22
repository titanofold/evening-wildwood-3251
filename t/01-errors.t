use Test::More tests => 12;
use Test::Mojo;

use FindBin;
require "$FindBin::Bin/../evening-wildwood";

my $t = Test::Mojo->new;

### Test op creation errors
# without headers
$t->get_ok('/new-op')->status_is(200)
  ->content_like(qr/Trust Required/, 'Trust Required');

# with only trust
$t->get_ok('/new-op' => {eve_trusted => 'Yes'})->status_is(200)
  ->content_like(qr/Bad Pilot/);

# With incorrect details
$t->get_ok(
  '/new-op' => {
    eve_trusted  => 'Yes',
    eve_charid   => '1234123412',
    eve_charname => 'Bad Pilot Name'
  }
)->status_is(200)->content_like(qr/Bad Pilot/);

### Test op-not-found
$t->get_ok(
  '/op/99999999' => {
    eve_trusted  => 'Yes',
    eve_charid   => '94495442',
    eve_charname => 'Samwise Dagordae'
  }
)->status_is(200)->content_like(qr/not found/i);

done_testing();
