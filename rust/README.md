# BluefinShieldconexMgmt Rust SDK



The Rust SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic Rust conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.client(Value::Noval)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This crate is not yet published to crates.io. Depend on it from the GitHub
release tag (`rust/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)) or
from a source checkout by adding it to your `Cargo.toml`:

```toml
[dependencies]
# From a source checkout:
voxgig-bluefin-shieldconex-mgmt-sdk = { path = "../rust" }

# Or from the git release tag:
# voxgig-bluefin-shieldconex-mgmt-sdk = { git = "<repo-url>", tag = "rust/vX.Y.Z" }
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```rust
use bluefin_shieldconex_mgmt_sdk::{getp, jo, BluefinShieldconexMgmtSDK, Value};

let client = BluefinShieldconexMgmtSDK::new(jo(vec![
    ("apikey", Value::str(std::env::var("BLUEFIN_SHIELDCONEX_MGMT_APIKEY").unwrap_or_default())),
]));
```

### 2. List client records

`list()` returns a `Value::List` of records and returns `Err` on
failure — match on the `Result`.

```rust
match client.client(Value::Noval).list(Value::Noval, Value::Noval) {
    Ok(clients) => {
        if let Value::List(items) = &clients {
            for client in items.borrow().iter() {
                println!("{:?}", client);
            }
        }
    }
    Err(err) => eprintln!("list failed: {}", err),
}
```

### 3. Load a client

`load()` returns the bare record and returns `Err` on failure.

```rust
match client.client(Value::Noval).load(jo(vec![("id", Value::str("example_id"))]), Value::Noval) {
    Ok(client) => println!("{:?}", client),
    Err(err) => eprintln!("load failed: {}", err),
}
```

### 4. Create, update, and remove

```rust
// Create — returns the bare created record
let created = client.client(Value::Noval).create(jo(vec![("billingId", Value::str("example_billingId")), ("contact", Value::empty_map())]), Value::Noval).unwrap();

// Remove
client.client(Value::Noval).remove(jo(vec![("id", getp(&created, "id"))]), Value::Noval).unwrap();
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

```rust
let result = client.direct(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("GET")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

if getp(&result, "ok") == Value::Bool(true) {
    println!("{:?}", getp(&result, "status"));  // 200
    println!("{:?}", getp(&result, "data"));    // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    println!("{:?} {:?}", getp(&result, "status"), getp(&result, "err"));
}
```

### Prepare a request without sending it

```rust
// prepare() returns the fetch definition on Ok and Err on failure.
let fetchdef = client.prepare(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("DELETE")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

println!("{:?}", getp(&fetchdef, "url"));
println!("{:?}", getp(&fetchdef, "method"));
println!("{:?}", getp(&fetchdef, "headers"));
```

### Use test mode

Create a mock client for unit testing — no server required:

```rust
let client = test_sdk(Value::Noval, Value::Noval);

// Entity ops return the bare record on Ok and Err on failure.
let partner = client.partner(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
// partner contains the mock response record
```

### Point at a different server

Override the base URL to reach a local or staging server:

```rust
let client = BluefinShieldconexMgmtSDK::new(jo(vec![
    ("base", Value::str("http://localhost:8080")),
]));
```

### Run live tests

Create a `.env.local` file at the crate root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd rust && cargo test
```


## Reference

### BluefinShieldconexMgmtSDK

```rust
use bluefin_shieldconex_mgmt_sdk::{BluefinShieldconexMgmtSDK, Value};

let client = BluefinShieldconexMgmtSDK::new(options);
```

Creates a new SDK client. `options` is a `Value` map (`Value::Noval` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```rust
use bluefin_shieldconex_mgmt_sdk::{test_sdk, Value};

let client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::Noval`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Value` | Deep copy of the current SDK options. |
| `get_utility` | `() -> Rc<Utility>` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) -> Result<Value, BluefinShieldconexMgmtError>` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) -> Result<Value, BluefinShieldconexMgmtError>` | Build and send an HTTP request. `Ok` is a result map (branch on `ok`). |
| `client` | `(entopts: Value) -> Rc<ClientEntity>` | Create a Client entity instance. |
| `clone` | `(entopts: Value) -> Rc<CloneEntity>` | Create a Clone entity instance. |
| `partner` | `(entopts: Value) -> Rc<PartnerEntity>` | Create a Partner entity instance. |
| `template` | `(entopts: Value) -> Rc<TemplateEntity>` | Create a Template entity instance. |
| `transaction` | `(entopts: Value) -> Rc<TransactionEntity>` | Create a Transaction entity instance. |
| `update_result` | `(entopts: Value) -> Rc<UpdateResultEntity>` | Create an UpdateResult entity instance. |
| `user` | `(entopts: Value) -> Rc<UserEntity>` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>` | Load a single entity by match criteria. |
| `list` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>` | List entities matching the criteria (Ok is a `Value::List`). |
| `create` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>` | Create a new entity. |
| `update` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>` | Update an existing entity. |
| `remove` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>` | Remove an entity. |
| `data` | `(args: Option<&Value>) -> Value` | Get entity data (pass `Some(&map)` to set). |
| `matchv` | `(args: Option<&Value>) -> Value` | Get entity match criteria (pass `Some(&map)` to set). |
| `make` | `() -> Rc<dyn Entity>` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return `Result<Value, BluefinShieldconexMgmtError>` — the
bare result data on `Ok` (a `Value::Map` for single-entity ops, a
`Value::List` for `list`) and the branded error on `Err`.

The `direct()` escape hatch resolves to `Ok` even on a non-2xx response —
it returns a result `Value::Map` you branch on via `getp(&result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

### Entities

#### Client

| Field | Description |
| --- | --- |
| `billingId` |  |
| `contact` |  |
| `created` |  |
| `directPartner` |  |
| `id` |  |
| `isActive` |  |
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
| `billingId` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `isActive` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `reference` |  |
| `verificationPhrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Template

| Field | Description |
| --- | --- |
| `accessMode` |  |
| `active` |  |
| `client` |  |
| `fieldTemplates` |  |
| `id` |  |
| `name` |  |
| `options` |  |
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
| `completeDate` |  |
| `directPartner` |  |
| `errCode` |  |
| `errMessage` |  |
| `id` |  |
| `ipAddress` |  |
| `messageId` |  |
| `partner` |  |
| `reference` |  |
| `success` |  |
| `templateId` |  |

Operations: List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `billingId` |  |
| `client` |  |
| `contact` |  |
| `directPartner` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `lastName` |  |
| `mid` |  |
| `name` |  |
| `parent` |  |
| `partner` |  |
| `phone` |  |
| `reference` |  |
| `sendWelcomeEmail` |  |
| `userName` |  |
| `userRole` |  |
| `verificationPhrase` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `lastName` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `userName` |  |
| `userRole` |  |
| `version` |  |

Operations: Load.

API path: `/users/{id}`



## Entities


### Client

Create an instance: `let client = client.client(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` |  |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `directPartner` | `std::collections::HashMap<String, Value>` |  |
| `id` | `i64` |  |
| `isActive` | `bool` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let client = client.client(Value::Noval).load(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let clients = client.client(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let client = client.client(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Clone

Create an instance: `let clone = client.clone(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` |  |
| `name` | `String` |  |

#### Example: Create

```rust
let clone = client.clone(Value::Noval).create(jo(vec![
    ("template_id", Value::str("example_template_id")),  // String
]), Value::Noval).unwrap();
```


### Partner

Create an instance: `let partner = client.partner(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` |  |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `id` | `i64` |  |
| `isActive` | `bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `std::collections::HashMap<String, Value>` |  |
| `reference` | `String` |  |
| `verificationPhrase` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let partner = client.partner(Value::Noval).load(jo(vec![("id", Value::str("partner_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let partners = client.partner(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let partner = client.partner(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Template

Create an instance: `let template = client.template(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `accessMode` | `Value` |  |
| `active` | `bool` |  |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `fieldTemplates` | `Vec<Value>` |  |
| `id` | `i64` |  |
| `name` | `String` |  |
| `options` | `std::collections::HashMap<String, Value>` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `reference` | `String` |  |
| `type` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let template = client.template(Value::Noval).load(jo(vec![("id", Value::str("template_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let templates = client.template(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let template = client.template(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Transaction

Create an instance: `let transaction = client.transaction(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `String` |  |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `completeDate` | `String` |  |
| `directPartner` | `std::collections::HashMap<String, Value>` |  |
| `errCode` | `String` |  |
| `errMessage` | `String` |  |
| `id` | `i64` |  |
| `ipAddress` | `String` |  |
| `messageId` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `reference` | `String` |  |
| `success` | `bool` |  |
| `templateId` | `String` |  |

#### Example: Load

```rust
let transaction = client.transaction(Value::Noval).load(jo(vec![("id", Value::str("transaction_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let transactions = client.transaction(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### UpdateResult

Create an instance: `let update_result = client.update_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` |  |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `directPartner` | `std::collections::HashMap<String, Value>` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `i64` |  |
| `isActive` | `bool` |  |
| `lastName` | `String` |  |
| `mid` | `String` |  |
| `name` | `String` |  |
| `parent` | `std::collections::HashMap<String, Value>` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `phone` | `String` |  |
| `reference` | `String` |  |
| `sendWelcomeEmail` | `bool` |  |
| `userName` | `String` |  |
| `userRole` | `std::collections::HashMap<String, Value>` |  |
| `verificationPhrase` | `String` |  |
| `version` | `i64` |  |

#### Example: List

```rust
let update_results = client.update_result(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let update_result = client.update_result(Value::Noval).create(jo(vec![
    ("contact", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("email", Value::str("example_email")),  // String
    ("firstName", Value::str("example_firstName")),  // String
    ("lastName", Value::str("example_lastName")),  // String
    ("phone", Value::str("example_phone")),  // String
    ("userName", Value::str("example_userName")),  // String
    ("userRole", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### User

Create an instance: `let user = client.user(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `i64` |  |
| `isActive` | `bool` |  |
| `lastName` | `String` |  |
| `modified` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let user = client.user(Value::Noval).load(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
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

### Data as `Value`

The Rust SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port (a
JSON-shaped enum: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Crate structure

```
rust/
├── lib.rs                       -- Crate root (module decls + re-exports)
├── core/                        -- Pipeline types, config, client (sdk.rs)
├── entity/                      -- Per-entity clients (one module each)
├── feature/                     -- Built-in features (base, test, log)
└── utility/                     -- Utilities + the vendored voxgig struct port
```

The public API is re-exported from the crate root, so `use bluefin_shieldconex_mgmt_sdk::{...}`
reaches the SDK client, `Value`, and the `jo` / `ja` / `getp` helpers
directly. Import entity or utility modules only when needed.

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
