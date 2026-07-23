// Generated basic-flow test for the clone entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_shieldconex_mgmt_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_shieldconex_mgmt_sdk::utility::voxgigstruct as vs;
use bluefin_shieldconex_mgmt_sdk::{test_sdk, Entity, BluefinShieldconexMgmtEntity, BluefinShieldconexMgmtSDK, Value};

#[test]
fn clone_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.clone(Value::Noval);
    assert_eq!(ent.get_name(), "clone");
}

#[test]
fn clone_entity_basic() {
    let setup = clone_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("clone.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let clone_ref01_ent = client.clone(Value::Noval);
    let clone_ref01_data = to_map(&getp(
        &getpath(&["new", "clone"], &setup.data),
        "clone_ref01",
    ));
    setp(&clone_ref01_data, "template_id", getp(&setup.idmap, "template01"));

    let clone_ref01_data_result = clone_ref01_ent
        .create(clone_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let clone_ref01_data = to_map(&clone_ref01_data_result);
    assert!(
        matches!(clone_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );
    assert!(
        !getp(&clone_ref01_data, "id").is_noval(),
        "expected created entity to have an id"
    );

}

fn clone_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("clone");
    entity_data_file.push("CloneTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("clone01"), Value::str("clone02"), Value::str("clone03"), Value::str("template01"), Value::str("template02"), Value::str("template03")]),
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
    let entid_env_raw = std::env::var("BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID", idmap.clone()),
        ("BLUEFINSHIELDCONEXMGMT_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFINSHIELDCONEXMGMT_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINSHIELDCONEXMGMT_TEST_CLONE_ENTID")) {
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
