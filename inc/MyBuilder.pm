package inc::MyBuilder;

use strict;
use warnings;
use parent qw(Module::Build);
use Pod::Perldoc::ToPod;

sub ACTION_docs {
    my ($self, @args) = @_;

    open my $fh, '>', 'README.pod' or die "cannot create README.pod";
    my $parser = Pod::Perldoc::ToPod->new;
    $parser->parse_from_file('lib/Test/Mock/LWP/Conditional.pm', $fh);

    return $self->SUPER::ACTION_docs(@args);
}

1;

