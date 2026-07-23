# BluefinShieldconexMgmt Golang SDK



The Golang SDK for the BluefinShieldconexMgmt API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.Client(nil)` — each with the same small set of operations (`List`, `Load`, `Create`, `Update`, `Remove`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
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
    created, err := client.Client(nil).Create(map[string]any{"billing_id": "example_billing_id", "contact": map[string]any{}}, nil)
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
client_s, err := client.Client(nil).List(nil, nil)
if err != nil {
    // handle err
    return
}
_ = client_s
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

client_, err := client.Client(nil).List(
    nil, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(client_) // the returned mock data
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
| `"billing_id"` |  |
| `"contact"` |  |
| `"created"` |  |
| `"direct_partner"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"mid"` |  |
| `"modified"` |  |
| `"name"` |  |
| `"partner"` |  |
| `"version"` |  |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### Clone

| Field | Description |
| --- | --- |
| `"id"` |  |
| `"name"` |  |

Operations: Create.

API path: `/templates/{id}/clone`

#### Partner

| Field | Description |
| --- | --- |
| `"billing_id"` |  |
| `"contact"` |  |
| `"created"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"modified"` |  |
| `"name"` |  |
| `"parent"` |  |
| `"reference"` |  |
| `"verification_phrase"` |  |
| `"version"` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Template

| Field | Description |
| --- | --- |
| `"access_mode"` |  |
| `"active"` |  |
| `"client"` |  |
| `"field_template"` |  |
| `"id"` |  |
| `"name"` |  |
| `"option"` |  |
| `"partner"` |  |
| `"reference"` |  |
| `"type"` |  |
| `"version"` |  |

Operations: Create, List, Load, Remove.

API path: `/templates`

#### Transaction

| Field | Description |
| --- | --- |
| `"bfid"` |  |
| `"client"` |  |
| `"complete_date"` |  |
| `"direct_partner"` |  |
| `"err_code"` |  |
| `"err_message"` |  |
| `"id"` |  |
| `"ip_address"` |  |
| `"message_id"` |  |
| `"partner"` |  |
| `"reference"` |  |
| `"success"` |  |
| `"template_id"` |  |

Operations: List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `"billing_id"` |  |
| `"client"` |  |
| `"contact"` |  |
| `"direct_partner"` |  |
| `"email"` |  |
| `"first_name"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"last_name"` |  |
| `"mid"` |  |
| `"name"` |  |
| `"parent"` |  |
| `"partner"` |  |
| `"phone"` |  |
| `"reference"` |  |
| `"send_welcome_email"` |  |
| `"user_name"` |  |
| `"user_role"` |  |
| `"verification_phrase"` |  |
| `"version"` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `"client"` |  |
| `"created"` |  |
| `"email"` |  |
| `"first_name"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"last_name"` |  |
| `"modified"` |  |
| `"partner"` |  |
| `"phone"` |  |
| `"user_name"` |  |
| `"user_role"` |  |
| `"version"` |  |

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
| `billing_id` | `string` |  |
| `contact` | `map[string]any` |  |
| `created` | `string` |  |
| `direct_partner` | `map[string]any` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `map[string]any` |  |
| `version` | `int` |  |

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
| `id` | `int` |  |
| `name` | `string` |  |

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
| `billing_id` | `string` |  |
| `contact` | `map[string]any` |  |
| `created` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `map[string]any` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `int` |  |

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
| `access_mode` | `any` |  |
| `active` | `bool` |  |
| `client` | `map[string]any` |  |
| `field_template` | `[]any` |  |
| `id` | `int` |  |
| `name` | `string` |  |
| `option` | `map[string]any` |  |
| `partner` | `map[string]any` |  |
| `reference` | `string` |  |
| `type` | `string` |  |
| `version` | `int` |  |

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
| `bfid` | `string` |  |
| `client` | `map[string]any` |  |
| `complete_date` | `string` |  |
| `direct_partner` | `map[string]any` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `int` |  |
| `ip_address` | `string` |  |
| `message_id` | `string` |  |
| `partner` | `map[string]any` |  |
| `reference` | `string` |  |
| `success` | `bool` |  |
| `template_id` | `string` |  |

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
| `billing_id` | `string` |  |
| `client` | `map[string]any` |  |
| `contact` | `map[string]any` |  |
| `direct_partner` | `map[string]any` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `last_name` | `string` |  |
| `mid` | `string` |  |
| `name` | `string` |  |
| `parent` | `map[string]any` |  |
| `partner` | `map[string]any` |  |
| `phone` | `string` |  |
| `reference` | `string` |  |
| `send_welcome_email` | `bool` |  |
| `user_name` | `string` |  |
| `user_role` | `map[string]any` |  |
| `verification_phrase` | `string` |  |
| `version` | `int` |  |

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
    "contact": map[string]any{},
    "email": "example_email",
    "first_name": "example_first_name",
    "last_name": "example_last_name",
    "phone": "example_phone",
    "user_name": "example_user_name",
    "user_role": map[string]any{},
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
| `client` | `map[string]any` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `map[string]any` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `map[string]any` |  |
| `version` | `int` |  |

#### Example: Load

```go
user, err := client.User(nil).Load(map[string]any{"id": "user_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(user) // the loaded record
```


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

- **TestFeature**: In-memory mock transport for testing without a live server

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
client_ := client.Client(nil)
client_.List(nil, nil)

// client_.Data() now returns the client_ data from the last list
// client_.Match() returns the last match criteria
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
