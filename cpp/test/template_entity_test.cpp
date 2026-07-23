// Generated basic-flow test for the template entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct TemplateSetup {
  std::shared_ptr<BluefinShieldconexMgmtSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static TemplateSetup template__basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/template/TemplateTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinShieldconexMgmtSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("template01"), Value("template02"), Value("template03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID", idmap},
    {"BLUEFINSHIELDCONEXMGMT_TEST_LIVE", Value("FALSE")},
    {"BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINSHIELDCONEXMGMT_TEST_LIVE") == Value("TRUE");

  TemplateSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void template__entity_instance() {
  auto testsdk = BluefinShieldconexMgmtSDK::testSDK();
  auto ent = testsdk->template_();
  ASSERT_EQ(ent->getName(), std::string("template"), "entity name");
}

static void template__entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"template", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinShieldconexMgmtSDK::testSDK(seed, sdkopts);
  auto se = strsdk->template_();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinShieldconexMgmtSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->template_();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void template__entity_basic() {
  auto setup = template__basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list", "load", "remove"}) {
    auto sk = is_control_skipped("entityOp", std::string("template.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto template_ref01_ent = client->template_();
  Value template_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "template"}), "template_ref01"));
  if (!template_ref01_data.is_map()) template_ref01_data = vmap();
  {
    Value template_ref01_data_result = template_ref01_ent->create(Struct::clone(template_ref01_data), Value::undef());
    template_ref01_data = Helpers::toMapAny(template_ref01_data_result);
    if (!template_ref01_data.is_map()) template_ref01_data = vmap();
    ASSERT_TRUE(template_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(template_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value template_ref01_match = vmap();
  Value template_ref01_list = template_ref01_ent->list(Struct::clone(template_ref01_match), Value::undef());
  ASSERT_TRUE(template_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(template_ref01_list), vmap({{"id", getp(template_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

  // LOAD
  Value template_ref01_match_dt0 = vmap({{"id", getp(template_ref01_data, "id")}});
  Value template_ref01_data_dt0_loaded = template_ref01_ent->load(Struct::clone(template_ref01_match_dt0), Value::undef());
  Value template_ref01_data_dt0_load_result = Helpers::toMapAny(template_ref01_data_dt0_loaded);
  ASSERT_TRUE(template_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(template_ref01_data_dt0_load_result, "id"), getp(template_ref01_data, "id"), "expected load result id to match");

  // REMOVE
  {
    Value template_ref01_match_rm0 = vmap({{"id", getp(template_ref01_data, "id")}});
    template_ref01_ent->remove(Struct::clone(template_ref01_match_rm0), Value::undef());
  }

  // LIST
  Value template_ref01_match_rt0 = vmap();
  Value template_ref01_list_rt0 = template_ref01_ent->list(Struct::clone(template_ref01_match_rt0), Value::undef());
  ASSERT_TRUE(template_ref01_list_rt0.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(template_ref01_list_rt0), vmap({{"id", getp(template_ref01_data, "id")}}));
    ASSERT_TRUE(found.empty(), "expected removed entity to not be in list");
  }

}

int main() {
  T_RUN(template__entity_instance);
  T_RUN(template__entity_stream);
  T_RUN(template__entity_basic);
  return sdktest::summary("template_entity_test");
}
