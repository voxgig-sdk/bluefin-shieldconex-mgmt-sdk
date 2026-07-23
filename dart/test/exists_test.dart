import 'harness.dart';

import '../lib/BluefinShieldconexMgmtSDK.dart';

void tests() {
  describe('exists', () {
    test('test-mode', (t) async {
      final testsdk = BluefinShieldconexMgmtSDK.test();
      equal(true, null != testsdk);
    });
  });
}
