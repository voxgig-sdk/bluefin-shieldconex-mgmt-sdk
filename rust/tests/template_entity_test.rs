// Generated basic-flow test for the template entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_shieldconex_mgmt_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_shieldconex_mgmt_sdk::utility::voxgigstruct as vs;
use bluefin_shieldconex_mgmt_sdk::{test_sdk, Entity, BluefinShieldconexMgmtEntity, BluefinShieldconexMgmtSDK, Value};

#[test]
fn template_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.template(Value::Noval);
    assert_eq!(ent.get_name(), "template");
}

#[test]
fn template_entity_stream() {
    // stream() runs the list op through the full pipeline and yields each
    // result item. Seed two entities via test mode; with the `streaming`
    // feature active it yields the feature's incremental items, else it
    // falls back to the materialised items — either way every item yields.
    let seed = jo(vec![(
        "entity",
        jo(vec![(
            "template",
            jo(vec![
                ("strm01", jo(vec![("id", Value::str("strm01"))])),
                ("strm02", jo(vec![("id", Value::str("strm02"))])),
            ]),
        )]),
    )]);

    let sdkopts = jo(vec![(
        "feature",
        jo(vec![("streaming", jo(vec![("active", Value::Bool(true))]))]),
    )]);

    let testsdk = test_sdk(seed.clone(), sdkopts);
    let ent = testsdk.template(Value::Noval);
    let items: Vec<Value> = ent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(items.len(), 2, "stream should yield both seeded items");

    // Fallback: streaming inactive still yields both materialised items.
    let plainsdk = test_sdk(seed, Value::Noval);
    let plainent = plainsdk.template(Value::Noval);
    let plain_items: Vec<Value> = plainent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(plain_items.len(), 2, "fallback stream should yield both items");
}

#[test]
fn template_entity_basic() {
    let setup = template_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create", "list", "load", "remove"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("template.{}", op), mode);
        if skip {
            let reason = if reason.is_empty() {
                "skipped via sdk-test-control.json".to_string()
            } else {
                reason
            };
            eprintln!("skip: {}", reason);
            return;
        }
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only {
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let template_ref01_ent = client.template(Value::Noval);
    let template_ref01_data = to_map(&getp(
        &getpath(&["new", "template"], &setup.data),
        "template_ref01",
    ));

    let template_ref01_data_result = template_ref01_ent
        .create(template_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let template_ref01_data = to_map(&template_ref01_data_result);
    assert!(
        matches!(template_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );
    assert!(
        !getp(&template_ref01_data, "id").is_noval(),
        "expected created entity to have an id"
    );

    // LIST
    let template_ref01_match = Value::empty_map();

    let template_ref01_list = template_ref01_ent
        .list(template_ref01_match.clone(), Value::Noval)
        .expect("list failed");
    assert!(
        matches!(template_ref01_list, Value::List(_)),
        "expected list result to be an array"
    );

    let found_item = vs::select(
        &entity_list_to_data(&template_ref01_list),
        &jo(vec![("id", getp(&template_ref01_data, "id"))]),
    );
    assert!(
        !vs::is_empty(&found_item),
        "expected to find created entity in list"
    );

    // LOAD
    let template_ref01_match_dt0 = jo(vec![("id", getp(&template_ref01_data, "id"))]);
    let template_ref01_data_dt0_loaded = template_ref01_ent
        .load(template_ref01_match_dt0.clone(), Value::Noval)
        .expect("load failed");
    let template_ref01_data_dt0_load_result = to_map(&template_ref01_data_dt0_loaded);
    assert!(
        matches!(template_ref01_data_dt0_load_result, Value::Map(_)),
        "expected load result to be a map"
    );
    assert_eq!(
        getp(&template_ref01_data_dt0_load_result, "id"),
        getp(&template_ref01_data, "id"),
        "expected load result id to match"
    );

    // REMOVE
    let template_ref01_match_rm0 = jo(vec![("id", getp(&template_ref01_data, "id"))]);
    template_ref01_ent
        .remove(template_ref01_match_rm0.clone(), Value::Noval)
        .expect("remove failed");

    // LIST
    let template_ref01_match_rt0 = Value::empty_map();

    let template_ref01_list_rt0 = template_ref01_ent
        .list(template_ref01_match_rt0.clone(), Value::Noval)
        .expect("list failed");
    assert!(
        matches!(template_ref01_list_rt0, Value::List(_)),
        "expected list result to be an array"
    );

    let not_found_item = vs::select(
        &entity_list_to_data(&template_ref01_list_rt0),
        &jo(vec![("id", getp(&template_ref01_data, "id"))]),
    );
    assert!(
        vs::is_empty(&not_found_item),
        "expected removed entity to not be in list"
    );

}

fn template_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("template");
    entity_data_file.push("TemplateTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("template01"), Value::str("template02"), Value::str("template03")]),
        &jo(vec![(
            "`$PACK`",
            ja(vec![
                Value::str(""),
                jo(vec![
                    ("`$KEY`", Value::str("`$COPY`")),
                    (
                        "`$VAL`",
                        ja(vec![
                            Value::str("`$FORMAT`"),
                            Value::str("upper"),
                            Value::str("`$COPY`"),
                        ]),
                    ),
                ]),
            ]),
        )]),
        None,
    )
    .unwrap_or_else(|_| Value::empty_map());

    // Detect ENTID env override before env_override consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's.
    let entid_env_raw = std::env::var("BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID", idmap.clone()),
        ("BLUEFINSHIELDCONEXMGMT_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFINSHIELDCONEXMGMT_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID")) {
        Value::Map(m) => Value::Map(m),
        _ => to_map(&idmap),
    };

    let live = getp(&env, "BLUEFINSHIELDCONEXMGMT_TEST_LIVE") == Value::str("TRUE");

    let client = if live {
        let merged = vs::merge(
            &ja(vec![jo(vec![("apikey", getp(&env, "BLUEFINSHIELDCONEXMGMT_APIKEY"))]), extra]),
            None,
        );
        BluefinShieldconexMgmtSDK::new(to_map(&merged))
    } else {
        client
    };

    EntityTestSetup {
        client,
        data: entity_data,
        idmap: idmap_resolved,
        env: env.clone(),
        explain: getp(&env, "BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN") == Value::str("TRUE"),
        live,
        synthetic_only: live && !idmap_overridden,
        now: now_ms(),
    }
}
