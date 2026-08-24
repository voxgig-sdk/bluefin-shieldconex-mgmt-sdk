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
| `clone_` | `(entopts: Value) -> Rc<CloneEntity>` | Create a Clone entity instance. |
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
| `billingId` | Billing ID |
| `contact` |  |
| `created` | Creation timestamp in ISO 8601 format. |
| `directPartner` | Reference to the associated Partner. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Client account is active or disabled. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | Last modified timestamp. |
| `name` | The Client's name. |
| `partner` | Reference to the associated Partner. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### Clone

| Field | Description |
| --- | --- |
| `id` | Unique identifier of newly added element. |
| `name` | Name of Template |

Operations: Create.

API path: `/templates/{id}/clone`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `contact` |  |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Parter account is active or disabled. |
| `modified` | Last modified timestamp. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `reference` | The Partner's reference string. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/partners`

#### Template

| Field | Description |
| --- | --- |
| `accessMode` | The Template's access mode. |
| `active` | This property indicates if the Template is active or inactive. |
| `client` | Reference to the associated Client resource. |
| `fieldTemplates` | Field Template list items |
| `id` | Unique identifier of newly added element. |
| `name` | The Template's name. |
| `options` |  |
| `partner` | Reference to the associated Partner. |
| `reference` | The Template's unique reference. |
| `type` | The Template's type. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/templates`

#### Transaction

| Field | Description |
| --- | --- |
| `bfid` | BFID |
| `client` | Reference to the associated Client resource. |
| `completeDate` | Timestamp from the beginning of the transaction. |
| `directPartner` | Reference to the associated Partner. |
| `errCode` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | This resource's unique identifier. |
| `ipAddress` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | Message ID. |
| `partner` | Reference to the associated Partner. |
| `reference` | The reference property that the Client includes in the decrypt API call. |
| `success` | The success indicator. |
| `templateId` | The Template's unique identifier. |

Operations: List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `client` | Reference to the associated Client resource. |
| `contact` |  |
| `directPartner` | Reference to the associated Partner. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | Unique identifier of newly added element. |
| `isActive` | This property indicates if the User account is active or disabled. |
| `lastName` | The User's Surname. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | The Partner's reference string. |
| `sendWelcomeEmail` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `email` |  |
| `firstName` |  |
| `id` | This resource's unique identifier. |
| `isActive` |  |
| `lastName` |  |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `phone` |  |
| `userName` |  |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

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
| `billingId` | `String` | Billing ID |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `id` | `i64` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Client's name. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `version` | `i64` | The number of times that this resource has been updated. |

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

Create an instance: `let clone = client.clone_(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` | Unique identifier of newly added element. |
| `name` | `String` | Name of Template |

#### Example: Create

```rust
let clone = client.clone_(Value::Noval).create(jo(vec![
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
| `billingId` | `String` | The Partner's billing identifier. |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `id` | `i64` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Partner's name. |
| `parent` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `reference` | `String` | The Partner's reference string. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | The number of times that this resource has been updated. |

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
| `accessMode` | `Value` | The Template's access mode. |
| `active` | `bool` | This property indicates if the Template is active or inactive. |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `fieldTemplates` | `Vec<Value>` | Field Template list items |
| `id` | `i64` | Unique identifier of newly added element. |
| `name` | `String` | The Template's name. |
| `options` | `std::collections::HashMap<String, Value>` |  |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `reference` | `String` | The Template's unique reference. |
| `type` | `String` | The Template's type. |
| `version` | `i64` | The number of times that this resource has been updated. |

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
| `bfid` | `String` | BFID |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `completeDate` | `String` | Timestamp from the beginning of the transaction. |
| `directPartner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `errCode` | `String` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `i64` | This resource's unique identifier. |
| `ipAddress` | `String` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String` | Message ID. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `reference` | `String` | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | The success indicator. |
| `templateId` | `String` | The Template's unique identifier. |

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
| `billingId` | `String` | The Partner's billing identifier. |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `directPartner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `email` | `String` | The User's email address. |
| `firstName` | `String` | The User's name. |
| `id` | `i64` | Unique identifier of newly added element. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `lastName` | `String` | The User's Surname. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | The Partner's name. |
| `parent` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `phone` | `String` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String` | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String` | The User's unique username. |
| `userRole` | `std::collections::HashMap<String, Value>` | Reference to the associated User Role. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | The number of times that this resource has been updated. |

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
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `i64` | This resource's unique identifier. |
| `isActive` | `bool` |  |
| `lastName` | `String` |  |
| `modified` | `String` | Last modified timestamp. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `std::collections::HashMap<String, Value>` | Reference to the associated User Role. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let user = client.user(Value::Noval).load(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
```


## Open types

1 field is carried as open values rather than typed structures.
This follows from the API definition, not from a gap in this SDK: the
definition describes it with untagged unions —
`oneOf`/`anyOf` branches with no `discriminator` — so it never states which
variant a given value is. Nothing can select a branch reliably, so the SDK
passes the value through unchanged rather than assert a shape the API does not
guarantee.

| Entity | Field | Variants | Nesting |
| --- | --- | --- | --- |
| `template` | `fieldTemplates` | 9 | 1 level |

These values round-trip unchanged — read them, modify them, send them back. If
the API adds a `discriminator` to the definition, regenerating will type them.
Every other field is typed normally.

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
