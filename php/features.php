<?php
declare(strict_types=1);

// BluefinShieldconexMgmt SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/AuditFeature.php';
require_once __DIR__ . '/feature/ClienttrackFeature.php';
require_once __DIR__ . '/feature/DebugFeature.php';
require_once __DIR__ . '/feature/IdempotencyFeature.php';
require_once __DIR__ . '/feature/LogFeature.php';
require_once __DIR__ . '/feature/MetricsFeature.php';
require_once __DIR__ . '/feature/PagingFeature.php';
require_once __DIR__ . '/feature/RatelimitFeature.php';
require_once __DIR__ . '/feature/RetryFeature.php';
require_once __DIR__ . '/feature/TelemetryFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';
require_once __DIR__ . '/feature/TimeoutFeature.php';


class BluefinShieldconexMgmtFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new BluefinShieldconexMgmtBaseFeature();
            case "audit":
                return new BluefinShieldconexMgmtAuditFeature();
            case "clienttrack":
                return new BluefinShieldconexMgmtClienttrackFeature();
            case "debug":
                return new BluefinShieldconexMgmtDebugFeature();
            case "idempotency":
                return new BluefinShieldconexMgmtIdempotencyFeature();
            case "log":
                return new BluefinShieldconexMgmtLogFeature();
            case "metrics":
                return new BluefinShieldconexMgmtMetricsFeature();
            case "paging":
                return new BluefinShieldconexMgmtPagingFeature();
            case "ratelimit":
                return new BluefinShieldconexMgmtRatelimitFeature();
            case "retry":
                return new BluefinShieldconexMgmtRetryFeature();
            case "telemetry":
                return new BluefinShieldconexMgmtTelemetryFeature();
            case "test":
                return new BluefinShieldconexMgmtTestFeature();
            case "timeout":
                return new BluefinShieldconexMgmtTimeoutFeature();
            default:
                return new BluefinShieldconexMgmtBaseFeature();
        }
    }

    /**
     * Does a generated feature class back this name? False for a name only
     * an options extend instance can supply (the station adopt path) - the
     * constructor uses this to skip make_feature for such names instead of
     * adding a stray BaseFeature.
     */
    public static function has_feature(string $name): bool
    {
        switch ($name) {
            case "base":
            case "audit":
            case "clienttrack":
            case "debug":
            case "idempotency":
            case "log":
            case "metrics":
            case "paging":
            case "ratelimit":
            case "retry":
            case "telemetry":
            case "test":
            case "timeout":
                return true;
            default:
                return false;
        }
    }
}
