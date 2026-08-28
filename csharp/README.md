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
var created = client.Client().Create(new Dictionary<string, object?> { ["contact_email"] = "example_contact_email", ["contact_first_name"] = "example_contact_first_name", ["contact_is_active"] = true, ["contact_last_name"] = "example_contact_last_name", ["contact_phone"] = "example_contact_phone", ["contact_send_welcome_email"] = true, ["contact_user_name"] = "example_contact_user_name", ["contact_user_role"] = "example_contact_user_role", ["direct_partner_id"] = 1L, ["direct_partner_name"] = "example_direct_partner_name", ["is_active"] = true, ["name"] = "example_name" });

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
| `billingId` | Billing ID |
| `contact` |  |
| `created` | Creation timestamp in ISO 8601 format. |
| `directPartner` | Reference to the associated Partner. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Client account is active or disabled. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | Last modified timestamp. |
| `name` | The Client's name. |
| `partner` | Reference to the associated Partner. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### Clone

| Field | Description |
| --- | --- |
| `id` | Unique identifier of newly added element. |
| `name` | Name of Template |

Operations: Create.

API path: `/templates/{id}/clone`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `contact` |  |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Parter account is active or disabled. |
| `modified` | Last modified timestamp. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `reference` | The Partner's reference string. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/partners`

#### Template

| Field | Description |
| --- | --- |
| `accessMode` | The Template's access mode. |
| `active` | This property indicates if the Template is active or inactive. |
| `client` | Reference to the associated Client resource. |
| `fieldTemplates` | Field Template list items |
| `id` | Unique identifier of newly added element. |
| `name` | The Template's name. |
| `options` |  |
| `partner` | Reference to the associated Partner. |
| `reference` | The Template's unique reference. |
| `type` | The Template's type. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/templates`

#### Transaction

| Field | Description |
| --- | --- |
| `bfid` | BFID |
| `client` | Reference to the associated Client resource. |
| `completeDate` | Timestamp from the beginning of the transaction. |
| `directPartner` | Reference to the associated Partner. |
| `errCode` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | This resource's unique identifier. |
| `ipAddress` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | Message ID. |
| `partner` | Reference to the associated Partner. |
| `reference` | The reference property that the Client includes in the decrypt API call. |
| `success` | The success indicator. |
| `templateId` | The Template's unique identifier. |

Operations: List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `client` | Reference to the associated Client resource. |
| `contact` |  |
| `directPartner` | Reference to the associated Partner. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | Unique identifier of newly added element. |
| `isActive` | This property indicates if the User account is active or disabled. |
| `lastName` | The User's Surname. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | The Partner's reference string. |
| `sendWelcomeEmail` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `email` |  |
| `firstName` |  |
| `id` | This resource's unique identifier. |
| `isActive` |  |
| `lastName` |  |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `phone` |  |
| `userName` |  |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

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
| `billingId` | `string` | Billing ID |
| `contact` | `Dictionary<string, object?>` |  |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `id` | `long` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Client's name. |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `version` | `long` | The number of times that this resource has been updated. |

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
    ["contact_email"] = "example_contact_email",  // string
    ["contact_first_name"] = "example_contact_first_name",  // string
    ["contact_is_active"] = true,  // bool
    ["contact_last_name"] = "example_contact_last_name",  // string
    ["contact_phone"] = "example_contact_phone",  // string
    ["contact_send_welcome_email"] = true,  // bool
    ["contact_user_name"] = "example_contact_user_name",  // string
    ["contact_user_role"] = "example_contact_user_role",  // string
    ["direct_partner_id"] = 1L,  // long
    ["direct_partner_name"] = "example_direct_partner_name",  // string
    ["is_active"] = true,  // bool
    ["name"] = "example_name",  // string
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
| `id` | `long` | Unique identifier of newly added element. |
| `name` | `string` | Name of Template |

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
| `billingId` | `string` | The Partner's billing identifier. |
| `contact` | `Dictionary<string, object?>` |  |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `long` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Partner's name. |
| `parent` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `reference` | `string` | The Partner's reference string. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `long` | The number of times that this resource has been updated. |

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
    ["billing_id"] = "example_billing_id",  // string
    ["contact_email"] = "example_contact_email",  // string
    ["contact_first_name"] = "example_contact_first_name",  // string
    ["contact_is_active"] = true,  // bool
    ["contact_last_name"] = "example_contact_last_name",  // string
    ["contact_phone"] = "example_contact_phone",  // string
    ["contact_send_welcome_email"] = true,  // bool
    ["contact_user_name"] = "example_contact_user_name",  // string
    ["contact_user_role"] = "example_contact_user_role",  // string
    ["is_active"] = true,  // bool
    ["name"] = "example_name",  // string
    ["reference"] = "example_reference",  // string
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
| `accessMode` | `object?` | The Template's access mode. |
| `active` | `bool` | This property indicates if the Template is active or inactive. |
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `fieldTemplates` | `List<object?>` | Field Template list items |
| `id` | `long` | Unique identifier of newly added element. |
| `name` | `string` | The Template's name. |
| `options` | `Dictionary<string, object?>` |  |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `reference` | `string` | The Template's unique reference. |
| `type` | `string` | The Template's type. |
| `version` | `long` | The number of times that this resource has been updated. |

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
    ["active"] = true,  // bool
    ["client_id"] = 1L,  // long
    ["client_name"] = "example_client_name",  // string
    ["name"] = "example_name",  // string
    ["partner_id"] = 1L,  // long
    ["partner_name"] = "example_partner_name",  // string
    ["reference"] = "example_reference",  // string
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
| `bfid` | `string` | BFID |
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `completeDate` | `string` | Timestamp from the beginning of the transaction. |
| `directPartner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `long` | This resource's unique identifier. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `string` | Message ID. |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `reference` | `string` | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | The success indicator. |
| `templateId` | `string` | The Template's unique identifier. |

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
| `billingId` | `string` | The Partner's billing identifier. |
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `contact` | `Dictionary<string, object?>` |  |
| `directPartner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `long` | Unique identifier of newly added element. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `lastName` | `string` | The User's Surname. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | The Partner's name. |
| `parent` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `string` | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `Dictionary<string, object?>` | Reference to the associated User Role. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: List

```csharp
var updateResultList = client.UpdateResult().List(null);
```

#### Example: Create

```csharp
var updateResult = client.UpdateResult().Create(new Dictionary<string, object?>
{
    ["email"] = "example_email",  // string
    ["first_name"] = "example_first_name",  // string
    ["is_active"] = true,  // bool
    ["last_name"] = "example_last_name",  // string
    ["phone"] = 1L,  // long
    ["send_welcome_email"] = true,  // bool
    ["user_role"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["username"] = "example_username",  // string
    ["contact"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["firstName"] = "example_firstName",  // string
    ["lastName"] = "example_lastName",  // string
    ["userName"] = "example_userName",  // string
    ["userRole"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
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
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `long` | This resource's unique identifier. |
| `isActive` | `bool` |  |
| `lastName` | `string` |  |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `Dictionary<string, object?>` | Reference to the associated User Role. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var user = client.User().Load(new Dictionary<string, object?> { ["id"] = "user_id" });
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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

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
