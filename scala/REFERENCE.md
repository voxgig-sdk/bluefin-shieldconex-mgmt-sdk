# BluefinShieldconexMgmt Scala SDK Reference

Complete API reference for the BluefinShieldconexMgmt Scala SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```scala
val client = new BluefinShieldconexMgmtSDK(options)
```

Create a new SDK client instance. `options` is a `java.util.Map[String, Object]`.

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

```scala
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

#### `optionsMap() -> Map`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Map`

Make a direct HTTP request to any API endpoint. Returns a result
`java.util.Map[String, Object]` with `ok`, `status`, `headers`, and
`data` (or `err` on failure). This escape hatch never raises — branch on
`result.get("ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Object` | Request body (maps are JSON-serialized). |

**Returns:** `java.util.Map[String, Object]`

#### `prepare(fetchargs) -> Map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Client

```scala
val client = client.client(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No | Billing ID |
| `contact` | `java.util.Map[String, Object]` | No |  |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `id` | `java.lang.Long` | No | This resource's unique identifier. |
| `isActive` | `java.lang.Boolean` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Client's name. |
| `partner` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `version` | `java.lang.Long` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.client(null).create(java.util.Map.of(
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.client(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.client(null).load(java.util.Map.of("id", "client_id"), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.client(null).remove(java.util.Map.of("id", "client_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Client` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Clone

```scala
val clone = client.clone(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `java.lang.Long` | No | Unique identifier of newly added element. |
| `name` | `String` | No | Name of Template |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.clone(null).create(java.util.Map.of(
    "template_id", "example_template_id"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Clone` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Partner

```scala
val partner = client.partner(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No | The Partner's billing identifier. |
| `contact` | `java.util.Map[String, Object]` | No |  |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `java.lang.Long` | No | This resource's unique identifier. |
| `isActive` | `java.lang.Boolean` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The Partner's reference string. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `java.lang.Long` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.partner(null).create(java.util.Map.of(
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.partner(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.partner(null).load(java.util.Map.of("id", "partner_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Partner` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Template

```scala
val template = client.template(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `accessMode` | `Object` | No | The Template's access mode. |
| `active` | `java.lang.Boolean` | No | This property indicates if the Template is active or inactive. |
| `client` | `java.util.Map[String, Object]` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `java.util.List[Object]` | No | Field Template list items |
| `id` | `java.lang.Long` | No | Unique identifier of newly added element. |
| `name` | `String` | No | The Template's name. |
| `options` | `java.util.Map[String, Object]` | No |  |
| `partner` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The Template's unique reference. |
| `type` | `String` | No | The Template's type. |
| `version` | `java.lang.Long` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.template(null).create(java.util.Map.of(
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.template(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.template(null).load(java.util.Map.of("id", "template_id"), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.template(null).remove(java.util.Map.of("id", "template_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Template` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Transaction

```scala
val transaction = client.transaction(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `String` | No | BFID |
| `client` | `java.util.Map[String, Object]` | No | Reference to the associated Client resource. |
| `completeDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `java.lang.Long` | No | This resource's unique identifier. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String` | No | Message ID. |
| `partner` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `java.lang.Boolean` | No | The success indicator. |
| `templateId` | `String` | No | The Template's unique identifier. |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.transaction(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.transaction(null).load(java.util.Map.of("id", "transaction_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Transaction` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## UpdateResult

```scala
val updateResult = client.updateResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No | The Partner's billing identifier. |
| `client` | `java.util.Map[String, Object]` | No | Reference to the associated Client resource. |
| `contact` | `java.util.Map[String, Object]` | Yes |  |
| `directPartner` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `email` | `String` | Yes | The User's email address. |
| `firstName` | `String` | Yes | The User's name. |
| `id` | `java.lang.Long` | No | Unique identifier of newly added element. |
| `isActive` | `java.lang.Boolean` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `String` | Yes | The User's Surname. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `partner` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `phone` | `String` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `java.lang.Boolean` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String` | Yes | The User's unique username. |
| `userRole` | `java.util.Map[String, Object]` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `java.lang.Long` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.updateResult(null).create(java.util.Map.of(
    "contact", java.util.Map.of(),  // java.util.Map[String, Object]
    "email", "example_email",  // String
    "firstName", "example_firstName",  // String
    "lastName", "example_lastName",  // String
    "phone", "example_phone",  // String
    "userName", "example_userName",  // String
    "userRole", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.updateResult(null).list(null, null)
println(results)
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```scala
val result = client.updateResult(null).update(java.util.Map.of(
    "id", "id"
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## User

```scala
val user = client.user(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `java.util.Map[String, Object]` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `java.lang.Long` | No | This resource's unique identifier. |
| `isActive` | `java.lang.Boolean` | No |  |
| `lastName` | `String` | No |  |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `java.util.Map[String, Object]` | No | Reference to the associated Partner. |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `java.util.Map[String, Object]` | No | Reference to the associated User Role. |
| `version` | `java.lang.Long` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.user(null).load(java.util.Map.of("id", "user_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `User` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```scala
val feature = new java.util.LinkedHashMap[String, Object]()
feature.put("test", java.util.Map.of("active", true))
val options = new java.util.LinkedHashMap[String, Object]()
options.put("feature", feature)
val client = new BluefinShieldconexMgmtSDK(options)
```

