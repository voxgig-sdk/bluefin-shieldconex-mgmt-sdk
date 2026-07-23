# BluefinShieldconexMgmt Rust SDK Reference

Complete API reference for the BluefinShieldconexMgmt Rust SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```rust
use bluefin_shieldconex_mgmt_sdk::{BluefinShieldconexMgmtSDK, Value};

let client = BluefinShieldconexMgmtSDK::new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`Value::Noval` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) -> Rc<BluefinShieldconexMgmtSDK>`

Create a test client with mock features active. Both arguments may be
`Value::Noval`.

```rust
use bluefin_shieldconex_mgmt_sdk::{test_sdk, Value};

let client = test_sdk(Value::Noval, Value::Noval);
```


### Instance Methods

#### `client(entopts: Value) -> Rc<ClientEntity>`

Create a new `ClientEntity` instance. Pass `Value::Noval` for no
initial options.

#### `clone(entopts: Value) -> Rc<CloneEntity>`

Create a new `CloneEntity` instance. Pass `Value::Noval` for no
initial options.

#### `partner(entopts: Value) -> Rc<PartnerEntity>`

Create a new `PartnerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `template(entopts: Value) -> Rc<TemplateEntity>`

Create a new `TemplateEntity` instance. Pass `Value::Noval` for no
initial options.

#### `transaction(entopts: Value) -> Rc<TransactionEntity>`

Create a new `TransactionEntity` instance. Pass `Value::Noval` for no
initial options.

#### `update_result(entopts: Value) -> Rc<UpdateResultEntity>`

Create a new `UpdateResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `user(entopts: Value) -> Rc<UserEntity>`

Create a new `UserEntity` instance. Pass `Value::Noval` for no
initial options.

#### `options_map() -> Value`

Return a deep copy of the current SDK options.

#### `get_utility() -> Rc<Utility>`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Make a direct HTTP request to any API endpoint. `Ok` is a result `Value::Map`
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch resolves to `Ok` even on a non-2xx response — branch on
`getp(&result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Prepare a fetch definition without sending. Returns the fetchdef on `Ok`.


---

## ClientEntity

```rust
let client = client.client(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `contact` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No |  |
| `direct_partner` | `std::collections::HashMap<String, Value>` | No |  |
| `id` | `i64` | No |  |
| `is_active` | `bool` | No |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `version` | `i64` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.client(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.client(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for client in items.borrow().iter() {
        println!("{:?}", client);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.client(Value::Noval).load(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.client(Value::Noval).remove(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ClientEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## CloneEntity

```rust
let clone = client.clone(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `i64` | No |  |
| `name` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.clone(Value::Noval).create(jo(vec![
    ("template_id", Value::str("example_template_id")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `CloneEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## PartnerEntity

```rust
let partner = client.partner(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `contact` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No |  |
| `id` | `i64` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `std::collections::HashMap<String, Value>` | No |  |
| `reference` | `String` | No |  |
| `verification_phrase` | `String` | No |  |
| `version` | `i64` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.partner(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.partner(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for partner in items.borrow().iter() {
        println!("{:?}", partner);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.partner(Value::Noval).load(jo(vec![("id", Value::str("partner_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `PartnerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## TemplateEntity

```rust
let template = client.template(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `Value` | No |  |
| `active` | `bool` | No |  |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `field_template` | `Vec<Value>` | No |  |
| `id` | `i64` | No |  |
| `name` | `String` | No |  |
| `option` | `std::collections::HashMap<String, Value>` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `reference` | `String` | No |  |
| `type` | `String` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.template(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.template(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for template in items.borrow().iter() {
        println!("{:?}", template);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.template(Value::Noval).load(jo(vec![("id", Value::str("template_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.template(Value::Noval).remove(jo(vec![("id", Value::str("template_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `TemplateEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## TransactionEntity

```rust
let transaction = client.transaction(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `String` | No |  |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `complete_date` | `String` | No |  |
| `direct_partner` | `std::collections::HashMap<String, Value>` | No |  |
| `err_code` | `String` | No |  |
| `err_message` | `String` | No |  |
| `id` | `i64` | No |  |
| `ip_address` | `String` | No |  |
| `message_id` | `String` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `reference` | `String` | No |  |
| `success` | `bool` | No |  |
| `template_id` | `String` | No |  |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.transaction(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for transaction in items.borrow().iter() {
        println!("{:?}", transaction);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.transaction(Value::Noval).load(jo(vec![("id", Value::str("transaction_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `TransactionEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## UpdateResultEntity

```rust
let update_result = client.update_result(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `contact` | `std::collections::HashMap<String, Value>` | Yes |  |
| `direct_partner` | `std::collections::HashMap<String, Value>` | No |  |
| `email` | `String` | Yes |  |
| `first_name` | `String` | Yes |  |
| `id` | `i64` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `String` | Yes |  |
| `mid` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `std::collections::HashMap<String, Value>` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `phone` | `String` | Yes |  |
| `reference` | `String` | No |  |
| `send_welcome_email` | `bool` | No |  |
| `user_name` | `String` | Yes |  |
| `user_role` | `std::collections::HashMap<String, Value>` | Yes |  |
| `verification_phrase` | `String` | No |  |
| `version` | `i64` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.update_result(Value::Noval).create(jo(vec![
    ("contact", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("email", Value::str("example_email")),  // String
    ("first_name", Value::str("example_first_name")),  // String
    ("last_name", Value::str("example_last_name")),  // String
    ("phone", Value::str("example_phone")),  // String
    ("user_name", Value::str("example_user_name")),  // String
    ("user_role", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.update_result(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for update_result in items.borrow().iter() {
        println!("{:?}", update_result);
    }
}
```

#### `update(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Update an existing entity. The data must include the entity id. Returns the updated entity data on `Ok`.

```rust
let result = client.update_result(Value::Noval).update(jo(vec![
    ("id", Value::str("id")),
    // Fields to update
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `UpdateResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## UserEntity

```rust
let user = client.user(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `i64` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `std::collections::HashMap<String, Value>` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.user(Value::Noval).load(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `UserEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```rust
let client = BluefinShieldconexMgmtSDK::new(jo(vec![
    ("feature", jo(vec![
        ("test", jo(vec![("active", Value::Bool(true))])),
    ])),
]));
```

