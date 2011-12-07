use strict;
use warnings;
use Test::More;
use Test::Fake::HTTPD;
use Test::Mock::LWP::Conditional;
use LWP::UserAgent;
use HTTP::Response;

my $httpd = run_http_server { [204, [], []] };

my $ua = LWP::UserAgent->new;
is $ua->get($httpd->endpoint)->code => 204, 'returns a real response';

$ua->stub_request($httpd->endpoint => HTTP::Response->new(404));
is $ua->get($httpd->endpoint)->code => 404, 'returns a stub response';

my $new_ua = LWP::UserAgent->new;
is $new_ua->get($httpd->endpoint)->code => 204, 'another instance returns a real response';

done_testing;

