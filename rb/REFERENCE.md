# BluefinShieldconexMgmt Ruby SDK Reference

Complete API reference for the BluefinShieldconexMgmt Ruby SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```ruby
require_relative 'BluefinShieldconexMgmt_sdk'

client = BluefinShieldconexMgmtSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinShieldconexMgmtSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = BluefinShieldconexMgmtSDK.test
```


### Instance Methods

#### `Client(data = nil)`

Create a new `Client` entity instance. Pass `nil` for no initial data.

#### `Clone(data = nil)`

Create a new `Clone` entity instance. Pass `nil` for no initial data.

#### `Partner(data = nil)`

Create a new `Partner` entity instance. Pass `nil` for no initial data.

#### `Template(data = nil)`

Create a new `Template` entity instance. Pass `nil` for no initial data.

#### `Transaction(data = nil)`

Create a new `Transaction` entity instance. Pass `nil` for no initial data.

#### `UpdateResult(data = nil)`

Create a new `UpdateResult` entity instance. Pass `nil` for no initial data.

#### `User(data = nil)`

Create a new `User` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## ClientEntity

```ruby
client_ = client.Client
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `contact` | `Hash` | No |  |
| `created` | `String` | No |  |
| `direct_partner` | `Hash` | No |  |
| `id` | `Integer` | No |  |
| `is_active` | `Boolean` | No |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `Hash` | No |  |
| `version` | `Integer` | No |  |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Client.create({
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Client.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Client.load({ "id" => "client_id" })
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.Client.remove({ "id" => "client_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ClientEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## CloneEntity

```ruby
clone = client.Clone
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Integer` | No |  |
| `name` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Clone.create({
  "template_id" => "example_template_id", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `CloneEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PartnerEntity

```ruby
partner = client.Partner
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `contact` | `Hash` | No |  |
| `created` | `String` | No |  |
| `id` | `Integer` | No |  |
| `is_active` | `Boolean` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Hash` | No |  |
| `reference` | `String` | No |  |
| `verification_phrase` | `String` | No |  |
| `version` | `Integer` | No |  |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Partner.create({
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Partner.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Partner.load({ "id" => "partner_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PartnerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TemplateEntity

```ruby
template = client.Template
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `Object` | No |  |
| `active` | `Boolean` | No |  |
| `client` | `Hash` | No |  |
| `field_template` | `Array` | No |  |
| `id` | `Integer` | No |  |
| `name` | `String` | No |  |
| `option` | `Hash` | No |  |
| `partner` | `Hash` | No |  |
| `reference` | `String` | No |  |
| `type` | `String` | No |  |
| `version` | `Integer` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Template.create({
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Template.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Template.load({ "id" => "template_id" })
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.Template.remove({ "id" => "template_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TemplateEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TransactionEntity

```ruby
transaction = client.Transaction
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `String` | No |  |
| `client` | `Hash` | No |  |
| `complete_date` | `String` | No |  |
| `direct_partner` | `Hash` | No |  |
| `err_code` | `String` | No |  |
| `err_message` | `String` | No |  |
| `id` | `Integer` | No |  |
| `ip_address` | `String` | No |  |
| `message_id` | `String` | No |  |
| `partner` | `Hash` | No |  |
| `reference` | `String` | No |  |
| `success` | `Boolean` | No |  |
| `template_id` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Transaction.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Transaction.load({ "id" => "transaction_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TransactionEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## UpdateResultEntity

```ruby
update_result = client.UpdateResult
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `client` | `Hash` | No |  |
| `contact` | `Hash` | Yes |  |
| `direct_partner` | `Hash` | No |  |
| `email` | `String` | Yes |  |
| `first_name` | `String` | Yes |  |
| `id` | `Integer` | No |  |
| `is_active` | `Boolean` | No |  |
| `last_name` | `String` | Yes |  |
| `mid` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Hash` | No |  |
| `partner` | `Hash` | No |  |
| `phone` | `String` | Yes |  |
| `reference` | `String` | No |  |
| `send_welcome_email` | `Boolean` | No |  |
| `user_name` | `String` | Yes |  |
| `user_role` | `Hash` | Yes |  |
| `verification_phrase` | `String` | No |  |
| `version` | `Integer` | No |  |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.UpdateResult.create({
  "contact" => {}, # Hash
  "email" => "example_email", # String
  "first_name" => "example_first_name", # String
  "last_name" => "example_last_name", # String
  "phone" => "example_phone", # String
  "user_name" => "example_user_name", # String
  "user_role" => {}, # Hash
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.UpdateResult.list
```

#### `update(reqdata, ctrl = nil) -> result`

Update an existing entity. The data must include the entity `id`. Raises on error.

```ruby
result = client.UpdateResult.update({
  "id" => "id",
  # Fields to update
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `UpdateResultEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## UserEntity

```ruby
user = client.User
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Hash` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `Integer` | No |  |
| `is_active` | `Boolean` | No |  |
| `last_name` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Hash` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `Hash` | No |  |
| `version` | `Integer` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.User.load({ "id" => "user_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `UserEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = BluefinShieldconexMgmtSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

