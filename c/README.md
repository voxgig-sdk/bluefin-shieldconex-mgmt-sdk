# BluefinShieldconexMgmt C SDK



The C SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic C conventions (explicit structs, function-pointer vtables, and a trailing `PNError**` out-param for errors).

The SDK exposes the API as capitalised, semantic **Entities** — for example `bluefin_shieldconex_mgmt_client(client, NULL)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
C has no central package registry — a release is the git tag
(`c/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)). Build from a
source checkout with the bundled `Makefile`; the voxgig struct library is
vendored under `utility/struct`, so there are no external dependencies to
fetch:

```bash
cd c && make          # builds libsdk.a
cd c && make test     # builds + runs the test binaries
```

Link your program against `libsdk.a` and include `core/api.h`:

```bash
cc -I c/core -I c/utility/struct \
   myapp.c c/libsdk.a -lm -o myapp
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```c
#include "core/api.h"

BluefinShieldconexMgmtSDK* client = bluefin_shieldconex_mgmt_sdk_new(cmap(1,
    "apikey", v_str(getenv("BLUEFIN_SHIELDCONEX_MGMT_APIKEY"))));
PNError* err = NULL;
```

### 2. List client records

`list()` returns a List of records and sets `*err` on failure — check
`err` after the call.

```c
Entity* client = bluefin_shieldconex_mgmt_client(client, NULL);
voxgig_value* clients = client->vt->list(client, NULL, NULL, &err);
if (err) {
    fprintf(stderr, "list failed: %s\n", err->msg);
} else {
    for (size_t i = 0; i < (size_t)voxgig_size(clients); i++) {
        printf("%s\n", voxgig_to_json(voxgig_getelem(clients, v_int(i), NULL)));
    }
}
```

### 3. Load a client

`load()` returns the bare record and sets `*err` on failure.

```c
voxgig_value* client_rec = client->vt->load(client, cmap(1, "id", v_str("example_id")), NULL, &err);
if (err) {
    fprintf(stderr, "load failed: %s\n", err->msg);
} else {
    printf("%s\n", voxgig_to_json(client_rec));
}
```

### 4. Create, update, and remove

```c
// Create — returns the bare created record
voxgig_value* created = client->vt->create(client, cmap(2, "billing_id", v_str("example_billing_id"), "contact", v_map()), NULL, &err);

// Remove
client->vt->remove(client, cmap(1, "id", getp(created, "id")), NULL, &err);
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

For endpoints not covered by entity operations:

```c
PNError* err = NULL;
voxgig_value* result = sdk_direct(client, cmap(3,
    "path", v_str("/api/resource/{id}"),
    "method", v_str("GET"),
    "params", cmap(1, "id", v_str("example"))), &err);

if (voxgig_as_bool(getp(result, "ok"))) {
    printf("%lld\n", (long long)to_int(getp(result, "status")));  // 200
    printf("%s\n", voxgig_to_json(getp(result, "data")));         // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    printf("%s\n", voxgig_to_json(getp(result, "err")));
}
```

`sdk_direct()` never sets `*err` for a non-2xx response — it always returns
a result map you branch on via `getp(result, "ok")`.

### Prepare a request without sending it

```c
PNError* err = NULL;
voxgig_value* fetchdef = sdk_prepare(client, cmap(3,
    "path", v_str("/api/resource/{id}"),
    "method", v_str("DELETE"),
    "params", cmap(1, "id", v_str("example"))), &err);

printf("%s\n", get_str(fetchdef, "url"));
printf("%s\n", get_str(fetchdef, "method"));
printf("%s\n", voxgig_to_json(getp(fetchdef, "headers")));
```

### Use test mode

Create a mock client for unit testing — no server required:

```c
BluefinShieldconexMgmtSDK* client = test_sdk(NULL, NULL);
PNError* err = NULL;

// Entity ops return the bare record and set *err on failure.
Entity* partner = bluefin_shieldconex_mgmt_partner(client, NULL);
voxgig_value* partner_rec = partner->vt->list(partner, NULL, NULL, &err);
// partner_rec contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function (the same shape the test
transport uses):

```c
static voxgig_value* mock_fetch(void* ud, voxgig_value* args) {
    (void)ud; (void)args;
    return cmap(4,
        "status", v_num(200),
        "statusText", v_str("OK"),
        "headers", v_map(),
        "json", json_thunk(cmap(1, "id", v_str("mock01"))));
}

BluefinShieldconexMgmtSDK* client = bluefin_shieldconex_mgmt_sdk_new(cmap(2,
    "base", v_str("http://localhost:8080"),
    "system", cmap(1, "fetch", vfn(mock_fetch, NULL))));
```

### Point at a different server

Override the base URL to reach a local or staging server:

```c
BluefinShieldconexMgmtSDK* client = bluefin_shieldconex_mgmt_sdk_new(cmap(1,
    "base", v_str("http://localhost:8080")));
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd c && make test
```


## Reference

### BluefinShieldconexMgmtSDK

```c
#include "core/api.h"

BluefinShieldconexMgmtSDK* client = bluefin_shieldconex_mgmt_sdk_new(options);
```

Creates a new SDK client. `options` is a `voxgig_value*` map (`NULL` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom `fetch`). |

### test_sdk

```c
BluefinShieldconexMgmtSDK* client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`NULL`.

### BluefinShieldconexMgmtSDK functions

| Function | Signature | Description |
| --- | --- | --- |
| `sdk_prepare` | `(BluefinShieldconexMgmtSDK*, fetchargs, PNError**) -> voxgig_value*` | Build an HTTP request definition without sending. |
| `sdk_direct` | `(BluefinShieldconexMgmtSDK*, fetchargs, PNError**) -> voxgig_value*` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `bluefin_shieldconex_mgmt_client` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Client entity instance. |
| `bluefin_shieldconex_mgmt_clone` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Clone entity instance. |
| `bluefin_shieldconex_mgmt_partner` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Partner entity instance. |
| `bluefin_shieldconex_mgmt_template` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Template entity instance. |
| `bluefin_shieldconex_mgmt_transaction` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Transaction entity instance. |
| `bluefin_shieldconex_mgmt_update_result` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create an UpdateResult entity instance. |
| `bluefin_shieldconex_mgmt_user` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create an User entity instance. |

### Entity interface (vtable)

All entities share the same `EntityVT` vtable, reached via `e->vt->...`.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | Load a single entity by match criteria. |
| `list` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | List entities matching the criteria (a List). |
| `create` | `(Entity*, reqdata, ctrl, PNError**) -> voxgig_value*` | Create a new entity. |
| `update` | `(Entity*, reqdata, ctrl, PNError**) -> voxgig_value*` | Update an existing entity. |
| `remove` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | Remove an entity. |
| `data` | `(Entity*, args) -> voxgig_value*` | Get entity data (pass a map to set). |
| `matchv` | `(Entity*, args) -> voxgig_value*` | Get entity match criteria (pass a map to set). |
| `make` | `(Entity*) -> Entity*` | Create a new instance with the same options. |
| `get_name` | `(Entity*) -> const char*` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `voxgig_value` map for
single-entity ops, a List for `list`) and set `*err` to a `PNError*` on
failure. Always initialise `PNError* err = NULL;` and check it after the
call.

The `sdk_direct()` escape hatch never sets `*err` for a non-2xx response —
it returns a result map you branch on via `getp(result, "ok")`:

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

Create an instance: `Entity* client = bluefin_shieldconex_mgmt_client(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `char*` |  |
| `contact` | `voxgig_value* (map)` |  |
| `created` | `char*` |  |
| `direct_partner` | `voxgig_value* (map)` |  |
| `id` | `int64_t` |  |
| `is_active` | `bool` |  |
| `mid` | `char*` |  |
| `modified` | `char*` |  |
| `name` | `char*` |  |
| `partner` | `voxgig_value* (map)` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* client = bluefin_shieldconex_mgmt_client(client, NULL);
voxgig_value* client_rec = client->vt->load(client, cmap(1, "id", v_str("client_id")), NULL, &err);
```

#### Example: List

```c
Entity* client = bluefin_shieldconex_mgmt_client(client, NULL);
voxgig_value* clients = client->vt->list(client, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* client = bluefin_shieldconex_mgmt_client(client, NULL);
voxgig_value* client_rec = client->vt->create(client, NULL, NULL, &err);
```


### Clone

Create an instance: `Entity* clone = bluefin_shieldconex_mgmt_clone(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int64_t` |  |
| `name` | `char*` |  |

#### Example: Create

```c
Entity* clone = bluefin_shieldconex_mgmt_clone(client, NULL);
voxgig_value* clone_rec = clone->vt->create(clone, cmap(1,
    "template_id", v_str("example_template_id"))  // char*
, NULL, &err);
```


### Partner

Create an instance: `Entity* partner = bluefin_shieldconex_mgmt_partner(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `char*` |  |
| `contact` | `voxgig_value* (map)` |  |
| `created` | `char*` |  |
| `id` | `int64_t` |  |
| `is_active` | `bool` |  |
| `modified` | `char*` |  |
| `name` | `char*` |  |
| `parent` | `voxgig_value* (map)` |  |
| `reference` | `char*` |  |
| `verification_phrase` | `char*` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* partner = bluefin_shieldconex_mgmt_partner(client, NULL);
voxgig_value* partner_rec = partner->vt->load(partner, cmap(1, "id", v_str("partner_id")), NULL, &err);
```

#### Example: List

```c
Entity* partner = bluefin_shieldconex_mgmt_partner(client, NULL);
voxgig_value* partners = partner->vt->list(partner, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* partner = bluefin_shieldconex_mgmt_partner(client, NULL);
voxgig_value* partner_rec = partner->vt->create(partner, NULL, NULL, &err);
```


### Template

Create an instance: `Entity* template = bluefin_shieldconex_mgmt_template(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `voxgig_value*` |  |
| `active` | `bool` |  |
| `client` | `voxgig_value* (map)` |  |
| `field_template` | `voxgig_value* (list)` |  |
| `id` | `int64_t` |  |
| `name` | `char*` |  |
| `option` | `voxgig_value* (map)` |  |
| `partner` | `voxgig_value* (map)` |  |
| `reference` | `char*` |  |
| `type` | `char*` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* template = bluefin_shieldconex_mgmt_template(client, NULL);
voxgig_value* template_rec = template->vt->load(template, cmap(1, "id", v_str("template_id")), NULL, &err);
```

#### Example: List

```c
Entity* template = bluefin_shieldconex_mgmt_template(client, NULL);
voxgig_value* templates = template->vt->list(template, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* template = bluefin_shieldconex_mgmt_template(client, NULL);
voxgig_value* template_rec = template->vt->create(template, NULL, NULL, &err);
```


### Transaction

Create an instance: `Entity* transaction = bluefin_shieldconex_mgmt_transaction(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `char*` |  |
| `client` | `voxgig_value* (map)` |  |
| `complete_date` | `char*` |  |
| `direct_partner` | `voxgig_value* (map)` |  |
| `err_code` | `char*` |  |
| `err_message` | `char*` |  |
| `id` | `int64_t` |  |
| `ip_address` | `char*` |  |
| `message_id` | `char*` |  |
| `partner` | `voxgig_value* (map)` |  |
| `reference` | `char*` |  |
| `success` | `bool` |  |
| `template_id` | `char*` |  |

#### Example: Load

```c
Entity* transaction = bluefin_shieldconex_mgmt_transaction(client, NULL);
voxgig_value* transaction_rec = transaction->vt->load(transaction, cmap(1, "id", v_str("transaction_id")), NULL, &err);
```

#### Example: List

```c
Entity* transaction = bluefin_shieldconex_mgmt_transaction(client, NULL);
voxgig_value* transactions = transaction->vt->list(transaction, NULL, NULL, &err);
```


### UpdateResult

Create an instance: `Entity* update_result = bluefin_shieldconex_mgmt_update_result(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->update(e, reqdata, ctrl, &err)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `char*` |  |
| `client` | `voxgig_value* (map)` |  |
| `contact` | `voxgig_value* (map)` |  |
| `direct_partner` | `voxgig_value* (map)` |  |
| `email` | `char*` |  |
| `first_name` | `char*` |  |
| `id` | `int64_t` |  |
| `is_active` | `bool` |  |
| `last_name` | `char*` |  |
| `mid` | `char*` |  |
| `name` | `char*` |  |
| `parent` | `voxgig_value* (map)` |  |
| `partner` | `voxgig_value* (map)` |  |
| `phone` | `char*` |  |
| `reference` | `char*` |  |
| `send_welcome_email` | `bool` |  |
| `user_name` | `char*` |  |
| `user_role` | `voxgig_value* (map)` |  |
| `verification_phrase` | `char*` |  |
| `version` | `int64_t` |  |

#### Example: List

```c
Entity* update_result = bluefin_shieldconex_mgmt_update_result(client, NULL);
voxgig_value* update_results = update_result->vt->list(update_result, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* update_result = bluefin_shieldconex_mgmt_update_result(client, NULL);
voxgig_value* update_result_rec = update_result->vt->create(update_result, cmap(7,
    "contact", v_map(),  // voxgig_value* (map)
    "email", v_str("example_email"),  // char*
    "first_name", v_str("example_first_name"),  // char*
    "last_name", v_str("example_last_name"),  // char*
    "phone", v_str("example_phone"),  // char*
    "user_name", v_str("example_user_name"),  // char*
    "user_role", v_map())  // voxgig_value* (map)
, NULL, &err);
```


### User

Create an instance: `Entity* user = bluefin_shieldconex_mgmt_user(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `voxgig_value* (map)` |  |
| `created` | `char*` |  |
| `email` | `char*` |  |
| `first_name` | `char*` |  |
| `id` | `int64_t` |  |
| `is_active` | `bool` |  |
| `last_name` | `char*` |  |
| `modified` | `char*` |  |
| `partner` | `voxgig_value* (map)` |  |
| `phone` | `char*` |  |
| `user_name` | `char*` |  |
| `user_role` | `voxgig_value* (map)` |  |
| `version` | `int64_t` |  |

#### Example: Load

```c
Entity* user = bluefin_shieldconex_mgmt_user(client, NULL);
voxgig_value* user_rec = user->vt->load(user, cmap(1, "id", v_str("user_id")), NULL, &err);
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

### Data as `voxgig_value*`

The C SDK uses a single dynamic `voxgig_value*` type throughout rather than
a typed struct per entity. `voxgig_value` is the vendored voxgig struct
port (a JSON-shaped tagged union: string, number, bool, list, map, null,
undef). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `cmap` / `clist` / `v_str` / `v_num` /
`v_bool` helper builders, and read fields back with `getp` (or the typed
`get_str` / `get_bool` / `to_int`); use `to_map` to safely coerce a
value to a map.

Memory follows a retain-heavy, never-free discipline — pipeline values are
never released. This is safe (no use-after-free) and leaks are acceptable
for the short-lived SDK and test binaries.

### Error handling

Fallible functions return a `voxgig_value*` (or a struct pointer) and take a
trailing `PNError** err` out-param. On success `*err` is left `NULL`; on
failure `*err` points to a heap `PNError` carrying `code` and `msg`.
Always initialise `PNError* err = NULL;` and branch on it after each call.

### Project structure

```
c/
├── core/          -- Pipeline types, config, client (client.c), api.h + sdk.h
├── entity/        -- Per-entity implementations (one .c each)
├── feature/       -- Built-in features (base, test, log, ...)
├── utility/       -- Utilities + the vendored voxgig struct port (utility/struct)
├── tests/         -- Test binaries (each a standalone main())
└── Makefile       -- Builds libsdk.a and runs every tests/*.c
```

The public entry header is `core/api.h` — it includes `core/sdk.h` (the
umbrella runtime header) and declares each entity's constructor and SDK
accessor. Include it and link against `libsdk.a`.

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
