# BluefinShieldconexMgmt SDK utility: make_context
require_relative '../core/context'
module BluefinShieldconexMgmtUtilities
  MakeContext = ->(ctxmap, basectx) {
    BluefinShieldconexMgmtContext.new(ctxmap, basectx)
  }
end
