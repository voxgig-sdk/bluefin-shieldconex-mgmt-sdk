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
voxgig_value* result = client->vt->create(client, cmap(12,
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
voxgig_value* result = partner->vt->create(partner, cmap(12,
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
voxgig_value* result = template->vt->create(template, cmap(7,
    "active", v_bool(true),  // bool
    "client_id", v_num(1),  // int64_t
    "client_name", v_str("example_client_name"),  // char*
    "name", v_str("example_name"),  // char*
    "partner_id", v_num(1),  // int64_t
    "partner_name", v_str("example_partner_name"),  // char*
    "reference", v_str("example_reference"))  // char*
, NULL, &err);
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
voxgig_value* result = update_result->vt->create(update_result, cmap(13,
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
| `audit` | 0.0.1 | Audit trail |
| `clienttrack` | 0.0.1 | Client tracking |
| `debug` | 0.0.1 | Debug capture |
| `idempotency` | 0.0.1 | Idempotency |
| `log` | 0.0.1 | Logging |
| `metrics` | 0.0.1 | Metrics |
| `paging` | 0.0.1 | Paging |
| `ratelimit` | 0.0.1 | Rate limiting |
| `retry` | 0.0.1 | Retry |
| `telemetry` | 0.0.1 | Telemetry |
| `test` | 0.0.1 | Test transport |
| `timeout` | 0.0.1 | Timeout |


Features are activated via the `feature` option:

```c
BluefinShieldconexMgmtSDK* client = bluefinshieldconexmgmt_sdk_new(cmap(1,
    "feature", cmap(12,
        "audit", cmap(1, "active", v_bool(true)),
        "clienttrack", cmap(1, "active", v_bool(true)),
        "debug", cmap(1, "active", v_bool(true)),
        "idempotency", cmap(1, "active", v_bool(true)),
        "log", cmap(1, "active", v_bool(true)),
        "metrics", cmap(1, "active", v_bool(true)),
        "paging", cmap(1, "active", v_bool(true)),
        "ratelimit", cmap(1, "active", v_bool(true)),
        "retry", cmap(1, "active", v_bool(true)),
        "telemetry", cmap(1, "active", v_bool(true)),
        "test", cmap(1, "active", v_bool(true)),
        "timeout", cmap(1, "active", v_bool(true)))
));
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

`audit`, `clienttrack`, `debug`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Audit trail.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

| Option | Type |
|---|---|
| `now` | function |
| `sink` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client tracking.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

| Option | Type |
|---|---|
| `clientName` | string |
| `headers` | map |
| `idgen` | function |
| `sessionId` | string |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `debug`

Debug capture.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

| Option | Type |
|---|---|
| `now` | function |
| `onEntry` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.debug.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

| Option | Type |
|---|---|
| `keygen` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

| Option | Type |
|---|---|
| `level` | string |
| `logger` | any |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Metrics.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Paging.

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

| Option | Type |
|---|---|
| `limit` | number |
| `ops` | list |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Rate limiting.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

| Option | Type |
|---|---|
| `now` | function |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Retry.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

| Option | Type |
|---|---|
| `jitter` | boolean |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Telemetry.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `exporter` | function |
| `headers` | map |
| `idgen` | function |
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

Test transport.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

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

Timeout.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

| Option | Type |
|---|---|
| `clearTimer` | function |
| `setTimer` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

