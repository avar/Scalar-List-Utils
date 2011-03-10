use strict;
use warnings;
use Test::More tests => 2;

use Scalar::Util qw(subname);

use B::Deparse;

my $source = eval {
	B::Deparse->new->coderef2text(subname foo => sub{ @_ });
};

ok !$@;

like $source, qr/\@\_/;
