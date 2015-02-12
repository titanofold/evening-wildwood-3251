use v5.20;

use Test::More tests => 6;
use Test::Mojo;
use Mojo::Pg;

use FindBin;
require "$FindBin::Bin/../evening-wildwood";

my $t = Test::Mojo->new;

# First, make sure that the app works as well as the template engine,
# 'cause, ya'know, we're doomed if this doesn't work.
$t->get_ok('/')->status_is(200)->element_exists('footer');

# Initialize the database
$t->get_ok('/db_setup')->status_is(200)
  ->content_isnt('Database migration failed. Check STDERR for reasons why.');

done_testing();
