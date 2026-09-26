

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


loadEnvLocal(__dirname + '/../../../.env.local')


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

    const live = 'TRUE' === process.env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE
    for (const op of ['list', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'transaction.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"bfid":{"a":true,"h":"Bfid","n":"bfid","r":false,"sh":"BFID","t":"`$STRING`","key$":"bfid","index$":0},"client":{"a":true,"h":"Client","n":"client","r":false,"sh":"Reference to the associated Client resource.","t":"`$OBJECT`","key$":"client","index$":1},"completeDate":{"a":true,"fo":"date-time","h":"Complete Date","n":"completeDate","r":false,"sh":"Timestamp from the beginning of the transaction.","t":"`$STRING`","key$":"completeDate","index$":2},"directPartner":{"a":true,"h":"Direct Partner","n":"directPartner","r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"directPartner","index$":3},"errCode":{"a":true,"h":"Err Code","n":"errCode","r":false,"sh":"The error code that is sent in response to a failed decrypt API call.","t":"`$STRING`","key$":"errCode","index$":4},"errMessage":{"a":true,"h":"Err Message","n":"errMessage","r":false,"sh":"The error messge that is sent in response to a failed decrypt API call.","t":"`$STRING`","key$":"errMessage","index$":5},"id":{"a":true,"fo":"int64","h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$INTEGER`","key$":"id","index$":6},"ipAddress":{"a":true,"h":"Ip Address","n":"ipAddress","r":false,"sh":"The IP address of the http client that makes the decrypt API call.","t":"`$STRING`","key$":"ipAddress","index$":7},"messageId":{"a":true,"h":"Message Id","n":"messageId","r":false,"sh":"Message ID.","t":"`$STRING`","key$":"messageId","index$":8},"partner":{"a":true,"h":"Partner","n":"partner","r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"partner","index$":9},"reference":{"a":true,"h":"Reference","n":"reference","r":false,"sh":"The reference property that the Client includes in the decrypt API call.","t":"`$STRING`","key$":"reference","index$":10},"success":{"a":true,"h":"Success","n":"success","r":false,"sh":"The success indicator.","t":"`$BOOLEAN`","key$":"success","index$":11},"templateId":{"a":true,"fo":"int32","h":"Template Id","n":"templateId","r":false,"sh":"The Template's unique identifier.","t":"`$STRING`","key$":"templateId","index$":12}},"id":{"field":"id","name":"id"},"name":"transaction","op":{"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /transactions","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"client","or":"client","r":false,"t":"`$STRING`","index$":0},{"a":true,"k":"query","n":"date_from","or":"date_from","r":false,"t":"`$STRING`","index$":1},{"a":true,"k":"query","n":"date_to","or":"date_to","r":false,"t":"`$STRING`","index$":2},{"a":true,"k":"query","n":"message_id","or":"message_id","r":false,"t":"`$STRING`","index$":3},{"a":true,"k":"query","n":"paging_mode","or":"paging_mode","r":false,"t":"`$STRING`","index$":4},{"a":true,"k":"query","n":"partner","or":"partner","r":false,"t":"`$STRING`","index$":5},{"a":true,"k":"query","n":"reference","or":"reference","r":false,"t":"`$STRING`","index$":6},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":7},{"a":true,"k":"query","n":"success","or":"success","r":false,"t":"`$BOOLEAN`","index$":8},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":9},{"a":true,"k":"query","n":"transaction_type","or":"transaction_type","r":false,"t":"`$STRING`","index$":10}]},"k":"http","m":"GET","o":"/transactions","q":{"exist":["client","date_from","date_to","message_id","paging_mode","partner","reference","skip","success","take","transaction_type"]},"r":{},"s":[{"lit":"transactions"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /transactions/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}],"query":[{"a":true,"k":"query","n":"transaction_type","or":"transaction_type","r":false,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/transactions/{id}","q":{"exist":["id","transaction_type"]},"r":{},"s":[{"lit":"transactions"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"transaction","name__orig":"transaction","Name":"Transaction","name_":"transaction","name-":"transaction","NAME":"TRANSACTION","index$":4}, {"active":true,"entity":"transaction","key$":"BasicTransactionFlow","kind":"basic","name":"BasicTransactionFlow","param":{},"step":[{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"transaction_ref01"}}],"index$":0},{"a":true,"d":{},"i":{"ref":"transaction_ref01","srcdatavar":"transaction_ref01_data","suffix":"_dt0"},"m":{"id":"transaction01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-transaction_ref01"}}],"index$":1}]}, 'Transaction', {"GET /transactions":{"protocol":"http","parameters":[{"name":"transactionType","in":"query","description":"Transaction Type. Detokenization = 4, Tokenization = 5, 3DS = 6, Other = empty","schema":{"type":"string","enum":["4","5","6"]},"index$":0},{"name":"partner","in":"query","description":"Filter the list by Partner. The parameter value can be either a Partner ID or Name.","schema":{"type":"string","maxLength":255},"index$":1},{"name":"client","in":"query","description":"Filter the list by Client. The parameter value can be either a Client ID or Name.","schema":{"type":"string","maxLength":255},"index$":2},{"name":"success","in":"query","description":"Filter the list by success indicator.","schema":{"type":"boolean","enum":[true,false]},"index$":3},{"name":"dateFrom","in":"query","description":"Filter the list by transaction date. Only show transactions that were processed after this date.","schema":{"type":"string","format":"date-time"},"index$":4},{"name":"dateTo","in":"query","description":"Filter the list by transaction date. Only show transactions that were processed before this date.","schema":{"type":"string","format":"date-time"},"index$":5},{"name":"messageId","in":"query","description":"Filter the list by Message ID.","schema":{"type":"string","maxLength":255},"index$":6},{"name":"reference","in":"query","description":"Filter the list by Reference ID.","schema":{"type":"string","maxLength":255},"index$":7},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":8},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":9},{"name":"paging.mode","in":"query","description":"Toggles the total count in the response.","schema":{"type":"string","enum":["nocount","full"]},"index$":10}]},"GET /transactions/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"Transaction id.","required":true,"schema":{"type":"string","maxLength":20},"index$":0},{"name":"transactionType","in":"query","description":"Transaction Type. Detokenization = 4, Tokenization = 5, 3DS = 6, Other = empty","schema":{"type":"string","enum":["4","5","6"]},"index$":1}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let transaction_ref01_data = Object.values(setup.data.existing.transaction)[0] as any

    // LIST
    const transaction_ref01_ent = client.Transaction()
    const transaction_ref01_match: any = {}

    const transaction_ref01_list = (await transaction_ref01_ent.list(transaction_ref01_match)).map((e: any) => e.data())


    // LOAD
    const transaction_ref01_match_dt0: any = {}
    transaction_ref01_match_dt0.id = transaction_ref01_data.id
    const transaction_ref01_data_dt0 = (await transaction_ref01_ent.load(transaction_ref01_match_dt0)).data()
    assert(transaction_ref01_data_dt0.id === transaction_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

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
    'BLUEFIN_SHIELDCONEX_MGMT_SECRET': '',
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
  
