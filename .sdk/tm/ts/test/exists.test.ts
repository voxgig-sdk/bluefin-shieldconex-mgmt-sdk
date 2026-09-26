
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BluefinShieldconexMgmtSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = BluefinShieldconexMgmtSDK.test()
    equal(testsdk instanceof BluefinShieldconexMgmtSDK, true,
      'BluefinShieldconexMgmtSDK.test() must return a client synchronously')
  })

})
