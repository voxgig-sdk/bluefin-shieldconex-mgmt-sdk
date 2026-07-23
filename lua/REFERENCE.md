# BluefinShieldconexMgmt Lua SDK Reference

Complete API reference for the BluefinShieldconexMgmt Lua SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```lua
local sdk = require("bluefin-shieldconex-mgmt_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Client(data)`

Create a new `Client` entity instance. Pass `nil` for no initial data.

#### `Clone(data)`

Create a new `Clone` entity instance. Pass `nil` for no initial data.

#### `Partner(data)`

Create a new `Partner` entity instance. Pass `nil` for no initial data.

#### `Template(data)`

Create a new `Template` entity instance. Pass `nil` for no initial data.

#### `Transaction(data)`

Create a new `Transaction` entity instance. Pass `nil` for no initial data.

#### `UpdateResult(data)`

Create a new `UpdateResult` entity instance. Pass `nil` for no initial data.

#### `User(data)`

Create a new `User` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## ClientEntity

```lua
local client_ = client:Client(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `table` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `table` | No |  |
| `id` | `number` | No |  |
| `is_active` | `boolean` | No |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `table` | No |  |
| `version` | `number` | No |  |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `billing_id` | - | - | - | - |
| `contact` | - | Yes | Yes | - |
| `created` | - | - | - | - |
| `direct_partner` | - | - | Yes | - |
| `id` | - | - | - | - |
| `is_active` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | Yes | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Client():create({
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Client():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Client():load({ id = "client_id" })
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:Client():remove({ id = "client_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ClientEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## CloneEntity

```lua
local clone = client:Clone(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `number` | No |  |
| `name` | `string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Clone():create({
  template_id = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CloneEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PartnerEntity

```lua
local partner = client:Partner(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `table` | No |  |
| `created` | `string` | No |  |
| `id` | `number` | No |  |
| `is_active` | `boolean` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `table` | No |  |
| `reference` | `string` | No |  |
| `verification_phrase` | `string` | No |  |
| `version` | `number` | No |  |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billing_id` | - | - | - |
| `contact` | - | Yes | Yes |
| `created` | - | - | - |
| `id` | - | - | - |
| `is_active` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | Yes |
| `parent` | - | - | Yes |
| `reference` | - | - | - |
| `verification_phrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Partner():create({
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Partner():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Partner():load({ id = "partner_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PartnerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TemplateEntity

```lua
local template = client:Template(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `any` | No |  |
| `active` | `boolean` | No |  |
| `client` | `table` | No |  |
| `field_template` | `table` | No |  |
| `id` | `number` | No |  |
| `name` | `string` | No |  |
| `option` | `table` | No |  |
| `partner` | `table` | No |  |
| `reference` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Template():create({
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Template():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Template():load({ id = "template_id" })
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:Template():remove({ id = "template_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TemplateEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TransactionEntity

```lua
local transaction = client:Transaction(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `string` | No |  |
| `client` | `table` | No |  |
| `complete_date` | `string` | No |  |
| `direct_partner` | `table` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `number` | No |  |
| `ip_address` | `string` | No |  |
| `message_id` | `string` | No |  |
| `partner` | `table` | No |  |
| `reference` | `string` | No |  |
| `success` | `boolean` | No |  |
| `template_id` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Transaction():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Transaction():load({ id = "transaction_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## UpdateResultEntity

```lua
local update_result = client:UpdateResult(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client` | `table` | No |  |
| `contact` | `table` | Yes |  |
| `direct_partner` | `table` | No |  |
| `email` | `string` | Yes |  |
| `first_name` | `string` | Yes |  |
| `id` | `number` | No |  |
| `is_active` | `boolean` | No |  |
| `last_name` | `string` | Yes |  |
| `mid` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `table` | No |  |
| `partner` | `table` | No |  |
| `phone` | `string` | Yes |  |
| `reference` | `string` | No |  |
| `send_welcome_email` | `boolean` | No |  |
| `user_name` | `string` | Yes |  |
| `user_role` | `table` | Yes |  |
| `verification_phrase` | `string` | No |  |
| `version` | `number` | No |  |

### Field Usage by Operation

| Field | list | create | update |
| --- | --- | --- | --- |
| `billing_id` | - | - | - |
| `client` | - | - | - |
| `contact` | - | - | - |
| `direct_partner` | - | - | - |
| `email` | Yes | - | Yes |
| `first_name` | Yes | - | Yes |
| `id` | - | - | - |
| `is_active` | - | - | - |
| `last_name` | Yes | - | Yes |
| `mid` | - | - | - |
| `name` | - | - | - |
| `parent` | - | - | - |
| `partner` | - | - | - |
| `phone` | Yes | - | Yes |
| `reference` | - | - | - |
| `send_welcome_email` | - | - | - |
| `user_name` | Yes | - | Yes |
| `user_role` | Yes | - | Yes |
| `verification_phrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:UpdateResult():create({
  contact = --[[ table ]],
  email = --[[ string ]],
  first_name = --[[ string ]],
  last_name = --[[ string ]],
  phone = --[[ string ]],
  user_name = --[[ string ]],
  user_role = --[[ table ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:UpdateResult():list()
```

#### `update(reqdata, ctrl) -> any, err`

Update an existing entity. The data must include the entity `id`.

```lua
local result, err = client:UpdateResult():update({
  id = "id",
  -- Fields to update
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResultEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## UserEntity

```lua
local user = client:User(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `table` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `number` | No |  |
| `is_active` | `boolean` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `table` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `table` | No |  |
| `version` | `number` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:User():load({ id = "user_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UserEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

