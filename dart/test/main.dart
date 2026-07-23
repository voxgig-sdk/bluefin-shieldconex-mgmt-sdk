// BluefinShieldconexMgmt SDK test suite entry. GENERATED — do not edit.

import 'dart:io';

import 'harness.dart' as harness;

import 'exists_test.dart' as exists_test;
import 'struct_test.dart' as struct_test;
import 'primary_test.dart' as primary_test;
import 'pipeline_test.dart' as pipeline_test;
import 'feature_test.dart' as feature_test;
import 'netsim_test.dart' as netsim_test;
import 'custom_test.dart' as custom_test;
import 'readme_examples_test.dart' as readme_examples_test;
import 'entity/client/ClientEntity_test.dart' as client_entity_test;
import 'entity/client/ClientDirect_test.dart' as client_direct_test;
import 'entity/clone/CloneEntity_test.dart' as clone_entity_test;
import 'entity/partner/PartnerEntity_test.dart' as partner_entity_test;
import 'entity/partner/PartnerDirect_test.dart' as partner_direct_test;
import 'entity/template/TemplateEntity_test.dart' as template_entity_test;
import 'entity/template/TemplateDirect_test.dart' as template_direct_test;
import 'entity/transaction/TransactionEntity_test.dart' as transaction_entity_test;
import 'entity/transaction/TransactionDirect_test.dart' as transaction_direct_test;
import 'entity/update_result/UpdateResultEntity_test.dart' as update_result_entity_test;
import 'entity/update_result/UpdateResultDirect_test.dart' as update_result_direct_test;
import 'entity/user/UserEntity_test.dart' as user_entity_test;
import 'entity/user/UserDirect_test.dart' as user_direct_test;

Future<void> main() async {
  exists_test.tests();
  struct_test.tests();
  primary_test.tests();
  pipeline_test.tests();
  feature_test.tests();
  netsim_test.tests();
  custom_test.tests();
  readme_examples_test.tests();
  client_entity_test.tests();
  client_direct_test.tests();
  clone_entity_test.tests();
  partner_entity_test.tests();
  partner_direct_test.tests();
  template_entity_test.tests();
  template_direct_test.tests();
  transaction_entity_test.tests();
  transaction_direct_test.tests();
  update_result_entity_test.tests();
  update_result_direct_test.tests();
  user_entity_test.tests();
  user_direct_test.tests();

  final failed = await harness.runAll();
  if (0 < failed) {
    exitCode = 1;
  }
}
