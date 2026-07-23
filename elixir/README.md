# BluefinShieldconexMgmt Elixir SDK



The Elixir SDK for the BluefinShieldconexMgmt API — an entity-oriented client
following idiomatic, functional Elixir conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `BluefinShieldconexMgmt.client(sdk)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to [Hex](https://hex.pm). Install it from
the GitHub release tag (`elixir/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases))
by adding a git dependency to your `mix.exs`:

```elixir
def deps do
  [
    {:bluefin_shieldconex_mgmt, git: "https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk.git", tag: "elixir/vX.Y.Z"}
  ]
end
```

Or from a local source checkout:

```elixir
def deps do
  [
    {:bluefin_shieldconex_mgmt, path: "../bluefin-shieldconex-mgmt-sdk/elixir"}
  ]
end
```

Then run `mix deps.get`.


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```elixir
alias BluefinShieldconexMgmt.Helpers, as: H

sdk = BluefinShieldconexMgmt.new(H.deep(%{"apikey" => System.get_env("BLUEFIN_SHIELDCONEX_MGMT_APIKEY")}))
```

### 2. List client records

`list/2` returns a list value node and raises on error.

```elixir
try do
  client = BluefinShieldconexMgmt.client(sdk)
  records = BluefinShieldconexMgmt.Entity.Client.list(client)
  IO.inspect(records)
rescue
  err -> IO.puts("list failed: " <> inspect(err))
end
```

### 3. Load a client

`load/2` returns the bare record and raises on error.

```elixir
try do
  client = BluefinShieldconexMgmt.client(sdk)
  record = BluefinShieldconexMgmt.Entity.Client.load(client, H.deep(%{"id" => "example_id"}))
  IO.inspect(record)
rescue
  err -> IO.puts("load failed: " <> inspect(err))
end
```

### 4. Create, update, and remove

```elixir
client = BluefinShieldconexMgmt.client(sdk)

# Create — returns the bare created record
created = BluefinShieldconexMgmt.Entity.Client.create(client, H.deep(%{"billing_id" => "example_billing_id", "contact" => %{}}))

# Remove
BluefinShieldconexMgmt.Entity.Client.remove(client, H.deep(%{"id" => Voxgig.Struct.getprop(created, "id")}))
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const partners = await client.Partner().list()
  console.log(partners)
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity operations. `direct/2` never raises —
it returns a result node you branch on with `Voxgig.Struct.getprop/2`:

```elixir
alias Voxgig.Struct, as: S
alias BluefinShieldconexMgmt.Helpers, as: H

result = BluefinShieldconexMgmt.direct(sdk, H.deep(%{
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => %{"id" => "example"}
}))

if S.getprop(result, "ok") do
  IO.inspect(S.getprop(result, "status"))  # 200
  IO.inspect(S.getprop(result, "data"))    # response body
else
  # A non-2xx response carries status + data (the error body); a
  # transport-level failure carries err instead.
  IO.inspect(S.getprop(result, "err"))
end
```

### Prepare a request without sending it

```elixir
alias BluefinShieldconexMgmt.Helpers, as: H

# prepare/2 returns the fetch definition and raises on error.
fetchdef = BluefinShieldconexMgmt.prepare(sdk, H.deep(%{
  "path" => "/api/resource/{id}",
  "method" => "DELETE",
  "params" => %{"id" => "example"}
}))

IO.inspect(Voxgig.Struct.getprop(fetchdef, "url"))
IO.inspect(Voxgig.Struct.getprop(fetchdef, "method"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```elixir
alias BluefinShieldconexMgmt.Helpers, as: H

sdk = BluefinShieldconexMgmt.test()

# Entity ops return the bare record (raise on error).
partner = BluefinShieldconexMgmt.partner(sdk)
records = BluefinShieldconexMgmt.Entity.Partner.list(partner, H.deep(%{}))
IO.inspect(records)
```

### Use a custom fetch function

Replace the HTTP transport with your own function. It receives `(url,
fetchdef)` and returns a `{response, error}` tuple:

```elixir
alias Voxgig.Struct, as: S
alias BluefinShieldconexMgmt.Helpers, as: H

mock_fetch = fn _url, _fetchdef ->
  response = H.deep(%{
    "status" => 200,
    "statusText" => "OK",
    "headers" => %{},
    "json" => fn -> %{"id" => "mock01"} end
  })
  {response, nil}
end

sdk = BluefinShieldconexMgmt.new(H.deep(%{
  "base" => "http://localhost:8080",
  "system" => %{"fetch" => mock_fetch}
}))
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd elixir && mix test
```


## Reference

### BluefinShieldconexMgmt

```elixir
sdk = BluefinShieldconexMgmt.new(options)
```

Creates a new SDK client. `options` is a struct value node — build one from a
native map with `BluefinShieldconexMgmt.Helpers.deep/1`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String.t()` | API key for authentication. |
| `base` | `String.t()` | Base URL of the API server. |
| `prefix` | `String.t()` | URL path prefix prepended to all requests. |
| `suffix` | `String.t()` | URL path suffix appended to all requests. |
| `feature` | `map()` | Feature activation flags. |
| `extend` | `list()` | Additional feature instances to load. |
| `system` | `map()` | System overrides (e.g. custom `fetch` function). |

### test

```elixir
sdk = BluefinShieldconexMgmt.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinShieldconexMgmt functions

| Function | Signature | Description |
| --- | --- | --- |
| `options_map` | `(client) :: map()` | Deep copy of current SDK options. |
| `get_utility` | `(client) :: map()` | The SDK utility node. |
| `prepare` | `(client, fetchargs) :: map()` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(client, fetchargs) :: map()` | Build and send an HTTP request. Returns a result node (branch on `ok`). |
| `client` | `(client, entopts \\ nil) :: entity` | Create a Client entity handle. |
| `clone` | `(client, entopts \\ nil) :: entity` | Create a Clone entity handle. |
| `partner` | `(client, entopts \\ nil) :: entity` | Create a Partner entity handle. |
| `template` | `(client, entopts \\ nil) :: entity` | Create a Template entity handle. |
| `transaction` | `(client, entopts \\ nil) :: entity` | Create a Transaction entity handle. |
| `update_result` | `(client, entopts \\ nil) :: entity` | Create an UpdateResult entity handle. |
| `user` | `(client, entopts \\ nil) :: entity` | Create an User entity handle. |

### Entity interface

Every entity's `BluefinShieldconexMgmt.Entity.<Name>` module shares the same interface.

| Function | Signature | Description |
| --- | --- | --- |
| `load` | `(entity, reqmatch, ctrl \\ nil) :: map()` | Load a single entity by match criteria. Raises on error. |
| `list` | `(entity, reqmatch \\ nil, ctrl \\ nil) :: list()` | List entities matching the criteria. Raises on error. |
| `create` | `(entity, reqdata, ctrl \\ nil) :: map()` | Create a new entity. Raises on error. |
| `update` | `(entity, reqdata, ctrl \\ nil) :: map()` | Update an existing entity. Raises on error. |
| `remove` | `(entity, reqmatch \\ nil, ctrl \\ nil) :: map()` | Remove an entity. Raises on error. |
| `data_get` | `(entity) :: map()` | Get entity data. |
| `data_set` | `(entity, data)` | Set entity data. |
| `match_get` | `(entity) :: map()` | Get entity match criteria. |
| `match_set` | `(entity, match)` | Set entity match criteria. |
| `make` | `(entity) :: entity` | Create a new handle with the same options. |
| `get_name` | `(entity) :: String.t()` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a value node — a map for
single-entity ops, a list for `list`) and raise a `BluefinShieldconexMgmt.Error` on
failure. Wrap calls in `try`/`rescue` to handle errors.

The `direct/2` escape hatch never raises — it returns a result node you
branch on via `Voxgig.Struct.getprop(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean()` | `true` if the HTTP status is 2xx. |
| `status` | `integer()` | HTTP status code. |
| `headers` | `map()` | Response headers. |
| `data` | `any()` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

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

Every operation lives on the entity's `BluefinShieldconexMgmt.Entity.<Name>` module and
takes an entity handle built from the client:


### Client

Create a handle: `client = BluefinShieldconexMgmt.client(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |
| `remove(entity, match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String.t()` |  |
| `contact` | `map()` |  |
| `created` | `String.t()` |  |
| `direct_partner` | `map()` |  |
| `id` | `integer()` |  |
| `is_active` | `boolean()` |  |
| `mid` | `String.t()` |  |
| `modified` | `String.t()` |  |
| `name` | `String.t()` |  |
| `partner` | `map()` |  |
| `version` | `integer()` |  |

#### Example: Load

```elixir
client = BluefinShieldconexMgmt.client(sdk)
record = BluefinShieldconexMgmt.Entity.Client.load(client, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "client_id"}))
```

#### Example: List

```elixir
client = BluefinShieldconexMgmt.client(sdk)
records = BluefinShieldconexMgmt.Entity.Client.list(client)
```

#### Example: Create

```elixir
client = BluefinShieldconexMgmt.client(sdk)
record = BluefinShieldconexMgmt.Entity.Client.create(client, BluefinShieldconexMgmt.Helpers.deep(%{
}))
```


### Clone

Create a handle: `clone = BluefinShieldconexMgmt.clone(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `integer()` |  |
| `name` | `String.t()` |  |

#### Example: Create

```elixir
clone = BluefinShieldconexMgmt.clone(sdk)
record = BluefinShieldconexMgmt.Entity.Clone.create(clone, BluefinShieldconexMgmt.Helpers.deep(%{
  "template_id" => "example_template_id",  # String.t()
}))
```


### Partner

Create a handle: `partner = BluefinShieldconexMgmt.partner(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String.t()` |  |
| `contact` | `map()` |  |
| `created` | `String.t()` |  |
| `id` | `integer()` |  |
| `is_active` | `boolean()` |  |
| `modified` | `String.t()` |  |
| `name` | `String.t()` |  |
| `parent` | `map()` |  |
| `reference` | `String.t()` |  |
| `verification_phrase` | `String.t()` |  |
| `version` | `integer()` |  |

#### Example: Load

```elixir
partner = BluefinShieldconexMgmt.partner(sdk)
record = BluefinShieldconexMgmt.Entity.Partner.load(partner, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "partner_id"}))
```

#### Example: List

```elixir
partner = BluefinShieldconexMgmt.partner(sdk)
records = BluefinShieldconexMgmt.Entity.Partner.list(partner)
```

#### Example: Create

```elixir
partner = BluefinShieldconexMgmt.partner(sdk)
record = BluefinShieldconexMgmt.Entity.Partner.create(partner, BluefinShieldconexMgmt.Helpers.deep(%{
}))
```


### Template

Create a handle: `template = BluefinShieldconexMgmt.template(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |
| `remove(entity, match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `any()` |  |
| `active` | `boolean()` |  |
| `client` | `map()` |  |
| `field_template` | `list()` |  |
| `id` | `integer()` |  |
| `name` | `String.t()` |  |
| `option` | `map()` |  |
| `partner` | `map()` |  |
| `reference` | `String.t()` |  |
| `type` | `String.t()` |  |
| `version` | `integer()` |  |

#### Example: Load

```elixir
template = BluefinShieldconexMgmt.template(sdk)
record = BluefinShieldconexMgmt.Entity.Template.load(template, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "template_id"}))
```

#### Example: List

```elixir
template = BluefinShieldconexMgmt.template(sdk)
records = BluefinShieldconexMgmt.Entity.Template.list(template)
```

#### Example: Create

```elixir
template = BluefinShieldconexMgmt.template(sdk)
record = BluefinShieldconexMgmt.Entity.Template.create(template, BluefinShieldconexMgmt.Helpers.deep(%{
}))
```


### Transaction

Create a handle: `transaction = BluefinShieldconexMgmt.transaction(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `String.t()` |  |
| `client` | `map()` |  |
| `complete_date` | `String.t()` |  |
| `direct_partner` | `map()` |  |
| `err_code` | `String.t()` |  |
| `err_message` | `String.t()` |  |
| `id` | `integer()` |  |
| `ip_address` | `String.t()` |  |
| `message_id` | `String.t()` |  |
| `partner` | `map()` |  |
| `reference` | `String.t()` |  |
| `success` | `boolean()` |  |
| `template_id` | `String.t()` |  |

#### Example: Load

```elixir
transaction = BluefinShieldconexMgmt.transaction(sdk)
record = BluefinShieldconexMgmt.Entity.Transaction.load(transaction, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "transaction_id"}))
```

#### Example: List

```elixir
transaction = BluefinShieldconexMgmt.transaction(sdk)
records = BluefinShieldconexMgmt.Entity.Transaction.list(transaction)
```


### UpdateResult

Create a handle: `update_result = BluefinShieldconexMgmt.update_result(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `update(entity, data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String.t()` |  |
| `client` | `map()` |  |
| `contact` | `map()` |  |
| `direct_partner` | `map()` |  |
| `email` | `String.t()` |  |
| `first_name` | `String.t()` |  |
| `id` | `integer()` |  |
| `is_active` | `boolean()` |  |
| `last_name` | `String.t()` |  |
| `mid` | `String.t()` |  |
| `name` | `String.t()` |  |
| `parent` | `map()` |  |
| `partner` | `map()` |  |
| `phone` | `String.t()` |  |
| `reference` | `String.t()` |  |
| `send_welcome_email` | `boolean()` |  |
| `user_name` | `String.t()` |  |
| `user_role` | `map()` |  |
| `verification_phrase` | `String.t()` |  |
| `version` | `integer()` |  |

#### Example: List

```elixir
update_result = BluefinShieldconexMgmt.update_result(sdk)
records = BluefinShieldconexMgmt.Entity.UpdateResult.list(update_result)
```

#### Example: Create

```elixir
update_result = BluefinShieldconexMgmt.update_result(sdk)
record = BluefinShieldconexMgmt.Entity.UpdateResult.create(update_result, BluefinShieldconexMgmt.Helpers.deep(%{
  "contact" => %{},  # map()
  "email" => "example_email",  # String.t()
  "first_name" => "example_first_name",  # String.t()
  "last_name" => "example_last_name",  # String.t()
  "phone" => "example_phone",  # String.t()
  "user_name" => "example_user_name",  # String.t()
  "user_role" => %{},  # map()
}))
```


### User

Create a handle: `user = BluefinShieldconexMgmt.user(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map()` |  |
| `created` | `String.t()` |  |
| `email` | `String.t()` |  |
| `first_name` | `String.t()` |  |
| `id` | `integer()` |  |
| `is_active` | `boolean()` |  |
| `last_name` | `String.t()` |  |
| `modified` | `String.t()` |  |
| `partner` | `map()` |  |
| `phone` | `String.t()` |  |
| `user_name` | `String.t()` |  |
| `user_role` | `map()` |  |
| `version` | `integer()` |  |

#### Example: Load

```elixir
user = BluefinShieldconexMgmt.user(sdk)
record = BluefinShieldconexMgmt.Entity.User.load(user, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "user_id"}))
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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as struct value nodes

The Elixir SDK models every runtime object — clients, contexts, results and
record data — as reference-stable struct value nodes from the vendored
`Voxgig.Struct` library rather than as compile-time structs. This mirrors
the dynamic nature of the API and lets a feature hook mutate a shared node
that every later pipeline stage observes — the immutable-Elixir way to honour
the shared-mutable hook contract.

Build inputs from native Elixir maps with `BluefinShieldconexMgmt.Helpers.deep/1`,
and read fields off results with `Voxgig.Struct.getprop/2`.

### Module structure

```
elixir/
├── lib/
│   ├── bluefin-shieldconex-mgmt.ex                 -- Main SDK module (entity factories)
│   ├── config.ex                 -- Resolved configuration
│   ├── features.ex               -- Feature factory
│   ├── pipeline.ex               -- Operation pipeline
│   └── bluefin-shieldconex-mgmt/
│       ├── context.ex            -- Operation context
│       ├── entity_base.ex        -- Shared entity behaviour
│       ├── error.ex              -- SDK error type
│       ├── feature.ex            -- Built-in features
│       ├── helpers.ex            -- Value helpers (deep/1, ...)
│       ├── json.ex               -- JSON encode/decode
│       └── utility.ex            -- Utility functions
│   └── entity/                   -- Per-entity modules
├── mix.exs                       -- Package manifest
└── test/                         -- ExUnit suites
```

The main module `BluefinShieldconexMgmt` exposes the SDK constructors and one entity
factory function per entity. Call an operation on the matching
`BluefinShieldconexMgmt.Entity.<Name>` module.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const partner = client.Partner()
await partner.list()

// partner.data() now returns the partner data from the last `list`
// partner.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
