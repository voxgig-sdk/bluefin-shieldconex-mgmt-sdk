
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'


import { BluefinShieldconexMgmtSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


describe('TemplateEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when BLUEFINSHIELDCONEXMGMT_TEST_LIVE=TRUE.
  afterEach(liveDelay('BLUEFINSHIELDCONEXMGMT_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = BluefinShieldconexMgmtSDK.test()
    const ent = testsdk.Template()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE
    for (const op of ['create', 'list', 'load', 'remove']) {
      if (maybeSkipControl(t, 'entityOp', 'template.' + op, live)) return
    }

    const setup = basicSetup()
    // The basic flow consumes synthetic IDs and field values from the
    // fixture (entity TestData.json). Those don't exist on the live API.
    // Skip live runs unless the user provided a real ENTID env override.
    if (setup.syntheticOnly) {
      t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID JSON to run live')
      return
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const template_ref01_ent = client.Template()
    let template_ref01_data = setup.data.new.template['template_ref01']

    template_ref01_data = await template_ref01_ent.create(template_ref01_data)
    assert(null != template_ref01_data.id)


    // LIST
    const template_ref01_match: any = {}

    const template_ref01_list = await template_ref01_ent.list(template_ref01_match)

    assert(!isempty(select(template_ref01_list, { id: template_ref01_data.id })))


    // LOAD
    const template_ref01_match_dt0: any = {}
    template_ref01_match_dt0.id = template_ref01_data.id
    const template_ref01_data_dt0 = await template_ref01_ent.load(template_ref01_match_dt0)
    assert(template_ref01_data_dt0.id === template_ref01_data.id)


    // REMOVE
    const template_ref01_match_rm0: any = { id: template_ref01_data.id }
    await template_ref01_ent.remove(template_ref01_match_rm0)
  

    // LIST
    const template_ref01_match_rt0: any = {}

    const template_ref01_list_rt0 = await template_ref01_ent.list(template_ref01_match_rt0)

    assert(isempty(select(template_ref01_list_rt0, { id: template_ref01_data.id })))


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/template/TemplateTestData.json')

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
    ['template01','template02','template03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  const idmapEnvVal = process.env['BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID']
  const idmapOverridden = null != idmapEnvVal && idmapEnvVal.trim().startsWith('{')

  const env = envOverride({
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID': idmap,
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': 'NONE',
  })

  idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID']

  const live = 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE

  if (live) {
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
    live,
    syntheticOnly: live && !idmapOverridden,
    now: Date.now(),
  }

  return setup
}
  
