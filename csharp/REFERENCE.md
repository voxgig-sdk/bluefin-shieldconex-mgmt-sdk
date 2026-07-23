# BluefinShieldconexMgmt C# SDK Reference

Complete API reference for the BluefinShieldconexMgmt C# SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```csharp
using BluefinShieldconexMgmtSdk;

var client = new BluefinShieldconexMgmtSDK(options);
```

Create a new SDK client instance. `options` is a
`Dictionary<string, object?>`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Dictionary` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `Dictionary` | Custom headers for all requests. |
| `options["feature"]` | `Dictionary` | Feature configuration. |
| `options["system"]` | `Dictionary` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinShieldconexMgmtSDK.TestSDK(testopts = null, sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```csharp
var client = BluefinShieldconexMgmtSDK.TestSDK(null, null);
```


### Instance Methods

#### `Client(entopts = null)`

Create a new `Client` entity instance (returns
`BluefinShieldconexMgmtEntityBase`). Pass `null` for no initial options.

#### `Clone(entopts = null)`

Create a new `Clone` entity instance (returns
`BluefinShieldconexMgmtEntityBase`). Pass `null` for no initial options.

#### `Partner(entopts = null)`

Create a new `Partner` entity instance (returns
`BluefinShieldconexMgmtEntityBase`). Pass `null` for no initial options.

#### `Template(entopts = null)`

Create a new `Template` entity instance (returns
`BluefinShieldconexMgmtEntityBase`). Pass `null` for no initial options.

#### `Transaction(entopts = null)`

Create a new `Transaction` entity instance (returns
`BluefinShieldconexMgmtEntityBase`). Pass `null` for no initial options.

#### `UpdateResult(entopts = null)`

Create a new `UpdateResult` entity instance (returns
`BluefinShieldconexMgmtEntityBase`). Pass `null` for no initial options.

#### `User(entopts = null)`

Create a new `User` entity instance (returns
`BluefinShieldconexMgmtEntityBase`). Pass `null` for no initial options.

#### `OptionsMap() -> Dictionary`

Return a deep copy of the current SDK options.

#### `GetUtility() -> Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs = null) -> Dictionary`

Make a direct HTTP request to any API endpoint. Returns a result
`Dictionary<string, object?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Dictionary` | Path parameter values. |
| `fetchargs["query"]` | `Dictionary` | Query string parameters. |
| `fetchargs["headers"]` | `Dictionary` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `object?` | Request body (dictionaries are JSON-serialized). |

**Returns:** `Dictionary<string, object?>`

#### `Prepare(fetchargs = null) -> Dictionary`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Client

```csharp
var client = client.Client();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `Dictionary<string, object?>` | No |  |
| `id` | `long` | No |  |
| `is_active` | `bool` | No |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `version` | `long` | No |  |

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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Client().Create(new Dictionary<string, object?>
{
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Client().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Client().Load(new Dictionary<string, object?> { ["id"] = "client_id" });
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.Client().Remove(new Dictionary<string, object?> { ["id"] = "client_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Client` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Clone

```csharp
var clone = client.Clone();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `long` | No |  |
| `name` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Clone().Create(new Dictionary<string, object?>
{
    ["template_id"] = "example_template_id",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Clone` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Partner

```csharp
var partner = client.Partner();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No |  |
| `id` | `long` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `Dictionary<string, object?>` | No |  |
| `reference` | `string` | No |  |
| `verification_phrase` | `string` | No |  |
| `version` | `long` | No |  |

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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Partner().Create(new Dictionary<string, object?>
{
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Partner().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Partner().Load(new Dictionary<string, object?> { ["id"] = "partner_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Partner` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Template

```csharp
var template = client.Template();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `object?` | No |  |
| `active` | `bool` | No |  |
| `client` | `Dictionary<string, object?>` | No |  |
| `field_template` | `List<object?>` | No |  |
| `id` | `long` | No |  |
| `name` | `string` | No |  |
| `option` | `Dictionary<string, object?>` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `reference` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Template().Create(new Dictionary<string, object?>
{
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Template().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Template().Load(new Dictionary<string, object?> { ["id"] = "template_id" });
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.Template().Remove(new Dictionary<string, object?> { ["id"] = "template_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Template` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Transaction

```csharp
var transaction = client.Transaction();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `string` | No |  |
| `client` | `Dictionary<string, object?>` | No |  |
| `complete_date` | `string` | No |  |
| `direct_partner` | `Dictionary<string, object?>` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `long` | No |  |
| `ip_address` | `string` | No |  |
| `message_id` | `string` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `reference` | `string` | No |  |
| `success` | `bool` | No |  |
| `template_id` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Transaction().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Transaction().Load(new Dictionary<string, object?> { ["id"] = "transaction_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Transaction` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## UpdateResult

```csharp
var updateResult = client.UpdateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client` | `Dictionary<string, object?>` | No |  |
| `contact` | `Dictionary<string, object?>` | Yes |  |
| `direct_partner` | `Dictionary<string, object?>` | No |  |
| `email` | `string` | Yes |  |
| `first_name` | `string` | Yes |  |
| `id` | `long` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `string` | Yes |  |
| `mid` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `Dictionary<string, object?>` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `phone` | `string` | Yes |  |
| `reference` | `string` | No |  |
| `send_welcome_email` | `bool` | No |  |
| `user_name` | `string` | Yes |  |
| `user_role` | `Dictionary<string, object?>` | Yes |  |
| `verification_phrase` | `string` | No |  |
| `version` | `long` | No |  |

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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.UpdateResult().Create(new Dictionary<string, object?>
{
    ["contact"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["email"] = "example_email",  // string
    ["first_name"] = "example_first_name",  // string
    ["last_name"] = "example_last_name",  // string
    ["phone"] = "example_phone",  // string
    ["user_name"] = "example_user_name",  // string
    ["user_role"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.UpdateResult().List(null);
Console.WriteLine(results);
```

#### `Update(reqdata, ctrl = null) -> object?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```csharp
var result = client.UpdateResult().Update(new Dictionary<string, object?>
{
    ["id"] = "id",
    // Fields to update
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `UpdateResult` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## User

```csharp
var user = client.User();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `long` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `Dictionary<string, object?>` | No |  |
| `version` | `long` | No |  |

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.User().Load(new Dictionary<string, object?> { ["id"] = "user_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `User` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```csharp
var client = new BluefinShieldconexMgmtSDK(new Dictionary<string, object?>
{
    ["feature"] = new Dictionary<string, object?>
    {
        ["test"] = new Dictionary<string, object?> { ["active"] = true },
    },
});
```

