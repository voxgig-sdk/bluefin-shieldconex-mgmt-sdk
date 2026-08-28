# BluefinShieldconexMgmt SDK feature factory

from bluefinshieldconexmgmt_sdk.feature.base_feature import BluefinShieldconexMgmtBaseFeature
from bluefinshieldconexmgmt_sdk.feature.audit_feature import BluefinShieldconexMgmtAuditFeature
from bluefinshieldconexmgmt_sdk.feature.clienttrack_feature import BluefinShieldconexMgmtClienttrackFeature
from bluefinshieldconexmgmt_sdk.feature.idempotency_feature import BluefinShieldconexMgmtIdempotencyFeature
from bluefinshieldconexmgmt_sdk.feature.log_feature import BluefinShieldconexMgmtLogFeature
from bluefinshieldconexmgmt_sdk.feature.metrics_feature import BluefinShieldconexMgmtMetricsFeature
from bluefinshieldconexmgmt_sdk.feature.paging_feature import BluefinShieldconexMgmtPagingFeature
from bluefinshieldconexmgmt_sdk.feature.ratelimit_feature import BluefinShieldconexMgmtRatelimitFeature
from bluefinshieldconexmgmt_sdk.feature.retry_feature import BluefinShieldconexMgmtRetryFeature
from bluefinshieldconexmgmt_sdk.feature.telemetry_feature import BluefinShieldconexMgmtTelemetryFeature
from bluefinshieldconexmgmt_sdk.feature.test_feature import BluefinShieldconexMgmtTestFeature
from bluefinshieldconexmgmt_sdk.feature.timeout_feature import BluefinShieldconexMgmtTimeoutFeature


_FEATURES = {
    "base": lambda: BluefinShieldconexMgmtBaseFeature(),
    "audit": lambda: BluefinShieldconexMgmtAuditFeature(),
    "clienttrack": lambda: BluefinShieldconexMgmtClienttrackFeature(),
    "idempotency": lambda: BluefinShieldconexMgmtIdempotencyFeature(),
    "log": lambda: BluefinShieldconexMgmtLogFeature(),
    "metrics": lambda: BluefinShieldconexMgmtMetricsFeature(),
    "paging": lambda: BluefinShieldconexMgmtPagingFeature(),
    "ratelimit": lambda: BluefinShieldconexMgmtRatelimitFeature(),
    "retry": lambda: BluefinShieldconexMgmtRetryFeature(),
    "telemetry": lambda: BluefinShieldconexMgmtTelemetryFeature(),
    "test": lambda: BluefinShieldconexMgmtTestFeature(),
    "timeout": lambda: BluefinShieldconexMgmtTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
