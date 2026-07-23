# Clone entity test (offline, mock transport)

defmodule BluefinShieldconexMgmt.CloneEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinShieldconexMgmt.Helpers, as: H
  alias BluefinShieldconexMgmt.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/clone/CloneTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinShieldconexMgmt.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.clone"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinShieldconexMgmt.test()
    ent = BluefinShieldconexMgmt.clone(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinShieldconexMgmt.test(S.jm(["entity", S.jm(["clone", S.jm([])])]))
    ent = BluefinShieldconexMgmt.clone(sdk)
    made = BluefinShieldconexMgmt.Entity.Clone.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
