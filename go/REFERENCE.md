# BluefinShieldconexMgmt Golang SDK Reference

Complete API reference for the BluefinShieldconexMgmt Golang SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```go
func NewBluefinShieldconexMgmtSDK(options map[string]any) *BluefinShieldconexMgmtSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *BluefinShieldconexMgmtSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *BluefinShieldconexMgmtSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `Client(data map[string]any) BluefinShieldconexMgmtEntity`

Create a new `Client` entity instance. Pass `nil` for no initial data.

#### `Clone(data map[string]any) BluefinShieldconexMgmtEntity`

Create a new `Clone` entity instance. Pass `nil` for no initial data.

#### `Partner(data map[string]any) BluefinShieldconexMgmtEntity`

Create a new `Partner` entity instance. Pass `nil` for no initial data.

#### `Template(data map[string]any) BluefinShieldconexMgmtEntity`

Create a new `Template` entity instance. Pass `nil` for no initial data.

#### `Transaction(data map[string]any) BluefinShieldconexMgmtEntity`

Create a new `Transaction` entity instance. Pass `nil` for no initial data.

#### `UpdateResult(data map[string]any) BluefinShieldconexMgmtEntity`

Create a new `UpdateResult` entity instance. Pass `nil` for no initial data.

#### `User(data map[string]any) BluefinShieldconexMgmtEntity`

Create a new `User` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## ClientEntity

```go
client_ := client.Client(nil)
fmt.Println(client_.GetName()) // "client"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `string` | No | Billing ID |
| `contact` | `map[string]any` | No |  |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `map[string]any` | No | Reference to the associated Partner. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Client's name. |
| `partner` | `map[string]any` | No | Reference to the associated Partner. |
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Client(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Client(nil).Load(map[string]any{"id": "client_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Client(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.Client(nil).Remove(map[string]any{"id": "client_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ClientEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## CloneEntity

```go
clone := client.Clone(nil)
fmt.Println(clone.GetName()) // "clone"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No | Unique identifier of newly added element. |
| `name` | `string` | No | Name of Template |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Clone(nil).Create(map[string]any{
    "template_id": "example_template_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CloneEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PartnerEntity

```go
partner := client.Partner(nil)
fmt.Println(partner.GetName()) // "partner"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `string` | No | The Partner's billing identifier. |
| `contact` | `map[string]any` | No |  |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `map[string]any` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The Partner's reference string. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Partner(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Partner(nil).Load(map[string]any{"id": "partner_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Partner(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PartnerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TemplateEntity

```go
template := client.Template(nil)
fmt.Println(template.GetName()) // "template"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `accessMode` | `any` | No | The Template's access mode. |
| `active` | `bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `map[string]any` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `[]any` | No | Field Template list items |
| `id` | `int` | No | Unique identifier of newly added element. |
| `name` | `string` | No | The Template's name. |
| `options` | `map[string]any` | No |  |
| `partner` | `map[string]any` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The Template's unique reference. |
| `type` | `string` | No | The Template's type. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Template(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Template(nil).Load(map[string]any{"id": "template_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Template(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.Template(nil).Remove(map[string]any{"id": "template_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TemplateEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TransactionEntity

```go
transaction := client.Transaction(nil)
fmt.Println(transaction.GetName()) // "transaction"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `string` | No | BFID |
| `client` | `map[string]any` | No | Reference to the associated Client resource. |
| `completeDate` | `string` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `map[string]any` | No | Reference to the associated Partner. |
| `errCode` | `string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int` | No | This resource's unique identifier. |
| `ipAddress` | `string` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `string` | No | Message ID. |
| `partner` | `map[string]any` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | No | The success indicator. |
| `templateId` | `string` | No | The Template's unique identifier. |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Transaction(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Transaction(nil).Load(map[string]any{"id": "transaction_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TransactionEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## UpdateResultEntity

```go
updateResult := client.UpdateResult(nil)
fmt.Println(updateResult.GetName()) // "update_result"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `string` | No | The Partner's billing identifier. |
| `client` | `map[string]any` | No | Reference to the associated Client resource. |
| `contact` | `map[string]any` | Yes |  |
| `directPartner` | `map[string]any` | No | Reference to the associated Partner. |
| `email` | `string` | Yes | The User's email address. |
| `firstName` | `string` | Yes | The User's name. |
| `id` | `int` | No | Unique identifier of newly added element. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `string` | Yes | The User's Surname. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `map[string]any` | No | Reference to the associated Partner. |
| `partner` | `map[string]any` | No | Reference to the associated Partner. |
| `phone` | `string` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `string` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `string` | Yes | The User's unique username. |
| `userRole` | `map[string]any` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.UpdateResult(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.UpdateResult(nil).Create(map[string]any{
    "contact": map[string]any{},
    "email": "example_email",
    "firstName": "example_firstName",
    "lastName": "example_lastName",
    "phone": "example_phone",
    "userName": "example_userName",
    "userRole": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Update(reqdata, ctrl map[string]any) (any, error)`

Update an existing entity. The data must include the entity `id`.

```go
result, err := client.UpdateResult(nil).Update(map[string]any{
    "id": "id",
    // Fields to update
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `UpdateResultEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## UserEntity

```go
user := client.User(nil)
fmt.Println(user.GetName()) // "user"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map[string]any` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `map[string]any` | No | Reference to the associated Partner. |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `map[string]any` | No | Reference to the associated User Role. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.User(nil).Load(map[string]any{"id": "user_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `UserEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewBluefinShieldconexMgmtSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

