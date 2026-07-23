# BluefinShieldconexMgmt C# SDK



The C# SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic C# conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Client()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to NuGet. Install it from the GitHub
release tag (`csharp/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)) or
from a source checkout — build the library and add a project reference:

```bash
cd csharp && dotnet build BluefinShieldconexMgmtSDK.csproj
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```csharp
using BluefinShieldconexMgmtSdk;

var client = new BluefinShieldconexMgmtSDK(new Dictionary<string, object?>
{
    ["apikey"] = Environment.GetEnvironmentVariable("BLUEFIN_SHIELDCONEX_MGMT_APIKEY"),
});
```

### 2. List client records

`List(null)` returns an aggregate list of records (as `object?`) and raises
on error.

```csharp
try
{
    var clientList = client.Client().List(null);
    Console.WriteLine(clientList);
}
catch (Exception err)
{
    Console.WriteLine($"list failed: {err.Message}");
}
```

### 3. Load a client

`Load()` returns the bare record (as `object?`) and raises on error.

```csharp
try
{
    var client = client.Client().Load(new Dictionary<string, object?> { ["id"] = "example_id" });
    Console.WriteLine(client);
}
catch (Exception err)
{
    Console.WriteLine($"load failed: {err.Message}");
}
```

### 4. Create, update, and remove

```csharp
// Create — returns the bare created record (as object?)
var created = client.Client().Create(new Dictionary<string, object?> { ["billing_id"] = "example_billing_id", ["contact"] = new Dictionary<string, object?>() });

// Remove
client.Client().Remove(new Dictionary<string, object?> { ["id"] = "example_id" });
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const partners = await client.Partner().list()
  console.log(partners)
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```csharp
var result = client.Direct(new Dictionary<string, object?>
{
    ["path"] = "/api/resource/{id}",
    ["method"] = "GET",
    ["params"] = new Dictionary<string, object?> { ["id"] = "example" },
});

if (Equals(result["ok"], true))
{
    Console.WriteLine(result["status"]);  // 200
    Console.WriteLine(result["data"]);    // response body
}
else
{
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both with TryGetValue rather than indexing a key that may be absent.
    result.TryGetValue("status", out var status);
    result.TryGetValue("err", out var err);
    Console.WriteLine($"{status} {err}");
}
```

### Prepare a request without sending it

```csharp
// Prepare() returns the fetch definition and raises on error.
var fetchdef = client.Prepare(new Dictionary<string, object?>
{
    ["path"] = "/api/resource/{id}",
    ["method"] = "DELETE",
    ["params"] = new Dictionary<string, object?> { ["id"] = "example" },
});

Console.WriteLine(fetchdef["url"]);
Console.WriteLine(fetchdef["method"]);
Console.WriteLine(fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```csharp
var client = BluefinShieldconexMgmtSDK.TestSDK(null, null);

// Entity ops return the bare record and raise on error.
var partner = client.Partner().List(null);
// partner holds the mock response record
Console.WriteLine(partner);
```

### Use a custom fetch function

Replace the HTTP transport with your own delegate:

```csharp
Func<string, Dictionary<string, object?>, Dictionary<string, object?>> mockFetch =
    (url, init) => new Dictionary<string, object?>
    {
        ["status"] = 200,
        ["statusText"] = "OK",
        ["headers"] = new Dictionary<string, object?>(),
        ["json"] = (Func<object?>)(() => new Dictionary<string, object?> { ["id"] = "mock01" }),
    };

var client = new BluefinShieldconexMgmtSDK(new Dictionary<string, object?>
{
    ["base"] = "http://localhost:8080",
    ["system"] = new Dictionary<string, object?>
    {
        ["fetch"] = mockFetch,
    },
});
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd csharp && dotnet test
```


## Reference

### BluefinShieldconexMgmtSDK

```csharp
using BluefinShieldconexMgmtSdk;

var client = new BluefinShieldconexMgmtSDK(options);
```

Creates a new SDK client. `options` is a `Dictionary<string, object?>`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `Dictionary` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Dictionary` | System overrides (e.g. custom `fetch` delegate). |

### TestSDK

```csharp
var client = BluefinShieldconexMgmtSDK.TestSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() -> Dictionary` | Deep copy of current SDK options. |
| `GetUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs) -> Dictionary` | Build an HTTP request definition without sending. Raises on error. |
| `Direct` | `(fetchargs) -> Dictionary` | Build and send an HTTP request. Returns a result dictionary (branch on `ok`). |
| `Client` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Client entity instance. |
| `Clone` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Clone entity instance. |
| `Partner` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Partner entity instance. |
| `Template` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Template entity instance. |
| `Transaction` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create a Transaction entity instance. |
| `UpdateResult` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create an UpdateResult entity instance. |
| `User` | `(entopts) -> BluefinShieldconexMgmtEntityBase` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl) -> object?` | Load a single entity by match criteria. Raises on error. |
| `List` | `(reqmatch, ctrl) -> object?` | List entities matching the criteria (an aggregate list). Raises on error. |
| `Create` | `(reqdata, ctrl) -> object?` | Create a new entity. Raises on error. |
| `Update` | `(reqdata, ctrl) -> object?` | Update an existing entity. Raises on error. |
| `Remove` | `(reqmatch, ctrl) -> object?` | Remove an entity. Raises on error. |
| `Data` | `(newdata) -> object?` | Get or set entity data. |
| `Match` | `(newmatch) -> object?` | Get or set entity match criteria. |
| `Make` | `() -> IEntity` | Create a new instance with the same options. |
| `GetName` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `Dictionary` for
single-entity ops, an aggregate list for `List`) as `object?` and raise on
error. Wrap calls in `try`/`catch` to handle failures.

The `Direct()` escape hatch never raises — it returns a result
`Dictionary<string, object?>` you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Dictionary` | Response headers. |
| `data` | `object?` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

### Entities

#### Client

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `contact` |  |
| `created` |  |
| `direct_partner` |  |
| `id` |  |
| `is_active` |  |
| `mid` |  |
| `modified` |  |
| `name` |  |
| `partner` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### Clone

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: Create.

API path: `/templates/{id}/clone`

#### Partner

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `reference` |  |
| `verification_phrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Template

| Field | Description |
| --- | --- |
| `access_mode` |  |
| `active` |  |
| `client` |  |
| `field_template` |  |
| `id` |  |
| `name` |  |
| `option` |  |
| `partner` |  |
| `reference` |  |
| `type` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/templates`

#### Transaction

| Field | Description |
| --- | --- |
| `bfid` |  |
| `client` |  |
| `complete_date` |  |
| `direct_partner` |  |
| `err_code` |  |
| `err_message` |  |
| `id` |  |
| `ip_address` |  |
| `message_id` |  |
| `partner` |  |
| `reference` |  |
| `success` |  |
| `template_id` |  |

Operations: List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `client` |  |
| `contact` |  |
| `direct_partner` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `last_name` |  |
| `mid` |  |
| `name` |  |
| `parent` |  |
| `partner` |  |
| `phone` |  |
| `reference` |  |
| `send_welcome_email` |  |
| `user_name` |  |
| `user_role` |  |
| `verification_phrase` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `last_name` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

Operations: Load.

API path: `/users/{id}`



## Entities


### Client

Create an instance: `var client = client.Client();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |
| `Remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `Dictionary<string, object?>` |  |
| `created` | `string` |  |
| `direct_partner` | `Dictionary<string, object?>` |  |
| `id` | `long` |  |
| `is_active` | `bool` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `version` | `long` |  |

#### Example: Load

```csharp
var client = client.Client().Load(new Dictionary<string, object?> { ["id"] = "client_id" });
```

#### Example: List

```csharp
var clientList = client.Client().List(null);
```

#### Example: Create

```csharp
var client = client.Client().Create(new Dictionary<string, object?>
{
});
```


### Clone

Create an instance: `var clone = client.Clone();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `long` |  |
| `name` | `string` |  |

#### Example: Create

```csharp
var clone = client.Clone().Create(new Dictionary<string, object?>
{
    ["template_id"] = "example_template_id",  // string
});
```


### Partner

Create an instance: `var partner = client.Partner();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `Dictionary<string, object?>` |  |
| `created` | `string` |  |
| `id` | `long` |  |
| `is_active` | `bool` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `Dictionary<string, object?>` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```csharp
var partner = client.Partner().Load(new Dictionary<string, object?> { ["id"] = "partner_id" });
```

#### Example: List

```csharp
var partnerList = client.Partner().List(null);
```

#### Example: Create

```csharp
var partner = client.Partner().Create(new Dictionary<string, object?>
{
});
```


### Template

Create an instance: `var template = client.Template();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |
| `Remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `object?` |  |
| `active` | `bool` |  |
| `client` | `Dictionary<string, object?>` |  |
| `field_template` | `List<object?>` |  |
| `id` | `long` |  |
| `name` | `string` |  |
| `option` | `Dictionary<string, object?>` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `reference` | `string` |  |
| `type` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```csharp
var template = client.Template().Load(new Dictionary<string, object?> { ["id"] = "template_id" });
```

#### Example: List

```csharp
var templateList = client.Template().List(null);
```

#### Example: Create

```csharp
var template = client.Template().Create(new Dictionary<string, object?>
{
});
```


### Transaction

Create an instance: `var transaction = client.Transaction();`

#### Operations

| Method | Description |
| --- | --- |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `string` |  |
| `client` | `Dictionary<string, object?>` |  |
| `complete_date` | `string` |  |
| `direct_partner` | `Dictionary<string, object?>` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `long` |  |
| `ip_address` | `string` |  |
| `message_id` | `string` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `reference` | `string` |  |
| `success` | `bool` |  |
| `template_id` | `string` |  |

#### Example: Load

```csharp
var transaction = client.Transaction().Load(new Dictionary<string, object?> { ["id"] = "transaction_id" });
```

#### Example: List

```csharp
var transactionList = client.Transaction().List(null);
```


### UpdateResult

Create an instance: `var updateResult = client.UpdateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client` | `Dictionary<string, object?>` |  |
| `contact` | `Dictionary<string, object?>` |  |
| `direct_partner` | `Dictionary<string, object?>` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `long` |  |
| `is_active` | `bool` |  |
| `last_name` | `string` |  |
| `mid` | `string` |  |
| `name` | `string` |  |
| `parent` | `Dictionary<string, object?>` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `phone` | `string` |  |
| `reference` | `string` |  |
| `send_welcome_email` | `bool` |  |
| `user_name` | `string` |  |
| `user_role` | `Dictionary<string, object?>` |  |
| `verification_phrase` | `string` |  |
| `version` | `long` |  |

#### Example: List

```csharp
var updateResultList = client.UpdateResult().List(null);
```

#### Example: Create

```csharp
var updateResult = client.UpdateResult().Create(new Dictionary<string, object?>
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


### User

Create an instance: `var user = client.User();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Dictionary<string, object?>` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `long` |  |
| `is_active` | `bool` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `Dictionary<string, object?>` |  |
| `version` | `long` |  |

#### Example: Load

```csharp
var user = client.User().Load(new Dictionary<string, object?> { ["id"] = "user_id" });
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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dictionaries

The C# SDK uses a loose object model — `Dictionary<string, object?>`
throughout — rather than a bespoke typed class per endpoint. This mirrors
the dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.ToMapAny(value)` to safely coerce a value to a
`Dictionary<string, object?>`. A `BluefinShieldconexMgmtTypes.cs` module of
reference `record` types is also generated for editor documentation.

### Project structure

```
csharp/
├── BluefinShieldconexMgmtSDK.csproj    -- Library project (compiles everything except test/)
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- xUnit test suites
```

The main client class (`BluefinShieldconexMgmtSDK`, namespace
`BluefinShieldconexMgmtSdk`) exposes the entity accessors. Reference entity or
utility types directly only when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const partner = client.Partner()
await partner.list()

// partner.data() now returns the partner data from the last `list`
// partner.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
