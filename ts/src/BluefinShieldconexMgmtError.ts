
import { Context } from './Context'


class BluefinShieldconexMgmtError extends Error {

  isBluefinShieldconexMgmtError = true

  sdk = 'BluefinShieldconexMgmt'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  BluefinShieldconexMgmtError
}

