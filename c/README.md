# BluefinShieldconexMgmt C SDK



The C SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic C conventions (explicit structs, function-pointer vtables, and a trailing `PNError**` out-param for errors).

The SDK exposes the API as capitalised, semantic **Entities** — for example `bluefinshieldconexmgmt_client(client, NULL)` — each
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

BluefinShieldconexMgmtSDK* client = bluefinshieldconexmgmt_sdk_new(cmap(1,
    "apikey", v_str(getenv("BLUEFIN_SHIELDCONEX_MGMT_APIKEY"))));
PNError* err = NULL;
```

### 2. List client records

`list()` returns a List of records and sets `*err` on failure — check
`err` after the call.

```c
Entity* client = bluefinshieldconexmgmt_client(client, NULL);
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
voxgig_value* created = client->vt->create(client, cmap(12, "contact_email", v_str("example_contact_email"), "contact_first_name", v_str("example_contact_first_name"), "contact_is_active", v_bool(true), "contact_last_name", v_str("example_contact_last_name"), "contact_phone", v_str("example_contact_phone"), "contact_send_welcome_email", v_bool(true), "contact_user_name", v_str("example_contact_user_name"), "contact_user_role", v_str("example_contact_user_role"), "direct_partner_id", v_num(1), "direct_partner_name", v_str("example_direct_partner_name"), "is_active", v_bool(true), "name", v_str("example_name")), NULL, &err);

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
Entity* partner = bluefinshieldconexmgmt_partner(client, NULL);
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

BluefinShieldconexMgmtSDK* client = bluefinshieldconexmgmt_sdk_new(cmap(2,
    "base", v_str("http://localhost:8080"),
    "system", cmap(1, "fetch", vfn(mock_fetch, NULL))));
```

### Point at a different server

Override the base URL to reach a local or staging server:

```c
BluefinShieldconexMgmtSDK* client = bluefinshieldconexmgmt_sdk_new(cmap(1,
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

BluefinShieldconexMgmtSDK* client = bluefinshieldconexmgmt_sdk_new(options);
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
| `bluefinshieldconexmgmt_client` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Client entity instance. |
| `bluefinshieldconexmgmt_clone` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Clone entity instance. |
| `bluefinshieldconexmgmt_partner` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Partner entity instance. |
| `bluefinshieldconexmgmt_template` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Template entity instance. |
| `bluefinshieldconexmgmt_transaction` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create a Transaction entity instance. |
| `bluefinshieldconexmgmt_update_result` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create an UpdateResult entity instance. |
| `bluefinshieldconexmgmt_user` | `(BluefinShieldconexMgmtSDK*, entopts) -> Entity*` | Create an User entity instance. |

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

Create an instance: `Entity* client = bluefinshieldconexmgmt_client(client, NULL);`

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
| `billingId` | `char*` | Billing ID |
| `contact` | `voxgig_value* (map)` |  |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `id` | `int64_t` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `mid` | `char*` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `char*` | Last modified timestamp. |
| `name` | `char*` | The Client's name. |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: Load

```c
Entity* client = bluefinshieldconexmgmt_client(client, NULL);
voxgig_value* client_rec = client->vt->load(client, cmap(1, "id", v_str("client_id")), NULL, &err);
```

#### Example: List

```c
Entity* client = bluefinshieldconexmgmt_client(client, NULL);
voxgig_value* clients = client->vt->list(client, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* client = bluefinshieldconexmgmt_client(client, NULL);
voxgig_value* client_rec = client->vt->create(client, cmap(12,
    "contact_email", v_str("example_contact_email"),  // char*
    "contact_first_name", v_str("example_contact_first_name"),  // char*
    "contact_is_active", v_bool(true),  // bool
    "contact_last_name", v_str("example_contact_last_name"),  // char*
    "contact_phone", v_str("example_contact_phone"),  // char*
    "contact_send_welcome_email", v_bool(true),  // bool
    "contact_user_name", v_str("example_contact_user_name"),  // char*
    "contact_user_role", v_str("example_contact_user_role"),  // char*
    "direct_partner_id", v_num(1),  // int64_t
    "direct_partner_name", v_str("example_direct_partner_name"),  // char*
    "is_active", v_bool(true),  // bool
    "name", v_str("example_name"))  // char*
, NULL, &err);
```


### Clone

Create an instance: `Entity* clone = bluefinshieldconexmgmt_clone(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int64_t` | Unique identifier of newly added element. |
| `name` | `char*` | Name of Template |

#### Example: Create

```c
Entity* clone = bluefinshieldconexmgmt_clone(client, NULL);
voxgig_value* clone_rec = clone->vt->create(clone, cmap(1,
    "template_id", v_str("example_template_id"))  // char*
, NULL, &err);
```


### Partner

Create an instance: `Entity* partner = bluefinshieldconexmgmt_partner(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `char*` | The Partner's billing identifier. |
| `contact` | `voxgig_value* (map)` |  |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `id` | `int64_t` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `modified` | `char*` | Last modified timestamp. |
| `name` | `char*` | The Partner's name. |
| `parent` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `reference` | `char*` | The Partner's reference string. |
| `verificationPhrase` | `char*` | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: Load

```c
Entity* partner = bluefinshieldconexmgmt_partner(client, NULL);
voxgig_value* partner_rec = partner->vt->load(partner, cmap(1, "id", v_str("partner_id")), NULL, &err);
```

#### Example: List

```c
Entity* partner = bluefinshieldconexmgmt_partner(client, NULL);
voxgig_value* partners = partner->vt->list(partner, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* partner = bluefinshieldconexmgmt_partner(client, NULL);
voxgig_value* partner_rec = partner->vt->create(partner, cmap(12,
    "billing_id", v_str("example_billing_id"),  // char*
    "contact_email", v_str("example_contact_email"),  // char*
    "contact_first_name", v_str("example_contact_first_name"),  // char*
    "contact_is_active", v_bool(true),  // bool
    "contact_last_name", v_str("example_contact_last_name"),  // char*
    "contact_phone", v_str("example_contact_phone"),  // char*
    "contact_send_welcome_email", v_bool(true),  // bool
    "contact_user_name", v_str("example_contact_user_name"),  // char*
    "contact_user_role", v_str("example_contact_user_role"),  // char*
    "is_active", v_bool(true),  // bool
    "name", v_str("example_name"),  // char*
    "reference", v_str("example_reference"))  // char*
, NULL, &err);
```


### Template

Create an instance: `Entity* template = bluefinshieldconexmgmt_template(client, NULL);`

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
| `accessMode` | `voxgig_value*` | The Template's access mode. |
| `active` | `bool` | This property indicates if the Template is active or inactive. |
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `fieldTemplates` | `voxgig_value* (list)` | Field Template list items |
| `id` | `int64_t` | Unique identifier of newly added element. |
| `name` | `char*` | The Template's name. |
| `options` | `voxgig_value* (map)` |  |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `reference` | `char*` | The Template's unique reference. |
| `type` | `char*` | The Template's type. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: Load

```c
Entity* template = bluefinshieldconexmgmt_template(client, NULL);
voxgig_value* template_rec = template->vt->load(template, cmap(1, "id", v_str("template_id")), NULL, &err);
```

#### Example: List

```c
Entity* template = bluefinshieldconexmgmt_template(client, NULL);
voxgig_value* templates = template->vt->list(template, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* template = bluefinshieldconexmgmt_template(client, NULL);
voxgig_value* template_rec = template->vt->create(template, cmap(7,
    "active", v_bool(true),  // bool
    "client_id", v_num(1),  // int64_t
    "client_name", v_str("example_client_name"),  // char*
    "name", v_str("example_name"),  // char*
    "partner_id", v_num(1),  // int64_t
    "partner_name", v_str("example_partner_name"),  // char*
    "reference", v_str("example_reference"))  // char*
, NULL, &err);
```


### Transaction

Create an instance: `Entity* transaction = bluefinshieldconexmgmt_transaction(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `char*` | BFID |
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `completeDate` | `char*` | Timestamp from the beginning of the transaction. |
| `directPartner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `errCode` | `char*` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `char*` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int64_t` | This resource's unique identifier. |
| `ipAddress` | `char*` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `char*` | Message ID. |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `reference` | `char*` | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | The success indicator. |
| `templateId` | `char*` | The Template's unique identifier. |

#### Example: Load

```c
Entity* transaction = bluefinshieldconexmgmt_transaction(client, NULL);
voxgig_value* transaction_rec = transaction->vt->load(transaction, cmap(1, "id", v_str("transaction_id")), NULL, &err);
```

#### Example: List

```c
Entity* transaction = bluefinshieldconexmgmt_transaction(client, NULL);
voxgig_value* transactions = transaction->vt->list(transaction, NULL, NULL, &err);
```


### UpdateResult

Create an instance: `Entity* update_result = bluefinshieldconexmgmt_update_result(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->update(e, reqdata, ctrl, &err)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `char*` | The Partner's billing identifier. |
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `contact` | `voxgig_value* (map)` |  |
| `directPartner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `email` | `char*` | The User's email address. |
| `firstName` | `char*` | The User's name. |
| `id` | `int64_t` | Unique identifier of newly added element. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `lastName` | `char*` | The User's Surname. |
| `mid` | `char*` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `char*` | The Partner's name. |
| `parent` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `phone` | `char*` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `char*` | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `char*` | The User's unique username. |
| `userRole` | `voxgig_value* (map)` | Reference to the associated User Role. |
| `verificationPhrase` | `char*` | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: List

```c
Entity* update_result = bluefinshieldconexmgmt_update_result(client, NULL);
voxgig_value* update_results = update_result->vt->list(update_result, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* update_result = bluefinshieldconexmgmt_update_result(client, NULL);
voxgig_value* update_result_rec = update_result->vt->create(update_result, cmap(13,
    "email", v_str("example_email"),  // char*
    "first_name", v_str("example_first_name"),  // char*
    "is_active", v_bool(true),  // bool
    "last_name", v_str("example_last_name"),  // char*
    "phone", v_num(1),  // int64_t
    "send_welcome_email", v_bool(true),  // bool
    "user_role", v_map(),  // voxgig_value* (map)
    "username", v_str("example_username"),  // char*
    "contact", v_map(),  // voxgig_value* (map)
    "firstName", v_str("example_firstName"),  // char*
    "lastName", v_str("example_lastName"),  // char*
    "userName", v_str("example_userName"),  // char*
    "userRole", v_map())  // voxgig_value* (map)
, NULL, &err);
```


### User

Create an instance: `Entity* user = bluefinshieldconexmgmt_user(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `voxgig_value* (map)` | Reference to the associated Client resource. |
| `created` | `char*` | Creation timestamp in ISO 8601 format. |
| `email` | `char*` |  |
| `firstName` | `char*` |  |
| `id` | `int64_t` | This resource's unique identifier. |
| `isActive` | `bool` |  |
| `lastName` | `char*` |  |
| `modified` | `char*` | Last modified timestamp. |
| `partner` | `voxgig_value* (map)` | Reference to the associated Partner. |
| `phone` | `char*` |  |
| `userName` | `char*` |  |
| `userRole` | `voxgig_value* (map)` | Reference to the associated User Role. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

#### Example: Load

```c
Entity* user = bluefinshieldconexmgmt_user(client, NULL);
voxgig_value* user_rec = user->vt->load(user, cmap(1, "id", v_str("user_id")), NULL, &err);
```

## Features

This SDK ships 12 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Structured audit trail of operations |
| [`clienttrack`](#clienttrack) | Client identity and per-request correlation headers |
| [`debug`](#debug) | Request/response capture ring buffer for debugging |
| [`idempotency`](#idempotency) | Idempotency keys for safe retries of mutating operations |
| [`log`](#log) | Structured request and response logging |
| [`metrics`](#metrics) | Statistics capture: per-operation counters and latency |
| [`paging`](#paging) | Pagination signals for list operations |
| [`ratelimit`](#ratelimit) | Client-side rate limiting via a token bucket |
| [`retry`](#retry) | Automatic retry of transient failures with exponential backoff |
| [`telemetry`](#telemetry) | Distributed tracing spans with W3C trace-context propagation |
| [`test`](#test) | In-memory mock transport for testing without a live server |
| [`timeout`](#timeout) | Per-request timeout with transport abort |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### audit

Structured audit trail of operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Set `feature.audit.active` to enable it, then override any of the options above.

### clienttrack

Client identity and per-request correlation headers.

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Set `feature.clienttrack.active` to enable it, then override any of the options above.

### debug

Request/response capture ring buffer for debugging.

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

Set `feature.debug.active` to enable it, then override any of the options above.

### idempotency

Idempotency keys for safe retries of mutating operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Set `feature.idempotency.active` to enable it, then override any of the options above.

### log

Structured request and response logging.

| Option | Default |
|---|---|
| `active` | `true` |

Set `feature.log.active` to enable it, then override any of the options above.

### metrics

Statistics capture: per-operation counters and latency.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.metrics.active` to enable it, then override any of the options above.

### paging

Pagination signals for list operations.

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

Client-side rate limiting via a token bucket.

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

Automatic retry of transient failures with exponential backoff.

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

Distributed tracing spans with W3C trace-context propagation.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.telemetry.active` to enable it, then override any of the options above.

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Per-request timeout with transport abort.

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

- **AuditFeature**: Structured audit trail of operations
- **ClienttrackFeature**: Client identity and per-request correlation headers
- **DebugFeature**: Request/response capture ring buffer for debugging
- **IdempotencyFeature**: Idempotency keys for safe retries of mutating operations
- **LogFeature**: Structured request and response logging
- **MetricsFeature**: Statistics capture: per-operation counters and latency
- **PagingFeature**: Pagination signals for list operations
- **RatelimitFeature**: Client-side rate limiting via a token bucket
- **RetryFeature**: Automatic retry of transient failures with exponential backoff
- **TelemetryFeature**: Distributed tracing spans with W3C trace-context propagation
- **TestFeature**: In-memory mock transport for testing without a live server
- **TimeoutFeature**: Per-request timeout with transport abort

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
