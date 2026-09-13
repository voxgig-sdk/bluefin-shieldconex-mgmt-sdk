# BluefinShieldconexMgmt Golang SDK



The Golang SDK for the BluefinShieldconexMgmt API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.Client(nil)` — each with the same small set of operations (`List`, `Load`, `Create`, `Update`, `Remove`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Also generated from this model: `c`, `clojure`, `cpp`, `csharp`, `dart`, `elixir`, `go-cli`, `go-mcp`, `haskell`, `java`, `js`, `kotlin`, `lean`, `lua`, `ocaml`, `perl`, `php`, `py`, `rb`, `rust`, `scala`, `swift`, `ts`, `zig` — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/go=../bluefin-shieldconex-mgmt-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    "os"
    sdk "github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/go"
)

func main() {
    client := sdk.NewBluefinShieldconexMgmtSDK(map[string]any{
        "apikey": os.Getenv("BLUEFIN_SHIELDCONEX_MGMT_APIKEY"),
    })

    // List client_ records — the value is the array of records itself.
    client_s, err := client.Client(nil).List(nil, nil)
    if err != nil {
        panic(err)
    }
    for _, item := range client_s.([]any) {
        fmt.Println(item)
    }

    // Load a single client_ — the value is the loaded record.
    client_, err := client.Client(nil).Load(map[string]any{"id": "example_id"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(client_)

    // Create a client_.
    created, err := client.Client(nil).Create(map[string]any{"contact_email": "example_contact_email", "contact_first_name": "example_contact_first_name", "contact_is_active": true, "contact_last_name": "example_contact_last_name", "contact_phone": "example_contact_phone", "contact_send_welcome_email": true, "contact_user_name": "example_contact_user_name", "contact_user_role": "example_contact_user_role", "direct_partner_id": 1, "direct_partner_name": "example_direct_partner_name", "is_active": true, "name": "example_name"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(created)

    // Remove a client_.
    removed, err := client.Client(nil).Remove(map[string]any{"id": "example_id"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(removed)
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
partners, err := client.Partner(nil).List(nil, nil)
if err != nil {
    // handle err
    return
}
_ = partners
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

partner, err := client.Partner(nil).List(
    nil, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(partner) // the returned mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewBluefinShieldconexMgmtSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd go && go test ./test/...
```


## Reference

### NewBluefinShieldconexMgmtSDK

```go
func NewBluefinShieldconexMgmtSDK(options map[string]any) *BluefinShieldconexMgmtSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"apikey"` | `string` | API key for authentication. |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *BluefinShieldconexMgmtSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `Client` | `(data map[string]any) BluefinShieldconexMgmtEntity` | Create a Client entity instance. |
| `Clone` | `(data map[string]any) BluefinShieldconexMgmtEntity` | Create a Clone entity instance. |
| `Partner` | `(data map[string]any) BluefinShieldconexMgmtEntity` | Create a Partner entity instance. |
| `Template` | `(data map[string]any) BluefinShieldconexMgmtEntity` | Create a Template entity instance. |
| `Transaction` | `(data map[string]any) BluefinShieldconexMgmtEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `(data map[string]any) BluefinShieldconexMgmtEntity` | Create an UpdateResult entity instance. |
| `User` | `(data map[string]any) BluefinShieldconexMgmtEntity` | Create an User entity instance. |

### Entity interface (BluefinShieldconexMgmtEntity)

All entities implement the `BluefinShieldconexMgmtEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Update` | `(reqdata, ctrl map[string]any) (any, error)` | Update an existing entity. |
| `Remove` | `(reqmatch, ctrl map[string]any) (any, error)` | Remove an entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` / `Create` / `Update` / `Remove` | the entity record (`map[string]any`) |
| `List` | a `[]any` of entity records |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    client_, err := client.Client(nil).List(map[string]any{/* fields */}, nil)
    if err != nil { /* handle */ }
    // client_ is the returned record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

### Entities

#### Client

| Field | Description |
| --- | --- |
| `"billingId"` | Billing ID |
| `"contact"` |  |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"directPartner"` | Reference to the associated Partner. |
| `"id"` | This resource's unique identifier. |
| `"isActive"` | This property indicates if the Client account is active or disabled. |
| `"mid"` | Some Partners will have an merchant ids on their own software offerings. |
| `"modified"` | Last modified timestamp. |
| `"name"` | The Client's name. |
| `"partner"` | Reference to the associated Partner. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### Clone

| Field | Description |
| --- | --- |
| `"id"` | Unique identifier of newly added element. |
| `"name"` | Name of Template |

Operations: Create.

API path: `/templates/{id}/clone`

#### Partner

| Field | Description |
| --- | --- |
| `"billingId"` | The Partner's billing identifier. |
| `"contact"` |  |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"id"` | This resource's unique identifier. |
| `"isActive"` | This property indicates if the Parter account is active or disabled. |
| `"modified"` | Last modified timestamp. |
| `"name"` | The Partner's name. |
| `"parent"` | Reference to the associated Partner. |
| `"reference"` | The Partner's reference string. |
| `"verificationPhrase"` | The verification phrase is a message that the Partner creates. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/partners`

#### Template

| Field | Description |
| --- | --- |
| `"accessMode"` | The Template's access mode. |
| `"active"` | This property indicates if the Template is active or inactive. |
| `"client"` | Reference to the associated Client resource. |
| `"fieldTemplates"` | Field Template list items |
| `"id"` | Unique identifier of newly added element. |
| `"name"` | The Template's name. |
| `"options"` |  |
| `"partner"` | Reference to the associated Partner. |
| `"reference"` | The Template's unique reference. |
| `"type"` | The Template's type. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/templates`

#### Transaction

| Field | Description |
| --- | --- |
| `"bfid"` | BFID |
| `"client"` | Reference to the associated Client resource. |
| `"completeDate"` | Timestamp from the beginning of the transaction. |
| `"directPartner"` | Reference to the associated Partner. |
| `"errCode"` | The error code that is sent in response to a failed decrypt API call. |
| `"errMessage"` | The error messge that is sent in response to a failed decrypt API call. |
| `"id"` | This resource's unique identifier. |
| `"ipAddress"` | The IP address of the http client that makes the decrypt API call. |
| `"messageId"` | Message ID. |
| `"partner"` | Reference to the associated Partner. |
| `"reference"` | The reference property that the Client includes in the decrypt API call. |
| `"success"` | The success indicator. |
| `"templateId"` | The Template's unique identifier. |

Operations: List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `"billingId"` | The Partner's billing identifier. |
| `"client"` | Reference to the associated Client resource. |
| `"contact"` |  |
| `"directPartner"` | Reference to the associated Partner. |
| `"email"` | The User's email address. |
| `"firstName"` | The User's name. |
| `"id"` | Unique identifier of newly added element. |
| `"isActive"` | This property indicates if the User account is active or disabled. |
| `"lastName"` | The User's Surname. |
| `"mid"` | Some Partners will have an merchant ids on their own software offerings. |
| `"name"` | The Partner's name. |
| `"parent"` | Reference to the associated Partner. |
| `"partner"` | Reference to the associated Partner. |
| `"phone"` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `"reference"` | The Partner's reference string. |
| `"sendWelcomeEmail"` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `"userName"` | The User's unique username. |
| `"userRole"` | Reference to the associated User Role. |
| `"verificationPhrase"` | The verification phrase is a message that the Partner creates. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `"client"` | Reference to the associated Client resource. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"email"` |  |
| `"firstName"` |  |
| `"id"` | This resource's unique identifier. |
| `"isActive"` |  |
| `"lastName"` |  |
| `"modified"` | Last modified timestamp. |
| `"partner"` | Reference to the associated Partner. |
| `"phone"` |  |
| `"userName"` |  |
| `"userRole"` | Reference to the associated User Role. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Load.

API path: `/users/{id}`



## Entities


### Client

Create an instance: `client_ := client.Client(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` | Billing ID |
| `contact` | `map[string]any` |  |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `map[string]any` | Reference to the associated Partner. |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Client's name. |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```go
client_, err := client.Client(nil).Load(map[string]any{"id": "client_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(client_) // the loaded record
```

#### Example: List

```go
client_s, err := client.Client(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(client_s) // the array of records
```

#### Example: Create

```go
result, err := client.Client(nil).Create(map[string]any{
    "contact_email": "example_contact_email",
    "contact_first_name": "example_contact_first_name",
    "contact_is_active": true,
    "contact_last_name": "example_contact_last_name",
    "contact_phone": "example_contact_phone",
    "contact_send_welcome_email": true,
    "contact_user_name": "example_contact_user_name",
    "contact_user_role": "example_contact_user_role",
    "direct_partner_id": 1,
    "direct_partner_name": "example_direct_partner_name",
    "is_active": true,
    "name": "example_name",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Clone

Create an instance: `clone := client.Clone(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` | Unique identifier of newly added element. |
| `name` | `string` | Name of Template |

#### Example: Create

```go
result, err := client.Clone(nil).Create(map[string]any{
    "template_id": "example_template_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Partner

Create an instance: `partner := client.Partner(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` | The Partner's billing identifier. |
| `contact` | `map[string]any` |  |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Partner's name. |
| `parent` | `map[string]any` | Reference to the associated Partner. |
| `reference` | `string` | The Partner's reference string. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```go
partner, err := client.Partner(nil).Load(map[string]any{"id": "partner_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(partner) // the loaded record
```

#### Example: List

```go
partners, err := client.Partner(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(partners) // the array of records
```

#### Example: Create

```go
result, err := client.Partner(nil).Create(map[string]any{
    "billing_id": "example_billing_id",
    "contact_email": "example_contact_email",
    "contact_first_name": "example_contact_first_name",
    "contact_is_active": true,
    "contact_last_name": "example_contact_last_name",
    "contact_phone": "example_contact_phone",
    "contact_send_welcome_email": true,
    "contact_user_name": "example_contact_user_name",
    "contact_user_role": "example_contact_user_role",
    "is_active": true,
    "name": "example_name",
    "reference": "example_reference",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Template

Create an instance: `template := client.Template(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `accessMode` | `any` | The Template's access mode. |
| `active` | `bool` | This property indicates if the Template is active or inactive. |
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `fieldTemplates` | `[]any` | Field Template list items |
| `id` | `int` | Unique identifier of newly added element. |
| `name` | `string` | The Template's name. |
| `options` | `map[string]any` |  |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `reference` | `string` | The Template's unique reference. |
| `type` | `string` | The Template's type. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```go
template, err := client.Template(nil).Load(map[string]any{"id": "template_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(template) // the loaded record
```

#### Example: List

```go
templates, err := client.Template(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(templates) // the array of records
```

#### Example: Create

```go
result, err := client.Template(nil).Create(map[string]any{
    "active": true,
    "client_id": 1,
    "client_name": "example_client_name",
    "name": "example_name",
    "partner_id": 1,
    "partner_name": "example_partner_name",
    "reference": "example_reference",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Transaction

Create an instance: `transaction := client.Transaction(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `string` | BFID |
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `completeDate` | `string` | Timestamp from the beginning of the transaction. |
| `directPartner` | `map[string]any` | Reference to the associated Partner. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int` | This resource's unique identifier. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `string` | Message ID. |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `reference` | `string` | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | The success indicator. |
| `templateId` | `string` | The Template's unique identifier. |

#### Example: Load

```go
transaction, err := client.Transaction(nil).Load(map[string]any{"id": "transaction_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(transaction) // the loaded record
```

#### Example: List

```go
transactions, err := client.Transaction(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(transactions) // the array of records
```


### UpdateResult

Create an instance: `updateResult := client.UpdateResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` | The Partner's billing identifier. |
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `contact` | `map[string]any` |  |
| `directPartner` | `map[string]any` | Reference to the associated Partner. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `int` | Unique identifier of newly added element. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `lastName` | `string` | The User's Surname. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | The Partner's name. |
| `parent` | `map[string]any` | Reference to the associated Partner. |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `string` | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `map[string]any` | Reference to the associated User Role. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: List

```go
updateResults, err := client.UpdateResult(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(updateResults) // the array of records
```

#### Example: Create

```go
result, err := client.UpdateResult(nil).Create(map[string]any{
    "email": "example_email",
    "first_name": "example_first_name",
    "is_active": true,
    "last_name": "example_last_name",
    "phone": 1,
    "send_welcome_email": true,
    "user_role": map[string]any{},
    "username": "example_username",
    "contact": map[string]any{},
    "firstName": "example_firstName",
    "lastName": "example_lastName",
    "userName": "example_userName",
    "userRole": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### User

Create an instance: `user := client.User(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` |  |
| `lastName` | `string` |  |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `map[string]any` | Reference to the associated User Role. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```go
user, err := client.User(nil).Load(map[string]any{"id": "user_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(user) // the loaded record
```

## Features

This SDK ships 11 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Structured audit trail of operations |
| [`clienttrack`](#clienttrack) | Client identity and per-request correlation headers |
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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **AuditFeature**: Structured audit trail of operations
- **ClienttrackFeature**: Client identity and per-request correlation headers
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

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/go/
├── bluefin-shieldconex-mgmt.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `List`, the entity
stores the returned data and match criteria internally.

```go
partner := client.Partner(nil)
partner.List(nil, nil)

// partner.Data() now returns the partner data from the last list
// partner.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
