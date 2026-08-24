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

#### `clone_(entopts: Value) -> Rc<CloneEntity>`

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
| `billingId` | `String` | No | Billing ID |
| `contact` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `id` | `i64` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Client's name. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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
let clone = client.clone_(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `i64` | No | Unique identifier of newly added element. |
| `name` | `String` | No | Name of Template |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.clone_(Value::Noval).create(jo(vec![
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
| `billingId` | `String` | No | The Partner's billing identifier. |
| `contact` | `std::collections::HashMap<String, Value>` | No |  |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `i64` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The Partner's reference string. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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
| `accessMode` | `Value` | No | The Template's access mode. |
| `active` | `bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `Vec<Value>` | No | Field Template list items |
| `id` | `i64` | No | Unique identifier of newly added element. |
| `name` | `String` | No | The Template's name. |
| `options` | `std::collections::HashMap<String, Value>` | No |  |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The Template's unique reference. |
| `type` | `String` | No | The Template's type. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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
| `bfid` | `String` | No | BFID |
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `completeDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `i64` | No | This resource's unique identifier. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String` | No | Message ID. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | No | The success indicator. |
| `templateId` | `String` | No | The Template's unique identifier. |

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
| `billingId` | `String` | No | The Partner's billing identifier. |
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `contact` | `std::collections::HashMap<String, Value>` | Yes |  |
| `directPartner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `email` | `String` | Yes | The User's email address. |
| `firstName` | `String` | Yes | The User's name. |
| `id` | `i64` | No | Unique identifier of newly added element. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `String` | Yes | The User's Surname. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `phone` | `String` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String` | Yes | The User's unique username. |
| `userRole` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinShieldconexMgmtError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.update_result(Value::Noval).create(jo(vec![
    ("contact", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("email", Value::str("example_email")),  // String
    ("firstName", Value::str("example_firstName")),  // String
    ("lastName", Value::str("example_lastName")),  // String
    ("phone", Value::str("example_phone")),  // String
    ("userName", Value::str("example_userName")),  // String
    ("userRole", Value::empty_map()),  // std::collections::HashMap<String, Value>
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
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `i64` | No | This resource's unique identifier. |
| `isActive` | `bool` | No |  |
| `lastName` | `String` | No |  |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `std::collections::HashMap<String, Value>` | No | Reference to the associated User Role. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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

