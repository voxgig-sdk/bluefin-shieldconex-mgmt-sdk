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
| `billingId` | `string` | No | Billing ID |
| `contact` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `id` | `long` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Client's name. |
| `partner` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `id` | `long` | No | Unique identifier of newly added element. |
| `name` | `string` | No | Name of Template |

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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `contact` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `long` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The Partner's reference string. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `accessMode` | `object?` | No | The Template's access mode. |
| `active` | `bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `Dictionary<string, object?>` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `List<object?>` | No | Field Template list items |
| `id` | `long` | No | Unique identifier of newly added element. |
| `name` | `string` | No | The Template's name. |
| `options` | `Dictionary<string, object?>` | No |  |
| `partner` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The Template's unique reference. |
| `type` | `string` | No | The Template's type. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `bfid` | `string` | No | BFID |
| `client` | `Dictionary<string, object?>` | No | Reference to the associated Client resource. |
| `completeDate` | `string` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `errCode` | `string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `long` | No | This resource's unique identifier. |
| `ipAddress` | `string` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `string` | No | Message ID. |
| `partner` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | No | The success indicator. |
| `templateId` | `string` | No | The Template's unique identifier. |

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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `client` | `Dictionary<string, object?>` | No | Reference to the associated Client resource. |
| `contact` | `Dictionary<string, object?>` | Yes |  |
| `directPartner` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `email` | `string` | Yes | The User's email address. |
| `firstName` | `string` | Yes | The User's name. |
| `id` | `long` | No | Unique identifier of newly added element. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `string` | Yes | The User's Surname. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `partner` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `phone` | `string` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `string` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `string` | Yes | The User's unique username. |
| `userRole` | `Dictionary<string, object?>` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.UpdateResult().Create(new Dictionary<string, object?>
{
    ["contact"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["email"] = "example_email",  // string
    ["firstName"] = "example_firstName",  // string
    ["lastName"] = "example_lastName",  // string
    ["phone"] = "example_phone",  // string
    ["userName"] = "example_userName",  // string
    ["userRole"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
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
| `client` | `Dictionary<string, object?>` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `long` | No | This resource's unique identifier. |
| `isActive` | `bool` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `Dictionary<string, object?>` | No | Reference to the associated Partner. |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `Dictionary<string, object?>` | No | Reference to the associated User Role. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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

