# BluefinShieldconexMgmt SDK exists test

require "minitest/autorun"
require_relative "../BluefinShieldconexMgmt_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = BluefinShieldconexMgmtSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
