
const envlocal = __dirname + '/../../../.env.local'
require('../../utility').loadEnvLocal(envlocal)

const Path = require('node:path')
const Fs = require('node:fs')

const { test, describe, afterEach } = require('node:test')
const assert = require('node:assert')
const { createLiveTransport } = require('../../live-runner')
const { runLiveEntity } = require('../../live-entity')


const { BluefinShieldconexMgmtSDK, BaseFeature, stdutil, config } = require('../../..')

const {
  envOverride,
  liveClientOptions,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
} = require('../../utility')


describe('CloneEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinShieldconexMgmtSDK.test()
    const ent = testsdk.Clone()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"id":{"a":true,"fo":"int64","h":"Id","n":"id","r":false,"sh":"Unique identifier of newly added element.","t":"`$INTEGER`","key$":"id","index$":0},"name":{"a":true,"h":"Name","n":"name","r":false,"sh":"Name of Template","t":"`$STRING`","key$":"name","index$":1}},"id":{"field":"id","name":"id"},"name":"clone","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /templates/{id}/clone","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"template_id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"POST","o":"/templates/{id}/clone","q":{"exist":["template_id"]},"r":{"param":{"id":"template_id"}},"s":[{"lit":"templates"},{"var":"template_id"},{"lit":"clone"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[["$.main.kit.entity.template"]]},"key$":"clone","name__orig":"clone","Name":"Clone","name_":"clone","name-":"clone","NAME":"CLONE","index$":1}, {"active":true,"entity":"clone","key$":"BasicCloneFlow","kind":"basic","name":"BasicCloneFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"clone_ref01"},"m":{"template_id":"template01"},"o":"create","s":[],"v":[],"index$":0}]}, 'Clone', {"POST /templates/{id}/clone":{"protocol":"http","requestBody":{"description":"Template to be created.","content":{"application/json":{"schema":{"type":"object","properties":{"name":{"type":"string","description":"Name of Template","key$":"name"}},"x-ref":"#/components/schemas/TemplateClone","index$":1}}},"required":true},"parameters":[{"name":"id","in":"path","description":"The Template's unique identifier.","required":true,"schema":{"type":"string","maxLength":20},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const clone_ref01_ent = client.Clone()
    let clone_ref01_data = setup.data.new.clone['clone_ref01']
    clone_ref01_data['template_id'] = setup.idmap['template01']

    clone_ref01_data = (await clone_ref01_ent.create(clone_ref01_data)).data()
    assert(null != clone_ref01_data.id)


  })
})



function basicSetup(extra) {
  // TODO: fix test def options
  const options = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname,
      '../../../../.sdk/test/entity/clone/CloneTestData.json')

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
    ['clone01','clone02','clone03','template01','template02','template03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID': idmap,
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': '',
  })

  idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID']

  const live = 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new BluefinShieldconexMgmtSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
        apikey: env.BLUEFIN_SHIELDCONEX_MGMT_APIKEY,
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when
      // the last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey and
      // server values above and handed the SDK undefined.
      extra || {},
      { system: { fetch: transport.fetch } }
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
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
