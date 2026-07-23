# BluefinShieldconexMgmt Lua SDK



The Lua SDK for the BluefinShieldconexMgmt API — an entity-oriented client using Lua conventions.

It exposes the API as capitalised, semantic **Entities** — e.g. `client:Client()` — each with the same small set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to LuaRocks. Install it from the
GitHub release tag (`lua/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)),
or add the source directory to your `LUA_PATH`:

```bash
export LUA_PATH="path/to/lua/?.lua;path/to/lua/?/init.lua;;"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```lua
local sdk = require("bluefin-shieldconex-mgmt_sdk")

local client = sdk.new({
  apikey = os.getenv("BLUEFIN_SHIELDCONEX_MGMT_APIKEY"),
})
```

### 2. List client records

Entity operations return `(value, err)`. For `list`, `value` is the
array of records itself — iterate it directly (there is no wrapper).

```lua
local client_s, err = client:Client():list()
if err then error(err) end

for _, item in ipairs(client_s) do
  print(item["id"], item["billing_id"])
end
```

### 3. Load a client

```lua
local client_, err = client:Client():load({ id = "example_id" })
if err then error(err) end
print(client_)
```

### 4. Create, update, and remove

```lua
-- Create
local created, err = client:Client():create({ billing_id = "example_billing_id", contact = {} })
if err then error(err) end

-- Remove
client:Client():remove({ id = created["id"] })
```


## Error handling

Entity operations return `(value, err)`. Check `err` before using
the value:

```lua
local partners, err = client:Partner():list()
if err then error(err) end
```

`direct` follows the same `(value, err)` convention:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example_id" },
})
if err then error(err) end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
if err then error(err) end

if result["ok"] then
  print(result["status"])  -- 200
  print(result["data"])    -- response body
end
```

### Prepare a request without sending it

```lua
local fetchdef, err = client:prepare({
  path = "/api/resource/{id}",
  method = "DELETE",
  params = { id = "example" },
})
if err then error(err) end

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```lua
local client = sdk.test()

local result, err = client:Partner():list()
-- result is the returned data; err is set on failure
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```lua
local function mock_fetch(url, init)
  return {
    status = 200,
    statusText = "OK",
    headers = {},
    json = function()
      return { id = "mock01" }
    end,
  }, nil
end

local client = sdk.new({
  base = "http://localhost:8080",
  system = {
    fetch = mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd lua && busted test/
```


## Reference

### BluefinShieldconexMgmtSDK

```lua
local sdk = require("bluefin-shieldconex-mgmt_sdk")
local client = sdk.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `table` | Feature activation flags. |
| `extend` | `table` | Additional Feature instances to load. |
| `system` | `table` | System overrides (e.g. custom `fetch` function). |

### test

```lua
local client = sdk.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> table` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> table, err` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> table, err` | Build and send an HTTP request. |
| `Client` | `(data) -> ClientEntity` | Create a Client entity instance. |
| `Clone` | `(data) -> CloneEntity` | Create a Clone entity instance. |
| `Partner` | `(data) -> PartnerEntity` | Create a Partner entity instance. |
| `Template` | `(data) -> TemplateEntity` | Create a Template entity instance. |
| `Transaction` | `(data) -> TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `(data) -> UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User` | `(data) -> UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any, err` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> any, err` | List entities matching the criteria. |
| `create` | `(reqdata, ctrl) -> any, err` | Create a new entity. |
| `update` | `(reqdata, ctrl) -> any, err` | Update an existing entity. |
| `remove` | `(reqmatch, ctrl) -> any, err` | Remove an entity. |
| `data_get` | `() -> table` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> table` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return `(value, err)`. The `value` is the operation's
data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `load` / `create` / `update` / `remove` | the entity record (a `table`) |
| `list` | an array (`table`) of entity records |

Check `err` first (it is non-`nil` on failure), then use `value`:

    local client, err = client:Client():load({ id = "example_id" })
    if err then error(err) end
    -- client is the loaded record

Only `direct()` returns a response envelope — a `table` with `ok`,
`status`, `headers`, and `data` keys.

### Entities

#### Client

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `contact` |  |
| `created` |  |
| `direct_partner` |  |
| `id` |  |
| `is_active` |  |
| `mid` |  |
| `modified` |  |
| `name` |  |
| `partner` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### Clone

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: Create.

API path: `/templates/{id}/clone`

#### Partner

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `reference` |  |
| `verification_phrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Template

| Field | Description |
| --- | --- |
| `access_mode` |  |
| `active` |  |
| `client` |  |
| `field_template` |  |
| `id` |  |
| `name` |  |
| `option` |  |
| `partner` |  |
| `reference` |  |
| `type` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/templates`

#### Transaction

| Field | Description |
| --- | --- |
| `bfid` |  |
| `client` |  |
| `complete_date` |  |
| `direct_partner` |  |
| `err_code` |  |
| `err_message` |  |
| `id` |  |
| `ip_address` |  |
| `message_id` |  |
| `partner` |  |
| `reference` |  |
| `success` |  |
| `template_id` |  |

Operations: List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `client` |  |
| `contact` |  |
| `direct_partner` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `last_name` |  |
| `mid` |  |
| `name` |  |
| `parent` |  |
| `partner` |  |
| `phone` |  |
| `reference` |  |
| `send_welcome_email` |  |
| `user_name` |  |
| `user_role` |  |
| `verification_phrase` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `last_name` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

Operations: Load.

API path: `/users/{id}`



## Entities


### Client

Create an instance: `local client_ = client:Client(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `table` |  |
| `created` | `string` |  |
| `direct_partner` | `table` |  |
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `table` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local client_, err = client:Client():load({ id = "client_id" })
```

#### Example: List

```lua
local client_s, err = client:Client():list()
```

#### Example: Create

```lua
local client_, err = client:Client():create({
})
```


### Clone

Create an instance: `local clone = client:Clone(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `number` |  |
| `name` | `string` |  |

#### Example: Create

```lua
local clone, err = client:Clone():create({
  template_id = "example_template_id", -- string
})
```


### Partner

Create an instance: `local partner = client:Partner(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `table` |  |
| `created` | `string` |  |
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `table` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local partner, err = client:Partner():load({ id = "partner_id" })
```

#### Example: List

```lua
local partners, err = client:Partner():list()
```

#### Example: Create

```lua
local partner, err = client:Partner():create({
})
```


### Template

Create an instance: `local template = client:Template(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `any` |  |
| `active` | `boolean` |  |
| `client` | `table` |  |
| `field_template` | `table` |  |
| `id` | `number` |  |
| `name` | `string` |  |
| `option` | `table` |  |
| `partner` | `table` |  |
| `reference` | `string` |  |
| `type` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local template, err = client:Template():load({ id = "template_id" })
```

#### Example: List

```lua
local templates, err = client:Template():list()
```

#### Example: Create

```lua
local template, err = client:Template():create({
})
```


### Transaction

Create an instance: `local transaction = client:Transaction(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `string` |  |
| `client` | `table` |  |
| `complete_date` | `string` |  |
| `direct_partner` | `table` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `number` |  |
| `ip_address` | `string` |  |
| `message_id` | `string` |  |
| `partner` | `table` |  |
| `reference` | `string` |  |
| `success` | `boolean` |  |
| `template_id` | `string` |  |

#### Example: Load

```lua
local transaction, err = client:Transaction():load({ id = "transaction_id" })
```

#### Example: List

```lua
local transactions, err = client:Transaction():list()
```


### UpdateResult

Create an instance: `local update_result = client:UpdateResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client` | `table` |  |
| `contact` | `table` |  |
| `direct_partner` | `table` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `last_name` | `string` |  |
| `mid` | `string` |  |
| `name` | `string` |  |
| `parent` | `table` |  |
| `partner` | `table` |  |
| `phone` | `string` |  |
| `reference` | `string` |  |
| `send_welcome_email` | `boolean` |  |
| `user_name` | `string` |  |
| `user_role` | `table` |  |
| `verification_phrase` | `string` |  |
| `version` | `number` |  |

#### Example: List

```lua
local update_results, err = client:UpdateResult():list()
```

#### Example: Create

```lua
local update_result, err = client:UpdateResult():create({
  contact = {}, -- table
  email = "example_email", -- string
  first_name = "example_first_name", -- string
  last_name = "example_last_name", -- string
  phone = "example_phone", -- string
  user_name = "example_user_name", -- string
  user_role = {}, -- table
})
```


### User

Create an instance: `local user = client:User(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `table` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `table` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `table` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local user, err = client:User():load({ id = "user_id" })
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a Lua table
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as tables

The Lua SDK uses plain Lua tables throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a table.

### Module structure

```
lua/
├── bluefin-shieldconex-mgmt_sdk.lua    -- Main SDK module
├── config.lua               -- Configuration
├── features.lua             -- Feature factory
├── core/                    -- Core types and context
├── entity/                  -- Entity implementations
├── feature/                 -- Built-in features (Base, Test, Log)
├── utility/                 -- Utility functions and struct library
└── test/                    -- Test suites
```

The main module (`bluefin-shieldconex-mgmt_sdk`) exports the SDK constructor
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```lua
local partner = client:Partner()
partner:list()

-- partner:data_get() now returns the partner data from the last list
-- partner:match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
