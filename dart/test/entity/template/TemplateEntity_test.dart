// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinShieldconexMgmtSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('TemplateEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinShieldconexMgmtSDK.test();
      final ent = testsdk.Template();
      ok(null != ent);
    });

    test('stream', (t) async {
      // stream() runs the list op through the full pipeline and yields each
      // result item. Seed two entities via test mode; with the `streaming`
      // feature active it yields the feature's incremental items, else it
      // falls back to the materialised items — either way every item yields.
      final seed = <String, dynamic>{
        'entity': {
          'template': {
            'strm01': <String, dynamic>{'id': 'strm01'},
            'strm02': <String, dynamic>{'id': 'strm02'},
          }
        }
      };

      final sdkopts = <String, dynamic>{};
      if (null != config.feature['streaming']) {
        sdkopts['feature'] = {
          'streaming': {'active': true}
        };
      }

      final testsdk = BluefinShieldconexMgmtSDK.test(seed, sdkopts);
      final ent = testsdk.Template();

      final seen = [];
      await for (final item in ent.stream('list', <String, dynamic>{})) {
        seen.add(item);
      }
      equal(2, seen.length);

      // Fallback: with streaming inactive, stream() still yields both items
      // from the materialised result.
      final plainsdk = BluefinShieldconexMgmtSDK.test(seed);
      final plainent = plainsdk.Template();
      final seen2 = [];
      await for (final item in plainent.stream('list', <String, dynamic>{})) {
        seen2.add(item);
      }
      equal(2, seen2.length);
    });

    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'];
      for (final op in ['create', 'list', 'load', 'remove']) {
        if (maybeSkipControl(t, 'entityOp', 'template.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;


      // CREATE
      final template_ref01_ent = client.Template();
      dynamic template_ref01_data = setup['data']['new']['template']['template_ref01'];

      template_ref01_data = await template_ref01_ent.create(template_ref01_data);
      ok(null != template_ref01_data['id']);


      // LIST
      final template_ref01_match = <String, dynamic>{};

      final template_ref01_list = await template_ref01_ent.list(template_ref01_match);

      ok(!isempty(select(
          (template_ref01_list as List).map((e) => e.data()).toList(),
          {'id': template_ref01_data['id']})));


      // LOAD
      final template_ref01_match_dt0 = <String, dynamic>{};
      template_ref01_match_dt0['id'] = template_ref01_data['id'];
      final template_ref01_data_dt0 = await template_ref01_ent.load(template_ref01_match_dt0);
      ok(template_ref01_data_dt0['id'] == template_ref01_data['id']);


      // REMOVE
      final template_ref01_match_rm0 = <String, dynamic>{'id': template_ref01_data['id']};
      await template_ref01_ent.remove(template_ref01_match_rm0);


      // LIST
      final template_ref01_match_rt0 = <String, dynamic>{};

      final template_ref01_list_rt0 = await template_ref01_ent.list(template_ref01_match_rt0);

      ok(isempty(select(
          (template_ref01_list_rt0 as List).map((e) => e.data()).toList(),
          {'id': template_ref01_data['id']})));


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/template/TemplateTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinShieldconexMgmtSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['template01', 'template02', 'template03'],
      <String, dynamic>{
        '`\$PACK`': <dynamic>[
          '',
          <String, dynamic>{
            '`\$KEY`': '`\$COPY`',
            '`\$VAL`': <dynamic>['`\$FORMAT`', 'upper', '`\$COPY`'],
          }
        ]
      });

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  final idmapEnvVal =
      Platform.environment['BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID': idmap,
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID'];

  final live = 'TRUE' == env['BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'];

  if (live) {
    client = BluefinShieldconexMgmtSDK(merge([
      <String, dynamic>{
        'apikey': env['BLUEFIN_SHIELDCONEX_MGMT_APIKEY'],
      },
      extra
    ]));
  }

  final setup = <String, dynamic>{
    'idmap': idmap,
    'env': env,
    'options': options,
    'client': client,
    'struct': struct,
    'data': entityData,
    'explain': 'TRUE' == env['BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN'],
    'live': live,
    'syntheticOnly': live && !idmapOverridden,
    'now': DateTime.now().millisecondsSinceEpoch,
  };

  return setup;
}

