// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinShieldconexMgmtSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('CloneEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinShieldconexMgmtSDK.test();
      final ent = testsdk.Clone();
      ok(null != ent);
    });



    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'];
      for (final op in ['create']) {
        if (maybeSkipControl(t, 'entityOp', 'clone.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;


      // CREATE
      final clone_ref01_ent = client.Clone();
      dynamic clone_ref01_data = setup['data']['new']['clone']['clone_ref01'];
      clone_ref01_data['template_id'] = setup['idmap']['template01'];

      clone_ref01_data = await clone_ref01_ent.create(clone_ref01_data);
      ok(null != clone_ref01_data['id']);


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/clone/CloneTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinShieldconexMgmtSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['clone01', 'clone02', 'clone03', 'template01', 'template02', 'template03'],
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
      Platform.environment['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID': idmap,
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID'];

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

