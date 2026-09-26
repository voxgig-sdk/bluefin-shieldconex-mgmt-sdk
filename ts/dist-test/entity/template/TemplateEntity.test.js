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
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('TemplateEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinShieldconexMgmtSDK.test();
        const ent = testsdk.Template();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE;
        for (const op of ['create', 'list', 'load', 'remove']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'template.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "accessMode": { "a": true, "h": "Access Mode", "n": "accessMode", "r": false, "sh": "The Template's access mode.", "t": "`$ANY`", "key$": "accessMode", "index$": 0 }, "active": { "a": true, "h": "Active", "n": "active", "r": false, "sh": "This property indicates if the Template is active or inactive.", "t": "`$BOOLEAN`", "key$": "active", "index$": 1 }, "client": { "a": true, "h": "Client", "n": "client", "r": false, "sh": "Reference to the associated Client resource.", "t": "`$OBJECT`", "key$": "client", "index$": 2 }, "fieldTemplates": { "a": true, "h": "Field Templates", "n": "fieldTemplates", "r": false, "sh": "Field Template list items", "t": "`$ARRAY`", "union": { "branches": 9, "count": 1, "depth": 1 }, "key$": "fieldTemplates", "index$": 3 }, "id": { "a": true, "fo": "int64", "h": "Id", "n": "id", "r": false, "sh": "Unique identifier of newly added element.", "t": "`$INTEGER`", "key$": "id", "index$": 4 }, "name": { "a": true, "h": "Name", "n": "name", "r": false, "sh": "The Template's name.", "t": "`$STRING`", "key$": "name", "index$": 5 }, "options": { "a": true, "h": "Options", "n": "options", "r": false, "t": "`$OBJECT`", "key$": "options", "index$": 6 }, "partner": { "a": true, "h": "Partner", "n": "partner", "r": false, "sh": "Reference to the associated Partner.", "t": "`$OBJECT`", "key$": "partner", "index$": 7 }, "reference": { "a": true, "h": "Reference", "n": "reference", "r": false, "sh": "The Template's unique reference.", "t": "`$STRING`", "key$": "reference", "index$": 8 }, "type": { "a": true, "h": "Type", "n": "type", "r": false, "sh": "The Template's type.", "t": "`$STRING`", "key$": "type", "index$": 9 }, "version": { "a": true, "h": "Version", "n": "version", "r": false, "sh": "The number of times that this resource has been updated.", "t": "`$INTEGER`", "key$": "version", "index$": 10 } }, "id": { "field": "id", "name": "id" }, "name": "template", "op": { "create": { "input": "data", "name": "create", "points": [{ "a": true, "co": { "id": "POST /templates", "source": "openapi3", "version": 2 }, "g": { "query": [{ "a": true, "k": "query", "n": "access_mode", "or": "access_mode", "r": false, "t": "`$STRING`", "index$": 0 }, { "a": true, "k": "query", "n": "active", "or": "active", "r": true, "t": "`$BOOLEAN`", "index$": 1 }, { "a": true, "k": "query", "n": "client_id", "or": "client_id", "r": true, "t": "`$INTEGER`", "index$": 2 }, { "a": true, "k": "query", "n": "client_name", "or": "client_name", "r": true, "t": "`$STRING`", "index$": 3 }, { "a": true, "k": "query", "n": "field_template", "or": "field_template", "r": false, "t": "`$ARRAY`", "index$": 4 }, { "a": true, "k": "query", "n": "name", "or": "name", "r": true, "t": "`$STRING`", "index$": 5 }, { "a": true, "k": "query", "n": "options_custom_style", "or": "options_custom_style", "r": false, "t": "`$STRING`", "index$": 6 }, { "a": true, "k": "query", "n": "options_custom_style_file", "or": "options_custom_style_file", "r": false, "t": "`$STRING`", "index$": 7 }, { "a": true, "k": "query", "n": "options_domain", "or": "options_domain", "r": false, "t": "`$ARRAY`", "index$": 8 }, { "a": true, "k": "query", "n": "options_security_active_from", "or": "options_security_active_from", "r": false, "t": "`$STRING`", "index$": 9 }, { "a": true, "k": "query", "n": "options_security_active_to", "or": "options_security_active_to", "r": false, "t": "`$STRING`", "index$": 10 }, { "a": true, "k": "query", "n": "options_security_irreversible", "or": "options_security_irreversible", "r": false, "t": "`$BOOLEAN`", "index$": 11 }, { "a": true, "k": "query", "n": "partner_id", "or": "partner_id", "r": true, "t": "`$INTEGER`", "index$": 12 }, { "a": true, "k": "query", "n": "partner_name", "or": "partner_name", "r": true, "t": "`$STRING`", "index$": 13 }, { "a": true, "k": "query", "n": "reference", "or": "reference", "r": true, "t": "`$STRING`", "index$": 14 }, { "a": true, "k": "query", "n": "type", "or": "type", "r": false, "t": "`$STRING`", "index$": 15 }, { "a": true, "k": "query", "n": "version", "or": "version", "r": false, "t": "`$INTEGER`", "index$": 16 }] }, "k": "http", "m": "POST", "o": "/templates", "q": { "exist": ["access_mode", "active", "client_id", "client_name", "field_template", "name", "options_custom_style", "options_custom_style_file", "options_domain", "options_security_active_from", "options_security_active_to", "options_security_irreversible", "partner_id", "partner_name", "reference", "type", "version"] }, "r": {}, "s": [{ "lit": "templates" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" }, "list": { "input": "data", "name": "list", "points": [{ "a": true, "co": { "id": "GET /templates", "source": "openapi3", "version": 2 }, "g": { "query": [{ "a": true, "k": "query", "n": "client", "or": "client", "r": false, "t": "`$STRING`", "index$": 0 }, { "a": true, "k": "query", "n": "partner", "or": "partner", "r": false, "t": "`$STRING`", "index$": 1 }, { "a": true, "ex": 0, "k": "query", "n": "skip", "or": "skip", "r": false, "t": "`$INTEGER`", "index$": 2 }, { "a": true, "ex": 10, "k": "query", "n": "take", "or": "take", "r": false, "t": "`$INTEGER`", "index$": 3 }] }, "k": "http", "m": "GET", "o": "/templates", "q": { "exist": ["client", "partner", "skip", "take"] }, "r": {}, "s": [{ "lit": "templates" }], "t": { "req": "`reqdata`", "res": "`body.data`" }, "index$": 0 }], "key$": "list" }, "load": { "input": "data", "name": "load", "points": [{ "a": true, "co": { "id": "GET /templates/{id}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "k": "param", "n": "id", "or": "id", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "GET", "o": "/templates/{id}", "q": { "exist": ["id"] }, "r": {}, "s": [{ "lit": "templates" }, { "var": "id" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" }, "remove": { "input": "data", "name": "remove", "points": [{ "a": true, "co": { "id": "DELETE /templates/{id}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "k": "param", "n": "id", "or": "id", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "DELETE", "o": "/templates/{id}", "q": { "exist": ["id"] }, "r": {}, "s": [{ "lit": "templates" }, { "var": "id" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "remove" } }, "relations": { "ancestors": [] }, "key$": "template", "name__orig": "template", "Name": "Template", "name_": "template", "name-": "template", "NAME": "TEMPLATE", "index$": 3 }, { "active": true, "entity": "template", "key$": "BasicTemplateFlow", "kind": "basic", "name": "BasicTemplateFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "template_ref01" }, "m": {}, "o": "create", "s": [], "v": [], "index$": 0 }, { "a": true, "d": {}, "i": {}, "m": {}, "o": "list", "s": [], "v": [{ "apply": "ItemExists", "def": { "ref": "template_ref01" } }], "index$": 1 }, { "a": true, "d": {}, "i": { "ref": "template_ref01", "srcdatavar": "template_ref01_data", "suffix": "_dt0" }, "m": { "id": "template01" }, "o": "load", "s": [], "v": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-template_ref01" } }], "index$": 2 }, { "a": true, "d": {}, "i": { "ref": "template_ref01", "suffix": "_rm0" }, "m": { "id": "template01" }, "o": "remove", "s": [], "v": [], "index$": 3 }, { "a": true, "d": {}, "i": { "suffix": "_rt0" }, "m": {}, "o": "list", "s": [], "v": [{ "apply": "ItemNotExists", "def": { "ref": "template_ref01" } }], "index$": 4 }] }, 'Template', { "POST /templates": { "protocol": "http", "requestBody": { "description": "Template to be created.", "content": { "application/json": { "schema": { "allOf": [{ "type": "object", "properties": { "name": { "type": "string", "description": "The Template's name.", "key$": "name" }, "reference": { "type": "string", "description": "The Template's unique reference.", "key$": "reference" }, "active": { "type": "boolean", "description": "This property indicates if the Template is active or inactive. In the UI this is referred to as published and when set to true the template cannot be modified.", "key$": "active" }, "version": { "type": "integer", "description": "The number of times that this resource has been updated.", "key$": "version" }, "partner": { "type": "object", "properties": { "id": {}, "name": {} }, "description": "Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.", "x-ref": "#/components/schemas/PartnerReference", "key$": "partner" }, "client": { "type": "object", "properties": { "id": {}, "name": {} }, "description": "Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.", "x-ref": "#/components/schemas/ClientReference", "key$": "client" }, "fieldTemplates": { "type": "array", "description": "Field Template list items", "items": { "oneOf": [] }, "key$": "fieldTemplates" }, "type": { "type": "string", "description": "The Template's type. TODO provide description", "enum": ["userDefined", "templatePayConexTokenPayments", "templatePayConexTokenization", "templateMyChartCardTransaction", "templateMyChartAchTransaction"], "key$": "type" }, "accessMode": { "description": "The Template's access mode. TODO provide description", "enum": ["specific", "restricted", "unrestricted"], "key$": "accessMode" }, "options": { "type": "object", "properties": { "customStyles": {}, "customStyleFile": {}, "domains": {}, "security": {} }, "x-ref": "#/components/schemas/TemplateOptions", "key$": "options" } }, "x-ref": "#/components/schemas/TemplateBaseDetails" }], "type": "object", "properties": {}, "x-ref": "#/components/schemas/TemplateCreate", "index$": 1 } } }, "required": true }, "parameters": [{ "name": "name", "in": "query", "required": true, "schema": { "type": "string" }, "description": "The system name of the template. Should not include spaces or special characters except underscores.", "index$": 0 }, { "name": "reference", "in": "query", "required": true, "schema": { "type": "string" }, "description": "A reference identifier for the template.", "index$": 1 }, { "name": "active", "in": "query", "required": true, "schema": { "type": "boolean" }, "description": "Indicates if the template is published. Once set to true, the template is no longer editable.\"", "index$": 2 }, { "name": "version", "in": "query", "required": false, "schema": { "type": "integer", "format": "int32" }, "description": "Version number of the template.", "index$": 3 }, { "name": "partner.id", "in": "query", "required": true, "schema": { "type": "integer", "format": "int32" }, "description": "The ID of the partner associated with this template.", "index$": 4 }, { "name": "partner.name", "in": "query", "required": true, "schema": { "type": "string" }, "description": "The name of the partner associated with this template.", "index$": 5 }, { "name": "client.id", "in": "query", "required": true, "schema": { "type": "integer", "format": "int32" }, "description": "The ID of the client associated with this template.", "index$": 6 }, { "name": "client.name", "in": "query", "required": true, "schema": { "type": "string" }, "description": "The name of the client associated with this template.", "index$": 7 }, { "name": "fieldTemplates", "in": "query", "required": false, "schema": { "type": "array", "items": { "type": "object", "properties": { "method": { "type": "string", "enum": ["FPE", "FPT"], "description": "The tokenization method. Must be either \"FPE\" or \"FPT\". Relevant to all template types.\n" }, "sortOrder": { "type": "integer", "description": "Determines the order in which the field appears in the iFrame. This has no impact on API calls. Relevant to all template types.\n" }, "required": { "type": "boolean", "description": "Specifies if the field is required for tokenization. Impacts tokenization and iFrame but not detokenization. Relevant to all template types.\n" }, "width": { "type": "string", "description": "Defines the display width of the field in the iFrame. Relevant to all template types.\n" }, "templateType": { "type": "string", "enum": ["field", "date", "phone", "card", "address", "email", "bank", "routing"], "description": "Specifies the type of field template. Relevant to all template types.\n" }, "name": { "type": "string", "description": "The System Name of the field. Used in code and API calls. Must not contain spaces. Recommended to use only characters and underscores. Relevant to all template types.\n" }, "format": { "type": "string", "description": "Specifies the input format for the field. Relevant to all template types.\n", "enum": ["NONE", "LAST_FOUR", "FIRST_SIX", "FIRST_SIX_LAST_FOUR", "FIRST_TWO_LAST_FOUR"] }, "alphabet": { "type": "string", "enum": ["CARD10", "CARD62"], "description": "Specifies the allowed characters. CARD10 is numeric only, CARD62 is alphanumeric. Relevant to \"field\".\n" }, "placeholder": { "type": "string", "description": "Specifies the example value displayed in the iFrame. Disappears when the user begins typing. Optional. Relevant to iFrame rendering for all template types.\n" }, "label": { "type": "string", "description": "Specifies the name displayed above the input in the iFrame. Relevant to iFrame rendering for all template types.\n" }, "nonIdempotentTokens": { "type": "boolean", "description": "Determines if the same input always generates the same token. Only relevant for \"FPT\". Relevant to \"field\".\n" }, "inputType": { "type": "string", "enum": ["input", "select", "password"], "description": "Specifies the input type for the iFrame. Relevant to \"field\".\n" }, "inputValues": { "type": "string", "description": "Comma-separated values for dropdown inputs. Relevant to \"field\" with \"dropdown\" inputType.\n" }, "minLength": { "type": "integer", "minimum": 2, "description": "Specifies the minimum number of characters allowed. Relevant to \"field\".\n" }, "maxLength": { "type": "integer", "maximum": 128, "description": "Specifies the maximum number of characters allowed. Maximum is 56 for \"FPE\" and 128 for \"FPT\". Relevant to \"field\".\n" }, "pattern": { "type": "string", "description": "Regular expression for custom input validation. Relevant to \"field\".\n" }, "patternMessage": { "type": "string", "description": "Error message displayed when the input does not match the pattern. Relevant to \"field\".\n" }, "dateFormat": { "type": "string", "description": "Specifies the date format. E.g., \"MM-DD-YYYY\". Relevant to \"date\".\n" }, "dateSeparator": { "type": "string", "description": "Specifies the separator used in date fields. Relevant to \"date\".\n" }, "countryCode": { "type": "boolean", "description": "Indicates if a country code should be included in the phone field. Relevant to \"phone\".\n" }, "phoneInputMasking": { "type": "string", "description": "Specifies the input masking format for phone numbers. Relevant to \"phone\".\n" }, "cardNumberFormat": { "type": "string", "description": "Specifies the format for card numbers. Relevant to \"card\".\n" }, "cardNumberName": { "type": "string", "description": "System name for the card number field. Relevant to \"card\".\n" }, "cardNumberPlaceholder": { "type": "string", "description": "Placeholder for the card number field. Relevant to \"card\".\n" }, "cardNumberLabel": { "type": "string", "description": "Label for the card number field. Relevant to \"card\".\n" }, "cvvEnabled": { "type": "boolean", "description": "Indicates if the CVV field is enabled. Relevant to \"card\".\n" }, "cvvName": { "type": "string", "description": "System name for the CVV field. Relevant to \"card\".\n" }, "cvvPlaceholder": { "type": "string", "description": "Placeholder for the CVV field. Relevant to \"card\".\n" }, "cvvLabel": { "type": "string", "description": "Label for the CVV field. Relevant to \"card\".\n" }, "expirationEnabled": { "type": "boolean", "description": "Indicates if the expiration date field is enabled. Relevant to \"card\".\n" }, "expirationName": { "type": "string", "description": "System name for the expiration date field. Relevant to \"card\".\n" }, "expirationPlaceholder": { "type": "string", "description": "Placeholder for the expiration date field. Relevant to \"card\".\n" }, "expirationLabel": { "type": "string", "description": "Label for the expiration date field. Relevant to \"card\".\n" }, "cardholderEnabled": { "type": "boolean", "description": "Indicates if the cardholder name field is enabled. Relevant to \"card\".\n" }, "cardholderName": { "type": "string", "description": "System name for the cardholder name field. Relevant to \"card\".\n" }, "cardholderPlaceholder": { "type": "string", "description": "Placeholder for the cardholder name field. Relevant to \"card\".\n" }, "cardholderLabel": { "type": "string", "description": "Label for the cardholder name field. Relevant to \"card\".\n" }, "threeDsAddress": { "type": "string", "description": "Specifies 3D Secure address settings. Relevant to \"address\".\n" }, "addressLine1Enabled": { "type": "boolean", "description": "Indicates if Address Line 1 is enabled. Relevant to \"address\".\n" }, "addressLine1Name": { "type": "string", "description": "System name for Address Line 1. Relevant to \"address\".\n" }, "addressLine1Placeholder": { "type": "string", "description": "Placeholder for Address Line 1 in the iFrame. Relevant to \"address\".\n" }, "addressLine1Label": { "type": "string", "description": "Label for Address Line 1 in the iFrame. Relevant to \"address\".\n" }, "addressLine2Enabled": { "type": "boolean", "description": "Indicates if Address Line 2 is enabled. Relevant to \"address\".\n" }, "addressLine2Name": { "type": "string", "description": "System name for Address Line 2. Relevant to \"address\".\n" }, "addressLine2Placeholder": { "type": "string", "description": "Placeholder for Address Line 2 in the iFrame. Relevant to \"address\".\n" }, "addressLine2Label": { "type": "string", "description": "Label for Address Line 2 in the iFrame. Relevant to \"address\".\n" }, "cityEnabled": { "type": "boolean", "description": "Indicates if the City field is enabled. Relevant to \"address\".\n" }, "cityName": { "type": "string", "description": "System name for the City field. Relevant to \"address\".\n" }, "cityPlaceholder": { "type": "string", "description": "Placeholder for the City field in the iFrame. Relevant to \"address\".\n" }, "cityLabel": { "type": "string", "description": "Label for the City field in the iFrame. Relevant to \"address\".\n" }, "stateEnabled": { "type": "boolean", "description": "Indicates if the State field is enabled. Relevant to \"address\".\n" }, "stateName": { "type": "string", "description": "System name for the State field. Relevant to \"address\".\n" }, "statePlaceholder": { "type": "string", "description": "Placeholder for the State field in the iFrame. Relevant to \"address\".\n" }, "stateLabel": { "type": "string", "description": "Label for the State field in the iFrame. Relevant to \"address\".\n" }, "postalCodeEnabled": { "type": "boolean", "description": "Indicates if the Postal Code field is enabled. Relevant to \"address\".\n" }, "postalCodeName": { "type": "string", "description": "System name for the Postal Code field. Relevant to \"address\".\n" }, "postalCodePlaceholder": { "type": "string", "description": "Placeholder for the Postal Code field in the iFrame. Relevant to \"address\".\n" }, "postalCodeLabel": { "type": "string", "description": "Label for the Postal Code field in the iFrame. Relevant to \"address\".\n" }, "countryEnabled": { "type": "boolean", "description": "Indicates if the Country field is enabled. Relevant to \"address\".\n" }, "countryName": { "type": "string", "description": "System name for the Country field. Relevant to \"address\".\n" }, "countryPlaceholder": { "type": "string", "description": "Placeholder for the Country field in the iFrame. Relevant to \"address\".\n" }, "countryLabel": { "type": "string", "description": "Label for the Country field in the iFrame. Relevant to \"address\".\n" } } } }, "index$": 8 }, { "name": "type", "in": "query", "required": false, "schema": { "type": "string", "enum": ["userDefined", "preDefined"] }, "description": "Specifies if the template type is user-defined or pre-defined.", "index$": 9 }, { "name": "accessMode", "in": "query", "required": false, "schema": { "type": "string", "enum": ["specific", "general"] }, "description": "Access mode of the template, e.g., specific to certain domains.", "index$": 10 }, { "name": "options.customStyles", "in": "query", "required": false, "schema": { "type": "string" }, "description": "Custom styles applied to the iFrame. Should be in CSS format.", "index$": 11 }, { "name": "options.customStyleFile", "in": "query", "required": false, "schema": { "type": "string" }, "description": "File path to custom style file for the iFrame.", "index$": 12 }, { "name": "options.domains", "in": "query", "required": false, "schema": { "type": "array", "items": { "type": "string" } }, "description": "List of allowed domains for the template.", "index$": 13 }, { "name": "options.security.irreversible", "in": "query", "required": false, "schema": { "type": "boolean" }, "description": "Indicates if tokens generated by the template are irreversible.", "index$": 14 }, { "name": "options.security.active.from", "in": "query", "required": false, "schema": { "type": "string", "format": "ISO 8601" }, "description": "The duration from the time of tokenization until the token can be detokenized. This is specified in ISO 8601 format.", "index$": 15 }, { "name": "options.security.active.to", "in": "query", "required": false, "schema": { "type": "string", "format": "date-time" }, "description": "The duration from the time of tokenization (not the time of activation) until the token can no longer be detokenized. This is specified in ISO 8601 format. Should be greater than the 'active from' setting. If not the token will be effectively irreversible.", "index$": 16 }] }, "GET /templates": { "protocol": "http", "parameters": [{ "name": "partner", "in": "query", "description": "Filter the list by Partner. The parameter value can be either a Partner ID or Name.", "schema": { "type": "string", "maxLength": 255 }, "index$": 0 }, { "name": "client", "in": "query", "description": "Filter the list by Client. The parameter value can be either a Client ID or Name.", "schema": { "type": "string", "maxLength": 255 }, "index$": 1 }, { "name": "take", "in": "query", "description": "The number of entries to include in the list.", "schema": { "type": "integer", "format": "int32", "default": 10 }, "index$": 2 }, { "name": "skip", "in": "query", "description": "The number of results to skip before listing entries.", "schema": { "type": "integer", "format": "int32", "default": 0 }, "index$": 3 }] }, "GET /templates/{id}": { "protocol": "http", "parameters": [{ "name": "id", "in": "path", "description": "The Template's unique identifier.", "required": true, "schema": { "type": "string", "maxLength": 20 }, "index$": 0 }] }, "DELETE /templates/{id}": { "protocol": "http", "parameters": [{ "name": "id", "in": "path", "description": "The Template's unique identifier.", "required": true, "schema": { "type": "string", "maxLength": 20 }, "index$": 0 }] } });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const template_ref01_ent = client.Template();
        let template_ref01_data = setup.data.new.template['template_ref01'];
        template_ref01_data = (await template_ref01_ent.create(template_ref01_data)).data();
        (0, node_assert_1.default)(null != template_ref01_data.id);
        // LIST
        const template_ref01_match = {};
        const template_ref01_list = (await template_ref01_ent.list(template_ref01_match)).map((e) => e.data());
        (0, node_assert_1.default)(!isempty(select(template_ref01_list, { id: template_ref01_data.id })));
        // LOAD
        const template_ref01_match_dt0 = {};
        template_ref01_match_dt0.id = template_ref01_data.id;
        const template_ref01_data_dt0 = (await template_ref01_ent.load(template_ref01_match_dt0)).data();
        (0, node_assert_1.default)(template_ref01_data_dt0.id === template_ref01_data.id);
        // REMOVE
        const template_ref01_match_rm0 = { id: template_ref01_data.id };
        await template_ref01_ent.remove(template_ref01_match_rm0);
        // LIST
        const template_ref01_match_rt0 = {};
        const template_ref01_list_rt0 = (await template_ref01_ent.list(template_ref01_match_rt0)).map((e) => e.data());
        (0, node_assert_1.default)(isempty(select(template_ref01_list_rt0, { id: template_ref01_data.id })));
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/template/TemplateTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinShieldconexMgmtSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['template01', 'template02', 'template03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID': idmap,
        'BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE': 'FALSE',
        'BLUEFIN_SHIELDCONEX_MGMT_TEST_EXPLAIN': 'FALSE',
        'BLUEFIN_SHIELDCONEX_MGMT_APIKEY': '',
        'BLUEFIN_SHIELDCONEX_MGMT_SECRET': '',
    });
    idmap = env['BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_SHIELDCONEX_MGMT_TEST_TEMPLATE_ENTID'];
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
//# sourceMappingURL=TemplateEntity.test.js.map