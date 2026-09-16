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
(0, node_test_1.describe)('ClientEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinShieldconexMgmtSDK.test();
        const ent = testsdk.Client();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE;
        for (const op of ['create', 'list', 'load', 'remove']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'client.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "billingId", "req": false, "short": "Billing ID", "type": "`$STRING`", "index$": 0 }, { "active": true, "name": "contact", "op": { "create": { "req": true, "type": "`$OBJECT`" }, "list": { "req": true, "type": "`$OBJECT`" } }, "req": false, "type": "`$OBJECT`", "index$": 1 }, { "active": true, "format": "date-time", "name": "created", "req": false, "short": "Creation timestamp in ISO 8601 format.", "type": "`$STRING`", "index$": 2 }, { "active": true, "name": "directPartner", "op": { "create": { "req": true, "type": "`$OBJECT`" } }, "req": false, "short": "Reference to the associated Partner.", "type": "`$OBJECT`", "index$": 3 }, { "active": true, "format": "int64", "name": "id", "req": false, "short": "This resource's unique identifier.", "type": "`$INTEGER`", "index$": 4 }, { "active": true, "name": "isActive", "req": false, "short": "This property indicates if the Client account is active or disabled.", "type": "`$BOOLEAN`", "index$": 5 }, { "active": true, "name": "mid", "req": false, "short": "Some Partners will have an merchant ids on their own software offerings.", "type": "`$STRING`", "index$": 6 }, { "active": true, "format": "date-time", "name": "modified", "req": false, "short": "Last modified timestamp.", "type": "`$STRING`", "index$": 7 }, { "active": true, "name": "name", "op": { "create": { "req": true, "type": "`$STRING`" } }, "req": false, "short": "The Client's name.", "type": "`$STRING`", "index$": 8 }, { "active": true, "name": "partner", "req": false, "short": "Reference to the associated Partner.", "type": "`$OBJECT`", "index$": 9 }, { "active": true, "name": "version", "req": false, "short": "The number of times that this resource has been updated.", "type": "`$INTEGER`", "index$": 10 }], "id": { "field": "id", "name": "id" }, "name": "client", "op": { "create": { "input": "data", "name": "create", "points": [{ "active": true, "args": { "query": [{ "active": true, "kind": "query", "name": "billing_id", "orig": "billing_id", "reqd": false, "type": "`$STRING`", "index$": 0 }, { "active": true, "kind": "query", "name": "contact_email", "orig": "contact_email", "reqd": true, "type": "`$STRING`", "index$": 1 }, { "active": true, "kind": "query", "name": "contact_first_name", "orig": "contact_first_name", "reqd": true, "type": "`$STRING`", "index$": 2 }, { "active": true, "kind": "query", "name": "contact_is_active", "orig": "contact_is_active", "reqd": true, "type": "`$BOOLEAN`", "index$": 3 }, { "active": true, "kind": "query", "name": "contact_last_name", "orig": "contact_last_name", "reqd": true, "type": "`$STRING`", "index$": 4 }, { "active": true, "kind": "query", "name": "contact_phone", "orig": "contact_phone", "reqd": true, "type": "`$STRING`", "index$": 5 }, { "active": true, "kind": "query", "name": "contact_send_welcome_email", "orig": "contact_send_welcome_email", "reqd": true, "type": "`$BOOLEAN`", "index$": 6 }, { "active": true, "kind": "query", "name": "contact_user_name", "orig": "contact_user_name", "reqd": true, "type": "`$STRING`", "index$": 7 }, { "active": true, "kind": "query", "name": "contact_user_role", "orig": "contact_user_role", "reqd": true, "type": "`$STRING`", "index$": 8 }, { "active": true, "kind": "query", "name": "direct_partner_id", "orig": "direct_partner_id", "reqd": true, "type": "`$INTEGER`", "index$": 9 }, { "active": true, "kind": "query", "name": "direct_partner_name", "orig": "direct_partner_name", "reqd": true, "type": "`$STRING`", "index$": 10 }, { "active": true, "kind": "query", "name": "is_active", "orig": "is_active", "reqd": true, "type": "`$BOOLEAN`", "index$": 11 }, { "active": true, "kind": "query", "name": "mid", "orig": "mid", "reqd": false, "type": "`$STRING`", "index$": 12 }, { "active": true, "kind": "query", "name": "name", "orig": "name", "reqd": true, "type": "`$STRING`", "index$": 13 }] }, "contract": { "id": "POST /clients", "json": "{\"operationId\":\"create-client\",\"parameters\":[{\"description\":\"The name of the client.\",\"in\":\"query\",\"name\":\"name\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"Billing identifier associated with the client.\",\"in\":\"query\",\"name\":\"billingId\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"Merchant ID associated with the client.\",\"in\":\"query\",\"name\":\"mid\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"Indicates if the client is active.\",\"in\":\"query\",\"name\":\"isActive\",\"required\":true,\"schema\":{\"type\":\"boolean\"}},{\"description\":\"Identifier of the direct partner associated with the client.\",\"in\":\"query\",\"name\":\"directPartner.id\",\"required\":true,\"schema\":{\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"Name of the direct partner associated with the client.\",\"in\":\"query\",\"name\":\"directPartner.name\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"Username of the primary contact.\",\"in\":\"query\",\"name\":\"contact.userName\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"First name of the primary contact.\",\"in\":\"query\",\"name\":\"contact.firstName\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"Last name of the primary contact.\",\"in\":\"query\",\"name\":\"contact.lastName\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"Email address of the primary contact.\",\"in\":\"query\",\"name\":\"contact.email\",\"required\":true,\"schema\":{\"format\":\"email\",\"type\":\"string\"}},{\"description\":\"Phone number of the primary contact.\",\"in\":\"query\",\"name\":\"contact.phone\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"Role of the primary contact within the organization.\",\"in\":\"query\",\"name\":\"contact.userRole\",\"required\":true,\"schema\":{\"enum\":[\"Partner Supervisor\"],\"type\":\"string\"}},{\"description\":\"Indicates if the primary contact is active.\",\"in\":\"query\",\"name\":\"contact.isActive\",\"required\":true,\"schema\":{\"type\":\"boolean\"}},{\"description\":\"Indicates if a welcome email should be sent to the contact.\",\"in\":\"query\",\"name\":\"contact.sendWelcomeEmail\",\"required\":true,\"schema\":{\"type\":\"boolean\"}}],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"billingId\":{\"description\":\"Billing ID\",\"maxLength\":50,\"type\":\"string\"},\"contact\":{\"properties\":{\"email\":{\"description\":\"The User's email address.\",\"maxLength\":255,\"type\":\"string\"},\"firstName\":{\"description\":\"The User's name.\",\"maxLength\":255,\"type\":\"string\"},\"isActive\":{\"description\":\"This property indicates if the User account is active or disabled. Once a user has logged into the system, their account cannot be deleted. As an alternative, their account can be set to inactive.\",\"type\":\"boolean\"},\"lastName\":{\"description\":\"The User's Surname.\",\"maxLength\":255,\"type\":\"string\"},\"phone\":{\"description\":\"The User's phone number without dashes, spaces, or brackets (e.g. +14155552671).\",\"maxLength\":255,\"type\":\"string\"},\"sendWelcomeEmail\":{\"description\":\"If this property is set to 'true' the newly created user will be sent a welcome email.\",\"type\":\"boolean\"},\"userName\":{\"description\":\"The User's unique username.\",\"maxLength\":255,\"type\":\"string\"},\"userRole\":{\"description\":\"Reference to the associated User Role.\",\"enum\":[\"Partner Supervisor\",\"Partner User\",\"Client Admin\",\"Client User\"],\"type\":\"string\"}},\"required\":[\"email\",\"firstName\",\"lastName\",\"phone\",\"userName\"],\"type\":\"object\"},\"directPartner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"isActive\":{\"description\":\"This property indicates if the Client account is active or disabled. It is not possible to delete Clients, however their account can be set to inactive.\",\"type\":\"boolean\"},\"mid\":{\"description\":\"Some Partners will have an merchant ids on their own software offerings. This is an open field that allows those Partner associate a Client resource with their Merchant Identifier.\",\"maxLength\":50,\"type\":\"string\"},\"name\":{\"description\":\"The Client's name.\",\"maxLength\":255,\"type\":\"string\"}},\"required\":[\"contact\",\"directPartner\",\"name\"],\"type\":\"object\"}}},\"description\":\"Client to be created.\",\"required\":true},\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"id\":{\"description\":\"Unique identifier of newly added element.\",\"format\":\"int64\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Client create response\",\"headers\":{\"X-RateLimit-Limit\":{\"description\":\"Request limit per hour.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Remaining\":{\"description\":\"The number of requests left for the time window.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Reset\":{\"description\":\"The UTC date/time at which the current rate limit window resets.\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}}}},\"401\":{\"content\":{},\"description\":\"Unauthorized\"},\"403\":{\"content\":{},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"errors\":{\"properties\":{\"[attribute name]\":{\"description\":\"\",\"properties\":{\"attribute\":{\"description\":\"Invalid attribute name\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"type\":\"integer\"},\"message\":{\"description\":\"Invalid attribute description\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"message\":{\"type\":\"string\"},\"success\":{\"default\":false,\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"message\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "POST", "orig": "/clients", "segments": [{ "lit": "clients" }], "select": { "exist": ["billing_id", "contact_email", "contact_first_name", "contact_is_active", "contact_last_name", "contact_phone", "contact_send_welcome_email", "contact_user_name", "contact_user_role", "direct_partner_id", "direct_partner_name", "is_active", "mid", "name"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" }, "list": { "input": "data", "name": "list", "points": [{ "active": true, "args": { "query": [{ "active": true, "kind": "query", "name": "partner", "orig": "partner", "reqd": true, "type": "`$STRING`", "index$": 0 }, { "active": true, "example": 0, "kind": "query", "name": "skip", "orig": "skip", "reqd": false, "type": "`$INTEGER`", "index$": 1 }, { "active": true, "example": 10, "kind": "query", "name": "take", "orig": "take", "reqd": false, "type": "`$INTEGER`", "index$": 2 }] }, "contract": { "id": "GET /clients", "json": "{\"operationId\":\"list-clients\",\"parameters\":[{\"description\":\"Filter the list by Partner. The parameter value can be either a Partner ID or Name.\",\"in\":\"query\",\"name\":\"partner\",\"required\":true,\"schema\":{\"maxLength\":255,\"type\":\"string\"}},{\"description\":\"The number of entries to include in the list.\",\"in\":\"query\",\"name\":\"take\",\"schema\":{\"default\":10,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"The number of results to skip before listing entries.\",\"in\":\"query\",\"name\":\"skip\",\"schema\":{\"default\":0,\"format\":\"int32\",\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"data\":{\"description\":\"Client list items\",\"items\":{\"properties\":{\"billingId\":{\"type\":\"string\"},\"contact\":{\"description\":\"\",\"properties\":{\"id\":{\"description\":\"User Id\",\"format\":\"int64\",\"type\":\"integer\"}},\"required\":[\"id\"],\"type\":\"object\"},\"directPartner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"format\":\"int64\",\"type\":\"integer\"},\"isActive\":{\"type\":\"boolean\"},\"mid\":{\"type\":\"string\"},\"name\":{\"type\":\"string\"},\"partner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"},\"total\":{\"description\":\"Total number of clients available\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Clients list\",\"headers\":{\"X-RateLimit-Limit\":{\"description\":\"Request limit per hour.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Remaining\":{\"description\":\"The number of requests left for the time window.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Reset\":{\"description\":\"The UTC date/time at which the current rate limit window resets.\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}}}},\"401\":{\"content\":{},\"description\":\"Unauthorized\"},\"403\":{\"content\":{},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"errors\":{\"properties\":{\"[attribute name]\":{\"description\":\"\",\"properties\":{\"attribute\":{\"description\":\"Invalid attribute name\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"type\":\"integer\"},\"message\":{\"description\":\"Invalid attribute description\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"message\":{\"type\":\"string\"},\"success\":{\"default\":false,\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"message\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/clients", "segments": [{ "lit": "clients" }], "select": { "exist": ["partner", "skip", "take"] }, "transform": { "req": "`reqdata`", "res": "`body.data`" }, "index$": 0 }], "key$": "list" }, "load": { "input": "data", "name": "load", "points": [{ "active": true, "args": { "params": [{ "active": true, "kind": "param", "name": "id", "orig": "id", "reqd": true, "type": "`$STRING`", "index$": 0 }] }, "contract": { "id": "GET /clients/{id}", "json": "{\"operationId\":\"get-client\",\"parameters\":[{\"description\":\"The Client's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"maxLength\":20,\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"billingId\":{\"type\":\"string\"},\"contact\":{\"description\":\"\",\"properties\":{\"email\":{\"description\":\"Email\",\"type\":\"string\"},\"firstName\":{\"description\":\"First name\",\"type\":\"string\"},\"id\":{\"description\":\"User Id\",\"format\":\"int64\",\"type\":\"integer\"},\"lastName\":{\"description\":\"Last name\",\"type\":\"string\"}},\"type\":\"object\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"format\":\"date-time\",\"type\":\"string\"},\"directPartner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"format\":\"int64\",\"type\":\"integer\"},\"isActive\":{\"description\":\"This property indicates if the Client account is active or disabled. It is not possible to delete Clients, however their account can be set to inactive.\",\"type\":\"boolean\"},\"mid\":{\"description\":\"Some Partners will have an merchant ids on their own software offerings. This is an open field that allows those Partner associate a Client resource with their Merchant Identifier.\",\"type\":\"string\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"format\":\"date-time\",\"type\":\"string\"},\"name\":{\"description\":\"The Client's name.\",\"type\":\"string\"},\"partner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"type\":\"string\"}},\"type\":\"object\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Client details\",\"headers\":{\"X-RateLimit-Limit\":{\"description\":\"Request limit per hour.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Remaining\":{\"description\":\"The number of requests left for the time window.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Reset\":{\"description\":\"The UTC date/time at which the current rate limit window resets.\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}}}},\"401\":{\"content\":{},\"description\":\"Unauthorized\"},\"403\":{\"content\":{},\"description\":\"Forbidden\"},\"404\":{\"content\":{},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"message\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/clients/{id}", "segments": [{ "lit": "clients" }, { "var": "id" }], "select": { "exist": ["id"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" }, "remove": { "input": "data", "name": "remove", "points": [{ "active": true, "args": { "params": [{ "active": true, "kind": "param", "name": "id", "orig": "id", "reqd": true, "type": "`$STRING`", "index$": 0 }] }, "contract": { "id": "DELETE /clients/{id}", "json": "{\"operationId\":\"delete-client\",\"parameters\":[{\"description\":\"The Client's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"maxLength\":20,\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{},\"description\":\"Client has been deleted successfully\",\"headers\":{\"X-RateLimit-Limit\":{\"description\":\"Request limit per hour.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Remaining\":{\"description\":\"The number of requests left for the time window.\",\"schema\":{\"type\":\"integer\"}},\"X-RateLimit-Reset\":{\"description\":\"The UTC date/time at which the current rate limit window resets.\",\"schema\":{\"format\":\"date-time\",\"type\":\"string\"}}}},\"401\":{\"content\":{},\"description\":\"Unauthorized\"},\"403\":{\"content\":{},\"description\":\"Forbidden\"},\"404\":{\"content\":{},\"description\":\"Not found\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"errors\":{\"properties\":{\"[attribute name]\":{\"description\":\"\",\"properties\":{\"attribute\":{\"description\":\"Invalid attribute name\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"type\":\"integer\"},\"message\":{\"description\":\"Invalid attribute description\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"message\":{\"type\":\"string\"},\"success\":{\"default\":false,\"example\":false,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"\",\"properties\":{\"errorCode\":{\"type\":\"integer\"},\"message\":{\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "DELETE", "orig": "/clients/{id}", "segments": [{ "lit": "clients" }, { "var": "id" }], "select": { "exist": ["id"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "remove" } }, "relations": { "ancestors": [] }, "key$": "client", "name__orig": "client", "Name": "Client", "name_": "client", "name-": "client", "NAME": "CLIENT", "index$": 0 }, { "active": true, "entity": "client", "key$": "BasicClientFlow", "kind": "basic", "name": "BasicClientFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "client_ref01" }, "match": {}, "op": "create", "spec": [], "valid": [], "index$": 0 }, { "active": true, "data": {}, "input": {}, "match": {}, "op": "list", "spec": [], "valid": [{ "apply": "ItemExists", "def": { "ref": "client_ref01" } }], "index$": 1 }, { "active": true, "data": {}, "input": { "ref": "client_ref01", "srcdatavar": "client_ref01_data", "suffix": "_dt0" }, "match": { "id": "client01" }, "op": "load", "spec": [], "valid": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-client_ref01" } }], "index$": 2 }, { "active": true, "data": {}, "input": { "ref": "client_ref01", "suffix": "_rm0" }, "match": { "id": "client01" }, "op": "remove", "spec": [], "valid": [], "index$": 3 }, { "active": true, "data": {}, "input": { "suffix": "_rt0" }, "match": {}, "op": "list", "spec": [], "valid": [{ "apply": "ItemNotExists", "def": { "ref": "client_ref01" } }], "index$": 4 }] }, 'Client');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const client_ref01_ent = client.Client();
        let client_ref01_data = setup.data.new.client['client_ref01'];
        client_ref01_data = (await client_ref01_ent.create(client_ref01_data)).data();
        (0, node_assert_1.default)(null != client_ref01_data.id);
        // LIST
        const client_ref01_match = {};
        const client_ref01_list = (await client_ref01_ent.list(client_ref01_match)).map((e) => e.data());
        (0, node_assert_1.default)(!isempty(select(client_ref01_list, { id: client_ref01_data.id })));
        // LOAD
        const client_ref01_match_dt0 = {};
        client_ref01_match_dt0.id = client_ref01_data.id;
        const client_ref01_data_dt0 = (await client_ref01_ent.load(client_ref01_match_dt0)).data();
        (0, node_assert_1.default)(client_ref01_data_dt0.id === client_ref01_data.id);
        // REMOVE
        const client_ref01_match_rm0 = { id: client_ref01_data.id };
        await client_ref01_ent.remove(client_ref01_match_rm0);
        // LIST
        const client_ref01_match_rt0 = {};
        const client_ref01_list_rt0 = (await client_ref01_ent.list(client_ref01_match_rt0)).map((e) => e.data());
        (0, node_assert_1.default)(isempty(select(client_ref01_list_rt0, { id: client_ref01_data.id })));
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/client/ClientTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinShieldconexMgmtSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['client01', 'client02', 'client03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_SHIELDCONEX_MGMT_TEST_CLIENT_ENTID': idmap,
        'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
        'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
        'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': '',
        'BLUEFIN_SHIELDCONEX_MGMT_SECRET': '',
    });
    idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLIENT_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_SHIELDCONEX_MGMT_TEST_CLIENT_ENTID'];
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
//# sourceMappingURL=ClientEntity.test.js.map