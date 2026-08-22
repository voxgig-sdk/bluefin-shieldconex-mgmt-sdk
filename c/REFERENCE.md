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
| `billingId` | `char*` | No | Billing ID |
| `contact` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `char*` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `char*` | No | Last modified timestamp. |
| `name` | `char*` | No | The Client's name. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
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
| `id` | `int64_t` | No | Unique identifier of newly added element. |
| `name` | `char*` | No | Name of Template |

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
| `billingId` | `char*` | No | The Partner's billing identifier. |
| `contact` | `voxgig_value* (map)` | No |  |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `char*` | No | Last modified timestamp. |
| `name` | `char*` | No | The Partner's name. |
| `parent` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `reference` | `char*` | No | The Partner's reference string. |
| `verificationPhrase` | `char*` | No | The verification phrase is a message that the Partner creates. |
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
| `accessMode` | `voxgig_value*` | No | The Template's access mode. |
| `active` | `bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `voxgig_value* (list)` | No | Field Template list items |
| `id` | `int64_t` | No | Unique identifier of newly added element. |
| `name` | `char*` | No | The Template's name. |
| `options` | `voxgig_value* (map)` | No |  |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `reference` | `char*` | No | The Template's unique reference. |
| `type` | `char*` | No | The Template's type. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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
| `bfid` | `char*` | No | BFID |
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `completeDate` | `char*` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `errCode` | `char*` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `char*` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `ipAddress` | `char*` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `char*` | No | Message ID. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `reference` | `char*` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | No | The success indicator. |
| `templateId` | `char*` | No | The Template's unique identifier. |

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
| `billingId` | `char*` | No | The Partner's billing identifier. |
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `contact` | `voxgig_value* (map)` | Yes |  |
| `directPartner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `email` | `char*` | Yes | The User's email address. |
| `firstName` | `char*` | Yes | The User's name. |
| `id` | `int64_t` | No | Unique identifier of newly added element. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `char*` | Yes | The User's Surname. |
| `mid` | `char*` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `char*` | No | The Partner's name. |
| `parent` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `phone` | `char*` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `char*` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `char*` | Yes | The User's unique username. |
| `userRole` | `voxgig_value* (map)` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `char*` | No | The verification phrase is a message that the Partner creates. |
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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* update_result = bluefinshieldconexmgmt_update_result(client, NULL);
voxgig_value* result = update_result->vt->create(update_result, cmap(7,
    "contact", v_map(),  // voxgig_value* (map)
    "email", v_str("example_email"),  // char*
    "firstName", v_str("example_firstName"),  // char*
    "lastName", v_str("example_lastName"),  // char*
    "phone", v_str("example_phone"),  // char*
    "userName", v_str("example_userName"),  // char*
    "userRole", v_map())  // voxgig_value* (map)
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
| `client` | `voxgig_value* (map)` | No | Reference to the associated Client resource. |
| `created` | `char*` | No | Creation timestamp in ISO 8601 format. |
| `email` | `char*` | No |  |
| `firstName` | `char*` | No |  |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `isActive` | `bool` | No |  |
| `lastName` | `char*` | No |  |
| `modified` | `char*` | No | Last modified timestamp. |
| `partner` | `voxgig_value* (map)` | No | Reference to the associated Partner. |
| `phone` | `char*` | No |  |
| `userName` | `char*` | No |  |
| `userRole` | `voxgig_value* (map)` | No | Reference to the associated User Role. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

