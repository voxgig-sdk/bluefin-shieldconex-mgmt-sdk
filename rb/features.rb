# BluefinShieldconexMgmt SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module BluefinShieldconexMgmtFeatures
  def self.make_feature(name)
    case name
    when "base"
      BluefinShieldconexMgmtBaseFeature.new
    when "test"
      BluefinShieldconexMgmtTestFeature.new
    else
      BluefinShieldconexMgmtBaseFeature.new
    end
  end
end
