// Generated basic-flow test for the clone entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct CloneSetup {
  std::shared_ptr<BluefinShieldconexMgmtSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static CloneSetup clone_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/clone/CloneTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinShieldconexMgmtSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("clone01"), Value("clone02"), Value("clone03"), Value("template01"), Value("template02"), Value("template03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID", idmap},
    {"BLUEFINSHIELDCONEXMGMT_TEST_LIVE", Value("FALSE")},
    {"BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINSHIELDCONEXMGMT_TEST_LIVE") == Value("TRUE");

  CloneSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void clone_entity_instance() {
  auto testsdk = BluefinShieldconexMgmtSDK::testSDK();
  auto ent = testsdk->clone();
  ASSERT_EQ(ent->getName(), std::string("clone"), "entity name");
}

static void clone_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"clone", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinShieldconexMgmtSDK::testSDK(seed, sdkopts);
  auto se = strsdk->clone();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinShieldconexMgmtSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->clone();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void clone_entity_basic() {
  auto setup = clone_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create"}) {
    auto sk = is_control_skipped("entityOp", std::string("clone.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto clone_ref01_ent = client->clone();
  Value clone_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "clone"}), "clone_ref01"));
  if (!clone_ref01_data.is_map()) clone_ref01_data = vmap();
  setp(clone_ref01_data, "template_id", getp(setup.idmap, "template01"));
  {
    Value clone_ref01_data_result = clone_ref01_ent->create(Struct::clone(clone_ref01_data), Value::undef());
    clone_ref01_data = Helpers::toMapAny(clone_ref01_data_result);
    if (!clone_ref01_data.is_map()) clone_ref01_data = vmap();
    ASSERT_TRUE(clone_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(clone_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

}

int main() {
  T_RUN(clone_entity_instance);
  T_RUN(clone_entity_stream);
  T_RUN(clone_entity_basic);
  return sdktest::summary("clone_entity_test");
}
