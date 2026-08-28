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
| `billingId` | `std::string` | No | Billing ID |
| `contact` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `std::string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `name` | `std::string` | No | The Client's name. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->client()->create(vmap({
    {"contact_email", Value("example_contact_email")},  // std::string
    {"contact_first_name", Value("example_contact_first_name")},  // std::string
    {"contact_is_active", Value(true)},  // bool
    {"contact_last_name", Value("example_contact_last_name")},  // std::string
    {"contact_phone", Value("example_contact_phone")},  // std::string
    {"contact_send_welcome_email", Value(true)},  // bool
    {"contact_user_name", Value("example_contact_user_name")},  // std::string
    {"contact_user_role", Value("example_contact_user_role")},  // std::string
    {"direct_partner_id", Value(1)},  // int64_t
    {"direct_partner_name", Value("example_direct_partner_name")},  // std::string
    {"is_active", Value(true)},  // bool
    {"name", Value("example_name")},  // std::string
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
| `id` | `int64_t` | No | Unique identifier of newly added element. |
| `name` | `std::string` | No | Name of Template |

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
| `billingId` | `std::string` | No | The Partner's billing identifier. |
| `contact` | `std::map<std::string, Value>` | No |  |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `name` | `std::string` | No | The Partner's name. |
| `parent` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `reference` | `std::string` | No | The Partner's reference string. |
| `verificationPhrase` | `std::string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->partner()->create(vmap({
    {"billing_id", Value("example_billing_id")},  // std::string
    {"contact_email", Value("example_contact_email")},  // std::string
    {"contact_first_name", Value("example_contact_first_name")},  // std::string
    {"contact_is_active", Value(true)},  // bool
    {"contact_last_name", Value("example_contact_last_name")},  // std::string
    {"contact_phone", Value("example_contact_phone")},  // std::string
    {"contact_send_welcome_email", Value(true)},  // bool
    {"contact_user_name", Value("example_contact_user_name")},  // std::string
    {"contact_user_role", Value("example_contact_user_role")},  // std::string
    {"is_active", Value(true)},  // bool
    {"name", Value("example_name")},  // std::string
    {"reference", Value("example_reference")},  // std::string
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
| `accessMode` | `Value` | No | The Template's access mode. |
| `active` | `bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `std::vector<Value>` | No | Field Template list items |
| `id` | `int64_t` | No | Unique identifier of newly added element. |
| `name` | `std::string` | No | The Template's name. |
| `options` | `std::map<std::string, Value>` | No |  |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `reference` | `std::string` | No | The Template's unique reference. |
| `type` | `std::string` | No | The Template's type. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->template_()->create(vmap({
    {"active", Value(true)},  // bool
    {"client_id", Value(1)},  // int64_t
    {"client_name", Value("example_client_name")},  // std::string
    {"name", Value("example_name")},  // std::string
    {"partner_id", Value(1)},  // int64_t
    {"partner_name", Value("example_partner_name")},  // std::string
    {"reference", Value("example_reference")},  // std::string
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
| `bfid` | `std::string` | No | BFID |
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `completeDate` | `std::string` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `errCode` | `std::string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `std::string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `ipAddress` | `std::string` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `std::string` | No | Message ID. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `reference` | `std::string` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | No | The success indicator. |
| `templateId` | `std::string` | No | The Template's unique identifier. |

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
| `billingId` | `std::string` | No | The Partner's billing identifier. |
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `contact` | `std::map<std::string, Value>` | Yes |  |
| `directPartner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `email` | `std::string` | Yes | The User's email address. |
| `firstName` | `std::string` | Yes | The User's name. |
| `id` | `int64_t` | No | Unique identifier of newly added element. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `std::string` | Yes | The User's Surname. |
| `mid` | `std::string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `std::string` | No | The Partner's name. |
| `parent` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `phone` | `std::string` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `std::string` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `std::string` | Yes | The User's unique username. |
| `userRole` | `std::map<std::string, Value>` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `std::string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->update_result()->create(vmap({
    {"email", Value("example_email")},  // std::string
    {"first_name", Value("example_first_name")},  // std::string
    {"is_active", Value(true)},  // bool
    {"last_name", Value("example_last_name")},  // std::string
    {"phone", Value(1)},  // int64_t
    {"send_welcome_email", Value(true)},  // bool
    {"user_role", vmap()},  // std::map<std::string, Value>
    {"username", Value("example_username")},  // std::string
    {"contact", vmap()},  // std::map<std::string, Value>
    {"firstName", Value("example_firstName")},  // std::string
    {"lastName", Value("example_lastName")},  // std::string
    {"userName", Value("example_userName")},  // std::string
    {"userRole", vmap()},  // std::map<std::string, Value>
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
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `std::string` | No |  |
| `firstName` | `std::string` | No |  |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `isActive` | `bool` | No |  |
| `lastName` | `std::string` | No |  |
| `modified` | `std::string` | No | Last modified timestamp. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `phone` | `std::string` | No |  |
| `userName` | `std::string` | No |  |
| `userRole` | `std::map<std::string, Value>` | No | Reference to the associated User Role. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

```cpp
auto client = std::make_shared<BluefinShieldconexMgmtSDK>(vmap({
    {"feature", vmap({
        {"audit", vmap({{"active", Value(true)}})},
        {"clienttrack", vmap({{"active", Value(true)}})},
        {"idempotency", vmap({{"active", Value(true)}})},
        {"log", vmap({{"active", Value(true)}})},
        {"metrics", vmap({{"active", Value(true)}})},
        {"paging", vmap({{"active", Value(true)}})},
        {"ratelimit", vmap({{"active", Value(true)}})},
        {"retry", vmap({{"active", Value(true)}})},
        {"telemetry", vmap({{"active", Value(true)}})},
        {"test", vmap({{"active", Value(true)}})},
        {"timeout", vmap({{"active", Value(true)}})},
    })},
}));
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

