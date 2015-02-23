use v5.20;

use Test::More;
use Test::Mojo;
use Mojo::Pg;

use FindBin;
require "$FindBin::Bin/../evening-wildwood";

my $tests = 0;

# Test EVE Single Sign On handling
my $t = Test::Mojo->new;
$t->get_ok('/login')->status_is(302);
$tests += 2;

my $redirect_url = Mojo::URL->new($t->tx->res->headers->location);
is($redirect_url->protocol, 'https');
$tests++;
is($redirect_url->host, 'login.eveonline.com');
$tests++;
is($redirect_url->path, '/oauth/authorize');
$tests++;
is($redirect_url->query->param('response_type'), 'code');
$tests++;
is($redirect_url->query->param('scope'), '');
$tests++;

my $state_token = $redirect_url->query->param('state');
like($state_token,
  qr/^[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[ab89][a-f0-9]{3}-[a-f0-9]{12}$/i);
$tests++;

my $callback_url = Mojo::URL->new($redirect_url->query->param('redirect_uri'));
ok($callback_url->is_abs);
$tests++;
is($callback_url->path, '/callback');
$tests++;

$t->get_ok('/callback',
  form => {code => 'gEyuYF_rf...ofM0', state => $state_token});
$tests++;

done_testing($tests);
