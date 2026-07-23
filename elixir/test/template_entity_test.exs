# Template entity test (offline, mock transport)

defmodule BluefinShieldconexMgmt.TemplateEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinShieldconexMgmt.Helpers, as: H
  alias BluefinShieldconexMgmt.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/template/TemplateTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinShieldconexMgmt.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.template"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinShieldconexMgmt.test()
    ent = BluefinShieldconexMgmt.template(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinShieldconexMgmt.template(sdk)
    result = BluefinShieldconexMgmt.Entity.Template.list(ent, S.jm([]))
    assert S.islist(result)
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinShieldconexMgmt.template(sdk)
      rec = BluefinShieldconexMgmt.Entity.Template.load(ent, S.jm(["id", id]))
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end

  test "should create then read back" do
    sdk = BluefinShieldconexMgmt.test(S.jm(["entity", S.jm(["template", S.jm([])])]))
    ent = BluefinShieldconexMgmt.template(sdk)
    made = BluefinShieldconexMgmt.Entity.Template.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
