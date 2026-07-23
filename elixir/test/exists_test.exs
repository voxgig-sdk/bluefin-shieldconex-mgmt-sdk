defmodule BluefinShieldconexMgmt.ExistsTest do
  use ExUnit.Case

  test "should create test sdk" do
    testsdk = BluefinShieldconexMgmt.test()
    assert testsdk != nil
  end
end
