
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe } = require('node:test')
const assert = require('node:assert')


const { BluefinShieldconexMgmtSDK, BaseFeature, stdutil, config } = require('../../..')

const {
  envOverride,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
} = require('../../utility')


describe('TransactionEntity', async () => {

  test('instance', async () => {
    const testsdk = BluefinShieldconexMgmtSDK.test()
    const ent = testsdk.Transaction()
    assert(null != ent)
  })


  // Feature #4: the entity `stream(action, ...)` method runs the op pipeline
  // and returns an async iterator over result items. With the streaming
  // feature active it yields the feature's incremental output; otherwise it
  // falls back to the materialised list so `stream` always yields.
  test('stream', async () => {
    const seed = {
      entity: {
        transaction: { s1: { id: 's1' }, s2: { id: 's2' }, s3: { id: 's3' } }
      }
    }

    // Fallback: streaming inactive -> yields the materialised list items.
    const base = BluefinShieldconexMgmtSDK.test(seed)
    const seen = []
    for await (const item of base.Transaction().stream('list')) {
      seen.push(item)
    }
    assert.equal(seen.length, 3)

    // Inbound: streaming active -> yields each item from the feature iterator.
    if (config.feature && config.feature.streaming) {
      const sdk = BluefinShieldconexMgmtSDK.test(seed, { feature: { streaming: { active: true } } })
      const got = []
      for await (const item of sdk.Transaction().stream('list')) {
        if (Array.isArray(item)) { got.push(...item) } else { got.push(item) }
      }
      assert.equal(got.length, 3)
    }
  })


  test('basic', async () => {

    const setup = basicSetup()
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let transaction_ref01_data = Object.values(setup.data.existing.transaction)[0]

    // LIST
    const transaction_ref01_ent = client.Transaction()
    const transaction_ref01_match = {}

    const transaction_ref01_list = await transaction_ref01_ent.list(transaction_ref01_match)


    // LOAD
    const transaction_ref01_match_dt0 = {}
    transaction_ref01_match_dt0.id = transaction_ref01_data.id
    const transaction_ref01_data_dt0 = await transaction_ref01_ent.load(transaction_ref01_match_dt0)
    assert(transaction_ref01_data_dt0.id === transaction_ref01_data.id)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/transaction/TransactionTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = BluefinShieldconexMgmtSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['transaction01','transaction02','transaction03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_TRANSACTION_ENTID': idmap,
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_TRANSACTION_ENTID']

  if ('TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE) {
    client = new BluefinShieldconexMgmtSDK(merge([
      {
        apikey: env.BLUEFIN_SHIELDCONEX_MGMT_APIKEY,
      },
      extra
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN,
    now: Date.now(),
  }

  return setup
}
  
