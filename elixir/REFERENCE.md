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
| `billingId` | `String.t()` | No | Billing ID |
| `contact` | `map()` | No |  |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `map()` | No | Reference to the associated Partner. |
| `id` | `integer()` | No | This resource's unique identifier. |
| `isActive` | `boolean()` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `String.t()` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `name` | `String.t()` | No | The Client's name. |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `id` | `integer()` | No | Unique identifier of newly added element. |
| `name` | `String.t()` | No | Name of Template |

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
| `billingId` | `String.t()` | No | The Partner's billing identifier. |
| `contact` | `map()` | No |  |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `id` | `integer()` | No | This resource's unique identifier. |
| `isActive` | `boolean()` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `name` | `String.t()` | No | The Partner's name. |
| `parent` | `map()` | No | Reference to the associated Partner. |
| `reference` | `String.t()` | No | The Partner's reference string. |
| `verificationPhrase` | `String.t()` | No | The verification phrase is a message that the Partner creates. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `accessMode` | `any()` | No | The Template's access mode. |
| `active` | `boolean()` | No | This property indicates if the Template is active or inactive. |
| `client` | `map()` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `list()` | No | Field Template list items |
| `id` | `integer()` | No | Unique identifier of newly added element. |
| `name` | `String.t()` | No | The Template's name. |
| `options` | `map()` | No |  |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `reference` | `String.t()` | No | The Template's unique reference. |
| `type` | `String.t()` | No | The Template's type. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `bfid` | `String.t()` | No | BFID |
| `client` | `map()` | No | Reference to the associated Client resource. |
| `completeDate` | `String.t()` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `map()` | No | Reference to the associated Partner. |
| `errCode` | `String.t()` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String.t()` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `integer()` | No | This resource's unique identifier. |
| `ipAddress` | `String.t()` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String.t()` | No | Message ID. |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `reference` | `String.t()` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `boolean()` | No | The success indicator. |
| `templateId` | `String.t()` | No | The Template's unique identifier. |

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
| `billingId` | `String.t()` | No | The Partner's billing identifier. |
| `client` | `map()` | No | Reference to the associated Client resource. |
| `contact` | `map()` | Yes |  |
| `directPartner` | `map()` | No | Reference to the associated Partner. |
| `email` | `String.t()` | Yes | The User's email address. |
| `firstName` | `String.t()` | Yes | The User's name. |
| `id` | `integer()` | No | Unique identifier of newly added element. |
| `isActive` | `boolean()` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `String.t()` | Yes | The User's Surname. |
| `mid` | `String.t()` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String.t()` | No | The Partner's name. |
| `parent` | `map()` | No | Reference to the associated Partner. |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `phone` | `String.t()` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String.t()` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `boolean()` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String.t()` | Yes | The User's unique username. |
| `userRole` | `map()` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `String.t()` | No | The verification phrase is a message that the Partner creates. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinShieldconexMgmt.Entity.UpdateResult.create(update_result, BluefinShieldconexMgmt.Helpers.deep(%{
  "contact" => %{},  # map()
  "email" => "example_email",  # String.t()
  "firstName" => "example_firstName",  # String.t()
  "lastName" => "example_lastName",  # String.t()
  "phone" => "example_phone",  # String.t()
  "userName" => "example_userName",  # String.t()
  "userRole" => %{},  # map()
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
| `client` | `map()` | No | Reference to the associated Client resource. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String.t()` | No |  |
| `firstName` | `String.t()` | No |  |
| `id` | `integer()` | No | This resource's unique identifier. |
| `isActive` | `boolean()` | No |  |
| `lastName` | `String.t()` | No |  |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `phone` | `String.t()` | No |  |
| `userName` | `String.t()` | No |  |
| `userRole` | `map()` | No | Reference to the associated User Role. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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

