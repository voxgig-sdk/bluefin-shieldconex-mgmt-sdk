# BluefinShieldconexMgmt SDK feature factory

use strict;
use warnings;

use File::Basename ();
use Cwd ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/feature/base_feature.pm"));
require(Cwd::abs_path("$__dir/feature/audit_feature.pm"));
require(Cwd::abs_path("$__dir/feature/clienttrack_feature.pm"));
require(Cwd::abs_path("$__dir/feature/debug_feature.pm"));
require(Cwd::abs_path("$__dir/feature/idempotency_feature.pm"));
require(Cwd::abs_path("$__dir/feature/log_feature.pm"));
require(Cwd::abs_path("$__dir/feature/metrics_feature.pm"));
require(Cwd::abs_path("$__dir/feature/paging_feature.pm"));
require(Cwd::abs_path("$__dir/feature/ratelimit_feature.pm"));
require(Cwd::abs_path("$__dir/feature/retry_feature.pm"));
require(Cwd::abs_path("$__dir/feature/telemetry_feature.pm"));
require(Cwd::abs_path("$__dir/feature/test_feature.pm"));
require(Cwd::abs_path("$__dir/feature/timeout_feature.pm"));

package BluefinShieldconexMgmtFeatures;

sub make_feature {
  my ($name) = @_;
  $name = '' unless defined $name;
  return BluefinShieldconexMgmtBaseFeature->new if 'base' eq $name;
  return BluefinShieldconexMgmtAuditFeature->new if 'audit' eq $name;
  return BluefinShieldconexMgmtClienttrackFeature->new if 'clienttrack' eq $name;
  return BluefinShieldconexMgmtDebugFeature->new if 'debug' eq $name;
  return BluefinShieldconexMgmtIdempotencyFeature->new if 'idempotency' eq $name;
  return BluefinShieldconexMgmtLogFeature->new if 'log' eq $name;
  return BluefinShieldconexMgmtMetricsFeature->new if 'metrics' eq $name;
  return BluefinShieldconexMgmtPagingFeature->new if 'paging' eq $name;
  return BluefinShieldconexMgmtRatelimitFeature->new if 'ratelimit' eq $name;
  return BluefinShieldconexMgmtRetryFeature->new if 'retry' eq $name;
  return BluefinShieldconexMgmtTelemetryFeature->new if 'telemetry' eq $name;
  return BluefinShieldconexMgmtTestFeature->new if 'test' eq $name;
  return BluefinShieldconexMgmtTimeoutFeature->new if 'timeout' eq $name;
  return BluefinShieldconexMgmtBaseFeature->new;
}

1;
