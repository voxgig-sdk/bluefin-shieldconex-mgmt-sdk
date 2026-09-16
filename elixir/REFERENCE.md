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
  "active" => true,  # boolean()
  "client_id" => 1,  # integer()
  "client_name" => "example_client_name",  # String.t()
  "name" => "example_name",  # String.t()
  "partner_id" => 1,  # integer()
  "partner_name" => "example_partner_name",  # String.t()
  "reference" => "example_reference",  # String.t()
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
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
| `debug` | 0.0.1 | Request/response capture ring buffer for debugging |
| `idempotency` | 0.0.1 | Idempotency keys for safe retries of mutating operations |
| `log` | 0.0.1 | Structured request and response logging |
| `metrics` | 0.0.1 | Statistics capture: per-operation counters and latency |
| `paging` | 0.0.1 | Pagination signals for list operations |
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `telemetry` | 0.0.1 | Distributed tracing spans with W3C trace-context propagation |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```elixir
sdk = BluefinShieldconexMgmt.new(BluefinShieldconexMgmt.Helpers.deep(%{
  "feature" => %{
    "audit" => %{"active" => true},
    "clienttrack" => %{"active" => true},
    "debug" => %{"active" => true},
    "idempotency" => %{"active" => true},
    "log" => %{"active" => true},
    "metrics" => %{"active" => true},
    "paging" => %{"active" => true},
    "ratelimit" => %{"active" => true},
    "retry" => %{"active" => true},
    "telemetry" => %{"active" => true},
    "test" => %{"active" => true},
    "timeout" => %{"active" => true},
  }
}))
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`ratelimit`, `retry`, `timeout` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`audit`, `clienttrack`, `debug`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Structured audit trail of operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

| Option | Type |
|---|---|
| `now` | function |
| `sink` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client identity and per-request correlation headers.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

| Option | Type |
|---|---|
| `clientName` | string |
| `headers` | map |
| `idgen` | function |
| `sessionId` | string |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `debug`

Request/response capture ring buffer for debugging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

| Option | Type |
|---|---|
| `now` | function |
| `onEntry` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.debug.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency keys for safe retries of mutating operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

| Option | Type |
|---|---|
| `keygen` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Structured request and response logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

| Option | Type |
|---|---|
| `level` | string |
| `logger` | any |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Statistics capture: per-operation counters and latency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Pagination signals for list operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

| Option | Type |
|---|---|
| `limit` | number |
| `ops` | list |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Client-side rate limiting via a token bucket.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

| Option | Type |
|---|---|
| `now` | function |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Automatic retry of transient failures with exponential backoff.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

| Option | Type |
|---|---|
| `jitter` | boolean |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Distributed tracing spans with W3C trace-context propagation.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `exporter` | function |
| `headers` | map |
| `idgen` | function |
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

#### `timeout`

Per-request timeout with transport abort.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

| Option | Type |
|---|---|
| `clearTimer` | function |
| `setTimer` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

