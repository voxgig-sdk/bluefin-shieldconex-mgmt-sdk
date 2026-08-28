# BluefinShieldconexMgmt Kotlin SDK Reference

Complete API reference for the BluefinShieldconexMgmt Kotlin SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```kotlin
val client = BluefinShieldconexMgmtSDK(options)
```

Create a new SDK client instance. `options` is a `MutableMap<String, Any?>`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Map` | Custom headers for all requests. |
| `options["feature"]` | `Map` | Feature configuration. |
| `options["system"]` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinShieldconexMgmtSDK.testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `null`.

```kotlin
val client = BluefinShieldconexMgmtSDK.testSDK(null, null)
```


### Instance Methods

#### `client(entopts)`

Create a new `Client` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `clone(entopts)`

Create a new `Clone` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `partner(entopts)`

Create a new `Partner` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `template(entopts)`

Create a new `Template` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `transaction(entopts)`

Create a new `Transaction` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `updateResult(entopts)`

Create a new `UpdateResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `user(entopts)`

Create a new `User` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `optionsMap() -> MutableMap`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> MutableMap`

Make a direct HTTP request to any API endpoint. Returns a result
`MutableMap<String, Any?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Any?` | Request body (maps are JSON-serialized). |

**Returns:** `MutableMap<String, Any?>`

#### `prepare(fetchargs) -> MutableMap`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Client

```kotlin
val client = client.client(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String?` | No | Billing ID |
| `contact` | `Map<String, Any?>?` | No |  |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `id` | `Long?` | No | This resource's unique identifier. |
| `isActive` | `Boolean?` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `String?` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String?` | No | Last modified timestamp. |
| `name` | `String?` | No | The Client's name. |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `billingId` | - | - | - | - |
| `contact` | - | Yes | Yes | - |
| `created` | - | - | - | - |
| `directPartner` | - | - | Yes | - |
| `id` | - | - | - | - |
| `isActive` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | Yes | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.client(null).create(mutableMapOf<String, Any?>(
    "contact_email" to "example_contact_email",  // String?
    "contact_first_name" to "example_contact_first_name",  // String?
    "contact_is_active" to true,  // Boolean?
    "contact_last_name" to "example_contact_last_name",  // String?
    "contact_phone" to "example_contact_phone",  // String?
    "contact_send_welcome_email" to true,  // Boolean?
    "contact_user_name" to "example_contact_user_name",  // String?
    "contact_user_role" to "example_contact_user_role",  // String?
    "direct_partner_id" to 1L,  // Long?
    "direct_partner_name" to "example_direct_partner_name",  // String?
    "is_active" to true,  // Boolean?
    "name" to "example_name"  // String?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.client(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.client(null).load(mutableMapOf<String, Any?>("id" to "client_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.client(null).remove(mutableMapOf<String, Any?>("id" to "client_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Client` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Clone

```kotlin
val clone = client.clone(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Long?` | No | Unique identifier of newly added element. |
| `name` | `String?` | No | Name of Template |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.clone(null).create(mutableMapOf<String, Any?>(
    "template_id" to "example_template_id"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Clone` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Partner

```kotlin
val partner = client.partner(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String?` | No | The Partner's billing identifier. |
| `contact` | `Map<String, Any?>?` | No |  |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `id` | `Long?` | No | This resource's unique identifier. |
| `isActive` | `Boolean?` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `String?` | No | Last modified timestamp. |
| `name` | `String?` | No | The Partner's name. |
| `parent` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `reference` | `String?` | No | The Partner's reference string. |
| `verificationPhrase` | `String?` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billingId` | - | - | - |
| `contact` | - | Yes | Yes |
| `created` | - | - | - |
| `id` | - | - | - |
| `isActive` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | Yes |
| `parent` | - | - | Yes |
| `reference` | - | - | - |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.partner(null).create(mutableMapOf<String, Any?>(
    "billing_id" to "example_billing_id",  // String?
    "contact_email" to "example_contact_email",  // String?
    "contact_first_name" to "example_contact_first_name",  // String?
    "contact_is_active" to true,  // Boolean?
    "contact_last_name" to "example_contact_last_name",  // String?
    "contact_phone" to "example_contact_phone",  // String?
    "contact_send_welcome_email" to true,  // Boolean?
    "contact_user_name" to "example_contact_user_name",  // String?
    "contact_user_role" to "example_contact_user_role",  // String?
    "is_active" to true,  // Boolean?
    "name" to "example_name",  // String?
    "reference" to "example_reference"  // String?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.partner(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.partner(null).load(mutableMapOf<String, Any?>("id" to "partner_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Partner` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Template

```kotlin
val template = client.template(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `accessMode` | `Any?` | No | The Template's access mode. |
| `active` | `Boolean?` | No | This property indicates if the Template is active or inactive. |
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `List<Any?>?` | No | Field Template list items |
| `id` | `Long?` | No | Unique identifier of newly added element. |
| `name` | `String?` | No | The Template's name. |
| `options` | `Map<String, Any?>?` | No |  |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `reference` | `String?` | No | The Template's unique reference. |
| `type` | `String?` | No | The Template's type. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.template(null).create(mutableMapOf<String, Any?>(
    "active" to true,  // Boolean?
    "client_id" to 1L,  // Long?
    "client_name" to "example_client_name",  // String?
    "name" to "example_name",  // String?
    "partner_id" to 1L,  // Long?
    "partner_name" to "example_partner_name",  // String?
    "reference" to "example_reference"  // String?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.template(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.template(null).load(mutableMapOf<String, Any?>("id" to "template_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.template(null).remove(mutableMapOf<String, Any?>("id" to "template_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Template` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Transaction

```kotlin
val transaction = client.transaction(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `String?` | No | BFID |
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `completeDate` | `String?` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `errCode` | `String?` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String?` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `Long?` | No | This resource's unique identifier. |
| `ipAddress` | `String?` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String?` | No | Message ID. |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `reference` | `String?` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `Boolean?` | No | The success indicator. |
| `templateId` | `String?` | No | The Template's unique identifier. |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.transaction(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.transaction(null).load(mutableMapOf<String, Any?>("id" to "transaction_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Transaction` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## UpdateResult

```kotlin
val updateResult = client.updateResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String?` | No | The Partner's billing identifier. |
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `contact` | `Map<String, Any?>?` | Yes |  |
| `directPartner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `email` | `String?` | Yes | The User's email address. |
| `firstName` | `String?` | Yes | The User's name. |
| `id` | `Long?` | No | Unique identifier of newly added element. |
| `isActive` | `Boolean?` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `String?` | Yes | The User's Surname. |
| `mid` | `String?` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String?` | No | The Partner's name. |
| `parent` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `phone` | `String?` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String?` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `Boolean?` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String?` | Yes | The User's unique username. |
| `userRole` | `Map<String, Any?>?` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `String?` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | list | create | update |
| --- | --- | --- | --- |
| `billingId` | - | - | - |
| `client` | - | - | - |
| `contact` | - | - | - |
| `directPartner` | - | - | - |
| `email` | Yes | - | Yes |
| `firstName` | Yes | - | Yes |
| `id` | - | - | - |
| `isActive` | - | - | - |
| `lastName` | Yes | - | Yes |
| `mid` | - | - | - |
| `name` | - | - | - |
| `parent` | - | - | - |
| `partner` | - | - | - |
| `phone` | Yes | - | Yes |
| `reference` | - | - | - |
| `sendWelcomeEmail` | - | - | - |
| `userName` | Yes | - | Yes |
| `userRole` | Yes | - | Yes |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.updateResult(null).create(mutableMapOf<String, Any?>(
    "email" to "example_email",  // String?
    "first_name" to "example_first_name",  // String?
    "is_active" to true,  // Boolean?
    "last_name" to "example_last_name",  // String?
    "phone" to 1L,  // Long?
    "send_welcome_email" to true,  // Boolean?
    "user_role" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "username" to "example_username",  // String?
    "contact" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "firstName" to "example_firstName",  // String?
    "lastName" to "example_lastName",  // String?
    "userName" to "example_userName",  // String?
    "userRole" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.updateResult(null).list(null, null)
println(results)
```

#### `update(reqdata, ctrl) -> Any?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```kotlin
val result = client.updateResult(null).update(mutableMapOf<String, Any?>(
    "id" to "id"
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResult` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## User

```kotlin
val user = client.user(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String?` | No |  |
| `firstName` | `String?` | No |  |
| `id` | `Long?` | No | This resource's unique identifier. |
| `isActive` | `Boolean?` | No |  |
| `lastName` | `String?` | No |  |
| `modified` | `String?` | No | Last modified timestamp. |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `phone` | `String?` | No |  |
| `userName` | `String?` | No |  |
| `userRole` | `Map<String, Any?>?` | No | Reference to the associated User Role. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.user(null).load(mutableMapOf<String, Any?>("id" to "user_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `User` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
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

```kotlin
val feature = mutableMapOf<String, Any?>(
    "audit" to mapOf("active" to true),
    "clienttrack" to mapOf("active" to true),
    "idempotency" to mapOf("active" to true),
    "log" to mapOf("active" to true),
    "metrics" to mapOf("active" to true),
    "paging" to mapOf("active" to true),
    "ratelimit" to mapOf("active" to true),
    "retry" to mapOf("active" to true),
    "telemetry" to mapOf("active" to true),
    "test" to mapOf("active" to true),
    "timeout" to mapOf("active" to true),
)
val client = BluefinShieldconexMgmtSDK(mutableMapOf<String, Any?>("feature" to feature))
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

`audit`, `clienttrack`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Structured audit trail of operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

