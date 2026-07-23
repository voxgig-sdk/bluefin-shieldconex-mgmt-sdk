
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { BluefinShieldconexMgmtSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinShieldconexMgmtSDK.test()
    equal(null !== testsdk, true)
  })

})
