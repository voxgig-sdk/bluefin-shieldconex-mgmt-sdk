# BluefinShieldconexMgmt SDK feature factory

defmodule BluefinShieldconexMgmt.Features do
  def make_feature(name) do
    case name do
      "test" -> BluefinShieldconexMgmt.Feature.Test.new()
      _ -> BluefinShieldconexMgmt.Feature.new()
    end
  end
end
