# ProjectName SDK exists test

import pytest
from bluefinshieldconexmgmt_sdk import BluefinShieldconexMgmtSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = BluefinShieldconexMgmtSDK.test(None, None)
        assert testsdk is not None
