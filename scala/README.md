# BluefinShieldconexMgmt Scala SDK



The Scala SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic Scala conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.client(null)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. The generated SDK is a
plain-source scala-cli project (no build tool, no third-party runtime
dependencies). Install it from the GitHub release tag
(`scala/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)) or from a source
checkout — compile it with scala-cli:

```bash
cd scala && scala-cli compile .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```scala
import voxgig.bluefinshieldconexmgmtsdk.core.BluefinShieldconexMgmtSDK

val options = new java.util.LinkedHashMap[String, Object]()
options.put("apikey", System.getenv("BLUEFIN_SHIELDCONEX_MGMT_APIKEY"))
val client = new BluefinShieldconexMgmtSDK(options)
```

### 2. List client records

`list(null, null)` returns an aggregate list of records (as `Object`, an
aggregate list) and raises on error.

```scala
try {
    val clientList = client.client(null).list(null, null)
    println(clientList)
}
catch {
    case err: RuntimeException => println("list failed: " + err.getMessage)
}
```

### 3. Load a client

`load()` returns the bare record (as `Object`) and raises on error.

```scala
try {
    val client = client.client(null).load(java.util.Map.of("id", "example_id"), null)
    println(client)
}
catch {
    case err: RuntimeException => println("load failed: " + err.getMessage)
}
```

### 4. Create, update, and remove

```scala
// Create — returns the bare created record (as Object)
val created = client.client(null).create(java.util.Map.of("billing_id", "example_billing_id", "contact", java.util.Map.of()), null)

// Remove
client.client(null).remove(java.util.Map.of("id", "example_id"), null)
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

For endpoints not covered by entity methods:

```scala
val result = client.direct(java.util.Map.of(
    "path", "/api/resource/{id}",
    "method", "GET",
    "params", java.util.Map.of("id", "example")))

if (java.lang.Boolean.TRUE == result.get("ok")) {
    println(result.get("status"))  // 200
    println(result.get("data"))    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both — an absent key simply reads as null.
    println("status=" + result.get("status") + " err=" + result.get("err"))
}
```

### Prepare a request without sending it

```scala
// prepare() returns the fetch definition and raises on error.
val fetchdef = client.prepare(java.util.Map.of(
    "path", "/api/resource/{id}",
    "method", "DELETE",
    "params", java.util.Map.of("id", "example")))

println(fetchdef.get("url"))
println(fetchdef.get("method"))
println(fetchdef.get("headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```scala
val client = BluefinShieldconexMgmtSDK.testSDK(null, null)

// Entity ops return the bare record and raise on error.
val partner = client.partner(null).list(null, null)
// partner holds the mock response record
println(partner)
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```scala
val mockFetch: java.util.function.BiFunction[String, java.util.Map[String, Object], Object] =
    (url, init) => {
        val res = new java.util.LinkedHashMap[String, Object]()
        res.put("status", java.lang.Integer.valueOf(200))
        res.put("statusText", "OK")
        res.put("headers", new java.util.LinkedHashMap[String, Object]())
        res.put("json", (() => java.util.Map.of("id", "mock01")): java.util.function.Supplier[Object])
        res
    }

val options = new java.util.LinkedHashMap[String, Object]()
options.put("base", "http://localhost:8080")
options.put("system", java.util.Map.of("fetch", mockFetch))
val client = new BluefinShieldconexMgmtSDK(options)
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd scala && make test
```


## Reference

### BluefinShieldconexMgmtSDK

```scala
val client = new BluefinShieldconexMgmtSDK(options)
```

Creates a new SDK client. `options` is a `java.util.Map[String, Object]`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### testSDK

```scala
val client = BluefinShieldconexMgmtSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> Map` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Map` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Map` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `client` | `(entopts) -> SdkEntity` | Create a Client entity instance. |
| `clone` | `(entopts) -> SdkEntity` | Create a Clone entity instance. |
| `partner` | `(entopts) -> SdkEntity` | Create a Partner entity instance. |
| `template` | `(entopts) -> SdkEntity` | Create a Template entity instance. |
| `transaction` | `(entopts) -> SdkEntity` | Create a Transaction entity instance. |
| `updateResult` | `(entopts) -> SdkEntity` | Create an UpdateResult entity instance. |
| `user` | `(entopts) -> SdkEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Object` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> Object` | List entities matching the criteria (an aggregate list). Raises on error. |
| `create` | `(reqdata, ctrl) -> Object` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> Object` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> Object` | Remove an entity. Raises on error. |
| `data` | `(newdata*) -> Object` | Get or set entity data. |
| `matchArgs` | `(newmatch*) -> Object` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Object` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`java.util.Map[String, Object]` you branch on via `result.get("ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Object` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

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

Operations: create, list, load, remove.

API path: `/clients`

#### Clone

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: create.

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

Operations: create, list, load.

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

Operations: create, list, load, remove.

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

Operations: list, load.

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

Operations: create, list, update.

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

Operations: load.

API path: `/users/{id}`



## Entities


### Client

Create an instance: `val client = client.client(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `contact` | `java.util.Map[String, Object]` |  |
| `created` | `String` |  |
| `direct_partner` | `java.util.Map[String, Object]` |  |
| `id` | `java.lang.Long` |  |
| `is_active` | `java.lang.Boolean` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val client = client.client(null).load(java.util.Map.of("id", "client_id"), null)
```

#### Example: List

```scala
val clientList = client.client(null).list(null, null)
```

#### Example: Create

```scala
val client = client.client(null).create(java.util.Map.of(
), null)
```


### Clone

Create an instance: `val clone = client.clone(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `java.lang.Long` |  |
| `name` | `String` |  |

#### Example: Create

```scala
val clone = client.clone(null).create(java.util.Map.of(
    "template_id", "example_template_id"  // String
), null)
```


### Partner

Create an instance: `val partner = client.partner(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `contact` | `java.util.Map[String, Object]` |  |
| `created` | `String` |  |
| `id` | `java.lang.Long` |  |
| `is_active` | `java.lang.Boolean` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `java.util.Map[String, Object]` |  |
| `reference` | `String` |  |
| `verification_phrase` | `String` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val partner = client.partner(null).load(java.util.Map.of("id", "partner_id"), null)
```

#### Example: List

```scala
val partnerList = client.partner(null).list(null, null)
```

#### Example: Create

```scala
val partner = client.partner(null).create(java.util.Map.of(
), null)
```


### Template

Create an instance: `val template = client.template(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `Object` |  |
| `active` | `java.lang.Boolean` |  |
| `client` | `java.util.Map[String, Object]` |  |
| `field_template` | `java.util.List[Object]` |  |
| `id` | `java.lang.Long` |  |
| `name` | `String` |  |
| `option` | `java.util.Map[String, Object]` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `reference` | `String` |  |
| `type` | `String` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val template = client.template(null).load(java.util.Map.of("id", "template_id"), null)
```

#### Example: List

```scala
val templateList = client.template(null).list(null, null)
```

#### Example: Create

```scala
val template = client.template(null).create(java.util.Map.of(
), null)
```


### Transaction

Create an instance: `val transaction = client.transaction(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `String` |  |
| `client` | `java.util.Map[String, Object]` |  |
| `complete_date` | `String` |  |
| `direct_partner` | `java.util.Map[String, Object]` |  |
| `err_code` | `String` |  |
| `err_message` | `String` |  |
| `id` | `java.lang.Long` |  |
| `ip_address` | `String` |  |
| `message_id` | `String` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `reference` | `String` |  |
| `success` | `java.lang.Boolean` |  |
| `template_id` | `String` |  |

#### Example: Load

```scala
val transaction = client.transaction(null).load(java.util.Map.of("id", "transaction_id"), null)
```

#### Example: List

```scala
val transactionList = client.transaction(null).list(null, null)
```


### UpdateResult

Create an instance: `val updateResult = client.updateResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `client` | `java.util.Map[String, Object]` |  |
| `contact` | `java.util.Map[String, Object]` |  |
| `direct_partner` | `java.util.Map[String, Object]` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `java.lang.Long` |  |
| `is_active` | `java.lang.Boolean` |  |
| `last_name` | `String` |  |
| `mid` | `String` |  |
| `name` | `String` |  |
| `parent` | `java.util.Map[String, Object]` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `phone` | `String` |  |
| `reference` | `String` |  |
| `send_welcome_email` | `java.lang.Boolean` |  |
| `user_name` | `String` |  |
| `user_role` | `java.util.Map[String, Object]` |  |
| `verification_phrase` | `String` |  |
| `version` | `java.lang.Long` |  |

#### Example: List

```scala
val updateResultList = client.updateResult(null).list(null, null)
```

#### Example: Create

```scala
val updateResult = client.updateResult(null).create(java.util.Map.of(
    "contact", java.util.Map.of(),  // java.util.Map[String, Object]
    "email", "example_email",  // String
    "first_name", "example_first_name",  // String
    "last_name", "example_last_name",  // String
    "phone", "example_phone",  // String
    "user_name", "example_user_name",  // String
    "user_role", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```


### User

Create an instance: `val user = client.user(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `java.util.Map[String, Object]` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `java.lang.Long` |  |
| `is_active` | `java.lang.Boolean` |  |
| `last_name` | `String` |  |
| `modified` | `String` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `java.util.Map[String, Object]` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val user = client.user(null).load(java.util.Map.of("id", "user_id"), null)
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

### Data as maps

The Scala SDK uses a loose object model — `java.util.Map[String, Object]`
throughout — rather than a bespoke typed class per endpoint. This mirrors the
dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`java.util.Map[String, Object]`. A `BluefinShieldconexMgmtTypes.scala` module of
reference `case class` types is also generated for editor documentation.

### Project structure

```
scala/
├── project.scala               -- scala-cli project config (Scala 3, no deps)
├── core/                        -- Main SDK client, config, entity base, error type
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log, ...)
├── utility/                     -- Utility functions and the vendored struct library
└── sdktest/                     -- Generated per-entity tests (scala-cli mains)
```

The main client class (`BluefinShieldconexMgmtSDK`, package `voxgig.bluefinshieldconexmgmtsdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed. The SDK is a dependency-free scala-cli project: JSON parsing is
the vendored `utility/Json.java`, HTTP transport is the JDK
`java.net.http.HttpClient`, and the struct library is inlined under
`utility/struct`.

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
