-- BluefinShieldconexMgmt SDK error

local BluefinShieldconexMgmtError = {}
BluefinShieldconexMgmtError.__index = BluefinShieldconexMgmtError


function BluefinShieldconexMgmtError.new(code, msg, ctx)
  local self = setmetatable({}, BluefinShieldconexMgmtError)
  self.is_sdk_error = true
  self.sdk = "BluefinShieldconexMgmt"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function BluefinShieldconexMgmtError:error()
  return self.msg
end


function BluefinShieldconexMgmtError:__tostring()
  return self.msg
end


return BluefinShieldconexMgmtError
