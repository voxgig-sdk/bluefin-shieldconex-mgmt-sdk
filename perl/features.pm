# BluefinShieldconexMgmt SDK feature factory

use strict;
use warnings;

use File::Basename ();
use Cwd ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/feature/base_feature.pm"));
require(Cwd::abs_path("$__dir/feature/test_feature.pm"));

package BluefinShieldconexMgmtFeatures;

sub make_feature {
  my ($name) = @_;
  $name = '' unless defined $name;
  return BluefinShieldconexMgmtBaseFeature->new if 'base' eq $name;
  return BluefinShieldconexMgmtTestFeature->new if 'test' eq $name;
  return BluefinShieldconexMgmtBaseFeature->new;
}

1;
