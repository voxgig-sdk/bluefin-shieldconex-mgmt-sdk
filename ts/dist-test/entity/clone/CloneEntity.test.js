"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('CloneEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinShieldconexMgmtSDK.test();
        const ent = testsdk.Clone();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE;
        for (const op of ['create']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'clone.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "format": "int64", "name": "id", "req": false, "short": "Unique identifier of newly added element.", "type": "`$INTEGER`", "index$": 0 }, { "active": true, "name": "name", "req": false, "short": "Name of Template", "type": "`$STRING`", "index$": 1 }], "id": { "field": "id", "name": "id" }, "name": "clone", "op": { "create": { "input": "data", "name": "create", "points": [{ "active": true, "args": { "params": [{ "active": true, "kind": "param", "name": "template_id", "orig": "id", "reqd": true, "type": "`$STRING`", "index$": 0 }] }, "contract": { "id": "POST /templates/{id}/clone", "json": "{\"operationId\":\"clone-template\",\"parameters\":[{\"description\":\"The Template's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"maxLength\":20,\"type\":\"string\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"name\":{\"description\":\"Name of Template\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Template to be created.\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"id\":{\"description\":\"Unique identifier of newly added element.\",\"format\":\"int64\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Template create response\",\"headers\":{\"X-RateLimit-Limit\":{\"description\":\"Request limit per hour.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Remaining\":{\"description\":\"The number of requests left for the time window.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Reset\":{\"description\":\"The UTC date/time at which the current rate limit window resets.\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}}}},\"401\":{\"content\":{},\"description\":\"Unauthorized\"},\"403\":{\"content\":{},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"errors\":{\"properties\":{\"[attribute name]\":{\"description\":\"\",\"properties\":{\"attribute\":{\"description\":\"Invalid attribute name\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"type\":\"integer\"},\"message\":{\"description\":\"Invalid attribute description\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"message\":{\"type\":\"string\"},\"success\":{\"default\":false,\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"message\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/templates/{id}/clone", "rename": { "param": { "id": "template_id" } }, "segments": [{ "lit": "templates" }, { "var": "template_id" }, { "lit": "clone" }], "select": { "exist": ["template_id"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" } }, "relations": { "ancestors": [["template"]] }, "key$": "clone", "name__orig": "clone", "Name": "Clone", "name_": "clone", "name-": "clone", "NAME": "CLONE", "index$": 1 }, { "active": true, "entity": "clone", "key$": "BasicCloneFlow", "kind": "basic", "name": "BasicCloneFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "clone_ref01" }, "match": { "template_id": "template01" }, "op": "create", "spec": [], "valid": [], "index$": 0 }] }, 'Clone');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const clone_ref01_ent = client.Clone();
        let clone_ref01_data = setup.data.new.clone['clone_ref01'];
        clone_ref01_data['template_id'] = setup.idmap['template01'];
        clone_ref01_data = (await clone_ref01_ent.create(clone_ref01_data)).data();
        (0, node_assert_1.default)(null != clone_ref01_data.id);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/clone/CloneTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinShieldconexMgmtSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['clone01', 'clone02', 'clone03', 'template01', 'template02', 'template03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID': idmap,
        'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
        'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
        'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': '',
        'BLUEFIN_SHIELDCONEX_MGMT_SECRET': '',
    });
    idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLONE_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.BluefinShieldconexMgmtSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
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
        ]));
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
    };
    return setup;
}
//# sourceMappingURL=CloneEntity.test.js.map