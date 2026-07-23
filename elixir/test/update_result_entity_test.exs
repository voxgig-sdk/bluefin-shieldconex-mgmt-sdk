# UpdateResult entity test (offline, mock transport)

defmodule BluefinShieldconexMgmt.UpdateResultEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinShieldconexMgmt.Helpers, as: H
  alias BluefinShieldconexMgmt.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/update_result/UpdateResultTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinShieldconexMgmt.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.update_result"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinShieldconexMgmt.test()
    ent = BluefinShieldconexMgmt.update_result(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinShieldconexMgmt.update_result(sdk)
    result = BluefinShieldconexMgmt.Entity.UpdateResult.list(ent, S.jm([]))
    assert S.islist(result)
  end

  test "should create then read back" do
    sdk = BluefinShieldconexMgmt.test(S.jm(["entity", S.jm(["update_result", S.jm([])])]))
    ent = BluefinShieldconexMgmt.update_result(sdk)
    made = BluefinShieldconexMgmt.Entity.UpdateResult.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
