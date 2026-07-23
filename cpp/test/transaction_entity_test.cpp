// Generated basic-flow test for the transaction entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct TransactionSetup {
  std::shared_ptr<BluefinShieldconexMgmtSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static TransactionSetup transaction_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/transaction/TransactionTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinShieldconexMgmtSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("transaction01"), Value("transaction02"), Value("transaction03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID", idmap},
    {"BLUEFINSHIELDCONEXMGMT_TEST_LIVE", Value("FALSE")},
    {"BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINSHIELDCONEXMGMT_TEST_LIVE") == Value("TRUE");

  TransactionSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void transaction_entity_instance() {
  auto testsdk = BluefinShieldconexMgmtSDK::testSDK();
  auto ent = testsdk->transaction();
  ASSERT_EQ(ent->getName(), std::string("transaction"), "entity name");
}

static void transaction_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"transaction", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinShieldconexMgmtSDK::testSDK(seed, sdkopts);
  auto se = strsdk->transaction();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinShieldconexMgmtSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->transaction();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void transaction_entity_basic() {
  auto setup = transaction_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"list", "load"}) {
    auto sk = is_control_skipped("entityOp", std::string("transaction.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value transaction_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "transaction"}));
  Value transaction_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(transaction_ref01_data_raw);
    transaction_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!transaction_ref01_data.is_map()) transaction_ref01_data = vmap();
  }
  // LIST
  auto transaction_ref01_ent = client->transaction();
  Value transaction_ref01_match = vmap();
  Value transaction_ref01_list = transaction_ref01_ent->list(Struct::clone(transaction_ref01_match), Value::undef());
  ASSERT_TRUE(transaction_ref01_list.is_list(), "expected list result to be an array");

  // LOAD
  Value transaction_ref01_match_dt0 = vmap({{"id", getp(transaction_ref01_data, "id")}});
  Value transaction_ref01_data_dt0_loaded = transaction_ref01_ent->load(Struct::clone(transaction_ref01_match_dt0), Value::undef());
  Value transaction_ref01_data_dt0_load_result = Helpers::toMapAny(transaction_ref01_data_dt0_loaded);
  ASSERT_TRUE(transaction_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(transaction_ref01_data_dt0_load_result, "id"), getp(transaction_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(transaction_entity_instance);
  T_RUN(transaction_entity_stream);
  T_RUN(transaction_entity_basic);
  return sdktest::summary("transaction_entity_test");
}
