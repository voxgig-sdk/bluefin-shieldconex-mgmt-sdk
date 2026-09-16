# BluefinShieldconexMgmt SDK feature factory

defmodule BluefinShieldconexMgmt.Features do
  def make_feature(name) do
    case name do
      "audit" -> BluefinShieldconexMgmt.Feature.Audit.new()
      "clienttrack" -> BluefinShieldconexMgmt.Feature.Clienttrack.new()
      "debug" -> BluefinShieldconexMgmt.Feature.Debug.new()
      "idempotency" -> BluefinShieldconexMgmt.Feature.Idempotency.new()
      "log" -> BluefinShieldconexMgmt.Feature.Log.new()
      "metrics" -> BluefinShieldconexMgmt.Feature.Metrics.new()
      "paging" -> BluefinShieldconexMgmt.Feature.Paging.new()
      "ratelimit" -> BluefinShieldconexMgmt.Feature.Ratelimit.new()
      "retry" -> BluefinShieldconexMgmt.Feature.Retry.new()
      "telemetry" -> BluefinShieldconexMgmt.Feature.Telemetry.new()
      "test" -> BluefinShieldconexMgmt.Feature.Test.new()
      "timeout" -> BluefinShieldconexMgmt.Feature.Timeout.new()
      _ -> BluefinShieldconexMgmt.Feature.new()
    end
  end
end
