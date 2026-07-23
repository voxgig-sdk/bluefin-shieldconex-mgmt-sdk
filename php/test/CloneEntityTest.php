<?php
declare(strict_types=1);

// Clone entity test

require_once __DIR__ . '/../bluefinshieldconexmgmt_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class CloneEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinShieldconexMgmtSDK::test(null, null);
        $ent = $testsdk->Clone(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = clone_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "clone." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $clone_ref01_ent = $client->Clone(null);
        $clone_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.clone"), "clone_ref01"));
        $clone_ref01_data["template_id"] = $setup["idmap"]["template01"];

        $clone_ref01_data_result = $clone_ref01_ent->create($clone_ref01_data, null);
        $clone_ref01_data = Helpers::to_map($clone_ref01_data_result);
        $this->assertNotNull($clone_ref01_data);
        $this->assertNotNull($clone_ref01_data["id"]);

    }
}

function clone_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/clone/CloneTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinShieldconexMgmtSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["clone01", "clone02", "clone03", "template01", "template02", "template03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID" => $idmap,
        "BLUEFINSHIELDCONEXMGMT_TEST_LIVE" => "FALSE",
        "BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN" => "FALSE",
        "BLUEFINSHIELDCONEXMGMT_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
                "apikey" => $env["BLUEFINSHIELDCONEXMGMT_APIKEY"],
            ],
            $extra ?? [],
        ]);
        $client = new BluefinShieldconexMgmtSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
