

class BluefinShieldconexMgmtError extends Error {

  isBluefinShieldconexMgmtError = true

  sdk = 'BluefinShieldconexMgmt'

  constructor(code, msg, ctx) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

module.exports = {
  BluefinShieldconexMgmtError
}

