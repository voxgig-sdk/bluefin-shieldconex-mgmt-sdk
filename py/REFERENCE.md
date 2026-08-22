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
| `billingId` | `str` | No | Billing ID |
| `contact` | `dict` | No |  |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `dict` | No | Reference to the associated Partner. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `str` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `str` | No | Last modified timestamp. |
| `name` | `str` | No | The Client's name. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `id` | `int` | No | Unique identifier of newly added element. |
| `name` | `str` | No | Name of Template |

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
| `billingId` | `str` | No | The Partner's billing identifier. |
| `contact` | `dict` | No |  |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `str` | No | Last modified timestamp. |
| `name` | `str` | No | The Partner's name. |
| `parent` | `dict` | No | Reference to the associated Partner. |
| `reference` | `str` | No | The Partner's reference string. |
| `verificationPhrase` | `str` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `accessMode` | `Any` | No | The Template's access mode. |
| `active` | `bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `dict` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `list` | No | Field Template list items |
| `id` | `int` | No | Unique identifier of newly added element. |
| `name` | `str` | No | The Template's name. |
| `options` | `dict` | No |  |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `reference` | `str` | No | The Template's unique reference. |
| `type` | `str` | No | The Template's type. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `bfid` | `str` | No | BFID |
| `client` | `dict` | No | Reference to the associated Client resource. |
| `completeDate` | `str` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `dict` | No | Reference to the associated Partner. |
| `errCode` | `str` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `str` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int` | No | This resource's unique identifier. |
| `ipAddress` | `str` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `str` | No | Message ID. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `reference` | `str` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | No | The success indicator. |
| `templateId` | `str` | No | The Template's unique identifier. |

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
| `billingId` | `str` | No | The Partner's billing identifier. |
| `client` | `dict` | No | Reference to the associated Client resource. |
| `contact` | `dict` | Yes |  |
| `directPartner` | `dict` | No | Reference to the associated Partner. |
| `email` | `str` | Yes | The User's email address. |
| `firstName` | `str` | Yes | The User's name. |
| `id` | `int` | No | Unique identifier of newly added element. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `str` | Yes | The User's Surname. |
| `mid` | `str` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `str` | No | The Partner's name. |
| `parent` | `dict` | No | Reference to the associated Partner. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `phone` | `str` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `str` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `str` | Yes | The User's unique username. |
| `userRole` | `dict` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `str` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.UpdateResult().create({
    "contact": {},  # dict
    "email": "example_email",  # str
    "firstName": "example_firstName",  # str
    "lastName": "example_lastName",  # str
    "phone": "example_phone",  # str
    "userName": "example_userName",  # str
    "userRole": {},  # dict
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
| `client` | `dict` | No | Reference to the associated Client resource. |
| `created` | `str` | No | Creation timestamp in ISO 8601 format. |
| `email` | `str` | No |  |
| `firstName` | `str` | No |  |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No |  |
| `lastName` | `str` | No |  |
| `modified` | `str` | No | Last modified timestamp. |
| `partner` | `dict` | No | Reference to the associated Partner. |
| `phone` | `str` | No |  |
| `userName` | `str` | No |  |
| `userRole` | `dict` | No | Reference to the associated User Role. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

