
const { test, describe } = require('node:test')
const { equal } = require('node:assert')


const { BluefinShieldconexMgmtSDK } = require('..')


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await BluefinShieldconexMgmtSDK.test()
    equal(null !== testsdk, true)
  })

})
