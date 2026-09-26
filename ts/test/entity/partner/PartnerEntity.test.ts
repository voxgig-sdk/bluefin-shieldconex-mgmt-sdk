

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


describe('PartnerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinShieldconexMgmtSDK.test()
    const ent = testsdk.Partner()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE
    for (const op of ['create', 'list', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'partner.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"billingId":{"a":true,"h":"Billing Id","n":"billingId","r":false,"sh":"The Partner's billing identifier.","t":"`$STRING`","key$":"billingId","index$":0},"contact":{"a":true,"h":"Contact","n":"contact","op":{"create":{"req":true,"type":"`$OBJECT`"},"list":{"req":true,"type":"`$OBJECT`"}},"r":false,"t":"`$OBJECT`","key$":"contact","index$":1},"created":{"a":true,"fo":"date-time","h":"Created","n":"created","r":false,"sh":"Creation timestamp in ISO 8601 format.","t":"`$STRING`","key$":"created","index$":2},"id":{"a":true,"fo":"int64","h":"Id","n":"id","r":false,"sh":"This resource's unique identifier.","t":"`$INTEGER`","key$":"id","index$":3},"isActive":{"a":true,"h":"Is Active","n":"isActive","r":false,"sh":"This property indicates if the Parter account is active or disabled.","t":"`$BOOLEAN`","key$":"isActive","index$":4},"modified":{"a":true,"fo":"date-time","h":"Modified","n":"modified","r":false,"sh":"Last modified timestamp.","t":"`$STRING`","key$":"modified","index$":5},"name":{"a":true,"h":"Name","n":"name","op":{"create":{"req":true,"type":"`$STRING`"}},"r":false,"sh":"The Partner's name.","t":"`$STRING`","key$":"name","index$":6},"parent":{"a":true,"h":"Parent","n":"parent","op":{"create":{"req":true,"type":"`$OBJECT`"}},"r":false,"sh":"Reference to the associated Partner.","t":"`$OBJECT`","key$":"parent","index$":7},"reference":{"a":true,"h":"Reference","n":"reference","r":false,"sh":"The Partner's reference string.","t":"`$STRING`","key$":"reference","index$":8},"verificationPhrase":{"a":true,"h":"Verification Phrase","n":"verificationPhrase","r":false,"sh":"The verification phrase is a message that the Partner creates.","t":"`$STRING`","key$":"verificationPhrase","index$":9},"version":{"a":true,"h":"Version","n":"version","r":false,"sh":"The number of times that this resource has been updated.","t":"`$INTEGER`","key$":"version","index$":10}},"id":{"field":"id","name":"id"},"name":"partner","op":{"create":{"input":"data","name":"create","points":[{"a":true,"co":{"id":"POST /partners","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"billing_id","or":"billing_id","r":true,"t":"`$STRING`","index$":0},{"a":true,"k":"query","n":"contact_email","or":"contact_email","r":true,"t":"`$STRING`","index$":1},{"a":true,"k":"query","n":"contact_first_name","or":"contact_first_name","r":true,"t":"`$STRING`","index$":2},{"a":true,"k":"query","n":"contact_is_active","or":"contact_is_active","r":true,"t":"`$BOOLEAN`","index$":3},{"a":true,"k":"query","n":"contact_last_name","or":"contact_last_name","r":true,"t":"`$STRING`","index$":4},{"a":true,"k":"query","n":"contact_phone","or":"contact_phone","r":true,"t":"`$STRING`","index$":5},{"a":true,"k":"query","n":"contact_send_welcome_email","or":"contact_send_welcome_email","r":true,"t":"`$BOOLEAN`","index$":6},{"a":true,"k":"query","n":"contact_user_name","or":"contact_user_name","r":true,"t":"`$STRING`","index$":7},{"a":true,"k":"query","n":"contact_user_role","or":"contact_user_role","r":true,"t":"`$STRING`","index$":8},{"a":true,"k":"query","n":"is_active","or":"is_active","r":true,"t":"`$BOOLEAN`","index$":9},{"a":true,"k":"query","n":"name","or":"name","r":true,"t":"`$STRING`","index$":10},{"a":true,"k":"query","n":"parent_id","or":"parent_id","r":false,"t":"`$INTEGER`","index$":11},{"a":true,"k":"query","n":"parent_name","or":"parent_name","r":false,"t":"`$STRING`","index$":12},{"a":true,"k":"query","n":"reference","or":"reference","r":true,"t":"`$STRING`","index$":13},{"a":true,"k":"query","n":"verification_phrase","or":"verification_phrase","r":false,"t":"`$STRING`","index$":14}]},"k":"http","m":"POST","o":"/partners","q":{"exist":["billing_id","contact_email","contact_first_name","contact_is_active","contact_last_name","contact_phone","contact_send_welcome_email","contact_user_name","contact_user_role","is_active","name","parent_id","parent_name","reference","verification_phrase"]},"r":{},"s":[{"lit":"partners"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"},"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /partners","source":"openapi3","version":2},"g":{"query":[{"a":true,"k":"query","n":"partner","or":"partner","r":false,"t":"`$STRING`","index$":0},{"a":true,"ex":0,"k":"query","n":"skip","or":"skip","r":false,"t":"`$INTEGER`","index$":1},{"a":true,"ex":10,"k":"query","n":"take","or":"take","r":false,"t":"`$INTEGER`","index$":2}]},"k":"http","m":"GET","o":"/partners","q":{"exist":["partner","skip","take"]},"r":{},"s":[{"lit":"partners"}],"t":{"req":"`reqdata`","res":"`body.data`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"a":true,"co":{"id":"GET /partners/{id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/partners/{id}","q":{"exist":["id"]},"r":{},"s":[{"lit":"partners"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"partner","name__orig":"partner","Name":"Partner","name_":"partner","name-":"partner","NAME":"PARTNER","index$":2}, {"active":true,"entity":"partner","key$":"BasicPartnerFlow","kind":"basic","name":"BasicPartnerFlow","param":{},"step":[{"a":true,"d":{},"i":{"ref":"partner_ref01"},"m":{},"o":"create","s":[],"v":[],"index$":0},{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"partner_ref01"}}],"index$":1},{"a":true,"d":{},"i":{"ref":"partner_ref01","srcdatavar":"partner_ref01_data","suffix":"_dt0"},"m":{"id":"partner01"},"o":"load","s":[],"v":[{"apply":"TextFieldMark","def":{"mark":"Mark01-partner_ref01"}}],"index$":2}]}, 'Partner', {"POST /partners":{"protocol":"http","requestBody":{"description":"Partner to be created.","content":{"application/json":{"schema":{"required":["contact","name","parent"],"type":"object","properties":{"name":{"maxLength":255,"type":"string","description":"The Partner's name.","key$":"name"},"reference":{"maxLength":255,"type":"string","description":"The Partner's reference string. This reference is used in to identify the Partner on the Decryption APIs. It equates to the Partner ID.","key$":"reference"},"billingId":{"maxLength":50,"type":"string","description":"The Partner's billing identifier.","key$":"billingId"},"verificationPhrase":{"type":"string","description":"The verification phrase is a message that the Partner creates. It can be used as a mechanism to authorize a partner when they initiate communication over the phone.","key$":"verificationPhrase"},"isActive":{"type":"boolean","description":"This property indicates if the Parter account is active or disabled.","key$":"isActive"},"parent":{"type":"object","properties":{"id":{"description":"The referenced Partner's ID.","format":"int64","type":"integer"},"name":{"description":"The referenced Partner's name.","type":"string"}},"description":"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.","x-ref":"#/components/schemas/PartnerReference","key$":"parent"},"contact":{"required":["email","firstName","lastName","phone","userName"],"type":"object","properties":{"userName":{"maxLength":255,"type":"string","description":"The User's unique username."},"firstName":{"maxLength":255,"type":"string","description":"The User's name."},"lastName":{"maxLength":255,"type":"string","description":"The User's Surname."},"email":{"maxLength":255,"type":"string","description":"The User's email address."},"phone":{"maxLength":255,"type":"string","description":"The User's phone number without dashes, spaces, or brackets (e.g. +14155552671)."},"userRole":{"type":"string","enum":["Partner Supervisor","Partner User","Client Admin","Client User"],"description":"Reference to the associated User Role."},"isActive":{"type":"boolean","description":"This property indicates if the User account is active or disabled. Once a user has logged into the system, their account cannot be deleted. As an alternative, their account can be set to inactive."},"sendWelcomeEmail":{"type":"boolean","description":"If this property is set to 'true' the newly created user will be sent a welcome email."}},"x-ref":"#/components/schemas/UserCreateInline","key$":"contact"}},"x-ref":"#/components/schemas/PartnerCreate","index$":1}}},"required":true},"parameters":[{"name":"name","in":"query","required":true,"schema":{"type":"string"},"description":"The name of the entity.","index$":0},{"name":"reference","in":"query","required":true,"schema":{"type":"string"},"description":"A reference identifier for the entity. It's recommended that uuidv4 format be used.","index$":1},{"name":"billingId","in":"query","required":true,"schema":{"type":"string"},"description":"Billing identifier associated with the entity.","index$":2},{"name":"verificationPhrase","in":"query","required":false,"schema":{"type":"string"},"description":"A phrase used for verification purposes when calling to request a change to the Partner.","index$":3},{"name":"isActive","in":"query","required":true,"schema":{"type":"boolean"},"description":"Status indicating if the Partner is active.","index$":4},{"name":"parent.id","in":"query","required":false,"schema":{"type":"integer","format":"int32"},"description":"Identifier of the parent Partner.","index$":5},{"name":"parent.name","in":"query","required":false,"schema":{"type":"string"},"description":"Name of the parent Partner.","index$":6},{"name":"contact.userName","in":"query","required":true,"schema":{"type":"string"},"description":"Username of the contact.","index$":7},{"name":"contact.firstName","in":"query","required":true,"schema":{"type":"string"},"description":"First name of the contact.","index$":8},{"name":"contact.lastName","in":"query","required":true,"schema":{"type":"string"},"description":"Last name of the contact.","index$":9},{"name":"contact.email","in":"query","required":true,"schema":{"type":"string","format":"email"},"description":"Email address of the contact.","index$":10},{"name":"contact.phone","in":"query","required":true,"schema":{"type":"string"},"description":"Phone number of the contact.","index$":11},{"name":"contact.userRole","in":"query","required":true,"schema":{"type":"string","enum":["Partner Supervisor"]},"description":"Role of the contact within the organization.","index$":12},{"name":"contact.isActive","in":"query","required":true,"schema":{"type":"boolean"},"description":"Indicates if the contact is currently active.","index$":13},{"name":"contact.sendWelcomeEmail","in":"query","required":true,"schema":{"type":"boolean"},"description":"Indicates if a welcome email should be sent to the contact.","index$":14}]},"GET /partners":{"protocol":"http","parameters":[{"name":"partner","in":"query","description":"Filter the list by Partner. The parameter value can be either a Partner ID or Name.","schema":{"type":"string","maxLength":255},"index$":0},{"name":"take","in":"query","description":"The number of entries to include in the list.","schema":{"type":"integer","format":"int32","default":10},"index$":1},{"name":"skip","in":"query","description":"The number of results to skip before listing entries.","schema":{"type":"integer","format":"int32","default":0},"index$":2}]},"GET /partners/{id}":{"protocol":"http","parameters":[{"name":"id","in":"path","description":"Partner id.","required":true,"schema":{"type":"string","maxLength":20},"index$":0}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const partner_ref01_ent = client.Partner()
    let partner_ref01_data = setup.data.new.partner['partner_ref01']

    partner_ref01_data = (await partner_ref01_ent.create(partner_ref01_data)).data()
    assert(null != partner_ref01_data.id)


    // LIST
    const partner_ref01_match: any = {}

    const partner_ref01_list = (await partner_ref01_ent.list(partner_ref01_match)).map((e: any) => e.data())

    assert(!isempty(select(partner_ref01_list, { id: partner_ref01_data.id })))


    // LOAD
    const partner_ref01_match_dt0: any = {}
    partner_ref01_match_dt0.id = partner_ref01_data.id
    const partner_ref01_data_dt0 = (await partner_ref01_ent.load(partner_ref01_match_dt0)).data()
    assert(partner_ref01_data_dt0.id === partner_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/partner/PartnerTestData.json')

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
    ['partner01','partner02','partner03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_PARTNER_ENTID': idmap,
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': '',
    'BLUEFIN_SHIELDCONEX_MGMT_SECRET': '',
  })

  idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_PARTNER_ENTID']

  const live = 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['BLUEFIN_SHIELDCONEX_MGMT_TEST_PARTNER_ENTID']
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
  
