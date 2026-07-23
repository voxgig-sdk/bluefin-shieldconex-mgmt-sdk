# BluefinShieldconexMgmt C SDK Reference

Complete API reference for the BluefinShieldconexMgmt C SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```c
#include "core/api.h"

BluefinShieldconexMgmtSDK* client = bluefinshieldconexmgmt_sdk_new(options);
```

Create a new SDK client instance. `options` is a `voxgig_value*` map
(`NULL` for none).

**Parameters (`options` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Test Constructor

#### `BluefinShieldconexMgmtSDK* test_sdk(voxgig_value* testopts, voxgig_value* sdkopts)`

Create a test client with mock features active. Both arguments may be
`NULL`.

```c
BluefinShieldconexMgmtSDK* client = test_sdk(NULL, NULL);
```


### Entity Accessors

#### `Entity* bluefinshieldconexmgmt_client(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts)`

Create a new `Client` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefinshieldconexmgmt_clone(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts)`

Create a new `Clone` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefinshieldconexmgmt_partner(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts)`

Create a new `Partner` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefinshieldconexmgmt_template(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts)`

Create a new `Template` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefinshieldconexmgmt_transaction(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts)`

Create a new `Transaction` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefinshieldconexmgmt_update_result(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts)`

Create a new `UpdateResult` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefinshieldconexmgmt_user(BluefinShieldconexMgmtSDK* client, voxgig_value* entopts)`

Create a new `User` entity instance. Pass `NULL` for no initial
options.

#### `voxgig_value* sdk_direct(BluefinShieldconexMgmtSDK* client, voxgig_value* fetchargs, PNError** err)`

Make a direct HTTP request to any API endpoint. Returns a result map with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never sets `*err` for a non-2xx response — branch on
`getp(result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `voxgig_value* sdk_prepare(BluefinShieldconexMgmtSDK* client, voxgig_value* fetchargs, PNError** err)`

Prepare a fetch definition without sending. Returns the fetchdef and sets
`*err` on failure.


---

## Client

```c
Entity* client = bluefinshieldconexmgmt_client(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `char*` | No |  |
| `contact` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No |  |
| `direct_partner` | `voxgig_value* (map)` | No |  |
| `id` | `int64_t` | No |  |
| `is_active` | `bool` | No |  |
| `mid` | `char*` | No |  |
| `modified` | `char*` | No |  |
| `name` | `char*` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* client = bluefinshieldconexmgmt_client(client, NULL);
voxgig_value* result = client->vt->create(client, NULL, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* client = bluefinshieldconexmgmt_client(client, NULL);
voxgig_value* results = client->vt->list(client, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* client = bluefinshieldconexmgmt_client(client, NULL);
voxgig_value* result = client->vt->load(client, cmap(1, "id", v_str("client_id")), NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* client = bluefinshieldconexmgmt_client(client, NULL);
voxgig_value* result = client->vt->remove(client, cmap(1, "id", v_str("client_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Client` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Clone

```c
Entity* clone = bluefinshieldconexmgmt_clone(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int64_t` | No |  |
| `name` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* clone = bluefinshieldconexmgmt_clone(client, NULL);
voxgig_value* result = clone->vt->create(clone, cmap(1,
    "template_id", v_str("example_template_id"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Clone` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Partner

```c
Entity* partner = bluefinshieldconexmgmt_partner(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `char*` | No |  |
| `contact` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No |  |
| `id` | `int64_t` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `char*` | No |  |
| `name` | `char*` | No |  |
| `parent` | `voxgig_value* (map)` | No |  |
| `reference` | `char*` | No |  |
| `verification_phrase` | `char*` | No |  |
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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* partner = bluefinshieldconexmgmt_partner(client, NULL);
voxgig_value* result = partner->vt->create(partner, NULL, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* partner = bluefinshieldconexmgmt_partner(client, NULL);
voxgig_value* results = partner->vt->list(partner, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* partner = bluefinshieldconexmgmt_partner(client, NULL);
voxgig_value* result = partner->vt->load(partner, cmap(1, "id", v_str("partner_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Partner` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Template

```c
Entity* template = bluefinshieldconexmgmt_template(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `voxgig_value*` | No |  |
| `active` | `bool` | No |  |
| `client` | `voxgig_value* (map)` | No |  |
| `field_template` | `voxgig_value* (list)` | No |  |
| `id` | `int64_t` | No |  |
| `name` | `char*` | No |  |
| `option` | `voxgig_value* (map)` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `reference` | `char*` | No |  |
| `type` | `char*` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* template = bluefinshieldconexmgmt_template(client, NULL);
voxgig_value* result = template->vt->create(template, NULL, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* template = bluefinshieldconexmgmt_template(client, NULL);
voxgig_value* results = template->vt->list(template, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* template = bluefinshieldconexmgmt_template(client, NULL);
voxgig_value* result = template->vt->load(template, cmap(1, "id", v_str("template_id")), NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* template = bluefinshieldconexmgmt_template(client, NULL);
voxgig_value* result = template->vt->remove(template, cmap(1, "id", v_str("template_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Template` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Transaction

```c
Entity* transaction = bluefinshieldconexmgmt_transaction(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `char*` | No |  |
| `client` | `voxgig_value* (map)` | No |  |
| `complete_date` | `char*` | No |  |
| `direct_partner` | `voxgig_value* (map)` | No |  |
| `err_code` | `char*` | No |  |
| `err_message` | `char*` | No |  |
| `id` | `int64_t` | No |  |
| `ip_address` | `char*` | No |  |
| `message_id` | `char*` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `reference` | `char*` | No |  |
| `success` | `bool` | No |  |
| `template_id` | `char*` | No |  |

### Operations

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* transaction = bluefinshieldconexmgmt_transaction(client, NULL);
voxgig_value* results = transaction->vt->list(transaction, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* transaction = bluefinshieldconexmgmt_transaction(client, NULL);
voxgig_value* result = transaction->vt->load(transaction, cmap(1, "id", v_str("transaction_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Transaction` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## UpdateResult

```c
Entity* update_result = bluefinshieldconexmgmt_update_result(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `char*` | No |  |
| `client` | `voxgig_value* (map)` | No |  |
| `contact` | `voxgig_value* (map)` | Yes |  |
| `direct_partner` | `voxgig_value* (map)` | No |  |
| `email` | `char*` | Yes |  |
| `first_name` | `char*` | Yes |  |
| `id` | `int64_t` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `char*` | Yes |  |
| `mid` | `char*` | No |  |
| `name` | `char*` | No |  |
| `parent` | `voxgig_value* (map)` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `phone` | `char*` | Yes |  |
| `reference` | `char*` | No |  |
| `send_welcome_email` | `bool` | No |  |
| `user_name` | `char*` | Yes |  |
| `user_role` | `voxgig_value* (map)` | Yes |  |
| `verification_phrase` | `char*` | No |  |
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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* update_result = bluefinshieldconexmgmt_update_result(client, NULL);
voxgig_value* result = update_result->vt->create(update_result, cmap(7,
    "contact", v_map(),  // voxgig_value* (map)
    "email", v_str("example_email"),  // char*
    "first_name", v_str("example_first_name"),  // char*
    "last_name", v_str("example_last_name"),  // char*
    "phone", v_str("example_phone"),  // char*
    "user_name", v_str("example_user_name"),  // char*
    "user_role", v_map())  // voxgig_value* (map)
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* update_result = bluefinshieldconexmgmt_update_result(client, NULL);
voxgig_value* results = update_result->vt->list(update_result, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->update(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Update an existing entity. The data must include the entity id. Returns the updated entity data.

```c
Entity* update_result = bluefinshieldconexmgmt_update_result(client, NULL);
voxgig_value* result = update_result->vt->update(update_result, cmap(1, "id", v_str("id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `UpdateResult` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## User

```c
Entity* user = bluefinshieldconexmgmt_user(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No |  |
| `email` | `char*` | No |  |
| `first_name` | `char*` | No |  |
| `id` | `int64_t` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `char*` | No |  |
| `modified` | `char*` | No |  |
| `partner` | `voxgig_value* (map)` | No |  |
| `phone` | `char*` | No |  |
| `user_name` | `char*` | No |  |
| `user_role` | `voxgig_value* (map)` | No |  |
| `version` | `int64_t` | No |  |

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* user = bluefinshieldconexmgmt_user(client, NULL);
voxgig_value* result = user->vt->load(user, cmap(1, "id", v_str("user_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `User` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```c
BluefinShieldconexMgmtSDK* client = bluefinshieldconexmgmt_sdk_new(cmap(1,
    "feature", cmap(1,
        "test", cmap(1, "active", v_bool(true)))
));
```

