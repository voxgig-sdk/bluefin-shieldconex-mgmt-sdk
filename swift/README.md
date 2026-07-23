# BluefinShieldconexMgmt Swift SDK



The Swift SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic Swift conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Client()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to a SwiftPM registry. The generated SDK
is a dependency-free SwiftPM package (Foundation only, plus the vendored
Voxgig Struct port). Depend on it from the GitHub release tag
(`swift/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)) by adding it to
your `Package.swift`:

```swift
dependencies: [
    // From the git release tag:
    .package(url: "<repo-url>", exact: "0.0.1"),
],
```

Or build from a source checkout with SwiftPM:

```bash
cd swift && swift build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```swift
import BluefinShieldconexMgmtSdk

let options = VMap()
options.entries["apikey"] = .string(
    ProcessInfo.processInfo.environment["BLUEFIN_SHIELDCONEX_MGMT_APIKEY"] ?? "")
let client = BluefinShieldconexMgmtSDK(options)
```

### 2. List client records

`list(nil, nil)` returns a `Value` list of records and throws on error —
iterate its items.

```swift
do {
    let clientList = try client.Client().list(nil, nil)
    for client in clientList.asList?.items ?? [] {
        print(client)
    }
}
catch {
    print("list failed: \(error)")
}
```

### 3. Load a client

`load()` returns the bare record (a `Value`) and throws on error.

```swift
do {
    let client = try client.Client().load(VMap([("id", .string("example_id"))]), nil)
    print(client)
}
catch {
    print("load failed: \(error)")
}
```

### 4. Create, update, and remove

```swift
// Create — returns the bare created record (a Value)
let created = try client.Client().create(VMap([("billing_id", .string("example_billing_id")), ("contact", .map(VMap()))]), nil)

// Remove
_ = try client.Client().remove(VMap([("id", .string("example_id"))]), nil)
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

```swift
let result = client.direct(VMap([
    ("path", .string("/api/resource/{id}")),
    ("method", .string("GET")),
    ("params", .map([("id", .string("example"))])),
]))

if result.entries["ok"] == .bool(true) {
    print(result.entries["status"] ?? .noval)  // 200
    print(result.entries["data"] ?? .noval)     // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // an absent key simply reads as .noval.
    print(result.entries["status"] ?? .noval, result.entries["err"] ?? .noval)
}
```

### Prepare a request without sending it

```swift
// prepare() returns the fetch definition and throws on error.
let fetchdef = try client.prepare(VMap([
    ("path", .string("/api/resource/{id}")),
    ("method", .string("DELETE")),
    ("params", .map([("id", .string("example"))])),
]))

print(fetchdef.entries["url"] ?? .noval)
print(fetchdef.entries["method"] ?? .noval)
print(fetchdef.entries["headers"] ?? .noval)
```

### Use test mode

Create a mock client for unit testing — no server required:

```swift
let client = BluefinShieldconexMgmtSDK.testSDK(nil, nil)

// Entity ops return the bare record and throw on error.
let partner = try client.Partner().list(nil, nil)
// partner holds the mock response record
print(partner)
```

### Use a custom fetch function

Replace the HTTP transport with your own `SystemFetch` closure:

```swift
let fetch: SystemFetch = { url, _ in
    let m = VMap()
    m.entries["status"] = .int(200)
    m.entries["statusText"] = .string("OK")
    m.entries["headers"] = .map(VMap())
    m.entries["json"] = .nat({ () -> Value in .map(VMap([("id", .string("mock01"))])) } as NativeCall0)
    return .map(m)
}

let system = VMap()
system.entries["fetch"] = .nat(fetch)
let options = VMap()
options.entries["base"] = .string("http://localhost:8080")
options.entries["system"] = .map(system)
let client = BluefinShieldconexMgmtSDK(options)
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd swift && make test
```


## Reference

### BluefinShieldconexMgmtSDK

```swift
let client = BluefinShieldconexMgmtSDK(options)
```

Creates a new SDK client. `options` is a `VMap` of `Value`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `VMap` | Feature activation flags. |
| `extend` | `VList` | Additional Feature instances to load. |
| `system` | `VMap` | System overrides (e.g. custom `fetch` function). |

### testSDK

```swift
let client = BluefinShieldconexMgmtSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> VMap` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) throws -> VMap` | Build an HTTP request definition without sending. Throws on error. |
| `direct` | `(fetchargs) -> VMap` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `Client` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Client entity instance. |
| `Clone` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Clone entity instance. |
| `Partner` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Partner entity instance. |
| `Template` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Template entity instance. |
| `Transaction` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Transaction entity instance. |
| `UpdateResult` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create an UpdateResult entity instance. |
| `User` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) throws -> Value` | Load a single entity by match criteria. Throws on error. |
| `list` | `(reqmatch, ctrl) throws -> Value` | List entities matching the criteria (a Value list). Throws on error. |
| `create` | `(reqdata, ctrl) throws -> Value` | Create a new entity. Throws on error. |
| `update` | `(reqdata, ctrl) throws -> Value` | Update an existing entity. Throws on error. |
| `remove` | `(reqmatch, ctrl) throws -> Value` | Remove an entity. Throws on error. |
| `data` | `(newdata?) -> Value` | Get or set entity data. |
| `matchv` | `(newmatch?) -> Value` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `Value` map for
single-entity ops, a `Value` list for `list`) and throw on error. Wrap
calls in `do`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `VMap` you
branch on via `result.entries["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `VMap` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

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


### Client

Create an instance: `let client = client.Client()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |
| `remove(match, nil)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `contact` | `VMap` |  |
| `created` | `String` |  |
| `direct_partner` | `VMap` |  |
| `id` | `Int` |  |
| `is_active` | `Bool` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `VMap` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let client = try client.Client().load(VMap([("id", .string("client_id"))]), nil)
```

#### Example: List

```swift
let clientList = try client.Client().list(nil, nil)
```

#### Example: Create

```swift
let client = try client.Client().create(VMap([
]), nil)
```


### Clone

Create an instance: `let clone = client.Clone()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Int` |  |
| `name` | `String` |  |

#### Example: Create

```swift
let clone = try client.Clone().create(VMap([
    ("template_id", .string("example_template_id"))  // String
]), nil)
```


### Partner

Create an instance: `let partner = client.Partner()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `contact` | `VMap` |  |
| `created` | `String` |  |
| `id` | `Int` |  |
| `is_active` | `Bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `VMap` |  |
| `reference` | `String` |  |
| `verification_phrase` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let partner = try client.Partner().load(VMap([("id", .string("partner_id"))]), nil)
```

#### Example: List

```swift
let partnerList = try client.Partner().list(nil, nil)
```

#### Example: Create

```swift
let partner = try client.Partner().create(VMap([
]), nil)
```


### Template

Create an instance: `let template = client.Template()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |
| `remove(match, nil)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `Value` |  |
| `active` | `Bool` |  |
| `client` | `VMap` |  |
| `field_template` | `[Value]` |  |
| `id` | `Int` |  |
| `name` | `String` |  |
| `option` | `VMap` |  |
| `partner` | `VMap` |  |
| `reference` | `String` |  |
| `type` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let template = try client.Template().load(VMap([("id", .string("template_id"))]), nil)
```

#### Example: List

```swift
let templateList = try client.Template().list(nil, nil)
```

#### Example: Create

```swift
let template = try client.Template().create(VMap([
]), nil)
```


### Transaction

Create an instance: `let transaction = client.Transaction()`

#### Operations

| Method | Description |
| --- | --- |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `String` |  |
| `client` | `VMap` |  |
| `complete_date` | `String` |  |
| `direct_partner` | `VMap` |  |
| `err_code` | `String` |  |
| `err_message` | `String` |  |
| `id` | `Int` |  |
| `ip_address` | `String` |  |
| `message_id` | `String` |  |
| `partner` | `VMap` |  |
| `reference` | `String` |  |
| `success` | `Bool` |  |
| `template_id` | `String` |  |

#### Example: Load

```swift
let transaction = try client.Transaction().load(VMap([("id", .string("transaction_id"))]), nil)
```

#### Example: List

```swift
let transactionList = try client.Transaction().list(nil, nil)
```


### UpdateResult

Create an instance: `let updateResult = client.UpdateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `update(data, nil)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `client` | `VMap` |  |
| `contact` | `VMap` |  |
| `direct_partner` | `VMap` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `Int` |  |
| `is_active` | `Bool` |  |
| `last_name` | `String` |  |
| `mid` | `String` |  |
| `name` | `String` |  |
| `parent` | `VMap` |  |
| `partner` | `VMap` |  |
| `phone` | `String` |  |
| `reference` | `String` |  |
| `send_welcome_email` | `Bool` |  |
| `user_name` | `String` |  |
| `user_role` | `VMap` |  |
| `verification_phrase` | `String` |  |
| `version` | `Int` |  |

#### Example: List

```swift
let updateResultList = try client.UpdateResult().list(nil, nil)
```

#### Example: Create

```swift
let updateResult = try client.UpdateResult().create(VMap([
    ("contact", .map(VMap())),  // VMap
    ("email", .string("example_email")),  // String
    ("first_name", .string("example_first_name")),  // String
    ("last_name", .string("example_last_name")),  // String
    ("phone", .string("example_phone")),  // String
    ("user_name", .string("example_user_name")),  // String
    ("user_role", .map(VMap()))  // VMap
]), nil)
```


### User

Create an instance: `let user = client.User()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `VMap` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `Int` |  |
| `is_active` | `Bool` |  |
| `last_name` | `String` |  |
| `modified` | `String` |  |
| `partner` | `VMap` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `VMap` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let user = try client.User().load(VMap([("id", .string("user_id"))]), nil)
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

### Data as loose values

The Swift SDK uses a loose object model — the vendored `Value` enum
(with `VMap` / `VList` wrappers) throughout — rather than a bespoke typed
struct per endpoint. This mirrors the dynamic nature of the API and keeps the
SDK flexible: no regeneration is needed when the API schema changes.

Use the `.asMap` / `.asList` / `.asString` accessors to safely coerce a
`Value` to a concrete Swift type (each returns `nil` on a type mismatch).
A `BluefinShieldconexMgmtTypes.swift` file of reference `struct` types is also
generated for editor documentation.

### Project structure

```
swift/
├── Package.swift                     -- SwiftPM manifest (zero runtime deps)
├── Sources/ProjectNameSDK/
│   ├── core/                         -- Main client, config, entity base, error type
│   ├── entity/                       -- Generated entity clients
│   ├── feature/                      -- Built-in features (Base, Test, Log, ...)
│   ├── utility/                      -- Utility functions
│   └── Struct/                       -- Vendored Voxgig Struct port
└── Tests/ProjectNameSDKTests/        -- Test suites (XCTest)
```

The main client class (`BluefinShieldconexMgmtSDK`, under `Sources/ProjectNameSDK/core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed. The SDK is dependency-free: JSON parsing is the vendored
`Struct/JSON.swift`, HTTP transport is Foundation's `URLSession`, and the
struct library is inlined under `Struct/`.

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
