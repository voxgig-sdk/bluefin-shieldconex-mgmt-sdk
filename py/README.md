# BluefinShieldconexMgmt Python SDK



The Python SDK for the BluefinShieldconexMgmt API — an entity-oriented client following Pythonic conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Client()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to PyPI. Install it from the GitHub
release tag (`py/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)) or
from a source checkout:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
import os
from bluefinshieldconexmgmt_sdk import BluefinShieldconexMgmtSDK

client = BluefinShieldconexMgmtSDK({
    "apikey": os.environ.get("BLUEFIN_SHIELDCONEX_MGMT_APIKEY"),
})
```

### 2. List client records

`list()` returns a `list` of records (each a `dict`) and raises on
error — iterate it directly.

```python
try:
    client_s = client.Client().list()
    for client_ in client_s:
        print(client_)
except Exception as err:
    print(f"list failed: {err}")
```

### 3. Load a client

`load()` returns the ENTITY — call data_get() for the record — and raises on error.

```python
try:
    client_ = client.Client().load({"id": "example_id"})
    print(client_)
except Exception as err:
    print(f"load failed: {err}")
```

### 4. Create, update, and remove

```python
# Create — returns the ENTITY (call data_get() for the record)
created = client.Client().create({"billingId": "example_billingId", "contact": {}})

# Remove
client.Client().remove({"id": created.data_get()["id"]})
```


## Error handling

Entity operations raise on failure, so wrap them in `try` / `except`:

```python
try:
    partners = client.Partner().list()
    print(partners)
except Exception as err:
    print(f"list failed: {err}")
```

`direct()` does **not** raise — it returns the result envelope. Branch
on `ok`; on failure `status` holds the HTTP status (for error responses)
and `err` holds a transport error, so read both defensively:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example_id"},
})

if not result["ok"]:
    print("request failed:", result.get("status"), result.get("err"))
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
else:
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read both with .get() rather than indexing a key that may be absent.
    print(result.get("status"), result.get("err"))
```

### Prepare a request without sending it

```python
# prepare() returns the fetch definition and raises on error.
fetchdef = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = BluefinShieldconexMgmtSDK.test()

# Entity ops return the ENTITY and raises on error;
# call data_get() for the record.
partner = client.Partner().list()
# partner contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```python
def mock_fetch(url, init):
    return {
        "status": 200,
        "statusText": "OK",
        "headers": {},
        "json": lambda: {"id": "mock01"},
    }, None

client = BluefinShieldconexMgmtSDK({
    "base": "http://localhost:8080",
    "system": {
        "fetch": mock_fetch,
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd py && pytest test/
```


## Reference

### BluefinShieldconexMgmtSDK

```python
from bluefinshieldconexmgmt_sdk import BluefinShieldconexMgmtSDK

client = BluefinShieldconexMgmtSDK(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `str` | API key for authentication. |
| `base` | `str` | Base URL of the API server. |
| `prefix` | `str` | URL path prefix prepended to all requests. |
| `suffix` | `str` | URL path suffix appended to all requests. |
| `feature` | `dict` | Feature activation flags. |
| `extend` | `list` | Additional Feature instances to load. |
| `system` | `dict` | System overrides (e.g. custom `fetch` function). |

### test

```python
client = BluefinShieldconexMgmtSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `None`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> dict` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> dict` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> dict` | Build and send an HTTP request. Returns a result dict (branch on `ok`). |
| `Client` | `(data) -> ClientEntity` | Create a Client entity instance. |
| `Clone` | `(data) -> CloneEntity` | Create a Clone entity instance. |
| `Partner` | `(data) -> PartnerEntity` | Create a Partner entity instance. |
| `Template` | `(data) -> TemplateEntity` | Create a Template entity instance. |
| `Transaction` | `(data) -> TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `(data) -> UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User` | `(data) -> UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> list` | List entities matching the criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> any` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> any` | Remove an entity. Raises on error. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data_get() for the record) (a `dict` for single-entity
ops, a `list` for `list`) and raise on error. Wrap calls in
`try`/`except` to handle failures.

The `direct()` escape hatch never raises — it returns a result `dict`
you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `True` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `dict` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `False` and `err` contains the error value.

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

Create an instance: `client_ = client.Client()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `str` |  |
| `contact` | `dict` |  |
| `created` | `str` |  |
| `directPartner` | `dict` |  |
| `id` | `int` |  |
| `isActive` | `bool` |  |
| `mid` | `str` |  |
| `modified` | `str` |  |
| `name` | `str` |  |
| `partner` | `dict` |  |
| `version` | `int` |  |

#### Example: Load

```python
client_ = client.Client().load({"id": "client_id"})
```

#### Example: List

```python
client_s = client.Client().list()
```

#### Example: Create

```python
client_ = client.Client().create({
})
```


### Clone

Create an instance: `clone = client.Clone()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `str` |  |

#### Example: Create

```python
clone = client.Clone().create({
    "template_id": "example_template_id",  # str
})
```


### Partner

Create an instance: `partner = client.Partner()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `str` |  |
| `contact` | `dict` |  |
| `created` | `str` |  |
| `id` | `int` |  |
| `isActive` | `bool` |  |
| `modified` | `str` |  |
| `name` | `str` |  |
| `parent` | `dict` |  |
| `reference` | `str` |  |
| `verificationPhrase` | `str` |  |
| `version` | `int` |  |

#### Example: Load

```python
partner = client.Partner().load({"id": "partner_id"})
```

#### Example: List

```python
partners = client.Partner().list()
```

#### Example: Create

```python
partner = client.Partner().create({
})
```


### Template

Create an instance: `template = client.Template()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `accessMode` | `Any` |  |
| `active` | `bool` |  |
| `client` | `dict` |  |
| `fieldTemplates` | `list` |  |
| `id` | `int` |  |
| `name` | `str` |  |
| `options` | `dict` |  |
| `partner` | `dict` |  |
| `reference` | `str` |  |
| `type` | `str` |  |
| `version` | `int` |  |

#### Example: Load

```python
template = client.Template().load({"id": "template_id"})
```

#### Example: List

```python
templates = client.Template().list()
```

#### Example: Create

```python
template = client.Template().create({
})
```


### Transaction

Create an instance: `transaction = client.Transaction()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `str` |  |
| `client` | `dict` |  |
| `completeDate` | `str` |  |
| `directPartner` | `dict` |  |
| `errCode` | `str` |  |
| `errMessage` | `str` |  |
| `id` | `int` |  |
| `ipAddress` | `str` |  |
| `messageId` | `str` |  |
| `partner` | `dict` |  |
| `reference` | `str` |  |
| `success` | `bool` |  |
| `templateId` | `str` |  |

#### Example: Load

```python
transaction = client.Transaction().load({"id": "transaction_id"})
```

#### Example: List

```python
transactions = client.Transaction().list()
```


### UpdateResult

Create an instance: `update_result = client.UpdateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `str` |  |
| `client` | `dict` |  |
| `contact` | `dict` |  |
| `directPartner` | `dict` |  |
| `email` | `str` |  |
| `firstName` | `str` |  |
| `id` | `int` |  |
| `isActive` | `bool` |  |
| `lastName` | `str` |  |
| `mid` | `str` |  |
| `name` | `str` |  |
| `parent` | `dict` |  |
| `partner` | `dict` |  |
| `phone` | `str` |  |
| `reference` | `str` |  |
| `sendWelcomeEmail` | `bool` |  |
| `userName` | `str` |  |
| `userRole` | `dict` |  |
| `verificationPhrase` | `str` |  |
| `version` | `int` |  |

#### Example: List

```python
update_results = client.UpdateResult().list()
```

#### Example: Create

```python
update_result = client.UpdateResult().create({
    "contact": {},  # dict
    "email": "example_email",  # str
    "firstName": "example_firstName",  # str
    "lastName": "example_lastName",  # str
    "phone": "example_phone",  # str
    "userName": "example_userName",  # str
    "userRole": {},  # dict
})
```


### User

Create an instance: `user = client.User()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `dict` |  |
| `created` | `str` |  |
| `email` | `str` |  |
| `firstName` | `str` |  |
| `id` | `int` |  |
| `isActive` | `bool` |  |
| `lastName` | `str` |  |
| `modified` | `str` |  |
| `partner` | `dict` |  |
| `phone` | `str` |  |
| `userName` | `str` |  |
| `userRole` | `dict` |  |
| `version` | `int` |  |

#### Example: Load

```python
user = client.User().load({"id": "user_id"})
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

Features are the extension mechanism. A feature is a Python class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dicts

The Python SDK uses plain dicts throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a dict.

### Module structure

```
py/
├── bluefinshieldconexmgmt_sdk.py         -- Main SDK module
├── config.py                    -- Configuration
├── features.py                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log)
├── utility/                     -- Utility functions and struct library
└── test/                        -- Test suites
```

The main module (`bluefinshieldconexmgmt_sdk`) exports the SDK class.
Import entity or utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```python
partner = client.Partner()
partner.list()

# partner.data_get() now returns the partner data from the last list
# partner.match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
