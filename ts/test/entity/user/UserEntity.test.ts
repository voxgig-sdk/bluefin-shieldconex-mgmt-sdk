

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { BluefinShieldconexMgmtSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('UserEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinShieldconexMgmtSDK.test()
    const ent = testsdk.User()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'user.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"client","req":false,"short":"Reference to the associated Client resource.","type":"`$OBJECT`","index$":0},{"active":true,"format":"date-time","name":"created","req":false,"short":"Creation timestamp in ISO 8601 format.","type":"`$STRING`","index$":1},{"active":true,"name":"email","req":false,"type":"`$STRING`","index$":2},{"active":true,"name":"firstName","req":false,"type":"`$STRING`","index$":3},{"active":true,"format":"int64","name":"id","req":false,"short":"This resource's unique identifier.","type":"`$INTEGER`","index$":4},{"active":true,"name":"isActive","req":false,"type":"`$BOOLEAN`","index$":5},{"active":true,"name":"lastName","req":false,"type":"`$STRING`","index$":6},{"active":true,"format":"date-time","name":"modified","req":false,"short":"Last modified timestamp.","type":"`$STRING`","index$":7},{"active":true,"name":"partner","req":false,"short":"Reference to the associated Partner.","type":"`$OBJECT`","index$":8},{"active":true,"name":"phone","req":false,"type":"`$STRING`","index$":9},{"active":true,"name":"userName","req":false,"type":"`$STRING`","index$":10},{"active":true,"name":"userRole","req":false,"short":"Reference to the associated User Role.","type":"`$OBJECT`","index$":11},{"active":true,"name":"version","req":false,"short":"The number of times that this resource has been updated.","type":"`$INTEGER`","index$":12}],"id":{"field":"id","name":"id"},"name":"user","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /users/{id}","json":"{\"operationId\":\"get-user\",\"parameters\":[{\"description\":\"The User's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"maxLength\":20,\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Client's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"format\":\"date-time\",\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"firstName\":{\"type\":\"string\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"format\":\"int64\",\"type\":\"integer\"},\"isActive\":{\"type\":\"boolean\"},\"lastName\":{\"type\":\"string\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"format\":\"date-time\",\"type\":\"string\"},\"partner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"phone\":{\"type\":\"string\"},\"userName\":{\"type\":\"string\"},\"userRole\":{\"description\":\"Reference to the associated User Role.\",\"properties\":{\"name\":{\"description\":\"Role name.\",\"enum\":[\"System Admin\",\"System User\",\"Partner Supervisor\",\"Partner User\",\"Client Admin\",\"Client User\"],\"type\":\"string\"}},\"type\":\"object\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"User details\",\"headers\":{\"X-RateLimit-Limit\":{\"description\":\"Request limit per hour.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Remaining\":{\"description\":\"The number of requests left for the time window.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Reset\":{\"description\":\"The UTC date/time at which the current rate limit window resets.\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}}}},\"401\":{\"content\":{},\"description\":\"Unauthorized\"},\"403\":{\"content\":{},\"description\":\"Forbidden\"},\"404\":{\"content\":{},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"message\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/users/{id}","segments":[{"lit":"users"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"user","name__orig":"user","Name":"User","name_":"user","name-":"user","NAME":"USER","index$":6}, {"active":true,"entity":"user","key$":"BasicUserFlow","kind":"basic","name":"BasicUserFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"user_ref01","srcdatavar":"user_ref01_data","suffix":"_dt0"},"match":{"id":"user01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-user_ref01"}}],"index$":0}]}, 'User')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let user_ref01_data = Object.values(setup.data.existing.user)[0] as any

    // LOAD
    const user_ref01_ent = client.User()
    const user_ref01_match_dt0: any = {}
    user_ref01_match_dt0.id = user_ref01_data.id
    const user_ref01_data_dt0 = (await user_ref01_ent.load(user_ref01_match_dt0)).data()
    assert(user_ref01_data_dt0.id === user_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/user/UserTestData.json')

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
    ['user01','user02','user03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_USER_ENTID': idmap,
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': '',
    'BLUEFIN_SHIELDCONEX_MGMT_SECRET': '',
  })

  idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_USER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_SHIELDCONEX_MGMT_TEST_USER_ENTID']
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
        secret: env.BLUEFIN_SHIELDCONEX_MGMT_SECRET,
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
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
  
