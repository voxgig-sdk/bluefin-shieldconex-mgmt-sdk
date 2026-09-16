
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


describe('TransactionEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinShieldconexMgmtSDK.test()
    const ent = testsdk.Transaction()
    assert(null != ent)
  })


  test('basic', async (t) => {

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"bfid","req":false,"short":"BFID","type":"`$STRING`","index$":0},{"active":true,"name":"client","req":false,"short":"Reference to the associated Client resource.","type":"`$OBJECT`","index$":1},{"active":true,"format":"date-time","name":"completeDate","req":false,"short":"Timestamp from the beginning of the transaction.","type":"`$STRING`","index$":2},{"active":true,"name":"directPartner","req":false,"short":"Reference to the associated Partner.","type":"`$OBJECT`","index$":3},{"active":true,"name":"errCode","req":false,"short":"The error code that is sent in response to a failed decrypt API call.","type":"`$STRING`","index$":4},{"active":true,"name":"errMessage","req":false,"short":"The error messge that is sent in response to a failed decrypt API call.","type":"`$STRING`","index$":5},{"active":true,"format":"int64","name":"id","req":false,"short":"This resource's unique identifier.","type":"`$INTEGER`","index$":6},{"active":true,"name":"ipAddress","req":false,"short":"The IP address of the http client that makes the decrypt API call.","type":"`$STRING`","index$":7},{"active":true,"name":"messageId","req":false,"short":"Message ID.","type":"`$STRING`","index$":8},{"active":true,"name":"partner","req":false,"short":"Reference to the associated Partner.","type":"`$OBJECT`","index$":9},{"active":true,"name":"reference","req":false,"short":"The reference property that the Client includes in the decrypt API call.","type":"`$STRING`","index$":10},{"active":true,"name":"success","req":false,"short":"The success indicator.","type":"`$BOOLEAN`","index$":11},{"active":true,"format":"int32","name":"templateId","req":false,"short":"The Template's unique identifier.","type":"`$STRING`","index$":12}],"id":{"field":"id","name":"id"},"name":"transaction","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"client","orig":"client","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"kind":"query","name":"date_from","orig":"date_from","reqd":false,"type":"`$STRING`","index$":1},{"active":true,"kind":"query","name":"date_to","orig":"date_to","reqd":false,"type":"`$STRING`","index$":2},{"active":true,"kind":"query","name":"message_id","orig":"message_id","reqd":false,"type":"`$STRING`","index$":3},{"active":true,"kind":"query","name":"paging_mode","orig":"paging_mode","reqd":false,"type":"`$STRING`","index$":4},{"active":true,"kind":"query","name":"partner","orig":"partner","reqd":false,"type":"`$STRING`","index$":5},{"active":true,"kind":"query","name":"reference","orig":"reference","reqd":false,"type":"`$STRING`","index$":6},{"active":true,"example":0,"kind":"query","name":"skip","orig":"skip","reqd":false,"type":"`$INTEGER`","index$":7},{"active":true,"kind":"query","name":"success","orig":"success","reqd":false,"type":"`$BOOLEAN`","index$":8},{"active":true,"example":10,"kind":"query","name":"take","orig":"take","reqd":false,"type":"`$INTEGER`","index$":9},{"active":true,"kind":"query","name":"transaction_type","orig":"transaction_type","reqd":false,"type":"`$STRING`","index$":10}]},"contract":{"id":"GET /transactions","json":"{\"operationId\":\"list-transactions\",\"parameters\":[{\"description\":\"Transaction Type. Detokenization = 4, Tokenization = 5, 3DS = 6, Other = empty\",\"in\":\"query\",\"name\":\"transactionType\",\"schema\":{\"enum\":[\"4\",\"5\",\"6\"],\"type\":\"string\"}},{\"description\":\"Filter the list by Partner. The parameter value can be either a Partner ID or Name.\",\"in\":\"query\",\"name\":\"partner\",\"schema\":{\"maxLength\":255,\"type\":\"string\"}},{\"description\":\"Filter the list by Client. The parameter value can be either a Client ID or Name.\",\"in\":\"query\",\"name\":\"client\",\"schema\":{\"maxLength\":255,\"type\":\"string\"}},{\"description\":\"Filter the list by success indicator.\",\"in\":\"query\",\"name\":\"success\",\"schema\":{\"enum\":[true,false],\"type\":\"boolean\"}},{\"description\":\"Filter the list by transaction date. Only show transactions that were processed after this date.\",\"in\":\"query\",\"name\":\"dateFrom\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}},{\"description\":\"Filter the list by transaction date. Only show transactions that were processed before this date.\",\"in\":\"query\",\"name\":\"dateTo\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}},{\"description\":\"Filter the list by Message ID.\",\"in\":\"query\",\"name\":\"messageId\",\"schema\":{\"maxLength\":255,\"type\":\"string\"}},{\"description\":\"Filter the list by Reference ID.\",\"in\":\"query\",\"name\":\"reference\",\"schema\":{\"maxLength\":255,\"type\":\"string\"}},{\"description\":\"The number of entries to include in the list.\",\"in\":\"query\",\"name\":\"take\",\"schema\":{\"default\":10,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"The number of results to skip before listing entries.\",\"in\":\"query\",\"name\":\"skip\",\"schema\":{\"default\":0,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"Toggles the total count in the response.\",\"in\":\"query\",\"name\":\"paging.mode\",\"schema\":{\"enum\":[\"nocount\",\"full\"],\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"data\":{\"description\":\"Transaction list items\",\"items\":{\"properties\":{\"bfid\":{\"description\":\"BFID\",\"type\":\"string\"},\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Client's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"completeDate\":{\"description\":\"Timestamp of the transaction.\",\"format\":\"date-time\",\"type\":\"string\"},\"directPartner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"format\":\"int64\",\"type\":\"integer\"},\"messageId\":{\"description\":\"Message ID.\",\"type\":\"string\"},\"partner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"reference\":{\"description\":\"The reference property that the Client includes in the decrypt API call.\",\"type\":\"string\"},\"success\":{\"description\":\"The success indicator.\",\"type\":\"boolean\"},\"templateId\":{\"description\":\"A Template's unique identifier.\",\"format\":\"int32\",\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"},\"total\":{\"description\":\"Total number of transactions available\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Transactions list\",\"headers\":{\"X-RateLimit-Limit\":{\"description\":\"Request limit per hour.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Remaining\":{\"description\":\"The number of requests left for the time window.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Reset\":{\"description\":\"The UTC date/time at which the current rate limit window resets.\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}}}},\"401\":{\"content\":{},\"description\":\"Unauthorized\"},\"403\":{\"content\":{},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"errors\":{\"properties\":{\"[attribute name]\":{\"description\":\"\",\"properties\":{\"attribute\":{\"description\":\"Invalid attribute name\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"type\":\"integer\"},\"message\":{\"description\":\"Invalid attribute description\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"message\":{\"type\":\"string\"},\"success\":{\"default\":false,\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"message\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/transactions","segments":[{"lit":"transactions"}],"select":{"exist":["client","date_from","date_to","message_id","paging_mode","partner","reference","skip","success","take","transaction_type"]},"transform":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}],"query":[{"active":true,"kind":"query","name":"transaction_type","orig":"transaction_type","reqd":false,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /transactions/{id}","json":"{\"operationId\":\"get-transaction\",\"parameters\":[{\"description\":\"Transaction id.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"maxLength\":20,\"type\":\"string\"}},{\"description\":\"Transaction Type. Detokenization = 4, Tokenization = 5, 3DS = 6, Other = empty\",\"in\":\"query\",\"name\":\"transactionType\",\"schema\":{\"enum\":[\"4\",\"5\",\"6\"],\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"bfid\":{\"description\":\"BFID\",\"type\":\"string\"},\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Client's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"completeDate\":{\"description\":\"Timestamp from the beginning of the transaction.\",\"format\":\"date-time\",\"type\":\"string\"},\"directPartner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"errCode\":{\"description\":\"The error code that is sent in response to a failed decrypt API call.\",\"maxLength\":255,\"type\":\"string\"},\"errMessage\":{\"description\":\"The error messge that is sent in response to a failed decrypt API call.\",\"type\":\"string\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"format\":\"int64\",\"type\":\"integer\"},\"ipAddress\":{\"description\":\"The IP address of the http client that makes the decrypt API call.\",\"type\":\"string\"},\"messageId\":{\"description\":\"Message ID.\",\"type\":\"string\"},\"partner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"reference\":{\"description\":\"The reference property that the Client includes in the decrypt API call.\",\"type\":\"string\"},\"success\":{\"description\":\"The success indicator.\",\"type\":\"boolean\"},\"templateId\":{\"description\":\"The Template's unique identifier.\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Transaction details\",\"headers\":{\"X-RateLimit-Limit\":{\"description\":\"Request limit per hour.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Remaining\":{\"description\":\"The number of requests left for the time window.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Reset\":{\"description\":\"The UTC date/time at which the current rate limit window resets.\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}}}},\"401\":{\"content\":{},\"description\":\"Unauthorized\"},\"403\":{\"content\":{},\"description\":\"Forbidden\"},\"404\":{\"content\":{},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"message\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/transactions/{id}","segments":[{"lit":"transactions"},{"var":"id"}],"select":{"exist":["id","transaction_type"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"transaction","name__orig":"transaction","Name":"Transaction","name_":"transaction","name-":"transaction","NAME":"TRANSACTION","index$":4}, {"active":true,"entity":"transaction","key$":"BasicTransactionFlow","kind":"basic","name":"BasicTransactionFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"transaction_ref01"}}],"index$":0},{"active":true,"data":{},"input":{"ref":"transaction_ref01","srcdatavar":"transaction_ref01_data","suffix":"_dt0"},"match":{"id":"transaction01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-transaction_ref01"}}],"index$":1}]}, 'Transaction')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let transaction_ref01_data = Object.values(setup.data.existing.transaction)[0]

    // LIST
    const transaction_ref01_ent = client.Transaction()
    const transaction_ref01_match = {}

    const transaction_ref01_list = (await transaction_ref01_ent.list(transaction_ref01_match)).map((e) => e.data())


    // LOAD
    const transaction_ref01_match_dt0 = {}
    transaction_ref01_match_dt0.id = transaction_ref01_data.id
    const transaction_ref01_data_dt0 = (await transaction_ref01_ent.load(transaction_ref01_match_dt0)).data()
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
    'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': '',
  })

  idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_TRANSACTION_ENTID']

  const live = 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE
  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_SHIELDCONEX_MGMT_TEST_TRANSACTION_ENTID']
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
  
