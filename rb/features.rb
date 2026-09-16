# BluefinShieldconexMgmt SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/audit_feature'
require_relative 'feature/clienttrack_feature'
require_relative 'feature/debug_feature'
require_relative 'feature/idempotency_feature'
require_relative 'feature/log_feature'
require_relative 'feature/metrics_feature'
require_relative 'feature/paging_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/telemetry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module BluefinShieldconexMgmtFeatures
  def self.make_feature(name)
    case name
    when "base"
      BluefinShieldconexMgmtBaseFeature.new
    when "audit"
      BluefinShieldconexMgmtAuditFeature.new
    when "clienttrack"
      BluefinShieldconexMgmtClienttrackFeature.new
    when "debug"
      BluefinShieldconexMgmtDebugFeature.new
    when "idempotency"
      BluefinShieldconexMgmtIdempotencyFeature.new
    when "log"
      BluefinShieldconexMgmtLogFeature.new
    when "metrics"
      BluefinShieldconexMgmtMetricsFeature.new
    when "paging"
      BluefinShieldconexMgmtPagingFeature.new
    when "ratelimit"
      BluefinShieldconexMgmtRatelimitFeature.new
    when "retry"
      BluefinShieldconexMgmtRetryFeature.new
    when "telemetry"
      BluefinShieldconexMgmtTelemetryFeature.new
    when "test"
      BluefinShieldconexMgmtTestFeature.new
    when "timeout"
      BluefinShieldconexMgmtTimeoutFeature.new
    else
      BluefinShieldconexMgmtBaseFeature.new
    end
  end
end
