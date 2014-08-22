use Test::More;
use Test::Mojo;

use FindBin;
require "$FindBin::Bin/../evening-wildwood";

my %headers = (
  eve_trusted  => 'Yes',
  eve_charid   => '94495442',
  eve_charname => 'Samwise Dagordae'
);

my $t = Test::Mojo->new;

### Test Op Procedures
# Create the op
my $base_url = $t->get_ok('/new-op' => {%headers})->status_is(302)
  ->header_like(Location => qr|/op/(\d+)|)->tx->res->headers->location;

$t->get_ok($base_url => {%headers})->status_is(200)->content_like(qr/Foreman/);

done_testing();
