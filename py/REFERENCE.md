# BluefinShieldconexMgmt Python SDK Reference

Complete API reference for the BluefinShieldconexMgmt Python SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```python
from bluefinshieldconexmgmt_sdk import BluefinShieldconexMgmtSDK

client = BluefinShieldconexMgmtSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinShieldconexMgmtSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = BluefinShieldconexMgmtSDK.test()
```


### Instance Methods

#### `Client(data=None)`

Create a new `ClientEntity` instance. Pass `None` for no initial data.

#### `Clone(data=None)`

Create a new `CloneEntity` instance. Pass `None` for no initial data.

#### `Partner(data=None)`

Create a new `PartnerEntity` instance. Pass `None` for no initial data.

#### `Template(data=None)`

Create a new `TemplateEntity` instance. Pass `None` for no initial data.

#### `Transaction(data=None)`

Create a new `TransactionEntity` instance. Pass `None` for no initial data.

#### `UpdateResult(data=None)`

Create a new `UpdateResultEntity` instance. Pass `None` for no initial data.

#### `User(data=None)`

Create a new `UserEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## ClientEntity

```python
client_ = client.Client()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `str` | No |  |
| `contact` | `dict` | No |  |
| `created` | `str` | No |  |
| `direct_partner` | `dict` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `mid` | `str` | No |  |
| `modified` | `str` | No |  |
| `name` | `str` | No |  |
| `partner` | `dict` | No |  |
| `version` | `int` | No |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Client().create({
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Client().list()
for client_ in results:
    print(client_)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Client().load({"id": "client_id"})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.Client().remove({"id": "client_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ClientEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## CloneEntity

```python
clone = client.Clone()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Clone().create({
    "template_id": "example_template_id",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CloneEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PartnerEntity

```python
partner = client.Partner()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `str` | No |  |
| `contact` | `dict` | No |  |
| `created` | `str` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `str` | No |  |
| `name` | `str` | No |  |
| `parent` | `dict` | No |  |
| `reference` | `str` | No |  |
| `verification_phrase` | `str` | No |  |
| `version` | `int` | No |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Partner().create({
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Partner().list()
for partner in results:
    print(partner)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Partner().load({"id": "partner_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PartnerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TemplateEntity

```python
template = client.Template()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `Any` | No |  |
| `active` | `bool` | No |  |
| `client` | `dict` | No |  |
| `field_template` | `list` | No |  |
| `id` | `int` | No |  |
| `name` | `str` | No |  |
| `option` | `dict` | No |  |
| `partner` | `dict` | No |  |
| `reference` | `str` | No |  |
| `type` | `str` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Template().create({
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Template().list()
for template in results:
    print(template)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Template().load({"id": "template_id"})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.Template().remove({"id": "template_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TemplateEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TransactionEntity

```python
transaction = client.Transaction()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `str` | No |  |
| `client` | `dict` | No |  |
| `complete_date` | `str` | No |  |
| `direct_partner` | `dict` | No |  |
| `err_code` | `str` | No |  |
| `err_message` | `str` | No |  |
| `id` | `int` | No |  |
| `ip_address` | `str` | No |  |
| `message_id` | `str` | No |  |
| `partner` | `dict` | No |  |
| `reference` | `str` | No |  |
| `success` | `bool` | No |  |
| `template_id` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Transaction().list()
for transaction in results:
    print(transaction)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Transaction().load({"id": "transaction_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## UpdateResultEntity

```python
update_result = client.UpdateResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `str` | No |  |
| `client` | `dict` | No |  |
| `contact` | `dict` | Yes |  |
| `direct_partner` | `dict` | No |  |
| `email` | `str` | Yes |  |
| `first_name` | `str` | Yes |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `str` | Yes |  |
| `mid` | `str` | No |  |
| `name` | `str` | No |  |
| `parent` | `dict` | No |  |
| `partner` | `dict` | No |  |
| `phone` | `str` | Yes |  |
| `reference` | `str` | No |  |
| `send_welcome_email` | `bool` | No |  |
| `user_name` | `str` | Yes |  |
| `user_role` | `dict` | Yes |  |
| `verification_phrase` | `str` | No |  |
| `version` | `int` | No |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.UpdateResult().create({
    "contact": {},  # dict
    "email": "example_email",  # str
    "first_name": "example_first_name",  # str
    "last_name": "example_last_name",  # str
    "phone": "example_phone",  # str
    "user_name": "example_user_name",  # str
    "user_role": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.UpdateResult().list()
for update_result in results:
    print(update_result)
```

#### `update(reqdata, ctrl=None) -> dict`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```python
result = client.UpdateResult().update({
    "id": "id",
    # Fields to update
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResultEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## UserEntity

```python
user = client.User()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `dict` | No |  |
| `created` | `str` | No |  |
| `email` | `str` | No |  |
| `first_name` | `str` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `str` | No |  |
| `modified` | `str` | No |  |
| `partner` | `dict` | No |  |
| `phone` | `str` | No |  |
| `user_name` | `str` | No |  |
| `user_role` | `dict` | No |  |
| `version` | `int` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.User().load({"id": "user_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UserEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = BluefinShieldconexMgmtSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

