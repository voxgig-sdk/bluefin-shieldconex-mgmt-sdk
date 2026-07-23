# Clone entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinShieldconexMgmt_sdk"
require_relative "runner"

class CloneEntityTest < Minitest::Test
  def test_create_instance
    testsdk = BluefinShieldconexMgmtSDK.test(nil, nil)
    ent = testsdk.Clone(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = clone_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "clone." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # CREATE
    clone_ref01_ent = client.Clone(nil)
    clone_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.clone"), "clone_ref01"))
    clone_ref01_data["template_id"] = setup[:idmap]["template01"]

    clone_ref01_data_result = clone_ref01_ent.create(clone_ref01_data, nil)
    clone_ref01_data = Helpers.to_map(clone_ref01_data_result)
    assert !clone_ref01_data.nil?
    assert !clone_ref01_data["id"].nil?

  end
end

def clone_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "clone", "CloneTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinShieldconexMgmtSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["clone01", "clone02", "clone03", "template01", "template02", "template03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID" => idmap,
    "BLUEFINSHIELDCONEXMGMT_TEST_LIVE" => "FALSE",
    "BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN" => "FALSE",
    "BLUEFINSHIELDCONEXMGMT_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
        "apikey" => env["BLUEFINSHIELDCONEXMGMT_APIKEY"],
      },
      extra || {},
    ])
    client = BluefinShieldconexMgmtSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["BLUEFINSHIELDCONEXMGMT_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
