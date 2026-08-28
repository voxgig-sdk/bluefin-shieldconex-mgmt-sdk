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
created = BluefinShieldconexMgmt.Entity.Client.create(client, H.deep(%{"contact_email" => "example_contact_email", "contact_first_name" => "example_contact_first_name", "contact_is_active" => true, "contact_last_name" => "example_contact_last_name", "contact_phone" => "example_contact_phone", "contact_send_welcome_email" => true, "contact_user_name" => "example_contact_user_name", "contact_user_role" => "example_contact_user_role", "direct_partner_id" => 1, "direct_partner_name" => "example_direct_partner_name", "is_active" => true, "name" => "example_name"}))

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
| `billingId` | Billing ID |
| `contact` |  |
| `created` | Creation timestamp in ISO 8601 format. |
| `directPartner` | Reference to the associated Partner. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Client account is active or disabled. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | Last modified timestamp. |
| `name` | The Client's name. |
| `partner` | Reference to the associated Partner. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### Clone

| Field | Description |
| --- | --- |
| `id` | Unique identifier of newly added element. |
| `name` | Name of Template |

Operations: Create.

API path: `/templates/{id}/clone`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `contact` |  |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Parter account is active or disabled. |
| `modified` | Last modified timestamp. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `reference` | The Partner's reference string. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/partners`

#### Template

| Field | Description |
| --- | --- |
| `accessMode` | The Template's access mode. |
| `active` | This property indicates if the Template is active or inactive. |
| `client` | Reference to the associated Client resource. |
| `fieldTemplates` | Field Template list items |
| `id` | Unique identifier of newly added element. |
| `name` | The Template's name. |
| `options` |  |
| `partner` | Reference to the associated Partner. |
| `reference` | The Template's unique reference. |
| `type` | The Template's type. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/templates`

#### Transaction

| Field | Description |
| --- | --- |
| `bfid` | BFID |
| `client` | Reference to the associated Client resource. |
| `completeDate` | Timestamp from the beginning of the transaction. |
| `directPartner` | Reference to the associated Partner. |
| `errCode` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | This resource's unique identifier. |
| `ipAddress` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | Message ID. |
| `partner` | Reference to the associated Partner. |
| `reference` | The reference property that the Client includes in the decrypt API call. |
| `success` | The success indicator. |
| `templateId` | The Template's unique identifier. |

Operations: List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `client` | Reference to the associated Client resource. |
| `contact` |  |
| `directPartner` | Reference to the associated Partner. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | Unique identifier of newly added element. |
| `isActive` | This property indicates if the User account is active or disabled. |
| `lastName` | The User's Surname. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | The Partner's reference string. |
| `sendWelcomeEmail` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `email` |  |
| `firstName` |  |
| `id` | This resource's unique identifier. |
| `isActive` |  |
| `lastName` |  |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `phone` |  |
| `userName` |  |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

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
| `billingId` | `String.t()` | Billing ID |
| `contact` | `map()` |  |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `map()` | Reference to the associated Partner. |
| `id` | `integer()` | This resource's unique identifier. |
| `isActive` | `boolean()` | This property indicates if the Client account is active or disabled. |
| `mid` | `String.t()` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String.t()` | Last modified timestamp. |
| `name` | `String.t()` | The Client's name. |
| `partner` | `map()` | Reference to the associated Partner. |
| `version` | `integer()` | The number of times that this resource has been updated. |

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
  "contact_email" => "example_contact_email",  # String.t()
  "contact_first_name" => "example_contact_first_name",  # String.t()
  "contact_is_active" => true,  # boolean()
  "contact_last_name" => "example_contact_last_name",  # String.t()
  "contact_phone" => "example_contact_phone",  # String.t()
  "contact_send_welcome_email" => true,  # boolean()
  "contact_user_name" => "example_contact_user_name",  # String.t()
  "contact_user_role" => "example_contact_user_role",  # String.t()
  "direct_partner_id" => 1,  # integer()
  "direct_partner_name" => "example_direct_partner_name",  # String.t()
  "is_active" => true,  # boolean()
  "name" => "example_name",  # String.t()
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
| `id` | `integer()` | Unique identifier of newly added element. |
| `name` | `String.t()` | Name of Template |

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
| `billingId` | `String.t()` | The Partner's billing identifier. |
| `contact` | `map()` |  |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `id` | `integer()` | This resource's unique identifier. |
| `isActive` | `boolean()` | This property indicates if the Parter account is active or disabled. |
| `modified` | `String.t()` | Last modified timestamp. |
| `name` | `String.t()` | The Partner's name. |
| `parent` | `map()` | Reference to the associated Partner. |
| `reference` | `String.t()` | The Partner's reference string. |
| `verificationPhrase` | `String.t()` | The verification phrase is a message that the Partner creates. |
| `version` | `integer()` | The number of times that this resource has been updated. |

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
  "billing_id" => "example_billing_id",  # String.t()
  "contact_email" => "example_contact_email",  # String.t()
  "contact_first_name" => "example_contact_first_name",  # String.t()
  "contact_is_active" => true,  # boolean()
  "contact_last_name" => "example_contact_last_name",  # String.t()
  "contact_phone" => "example_contact_phone",  # String.t()
  "contact_send_welcome_email" => true,  # boolean()
  "contact_user_name" => "example_contact_user_name",  # String.t()
  "contact_user_role" => "example_contact_user_role",  # String.t()
  "is_active" => true,  # boolean()
  "name" => "example_name",  # String.t()
  "reference" => "example_reference",  # String.t()
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
| `accessMode` | `any()` | The Template's access mode. |
| `active` | `boolean()` | This property indicates if the Template is active or inactive. |
| `client` | `map()` | Reference to the associated Client resource. |
| `fieldTemplates` | `list()` | Field Template list items |
| `id` | `integer()` | Unique identifier of newly added element. |
| `name` | `String.t()` | The Template's name. |
| `options` | `map()` |  |
| `partner` | `map()` | Reference to the associated Partner. |
| `reference` | `String.t()` | The Template's unique reference. |
| `type` | `String.t()` | The Template's type. |
| `version` | `integer()` | The number of times that this resource has been updated. |

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
  "active" => true,  # boolean()
  "client_id" => 1,  # integer()
  "client_name" => "example_client_name",  # String.t()
  "name" => "example_name",  # String.t()
  "partner_id" => 1,  # integer()
  "partner_name" => "example_partner_name",  # String.t()
  "reference" => "example_reference",  # String.t()
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
| `bfid` | `String.t()` | BFID |
| `client` | `map()` | Reference to the associated Client resource. |
| `completeDate` | `String.t()` | Timestamp from the beginning of the transaction. |
| `directPartner` | `map()` | Reference to the associated Partner. |
| `errCode` | `String.t()` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String.t()` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `integer()` | This resource's unique identifier. |
| `ipAddress` | `String.t()` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String.t()` | Message ID. |
| `partner` | `map()` | Reference to the associated Partner. |
| `reference` | `String.t()` | The reference property that the Client includes in the decrypt API call. |
| `success` | `boolean()` | The success indicator. |
| `templateId` | `String.t()` | The Template's unique identifier. |

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
| `billingId` | `String.t()` | The Partner's billing identifier. |
| `client` | `map()` | Reference to the associated Client resource. |
| `contact` | `map()` |  |
| `directPartner` | `map()` | Reference to the associated Partner. |
| `email` | `String.t()` | The User's email address. |
| `firstName` | `String.t()` | The User's name. |
| `id` | `integer()` | Unique identifier of newly added element. |
| `isActive` | `boolean()` | This property indicates if the User account is active or disabled. |
| `lastName` | `String.t()` | The User's Surname. |
| `mid` | `String.t()` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String.t()` | The Partner's name. |
| `parent` | `map()` | Reference to the associated Partner. |
| `partner` | `map()` | Reference to the associated Partner. |
| `phone` | `String.t()` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String.t()` | The Partner's reference string. |
| `sendWelcomeEmail` | `boolean()` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String.t()` | The User's unique username. |
| `userRole` | `map()` | Reference to the associated User Role. |
| `verificationPhrase` | `String.t()` | The verification phrase is a message that the Partner creates. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: List

```elixir
update_result = BluefinShieldconexMgmt.update_result(sdk)
records = BluefinShieldconexMgmt.Entity.UpdateResult.list(update_result)
```

#### Example: Create

```elixir
update_result = BluefinShieldconexMgmt.update_result(sdk)
record = BluefinShieldconexMgmt.Entity.UpdateResult.create(update_result, BluefinShieldconexMgmt.Helpers.deep(%{
  "email" => "example_email",  # String.t()
  "first_name" => "example_first_name",  # String.t()
  "is_active" => true,  # boolean()
  "last_name" => "example_last_name",  # String.t()
  "phone" => 1,  # integer()
  "send_welcome_email" => true,  # boolean()
  "user_role" => %{},  # map()
  "username" => "example_username",  # String.t()
  "contact" => %{},  # map()
  "firstName" => "example_firstName",  # String.t()
  "lastName" => "example_lastName",  # String.t()
  "userName" => "example_userName",  # String.t()
  "userRole" => %{},  # map()
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
| `client` | `map()` | Reference to the associated Client resource. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `email` | `String.t()` |  |
| `firstName` | `String.t()` |  |
| `id` | `integer()` | This resource's unique identifier. |
| `isActive` | `boolean()` |  |
| `lastName` | `String.t()` |  |
| `modified` | `String.t()` | Last modified timestamp. |
| `partner` | `map()` | Reference to the associated Partner. |
| `phone` | `String.t()` |  |
| `userName` | `String.t()` |  |
| `userRole` | `map()` | Reference to the associated User Role. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
user = BluefinShieldconexMgmt.user(sdk)
record = BluefinShieldconexMgmt.Entity.User.load(user, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "user_id"}))
```

## Features

This SDK ships 11 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Structured audit trail of operations |
| [`clienttrack`](#clienttrack) | Client identity and per-request correlation headers |
| [`idempotency`](#idempotency) | Idempotency keys for safe retries of mutating operations |
| [`log`](#log) | Structured request and response logging |
| [`metrics`](#metrics) | Statistics capture: per-operation counters and latency |
| [`paging`](#paging) | Pagination signals for list operations |
| [`ratelimit`](#ratelimit) | Client-side rate limiting via a token bucket |
| [`retry`](#retry) | Automatic retry of transient failures with exponential backoff |
| [`telemetry`](#telemetry) | Distributed tracing spans with W3C trace-context propagation |
| [`test`](#test) | In-memory mock transport for testing without a live server |
| [`timeout`](#timeout) | Per-request timeout with transport abort |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### audit

Structured audit trail of operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Set `feature.audit.active` to enable it, then override any of the options above.

### clienttrack

Client identity and per-request correlation headers.

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Set `feature.clienttrack.active` to enable it, then override any of the options above.

### idempotency

Idempotency keys for safe retries of mutating operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Set `feature.idempotency.active` to enable it, then override any of the options above.

### log

Structured request and response logging.

| Option | Default |
|---|---|
| `active` | `true` |

Set `feature.log.active` to enable it, then override any of the options above.

### metrics

Statistics capture: per-operation counters and latency.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.metrics.active` to enable it, then override any of the options above.

### paging

Pagination signals for list operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

Set `feature.paging.active` to enable it, then override any of the options above.

### ratelimit

Client-side rate limiting via a token bucket.

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Set `feature.ratelimit.active` to enable it, then override any of the options above.

`ratelimit` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### retry

Automatic retry of transient failures with exponential backoff.

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Set `feature.retry.active` to enable it, then override any of the options above.

`retry` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### telemetry

Distributed tracing spans with W3C trace-context propagation.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.telemetry.active` to enable it, then override any of the options above.

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Per-request timeout with transport abort.

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Set `feature.timeout.active` to enable it, then override any of the options above.

`timeout` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.


## Open types

1 field is carried as open values rather than typed structures.
This follows from the API definition, not from a gap in this SDK: the
definition describes it with untagged unions —
`oneOf`/`anyOf` branches with no `discriminator` — so it never states which
variant a given value is. Nothing can select a branch reliably, so the SDK
passes the value through unchanged rather than assert a shape the API does not
guarantee.

| Entity | Field | Variants | Nesting |
| --- | --- | --- | --- |
| `template` | `fieldTemplates` | 9 | 1 level |

These values round-trip unchanged — read them, modify them, send them back. If
the API adds a `discriminator` to the definition, regenerating will type them.
Every other field is typed normally.

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

- **AuditFeature**: Structured audit trail of operations
- **ClienttrackFeature**: Client identity and per-request correlation headers
- **IdempotencyFeature**: Idempotency keys for safe retries of mutating operations
- **LogFeature**: Structured request and response logging
- **MetricsFeature**: Statistics capture: per-operation counters and latency
- **PagingFeature**: Pagination signals for list operations
- **RatelimitFeature**: Client-side rate limiting via a token bucket
- **RetryFeature**: Automatic retry of transient failures with exponential backoff
- **TelemetryFeature**: Distributed tracing spans with W3C trace-context propagation
- **TestFeature**: In-memory mock transport for testing without a live server
- **TimeoutFeature**: Per-request timeout with transport abort

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
