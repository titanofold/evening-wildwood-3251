use Test::More;
use Test::Mojo;

use FindBin;
require "$FindBin::Bin/../evening-wildwood";

my $t = Test::Mojo->new;
$t->websocket_ok('/api/v1')->send_ok({json => {test => 1}})->message_ok->json_message_is({code => 200})->finish_ok;

done_testing();
