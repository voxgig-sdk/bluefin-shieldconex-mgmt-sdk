#!perl
# BluefinShieldconexMgmt SDK exists test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";

use BluefinShieldconexMgmtSDK;

my $testsdk = BluefinShieldconexMgmtSDK->test(undef, undef);
ok(defined $testsdk, 'create test sdk');

done_testing();
