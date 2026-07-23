# BluefinShieldconexMgmt Ruby SDK



The Ruby SDK for the BluefinShieldconexMgmt API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Client` — with named operations (`list`/`load`/`create`/`update`/`remove`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "BluefinShieldconexMgmt_sdk"

client = BluefinShieldconexMgmtSDK.new({
  "apikey" => ENV["BLUEFIN_SHIELDCONEX_MGMT_APIKEY"],
})
```

### 2. List client records

```ruby
begin
  # list returns an Array of Client records — iterate directly.
  client_s = client.Client.list
  client_s.each do |item|
    puts "#{item["id"]} #{item["billing_id"]}"
  end
rescue => err
  warn "list failed: #{err}"
end
```

### 3. Load a client

```ruby
begin
  # load returns the bare Client record (raises on error).
  client_ = client.Client.load({ "id" => "example_id" })
  puts client_
rescue => err
  warn "load failed: #{err}"
end
```

### 4. Create, update, and remove

```ruby
# create returns the bare created Client record.
created = client.Client.create({ "billing_id" => "example_billing_id", "contact" => {} })

# Remove
client.Client.remove({ "id" => created["id"] })
```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  client_s = client.Client.list()
rescue => err
  warn "list failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```ruby
client = BluefinShieldconexMgmtSDK.test({
  "entity" => { "client" => { "test01" => { "id" => "test01" } } },
})

# Entity ops return the bare mock record (raises on error).
client_ = client.Client.list()
puts client_
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = BluefinShieldconexMgmtSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
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
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### BluefinShieldconexMgmtSDK

```ruby
require_relative "BluefinShieldconexMgmt_sdk"
client = BluefinShieldconexMgmtSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = BluefinShieldconexMgmtSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
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
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch = nil, ctrl) -> Array` | List entities matching the criteria (call with no argument to list all). Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> any` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> any` | Remove an entity. Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `BluefinShieldconexMgmtError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

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

Create an instance: `client_ = client.Client`

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
| `billing_id` | `String` |  |
| `contact` | `Hash` |  |
| `created` | `String` |  |
| `direct_partner` | `Hash` |  |
| `id` | `Integer` |  |
| `is_active` | `Boolean` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare Client record (raises on error).
client_ = client.Client.load({ "id" => "client_id" })
```

#### Example: List

```ruby
# list returns an Array of Client records (raises on error).
client_s = client.Client.list
```

#### Example: Create

```ruby
client_ = client.Client.create({
})
```


### Clone

Create an instance: `clone = client.Clone`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Integer` |  |
| `name` | `String` |  |

#### Example: Create

```ruby
clone = client.Clone.create({
  "template_id" => "example_template_id", # String
})
```


### Partner

Create an instance: `partner = client.Partner`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `contact` | `Hash` |  |
| `created` | `String` |  |
| `id` | `Integer` |  |
| `is_active` | `Boolean` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `Hash` |  |
| `reference` | `String` |  |
| `verification_phrase` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare Partner record (raises on error).
partner = client.Partner.load({ "id" => "partner_id" })
```

#### Example: List

```ruby
# list returns an Array of Partner records (raises on error).
partners = client.Partner.list
```

#### Example: Create

```ruby
partner = client.Partner.create({
})
```


### Template

Create an instance: `template = client.Template`

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
| `access_mode` | `Object` |  |
| `active` | `Boolean` |  |
| `client` | `Hash` |  |
| `field_template` | `Array` |  |
| `id` | `Integer` |  |
| `name` | `String` |  |
| `option` | `Hash` |  |
| `partner` | `Hash` |  |
| `reference` | `String` |  |
| `type` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare Template record (raises on error).
template = client.Template.load({ "id" => "template_id" })
```

#### Example: List

```ruby
# list returns an Array of Template records (raises on error).
templates = client.Template.list
```

#### Example: Create

```ruby
template = client.Template.create({
})
```


### Transaction

Create an instance: `transaction = client.Transaction`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `String` |  |
| `client` | `Hash` |  |
| `complete_date` | `String` |  |
| `direct_partner` | `Hash` |  |
| `err_code` | `String` |  |
| `err_message` | `String` |  |
| `id` | `Integer` |  |
| `ip_address` | `String` |  |
| `message_id` | `String` |  |
| `partner` | `Hash` |  |
| `reference` | `String` |  |
| `success` | `Boolean` |  |
| `template_id` | `String` |  |

#### Example: Load

```ruby
# load returns the bare Transaction record (raises on error).
transaction = client.Transaction.load({ "id" => "transaction_id" })
```

#### Example: List

```ruby
# list returns an Array of Transaction records (raises on error).
transactions = client.Transaction.list
```


### UpdateResult

Create an instance: `update_result = client.UpdateResult`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `client` | `Hash` |  |
| `contact` | `Hash` |  |
| `direct_partner` | `Hash` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `Integer` |  |
| `is_active` | `Boolean` |  |
| `last_name` | `String` |  |
| `mid` | `String` |  |
| `name` | `String` |  |
| `parent` | `Hash` |  |
| `partner` | `Hash` |  |
| `phone` | `String` |  |
| `reference` | `String` |  |
| `send_welcome_email` | `Boolean` |  |
| `user_name` | `String` |  |
| `user_role` | `Hash` |  |
| `verification_phrase` | `String` |  |
| `version` | `Integer` |  |

#### Example: List

```ruby
# list returns an Array of UpdateResult records (raises on error).
update_results = client.UpdateResult.list
```

#### Example: Create

```ruby
update_result = client.UpdateResult.create({
  "contact" => {}, # Hash
  "email" => "example_email", # String
  "first_name" => "example_first_name", # String
  "last_name" => "example_last_name", # String
  "phone" => "example_phone", # String
  "user_name" => "example_user_name", # String
  "user_role" => {}, # Hash
})
```


### User

Create an instance: `user = client.User`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Hash` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `Integer` |  |
| `is_active` | `Boolean` |  |
| `last_name` | `String` |  |
| `modified` | `String` |  |
| `partner` | `Hash` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare User record (raises on error).
user = client.User.load({ "id" => "user_id" })
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

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── BluefinShieldconexMgmt_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`BluefinShieldconexMgmt_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```ruby
client_ = client.Client
client_.list()

# client_.data_get now returns the client_ data from the last list
# client_.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
