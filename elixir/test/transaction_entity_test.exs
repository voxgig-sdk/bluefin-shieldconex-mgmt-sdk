# Transaction entity test (offline, mock transport)

defmodule BluefinShieldconexMgmt.TransactionEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinShieldconexMgmt.Helpers, as: H
  alias BluefinShieldconexMgmt.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/transaction/TransactionTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinShieldconexMgmt.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.transaction"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinShieldconexMgmt.test()
    ent = BluefinShieldconexMgmt.transaction(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinShieldconexMgmt.transaction(sdk)
    result = BluefinShieldconexMgmt.Entity.Transaction.list(ent, S.jm([]))
    assert S.islist(result)
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinShieldconexMgmt.transaction(sdk)
      rec = BluefinShieldconexMgmt.Entity.Transaction.load(ent, S.jm(["id", id]))
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end
end
