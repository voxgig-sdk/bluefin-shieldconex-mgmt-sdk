# BluefinShieldconexMgmt Elixir SDK Reference

Complete API reference for the BluefinShieldconexMgmt Elixir SDK.


## BluefinShieldconexMgmt

### Constructor

```elixir
sdk = BluefinShieldconexMgmt.new(options)
```

Create a new SDK client. `options` is a struct value node — build one from a
native map with `BluefinShieldconexMgmt.Helpers.deep/1`.

**Options:**

| Name | Type | Description |
| --- | --- | --- |
| `apikey` | `String.t()` | API key for authentication. |
| `base` | `String.t()` | Base URL for API requests. |
| `prefix` | `String.t()` | URL prefix appended after base. |
| `suffix` | `String.t()` | URL suffix appended after path. |
| `headers` | `map()` | Custom headers for all requests. |
| `feature` | `map()` | Feature configuration. |
| `system` | `map()` | System overrides (e.g. custom fetch). |


### Constructors

#### `BluefinShieldconexMgmt.test(testopts \\ nil, sdkopts \\ nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```elixir
sdk = BluefinShieldconexMgmt.test()
```


### Functions

#### `BluefinShieldconexMgmt.client(client, entopts \\ nil)`

Create a `BluefinShieldconexMgmt.Entity.Client` handle.

#### `BluefinShieldconexMgmt.clone(client, entopts \\ nil)`

Create a `BluefinShieldconexMgmt.Entity.Clone` handle.

#### `BluefinShieldconexMgmt.partner(client, entopts \\ nil)`

Create a `BluefinShieldconexMgmt.Entity.Partner` handle.

#### `BluefinShieldconexMgmt.template(client, entopts \\ nil)`

Create a `BluefinShieldconexMgmt.Entity.Template` handle.

#### `BluefinShieldconexMgmt.transaction(client, entopts \\ nil)`

Create a `BluefinShieldconexMgmt.Entity.Transaction` handle.

#### `BluefinShieldconexMgmt.update_result(client, entopts \\ nil)`

Create a `BluefinShieldconexMgmt.Entity.UpdateResult` handle.

#### `BluefinShieldconexMgmt.user(client, entopts \\ nil)`

Create a `BluefinShieldconexMgmt.Entity.User` handle.

#### `options_map(client) :: map()`

Return a deep copy of the current SDK options.

#### `get_utility(client) :: map()`

Return the SDK utility node.

#### `direct(client, fetchargs) :: map()`

Make a direct HTTP request to any API endpoint. Returns a result node with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `Voxgig.Struct.getprop(result, "ok")`.

**fetchargs keys:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String.t()` | URL path with optional `{param}` placeholders. |
| `method` | `String.t()` | HTTP method (default: `"GET"`). |
| `params` | `map()` | Path parameter values. |
| `query` | `map()` | Query string parameters. |
| `headers` | `map()` | Request headers (merged with defaults). |
| `body` | `any()` | Request body (maps are JSON-serialized). |

#### `prepare(client, fetchargs) :: map()`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises
on error.


---

## BluefinShieldconexMgmt.Entity.Client

```elixir
client = BluefinShieldconexMgmt.client(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String.t()` | No |  |
| `contact` | `map()` | No |  |
| `created` | `String.t()` | No |  |
| `direct_partner` | `map()` | No |  |
| `id` | `integer()` | No |  |
| `is_active` | `boolean()` | No |  |
| `mid` | `String.t()` | No |  |
| `modified` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `partner` | `map()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Client.create(client, BluefinShieldconexMgmt.Helpers.deep(%{
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinShieldconexMgmt.Entity.Client.list(client)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Client.load(client, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "client_id"}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Client.remove(client, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "client_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinShieldconexMgmt.Entity.Client` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinShieldconexMgmt.Entity.Clone

```elixir
clone = BluefinShieldconexMgmt.clone(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `integer()` | No |  |
| `name` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Clone.create(clone, BluefinShieldconexMgmt.Helpers.deep(%{
  "template_id" => "example_template_id",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinShieldconexMgmt.Entity.Clone` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinShieldconexMgmt.Entity.Partner

```elixir
partner = BluefinShieldconexMgmt.partner(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String.t()` | No |  |
| `contact` | `map()` | No |  |
| `created` | `String.t()` | No |  |
| `id` | `integer()` | No |  |
| `is_active` | `boolean()` | No |  |
| `modified` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `parent` | `map()` | No |  |
| `reference` | `String.t()` | No |  |
| `verification_phrase` | `String.t()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Partner.create(partner, BluefinShieldconexMgmt.Helpers.deep(%{
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinShieldconexMgmt.Entity.Partner.list(partner)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Partner.load(partner, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "partner_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinShieldconexMgmt.Entity.Partner` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinShieldconexMgmt.Entity.Template

```elixir
template = BluefinShieldconexMgmt.template(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `any()` | No |  |
| `active` | `boolean()` | No |  |
| `client` | `map()` | No |  |
| `field_template` | `list()` | No |  |
| `id` | `integer()` | No |  |
| `name` | `String.t()` | No |  |
| `option` | `map()` | No |  |
| `partner` | `map()` | No |  |
| `reference` | `String.t()` | No |  |
| `type` | `String.t()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Template.create(template, BluefinShieldconexMgmt.Helpers.deep(%{
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinShieldconexMgmt.Entity.Template.list(template)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Template.load(template, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "template_id"}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Template.remove(template, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "template_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinShieldconexMgmt.Entity.Template` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinShieldconexMgmt.Entity.Transaction

```elixir
transaction = BluefinShieldconexMgmt.transaction(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `String.t()` | No |  |
| `client` | `map()` | No |  |
| `complete_date` | `String.t()` | No |  |
| `direct_partner` | `map()` | No |  |
| `err_code` | `String.t()` | No |  |
| `err_message` | `String.t()` | No |  |
| `id` | `integer()` | No |  |
| `ip_address` | `String.t()` | No |  |
| `message_id` | `String.t()` | No |  |
| `partner` | `map()` | No |  |
| `reference` | `String.t()` | No |  |
| `success` | `boolean()` | No |  |
| `template_id` | `String.t()` | No |  |

### Operations

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinShieldconexMgmt.Entity.Transaction.list(transaction)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.Transaction.load(transaction, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "transaction_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinShieldconexMgmt.Entity.Transaction` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinShieldconexMgmt.Entity.UpdateResult

```elixir
update_result = BluefinShieldconexMgmt.update_result(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String.t()` | No |  |
| `client` | `map()` | No |  |
| `contact` | `map()` | Yes |  |
| `direct_partner` | `map()` | No |  |
| `email` | `String.t()` | Yes |  |
| `first_name` | `String.t()` | Yes |  |
| `id` | `integer()` | No |  |
| `is_active` | `boolean()` | No |  |
| `last_name` | `String.t()` | Yes |  |
| `mid` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `parent` | `map()` | No |  |
| `partner` | `map()` | No |  |
| `phone` | `String.t()` | Yes |  |
| `reference` | `String.t()` | No |  |
| `send_welcome_email` | `boolean()` | No |  |
| `user_name` | `String.t()` | Yes |  |
| `user_role` | `map()` | Yes |  |
| `verification_phrase` | `String.t()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
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

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinShieldconexMgmt.Entity.UpdateResult.list(update_result)
```

#### `update(entity, reqdata, ctrl \\ nil) :: map()`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.UpdateResult.update(update_result, BluefinShieldconexMgmt.Helpers.deep(%{
  "id" => "id",
  # Fields to update
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinShieldconexMgmt.Entity.UpdateResult` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinShieldconexMgmt.Entity.User

```elixir
user = BluefinShieldconexMgmt.user(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map()` | No |  |
| `created` | `String.t()` | No |  |
| `email` | `String.t()` | No |  |
| `first_name` | `String.t()` | No |  |
| `id` | `integer()` | No |  |
| `is_active` | `boolean()` | No |  |
| `last_name` | `String.t()` | No |  |
| `modified` | `String.t()` | No |  |
| `partner` | `map()` | No |  |
| `phone` | `String.t()` | No |  |
| `user_name` | `String.t()` | No |  |
| `user_role` | `map()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.User.load(user, BluefinShieldconexMgmt.Helpers.deep(%{"id" => "user_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinShieldconexMgmt.Entity.User` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```elixir
sdk = BluefinShieldconexMgmt.new(BluefinShieldconexMgmt.Helpers.deep(%{
  "feature" => %{
    "test" => %{"active" => true},
  }
}))
```

