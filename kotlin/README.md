# BluefinShieldconexMgmt Kotlin SDK



The Kotlin SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic Kotlin conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.client(null)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. Install it from the GitHub
release tag (`kotlin/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)) or
from a source checkout — build the library with Gradle:

```bash
cd kotlin && gradle build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```kotlin
import voxgig.bluefinshieldconexmgmtsdk.core.BluefinShieldconexMgmtSDK

val client = BluefinShieldconexMgmtSDK(mutableMapOf<String, Any?>(
    "apikey" to System.getenv("BLUEFIN_SHIELDCONEX_MGMT_APIKEY"),
))
```

### 2. List client records

`list(null, null)` returns an aggregate list of records (as `Any?`, an
aggregate list) and raises on error.

```kotlin
try {
    val clientList = client.client(null).list(null, null)
    println(clientList)
}
catch (err: RuntimeException) {
    println("list failed: " + err.message)
}
```

### 3. Load a client

`load()` returns the bare record (as `Any?`) and raises on error.

```kotlin
try {
    val client = client.client(null).load(mutableMapOf<String, Any?>("id" to "example_id"), null)
    println(client)
}
catch (err: RuntimeException) {
    println("load failed: " + err.message)
}
```

### 4. Create, update, and remove

```kotlin
// Create — returns the bare created record (as Any?)
val created = client.client(null).create(mutableMapOf<String, Any?>("billing_id" to "example_billing_id", "contact" to mapOf<String, Any?>()), null)

// Remove
client.client(null).remove(mutableMapOf<String, Any?>("id" to "example_id"), null)
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

```kotlin
val result = client.direct(mutableMapOf<String, Any?>(
    "path" to "/api/resource/{id}",
    "method" to "GET",
    "params" to mapOf("id" to "example")))

if (result["ok"] == true) {
    println(result["status"])  // 200
    println(result["data"])    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // an absent key simply reads as null.
    println("" + result["status"] + " " + result["err"])
}
```

### Prepare a request without sending it

```kotlin
// prepare() returns the fetch definition and raises on error.
val fetchdef = client.prepare(mutableMapOf<String, Any?>(
    "path" to "/api/resource/{id}",
    "method" to "DELETE",
    "params" to mapOf("id" to "example")))

println(fetchdef["url"])
println(fetchdef["method"])
println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```kotlin
val client = BluefinShieldconexMgmtSDK.testSDK(null, null)

// Entity ops return the bare record and raise on error.
val partner = client.partner(null).list(null, null)
// partner holds the mock response record
println(partner)
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```kotlin
val mockFetch = java.util.function.BiFunction<String, MutableMap<String, Any?>, Any?> { url, init ->
    mutableMapOf<String, Any?>(
        "status" to 200,
        "statusText" to "OK",
        "headers" to mutableMapOf<String, Any?>(),
        "json" to java.util.function.Supplier<Any?> { mapOf("id" to "mock01") },
    )
}

val client = BluefinShieldconexMgmtSDK(mutableMapOf<String, Any?>(
    "base" to "http://localhost:8080",
    "system" to mapOf("fetch" to mockFetch),
))
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd kotlin && gradle test
```


## Reference

### BluefinShieldconexMgmtSDK

```kotlin
val client = BluefinShieldconexMgmtSDK(options)
```

Creates a new SDK client. `options` is a `MutableMap<String, Any?>`.

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

```kotlin
val client = BluefinShieldconexMgmtSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> MutableMap` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> MutableMap` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> MutableMap` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
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
| `load` | `(reqmatch, ctrl) -> Any?` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> Any?` | List entities matching the criteria (an aggregate list). Raises on error. |
| `create` | `(reqdata, ctrl) -> Any?` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> Any?` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> Any?` | Remove an entity. Raises on error. |
| `data` | `(vararg newdata) -> Any?` | Get or set entity data. |
| `match` | `(vararg newmatch) -> Any?` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `name` | `val: String` | The entity name. |

### Result shape

Entity operations return the bare result data (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Any?` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`MutableMap<String, Any?>` you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Any?` | Parsed JSON response body. |

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
| `billing_id` | `String?` |  |
| `contact` | `Map<String, Any?>?` |  |
| `created` | `String?` |  |
| `direct_partner` | `Map<String, Any?>?` |  |
| `id` | `Long?` |  |
| `is_active` | `Boolean?` |  |
| `mid` | `String?` |  |
| `modified` | `String?` |  |
| `name` | `String?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val client = client.client(null).load(mutableMapOf<String, Any?>("id" to "client_id"), null)
```

#### Example: List

```kotlin
val clientList = client.client(null).list(null, null)
```

#### Example: Create

```kotlin
val client = client.client(null).create(mutableMapOf<String, Any?>(
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
| `id` | `Long?` |  |
| `name` | `String?` |  |

#### Example: Create

```kotlin
val clone = client.clone(null).create(mutableMapOf<String, Any?>(
    "template_id" to "example_template_id"  // String?
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
| `billing_id` | `String?` |  |
| `contact` | `Map<String, Any?>?` |  |
| `created` | `String?` |  |
| `id` | `Long?` |  |
| `is_active` | `Boolean?` |  |
| `modified` | `String?` |  |
| `name` | `String?` |  |
| `parent` | `Map<String, Any?>?` |  |
| `reference` | `String?` |  |
| `verification_phrase` | `String?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val partner = client.partner(null).load(mutableMapOf<String, Any?>("id" to "partner_id"), null)
```

#### Example: List

```kotlin
val partnerList = client.partner(null).list(null, null)
```

#### Example: Create

```kotlin
val partner = client.partner(null).create(mutableMapOf<String, Any?>(
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
| `access_mode` | `Any?` |  |
| `active` | `Boolean?` |  |
| `client` | `Map<String, Any?>?` |  |
| `field_template` | `List<Any?>?` |  |
| `id` | `Long?` |  |
| `name` | `String?` |  |
| `option` | `Map<String, Any?>?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `reference` | `String?` |  |
| `type` | `String?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val template = client.template(null).load(mutableMapOf<String, Any?>("id" to "template_id"), null)
```

#### Example: List

```kotlin
val templateList = client.template(null).list(null, null)
```

#### Example: Create

```kotlin
val template = client.template(null).create(mutableMapOf<String, Any?>(
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
| `bfid` | `String?` |  |
| `client` | `Map<String, Any?>?` |  |
| `complete_date` | `String?` |  |
| `direct_partner` | `Map<String, Any?>?` |  |
| `err_code` | `String?` |  |
| `err_message` | `String?` |  |
| `id` | `Long?` |  |
| `ip_address` | `String?` |  |
| `message_id` | `String?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `reference` | `String?` |  |
| `success` | `Boolean?` |  |
| `template_id` | `String?` |  |

#### Example: Load

```kotlin
val transaction = client.transaction(null).load(mutableMapOf<String, Any?>("id" to "transaction_id"), null)
```

#### Example: List

```kotlin
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
| `billing_id` | `String?` |  |
| `client` | `Map<String, Any?>?` |  |
| `contact` | `Map<String, Any?>?` |  |
| `direct_partner` | `Map<String, Any?>?` |  |
| `email` | `String?` |  |
| `first_name` | `String?` |  |
| `id` | `Long?` |  |
| `is_active` | `Boolean?` |  |
| `last_name` | `String?` |  |
| `mid` | `String?` |  |
| `name` | `String?` |  |
| `parent` | `Map<String, Any?>?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `phone` | `String?` |  |
| `reference` | `String?` |  |
| `send_welcome_email` | `Boolean?` |  |
| `user_name` | `String?` |  |
| `user_role` | `Map<String, Any?>?` |  |
| `verification_phrase` | `String?` |  |
| `version` | `Long?` |  |

#### Example: List

```kotlin
val updateResultList = client.updateResult(null).list(null, null)
```

#### Example: Create

```kotlin
val updateResult = client.updateResult(null).create(mutableMapOf<String, Any?>(
    "contact" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "email" to "example_email",  // String?
    "first_name" to "example_first_name",  // String?
    "last_name" to "example_last_name",  // String?
    "phone" to "example_phone",  // String?
    "user_name" to "example_user_name",  // String?
    "user_role" to mapOf<String, Any?>()  // Map<String, Any?>?
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
| `client` | `Map<String, Any?>?` |  |
| `created` | `String?` |  |
| `email` | `String?` |  |
| `first_name` | `String?` |  |
| `id` | `Long?` |  |
| `is_active` | `Boolean?` |  |
| `last_name` | `String?` |  |
| `modified` | `String?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `phone` | `String?` |  |
| `user_name` | `String?` |  |
| `user_role` | `Map<String, Any?>?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val user = client.user(null).load(mutableMapOf<String, Any?>("id" to "user_id"), null)
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

The Kotlin SDK uses a loose object model — `MutableMap<String, Any?>`
throughout — rather than a bespoke typed class per endpoint. This mirrors the
dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`MutableMap<String, Any?>`. A `BluefinShieldconexMgmtTypes.kt` module of
reference `data class` types is also generated for editor documentation.

### Project structure

```
kotlin/
├── build.gradle.kts            -- Gradle build (compiles core/, utility/, feature/, entity/)
├── settings.gradle.kts         -- Gradle project settings
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- JUnit test suites
```

The main client class (`BluefinShieldconexMgmtSDK`, package `voxgig.bluefinshieldconexmgmtsdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed.

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
