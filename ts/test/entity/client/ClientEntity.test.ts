

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


describe('ClientEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinShieldconexMgmtSDK.test()
    const ent = testsdk.Client()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE
    for (const op of ['create', 'list', 'load', 'remove']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'client.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"billingId":{"a":true,"h":"Billing Id","n":"billingId","r":false,"sh":"Billing ID","t":"`$STRING`","key$":"billingId","index$":0},"contact":{"a":true,"h":"Contact","n":"contact","op":{"create":{"req":true,"type":"`$OBJECT`"},"list":{"req":true,"type":"`$OBJECT`"}},"r":false,"t":"`$OBJECT`","key$":"contact","index$":1},"created":{"a":true,"fo":"date-time","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":2},"directPartner":{"a":true,"h":"Direct Partner","n":"directPartner","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"directPartner","index$":3},"id":{"a":true,"fo":"int64","h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$INTEGER`","key$":"id","index$":4},"isActive":{"a":true,"h":"Is Active","n":"isActive","r":false,"sh":"This property indicates if the Client account is active or disabled.","t":"`$BOOLEAN`","key$":"isActive","index$":5},"mid":{"a":true,"h":"Mid","n":"mid","r":false,"sh":"Some Partners will have an merchant ids on their own software offerings.","t":"`$STRING`","key$":"mid","index$":6},"modified":{"a":true,"fo":"date-time","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":7},"name":{"a":true,"h":"Name","n":"name","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The Client's name.","t":"`$STRING`","key$":"name","index$":8},"partner":{"a":true,"h":"Partner","n":"partner","r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"partner","index$":9},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":10}},"id":{"field":"id","name":"id"},"name":"client","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /clients","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"billing_id","or":"billing_id","r":false,"t":"`$STRING`","index$":0},{"a":true,"k":"query","n":"contact_email","or":"contact_email","r":true,"t":"`$STRING`","index$":1},{"a":true,"k":"query","n":"contact_first_name","or":"contact_first_name","r":true,"t":"`$STRING`","index$":2},{"a":true,"k":"query","n":"contact_is_active","or":"contact_is_active","r":true,"t":"`$BOOLEAN`","index$":3},{"a":true,"k":"query","n":"contact_last_name","or":"contact_last_name","r":true,"t":"`$STRING`","index$":4},{"a":true,"k":"query","n":"contact_phone","or":"contact_phone","r":true,"t":"`$STRING`","index$":5},{"a":true,"k":"query","n":"contact_send_welcome_email","or":"contact_send_welcome_email","r":true,"t":"`$BOOLEAN`","index$":6},{"a":true,"k":"query","n":"contact_user_name","or":"contact_user_name","r":true,"t":"`$STRING`","index$":7},{"a":true,"k":"query","n":"contact_user_role","or":"contact_user_role","r":true,"t":"`$STRING`","index$":8},{"a":true,"k":"query","n":"direct_partner_id","or":"direct_partner_id","r":true,"t":"`$INTEGER`","index$":9},{"a":true,"k":"query","n":"direct_partner_name","or":"direct_partner_name","r":true,"t":"`$STRING`","index$":10},{"a":true,"k":"query","n":"is_active","or":"is_active","r":true,"t":"`$BOOLEAN`","index$":11},{"a":true,"k":"query","n":"mid","or":"mid","r":false,"t":"`$STRING`","index$":12},{"a":true,"k":"query","n":"name","or":"name","r":true,"t":"`$STRING`","index$":13}]},"k":"http","m":"POST","o":"/clients","q":{"exist":["billing_id","contact_email","contact_first_name","contact_is_active","contact_last_name","contact_phone","contact_send_welcome_email","contact_user_name","contact_user_role","direct_partner_id","direct_partner_name","is_active","mid","name"]},"r":{},"s":[{"lit":"clients"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /clients","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"partner","or":"partner","r":true,"t":"`$STRING`","index$":0},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":1},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":2}]},"k":"http","m":"GET","o":"/clients","q":{"exist":["partner","skip","take"]},"r":{},"s":[{"lit":"clients"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /clients/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/clients/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"clients"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"},"remove":{"input":"data","name":"remove","points":[{"a":true,"co":{"id":"DELETE /clients/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"DELETE","o":"/clients/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"clients"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[]},"key$":"client","name__orig":"client","Name":"Client","name_":"client","name-":"client","NAME":"CLIENT","index$":0}, {"active":true,"entity":"client","key$":"BasicClientFlow","kind":"basic","name":"BasicClientFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"client_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"client_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"client_ref01","srcdatavar":"client_ref01_data","suffix":"_dt0"},"m":{"id":"client01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-client_ref01"}}],"index$":2},{"a":true,"d":{},"i":{"ref":"client_ref01","suffix":"_rm0"},"m":{"id":"client01"},"o":"remove","s":[],"v":[],"index$":3},{"a":true,"d":{},"i":{"suffix":"_rt0"},"m":{},"o":"list","s":[],"v":[{"apply":"ItemNotExists","def":{"ref":"client_ref01"}}],"index$":4}]}, 'Client', {"POST /clients":{"protocol":"http","requestBody":{"description":"Client to be created.","content":{"application/json":{"schema":{"required":["contact","directPartner","name"],"type":"object","properties":{"name":{"maxLength":255,"type":"string","description":"The Client's name.","key$":"name"},"billingId":{"maxLength":50,"type":"string","description":"Billing ID","key$":"billingId"},"mid":{"maxLength":50,"type":"string","description":"Some Partners will have an merchant ids on their own software offerings. This is an open field that allows those Partner associate a Client resource with their Merchant Identifier.","key$":"mid"},"isActive":{"type":"boolean","description":"This property indicates if the Client account is active or disabled. It is not possible to delete Clients, however their account can be set to inactive.","key$":"isActive"},"directPartner":{"type":"object","properties":{"id":{"description":"The referenced Partner's ID.","format":"int64","type":"integer"},"name":{"description":"The referenced Partner's name.","type":"string"}},"description":"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/PartnerReference","key$":"directPartner"},"contact":{"required":["email","firstName","lastName","phone","userName"],"type":"object","properties":{"userName":{"maxLength":255,"type":"string","description":"The User's unique username."},"firstName":{"maxLength":255,"type":"string","description":"The User's name."},"lastName":{"maxLength":255,"type":"string","description":"The User's Surname."},"email":{"maxLength":255,"type":"string","description":"The User's email address."},"phone":{"maxLength":255,"type":"string","description":"The User's phone number without dashes, spaces, or brackets (e.g. +14155552671)."},"userRole":{"type":"string","enum":["Partner Supervisor","Partner User","Client Admin","Client User"],"description":"Reference to the associated User Role."},"isActive":{"type":"boolean","description":"This property indicates if the User account is active or disabled. Once a user has logged into the system, their account cannot be deleted. As an alternative, their account can be set to inactive."},"sendWelcomeEmail":{"type":"boolean","description":"If this property is set to 'true' the newly created user will be sent a welcome email."}},"x-ref":"#/components/schemas/UserCreateInline","key$":"contact"}},"x-ref":"#/components/schemas/ClientCreate","index$":1}}},"required":true},"parameters":[{"name":"name","in":"query","required":true,"schema":{"type":"string"},"description":"The name of the client.","index$":0},{"name":"billingId","in":"query","required":false,"schema":{"type":"string"},"description":"Billing identifier associated with the client.","index$":1},{"name":"mid","in":"query","required":false,"schema":{"type":"string"},"description":"Merchant ID associated with the client.","index$":2},{"name":"isActive","in":"query","required":true,"schema":{"type":"boolean"},"description":"Indicates if the client is active.","index$":3},{"name":"directPartner.id","in":"query","required":true,"schema":{"type":"integer","format":"int32"},"description":"Identifier of the direct partner associated with the client.","index$":4},{"name":"directPartner.name","in":"query","required":true,"schema":{"type":"string"},"description":"Name of the direct partner associated with the client.","index$":5},{"name":"contact.userName","in":"query","required":true,"schema":{"type":"string"},"description":"Username of the primary contact.","index$":6},{"name":"contact.firstName","in":"query","required":true,"schema":{"type":"string"},"description":"First name of the primary contact.","index$":7},{"name":"contact.lastName","in":"query","required":true,"schema":{"type":"string"},"description":"Last name of the primary contact.","index$":8},{"name":"contact.email","in":"query","required":true,"schema":{"type":"string","format":"email"},"description":"Email address of the primary contact.","index$":9},{"name":"contact.phone","in":"query","required":true,"schema":{"type":"string"},"description":"Phone number of the primary contact.","index$":10},{"name":"contact.userRole","in":"query","required":true,"schema":{"type":"string","enum":["Partner Supervisor"]},"description":"Role of the primary contact within the organization.","index$":11},{"name":"contact.isActive","in":"query","required":true,"schema":{"type":"boolean"},"description":"Indicates if the primary contact is active.","index$":12},{"name":"contact.sendWelcomeEmail","in":"query","required":true,"schema":{"type":"boolean"},"description":"Indicates if a welcome email should be sent to the contact.","index$":13}]},"GET /clients":{"protocol":"http","parameters":[{"name":"partner","in":"query","description":"Filter the list by Partner. The parameter value can be either a Partner ID or Name.","required":true,"schema":{"type":"string","maxLength":255},"index$":0},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":1},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":2}]},"GET /clients/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Client's unique identifier.","required":true,"schema":{"type":"string","maxLength":20},"index$":0}]},"DELETE /clients/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"The Client's unique identifier.","required":true,"schema":{"type":"string","maxLength":20},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const client_ref01_ent = client.Client()
    let client_ref01_data = setup.data.new.client['client_ref01']

    client_ref01_data = (await client_ref01_ent.create(client_ref01_data)).data()
    assert(null != client_ref01_data.id)


    // LIST
    const client_ref01_match: any = {}

    const client_ref01_list = (await client_ref01_ent.list(client_ref01_match)).map((e: any) => e.data())

    assert(!isempty(select(client_ref01_list, { id: client_ref01_data.id })))


    // LOAD
    const client_ref01_match_dt0: any = {}
    client_ref01_match_dt0.id = client_ref01_data.id
    const client_ref01_data_dt0 = (await client_ref01_ent.load(client_ref01_match_dt0)).data()
    assert(client_ref01_data_dt0.id === client_ref01_data.id)


    // REMOVE
    const client_ref01_match_rm0: any = { id: client_ref01_data.id }
    await client_ref01_ent.remove(client_ref01_match_rm0)
  

    // LIST
    const client_ref01_match_rt0: any = {}

    const client_ref01_list_rt0 = (await client_ref01_ent.list(client_ref01_match_rt0)).map((e: any) => e.data())

    assert(isempty(select(client_ref01_list_rt0, { id: client_ref01_data.id })))


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/client/ClientTestData.json')

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
    ['client01','client02','client03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_CLIENT_ENTID': idmap,
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': '',
    'BLUEFIN_SHIELDCONEX_MGMT_SECRET': '',
  })

  idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLIENT_ENTID']

  const live = 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLIENT_ENTID']
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
  
