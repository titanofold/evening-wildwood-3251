use Test::More;
use Test::Mojo;

use FindBin;
require "$FindBin::Bin/../evening-wildwood";

my $t = Test::Mojo->new;
$t->get_ok('/')->status_is(200)->content_like(qr/Mojolicious/i);

done_testing();
