# BluefinShieldconexMgmt C++ SDK



The C++ SDK for the BluefinShieldconexMgmt API — a header-only,
entity-oriented client following idiomatic modern C++ (C++17) conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client->client()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low. Every value flows through a single dynamic
`sdk::Value` type (a JSON-like variant), so there is no schema-driven code to
regenerate when the API changes.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
The C++ SDK is **header-only** — there is no package to install
from a registry. Vendor the `cpp/` directory into your project (or add the
repository as a git submodule) and put it on your compiler's include path.
Releases are cut as the git tag `cpp/vX.Y.Z` (see
[Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)).

```bash
# Add the SDK as a submodule (or copy the cpp/ directory into your tree).
git submodule add <repo-url> third_party/bluefinshieldconexmgmt-sdk
```

Then include the umbrella header and compile with C++17:

```cpp
#include "core/sdk.hpp"
```

```bash
g++ -std=c++17 -Ithird_party/bluefinshieldconexmgmt-sdk/cpp your_app.cpp -o your_app
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```cpp
#include <cstdlib>
#include "core/sdk.hpp"

using namespace sdk;

const char* apikey = std::getenv("BLUEFIN_SHIELDCONEX_MGMT_APIKEY");
auto client = std::make_shared<BluefinShieldconexMgmtSDK>(vmap({
    {"apikey", Value(apikey ? apikey : "")},
}));
```

### 2. List client records

`list()` returns an `sdk::Value` list and throws `sdk::SdkErrorPtr`
on error — iterate it directly.

```cpp
try {
  Value clients = client->client()->list(Value::undef(), Value::undef());
  for (const auto& client : *clients.as_list()) {
    std::cout << Struct::jsonify(client) << std::endl;
  }
} catch (const SdkErrorPtr& err) {
  std::cerr << "list failed: " << err->msg << std::endl;
}
```

### 3. Load a client

`load()` returns the bare record and throws on error.

```cpp
try {
  Value client = client->client()->load(vmap({{"id", Value("example_id")}}), Value::undef());
  std::cout << Struct::jsonify(client) << std::endl;
} catch (const SdkErrorPtr& err) {
  std::cerr << "load failed: " << err->msg << std::endl;
}
```

### 4. Create, update, and remove

```cpp
// Create — returns the bare created record.
Value created = client->client()->create(vmap({{"contact_email", Value("example_contact_email")}, {"contact_first_name", Value("example_contact_first_name")}, {"contact_is_active", Value(true)}, {"contact_last_name", Value("example_contact_last_name")}, {"contact_phone", Value("example_contact_phone")}, {"contact_send_welcome_email", Value(true)}, {"contact_user_name", Value("example_contact_user_name")}, {"contact_user_role", Value("example_contact_user_role")}, {"direct_partner_id", Value(1)}, {"direct_partner_name", Value("example_direct_partner_name")}, {"is_active", Value(true)}, {"name", Value("example_name")}}), Value::undef());

// Remove
client->client()->remove(vmap({{"id", getp(created, "id")}}), Value::undef());
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

```cpp
Value result = client->direct(vmap({
    {"path", Value("/api/resource/{id}")},
    {"method", Value("GET")},
    {"params", vmap({{"id", Value("example")}})},
}));

if (getp(result, "ok") == Value(true)) {
  std::cout << Helpers::toInt(getp(result, "status")) << std::endl;  // 200
  std::cout << Struct::jsonify(getp(result, "data")) << std::endl;   // response body
} else {
  // A non-2xx response carries status + data (the error body); a
  // transport-level failure carries err instead. Only one is present.
  std::cerr << Helpers::toInt(getp(result, "status")) << " "
            << Struct::jsonify(getp(result, "err")) << std::endl;
}
```

`direct()` is the escape hatch: it never throws — branch on
`getp(result, "ok")`.

### Prepare a request without sending it

```cpp
// prepare() returns the fetch definition and throws on error.
Value fetchdef = client->prepare(vmap({
    {"path", Value("/api/resource/{id}")},
    {"method", Value("DELETE")},
    {"params", vmap({{"id", Value("example")}})},
}));

std::cout << Struct::stringify(getp(fetchdef, "url")) << std::endl;
std::cout << Struct::stringify(getp(fetchdef, "method")) << std::endl;
std::cout << Struct::jsonify(getp(fetchdef, "headers")) << std::endl;
```

### Use test mode

Create a mock client for unit testing — no server required. The test
feature installs an in-memory mock transport:

```cpp
auto client = BluefinShieldconexMgmtSDK::testSDK();

// Entity ops return the bare record and throw on error.
Value partner = client->partner()->list(Value::undef(), Value::undef());
// partner contains the mock response record
std::cout << Struct::jsonify(partner) << std::endl;
```

You can seed the mock store by passing test options — see the generated
`test/` suite for worked examples.

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then build and run the test suite:

```bash
cd cpp && make test
```


## Reference

### BluefinShieldconexMgmtSDK

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = std::make_shared<BluefinShieldconexMgmtSDK>(options);
```

Creates a new SDK client. `options` is an `sdk::Value` map.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `std::string` | API key for authentication. |
| `base` | `std::string` | Base URL of the API server. |
| `prefix` | `std::string` | URL path prefix prepended to all requests. |
| `suffix` | `std::string` | URL path suffix appended to all requests. |
| `feature` | `Value` | Feature activation flags. |
| `system` | `Value` | System overrides. |

### testSDK

```cpp
auto client = BluefinShieldconexMgmtSDK::testSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::undef()`; a no-arg `BluefinShieldconexMgmtSDK::testSDK()` overload is
also provided.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> Value` | Deep copy of current SDK options. |
| `getUtility` | `() -> UtilityPtr` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Value` | Build an HTTP request definition without sending. Throws on error. |
| `direct` | `(fetchargs) -> Value` | Build and send an HTTP request. Returns a result Value (branch on `ok`). |
| `client` | `(entopts) -> std::shared_ptr<ClientEntity>` | Create a Client entity instance. |
| `clone` | `(entopts) -> std::shared_ptr<CloneEntity>` | Create a Clone entity instance. |
| `partner` | `(entopts) -> std::shared_ptr<PartnerEntity>` | Create a Partner entity instance. |
| `template_` | `(entopts) -> std::shared_ptr<TemplateEntity>` | Create a Template entity instance. |
| `transaction` | `(entopts) -> std::shared_ptr<TransactionEntity>` | Create a Transaction entity instance. |
| `update_result` | `(entopts) -> std::shared_ptr<UpdateResultEntity>` | Create an UpdateResult entity instance. |
| `user` | `(entopts) -> std::shared_ptr<UserEntity>` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Value` | Load a single entity by match criteria. Throws on error. |
| `list` | `(reqmatch, ctrl) -> Value` | List entities matching the criteria (a Value list). Throws on error. |
| `create` | `(reqdata, ctrl) -> Value` | Create a new entity. Throws on error. |
| `update` | `(reqdata, ctrl) -> Value` | Update an existing entity. Throws on error. |
| `remove` | `(reqmatch, ctrl) -> Value` | Remove an entity. Throws on error. |
| `data` | `(arg) -> Value` | Get (no arg) or set (with arg) entity data. |
| `match` | `(arg) -> Value` | Get (no arg) or set (with arg) entity match criteria. |
| `make` | `() -> EntityPtr` | Create a new instance with the same options. |
| `getName` | `() -> std::string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a map `Value` for
single-entity ops, a list `Value` for `list`) and throw
`sdk::SdkErrorPtr` on error. Wrap calls in `try`/`catch` to handle
failures.

The `direct()` escape hatch never throws — it returns a result `Value`
you branch on via `getp(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Value` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

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

Create an instance: `auto client = client->client();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `std::string` | Billing ID |
| `contact` | `std::map<std::string, Value>` |  |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `id` | `int64_t` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `mid` | `std::string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `std::string` | Last modified timestamp. |
| `name` | `std::string` | The Client's name. |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: Load

```cpp
Value client = client->client()->load(vmap({{"id", Value("client_id")}}), Value::undef());
```

#### Example: List

```cpp
Value clients = client->client()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value client = client->client()->create(vmap({
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


### Clone

Create an instance: `auto clone = client->clone();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int64_t` | Unique identifier of newly added element. |
| `name` | `std::string` | Name of Template |

#### Example: Create

```cpp
Value clone = client->clone()->create(vmap({
    {"template_id", Value("example_template_id")},  // std::string
}), Value::undef());
```


### Partner

Create an instance: `auto partner = client->partner();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `std::string` | The Partner's billing identifier. |
| `contact` | `std::map<std::string, Value>` |  |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `id` | `int64_t` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `modified` | `std::string` | Last modified timestamp. |
| `name` | `std::string` | The Partner's name. |
| `parent` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `reference` | `std::string` | The Partner's reference string. |
| `verificationPhrase` | `std::string` | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: Load

```cpp
Value partner = client->partner()->load(vmap({{"id", Value("partner_id")}}), Value::undef());
```

#### Example: List

```cpp
Value partners = client->partner()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value partner = client->partner()->create(vmap({
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


### Template

Create an instance: `auto template_ = client->template_();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `accessMode` | `Value` | The Template's access mode. |
| `active` | `bool` | This property indicates if the Template is active or inactive. |
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `fieldTemplates` | `std::vector<Value>` | Field Template list items |
| `id` | `int64_t` | Unique identifier of newly added element. |
| `name` | `std::string` | The Template's name. |
| `options` | `std::map<std::string, Value>` |  |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `reference` | `std::string` | The Template's unique reference. |
| `type` | `std::string` | The Template's type. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: Load

```cpp
Value template_ = client->template_()->load(vmap({{"id", Value("template_id")}}), Value::undef());
```

#### Example: List

```cpp
Value template_s = client->template_()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value template_ = client->template_()->create(vmap({
    {"active", Value(true)},  // bool
    {"client_id", Value(1)},  // int64_t
    {"client_name", Value("example_client_name")},  // std::string
    {"name", Value("example_name")},  // std::string
    {"partner_id", Value(1)},  // int64_t
    {"partner_name", Value("example_partner_name")},  // std::string
    {"reference", Value("example_reference")},  // std::string
}), Value::undef());
```


### Transaction

Create an instance: `auto transaction = client->transaction();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `std::string` | BFID |
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `completeDate` | `std::string` | Timestamp from the beginning of the transaction. |
| `directPartner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `errCode` | `std::string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `std::string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int64_t` | This resource's unique identifier. |
| `ipAddress` | `std::string` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `std::string` | Message ID. |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `reference` | `std::string` | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | The success indicator. |
| `templateId` | `std::string` | The Template's unique identifier. |

#### Example: Load

```cpp
Value transaction = client->transaction()->load(vmap({{"id", Value("transaction_id")}}), Value::undef());
```

#### Example: List

```cpp
Value transactions = client->transaction()->list(Value::undef(), Value::undef());
```


### UpdateResult

Create an instance: `auto update_result = client->update_result();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `std::string` | The Partner's billing identifier. |
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `contact` | `std::map<std::string, Value>` |  |
| `directPartner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `email` | `std::string` | The User's email address. |
| `firstName` | `std::string` | The User's name. |
| `id` | `int64_t` | Unique identifier of newly added element. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `lastName` | `std::string` | The User's Surname. |
| `mid` | `std::string` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `std::string` | The Partner's name. |
| `parent` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `phone` | `std::string` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `std::string` | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `std::string` | The User's unique username. |
| `userRole` | `std::map<std::string, Value>` | Reference to the associated User Role. |
| `verificationPhrase` | `std::string` | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: List

```cpp
Value update_results = client->update_result()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value update_result = client->update_result()->create(vmap({
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


### User

Create an instance: `auto user = client->user();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `email` | `std::string` |  |
| `firstName` | `std::string` |  |
| `id` | `int64_t` | This resource's unique identifier. |
| `isActive` | `bool` |  |
| `lastName` | `std::string` |  |
| `modified` | `std::string` | Last modified timestamp. |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `phone` | `std::string` |  |
| `userName` | `std::string` |  |
| `userRole` | `std::map<std::string, Value>` | Reference to the associated User Role. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: Load

```cpp
Value user = client->user()->load(vmap({{"id", Value("user_id")}}), Value::undef());
```

## Features

This SDK ships 12 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Audit trail |
| [`clienttrack`](#clienttrack) | Client tracking |
| [`debug`](#debug) | Debug capture |
| [`idempotency`](#idempotency) | Idempotency |
| [`log`](#log) | Logging |
| [`metrics`](#metrics) | Metrics |
| [`paging`](#paging) | Paging |
| [`ratelimit`](#ratelimit) | Rate limiting |
| [`retry`](#retry) | Retry |
| [`telemetry`](#telemetry) | Telemetry |
| [`test`](#test) | Test transport |
| [`timeout`](#timeout) | Timeout |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### audit

Audit trail.

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Set `feature.audit.active` to enable it, then override any of the options above.

### clienttrack

Client tracking.

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Set `feature.clienttrack.active` to enable it, then override any of the options above.

### debug

Debug capture.

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

Set `feature.debug.active` to enable it, then override any of the options above.

### idempotency

Idempotency.

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Set `feature.idempotency.active` to enable it, then override any of the options above.

### log

Logging.

| Option | Default |
|---|---|
| `active` | `true` |

Set `feature.log.active` to enable it, then override any of the options above.

### metrics

Metrics.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.metrics.active` to enable it, then override any of the options above.

### paging

Paging.

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

Set `feature.paging.active` to enable it, then override any of the options above.

### ratelimit

Rate limiting.

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Set `feature.ratelimit.active` to enable it, then override any of the options above.

`ratelimit` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### retry

Retry.

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Set `feature.retry.active` to enable it, then override any of the options above.

`retry` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### telemetry

Telemetry.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.telemetry.active` to enable it, then override any of the options above.

### test

Test transport.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Timeout.

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Set `feature.timeout.active` to enable it, then override any of the options above.

`timeout` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.


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

- **AuditFeature**: Audit trail
- **ClienttrackFeature**: Client tracking
- **DebugFeature**: Debug capture
- **IdempotencyFeature**: Idempotency
- **LogFeature**: Logging
- **MetricsFeature**: Metrics
- **PagingFeature**: Paging
- **RatelimitFeature**: Rate limiting
- **RetryFeature**: Retry
- **TelemetryFeature**: Telemetry
- **TestFeature**: Test transport
- **TimeoutFeature**: Timeout

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as `Value`

The C++ SDK uses a single dynamic `sdk::Value` type (a JSON-like variant
over string / number / bool / list / map) throughout rather than generated
typed structs. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema changes.

Build maps with `sdk::vmap({{"key", sdk::Value("v")}})` and lists with
`sdk::vlist({...})`; read fields back with `sdk::getp(value, "key")`. Use
`sdk::to_map()` to safely coerce a value that should be a map, and
`sdk::Struct::jsonify(value)` to render it as JSON.

### Directory structure

```
cpp/
├── core/                        -- Runtime type graph, config, generated client
├── entity/                      -- Per-entity client headers
├── feature/                     -- Built-in features (Base, Test, Log, ...)
├── utility/                     -- Operation pipeline + vendored struct library
├── test/                        -- Test suites
├── Makefile                     -- Build & run the tests (C++17)
└── VERSION                      -- SDK version
```

Include the umbrella header `core/sdk.hpp` to pull in the whole SDK: the
runtime types, the pipeline utilities, the vendored struct, the generated
config, the per-entity clients and the generated `BluefinShieldconexMgmtSDK`
client class. Everything lives in the `sdk` namespace.

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
