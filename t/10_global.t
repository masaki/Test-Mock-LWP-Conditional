use strict;
use warnings;
use Test::More;
use Test::Fake::HTTPD;
use Test::Mock::LWP::Conditional;
use LWP::UserAgent;
use HTTP::Response;

sub lwp { LWP::UserAgent->new }

my $httpd = run_http_server { [204, [], []] };
is lwp->get($httpd->endpoint)->code => 204, 'returns a real response';

Test::Mock::LWP::Conditional->stub_request(
    $httpd->endpoint => HTTP::Response->new(404)
);
is lwp->get($httpd->endpoint)->code => 404, 'returns a stub response';

Test::Mock::LWP::Conditional->stub_request(
    $httpd->endpoint => sub { HTTP::Response->new(500) }
);
is lwp->get($httpd->endpoint)->code => 500, 'returns a code stubed response';

done_testing;

