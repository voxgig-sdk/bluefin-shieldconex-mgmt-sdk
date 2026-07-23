# BluefinShieldconexMgmt C++ SDK Reference

Complete API reference for the BluefinShieldconexMgmt C++ SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = std::make_shared<BluefinShieldconexMgmtSDK>(options);
```

Create a new SDK client instance. `options` is an `sdk::Value` map.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Value` | SDK configuration options (a map). |
| `options["apikey"]` | `std::string` | API key for authentication. |
| `options["base"]` | `std::string` | Base URL for API requests. |
| `options["prefix"]` | `std::string` | URL prefix appended after base. |
| `options["suffix"]` | `std::string` | URL suffix appended after path. |
| `options["headers"]` | `Value` | Custom headers for all requests. |
| `options["feature"]` | `Value` | Feature configuration. |
| `options["system"]` | `Value` | System overrides. |


### Static Methods

#### `BluefinShieldconexMgmtSDK::testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be
`Value::undef()`; a no-arg overload is also provided.

```cpp
auto client = BluefinShieldconexMgmtSDK::testSDK();
```


### Instance Methods

#### `client(entopts = Value::undef()) -> std::shared_ptr<ClientEntity>`

Create a new `ClientEntity` instance bound to this client.

#### `clone(entopts = Value::undef()) -> std::shared_ptr<CloneEntity>`

Create a new `CloneEntity` instance bound to this client.

#### `partner(entopts = Value::undef()) -> std::shared_ptr<PartnerEntity>`

Create a new `PartnerEntity` instance bound to this client.

#### `template_(entopts = Value::undef()) -> std::shared_ptr<TemplateEntity>`

Create a new `TemplateEntity` instance bound to this client.

#### `transaction(entopts = Value::undef()) -> std::shared_ptr<TransactionEntity>`

Create a new `TransactionEntity` instance bound to this client.

#### `update_result(entopts = Value::undef()) -> std::shared_ptr<UpdateResultEntity>`

Create a new `UpdateResultEntity` instance bound to this client.

#### `user(entopts = Value::undef()) -> std::shared_ptr<UserEntity>`

Create a new `UserEntity` instance bound to this client.

#### `optionsMap() -> Value`

Return a deep copy of the current SDK options.

#### `getUtility() -> UtilityPtr`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Value`

Make a direct HTTP request to any API endpoint. Returns a result `Value` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `getp(result, "ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `std::string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `std::string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Value` | Path parameter values. |
| `fetchargs["query"]` | `Value` | Query string parameters. |
| `fetchargs["headers"]` | `Value` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Value` | Request body (maps are JSON-serialized). |

**Returns:** `Value` (result map)

#### `prepare(fetchargs) -> Value`

Prepare a fetch definition without sending. Returns the `fetchdef` and throws on error.


---

## ClientEntity

```cpp
auto client = client->client();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `std::string` | No |  |
| `contact` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No |  |
| `direct_partner` | `std::map<std::string, Value>` | No |  |
| `id` | `int64_t` | No |  |
| `is_active` | `bool` | No |  |
| `mid` | `std::string` | No |  |
| `modified` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `version` | `int64_t` | No |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->client()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->client()->list(Value::undef(), Value::undef());
for (const auto& client : *results.as_list()) {
  std::cout << Struct::jsonify(client) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->client()->load(vmap({{"id", Value("client_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->client()->remove(vmap({{"id", Value("client_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ClientEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## CloneEntity

```cpp
auto clone = client->clone();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int64_t` | No |  |
| `name` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->clone()->create(vmap({
    {"template_id", Value("example_template_id")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `CloneEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## PartnerEntity

```cpp
auto partner = client->partner();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `std::string` | No |  |
| `contact` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No |  |
| `id` | `int64_t` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `parent` | `std::map<std::string, Value>` | No |  |
| `reference` | `std::string` | No |  |
| `verification_phrase` | `std::string` | No |  |
| `version` | `int64_t` | No |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->partner()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->partner()->list(Value::undef(), Value::undef());
for (const auto& partner : *results.as_list()) {
  std::cout << Struct::jsonify(partner) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->partner()->load(vmap({{"id", Value("partner_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `PartnerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## TemplateEntity

```cpp
auto template_ = client->template_();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `Value` | No |  |
| `active` | `bool` | No |  |
| `client` | `std::map<std::string, Value>` | No |  |
| `field_template` | `std::vector<Value>` | No |  |
| `id` | `int64_t` | No |  |
| `name` | `std::string` | No |  |
| `option` | `std::map<std::string, Value>` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `reference` | `std::string` | No |  |
| `type` | `std::string` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->template_()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->template_()->list(Value::undef(), Value::undef());
for (const auto& template_ : *results.as_list()) {
  std::cout << Struct::jsonify(template_) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->template_()->load(vmap({{"id", Value("template_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->template_()->remove(vmap({{"id", Value("template_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `TemplateEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## TransactionEntity

```cpp
auto transaction = client->transaction();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `std::string` | No |  |
| `client` | `std::map<std::string, Value>` | No |  |
| `complete_date` | `std::string` | No |  |
| `direct_partner` | `std::map<std::string, Value>` | No |  |
| `err_code` | `std::string` | No |  |
| `err_message` | `std::string` | No |  |
| `id` | `int64_t` | No |  |
| `ip_address` | `std::string` | No |  |
| `message_id` | `std::string` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `reference` | `std::string` | No |  |
| `success` | `bool` | No |  |
| `template_id` | `std::string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->transaction()->list(Value::undef(), Value::undef());
for (const auto& transaction : *results.as_list()) {
  std::cout << Struct::jsonify(transaction) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->transaction()->load(vmap({{"id", Value("transaction_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `TransactionEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## UpdateResultEntity

```cpp
auto update_result = client->update_result();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `std::string` | No |  |
| `client` | `std::map<std::string, Value>` | No |  |
| `contact` | `std::map<std::string, Value>` | Yes |  |
| `direct_partner` | `std::map<std::string, Value>` | No |  |
| `email` | `std::string` | Yes |  |
| `first_name` | `std::string` | Yes |  |
| `id` | `int64_t` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `std::string` | Yes |  |
| `mid` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `parent` | `std::map<std::string, Value>` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `phone` | `std::string` | Yes |  |
| `reference` | `std::string` | No |  |
| `send_welcome_email` | `bool` | No |  |
| `user_name` | `std::string` | Yes |  |
| `user_role` | `std::map<std::string, Value>` | Yes |  |
| `verification_phrase` | `std::string` | No |  |
| `version` | `int64_t` | No |  |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->update_result()->create(vmap({
    {"contact", vmap()},  // std::map<std::string, Value>
    {"email", Value("example_email")},  // std::string
    {"first_name", Value("example_first_name")},  // std::string
    {"last_name", Value("example_last_name")},  // std::string
    {"phone", Value("example_phone")},  // std::string
    {"user_name", Value("example_user_name")},  // std::string
    {"user_role", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->update_result()->list(Value::undef(), Value::undef());
for (const auto& update_result : *results.as_list()) {
  std::cout << Struct::jsonify(update_result) << std::endl;
}
```

#### `update(reqdata, ctrl) -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```cpp
Value result = client->update_result()->update(vmap({
    {"id", Value("id")},
    // Fields to update
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `UpdateResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## UserEntity

```cpp
auto user = client->user();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No |  |
| `email` | `std::string` | No |  |
| `first_name` | `std::string` | No |  |
| `id` | `int64_t` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `std::string` | No |  |
| `modified` | `std::string` | No |  |
| `partner` | `std::map<std::string, Value>` | No |  |
| `phone` | `std::string` | No |  |
| `user_name` | `std::string` | No |  |
| `user_role` | `std::map<std::string, Value>` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->user()->load(vmap({{"id", Value("user_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `UserEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```cpp
auto client = std::make_shared<BluefinShieldconexMgmtSDK>(vmap({
    {"feature", vmap({
        {"test", vmap({{"active", Value(true)}})},
    })},
}));
```

