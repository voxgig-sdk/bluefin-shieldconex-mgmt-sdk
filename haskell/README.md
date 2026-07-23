# BluefinShieldconexMgmt Haskell SDK



The Haskell SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic Haskell conventions (pure functions, explicit `IO`, and the dependency-free vendored `Value` struct model).

The SDK exposes the API as capitalised, semantic **Entities** — for example `client sdk VNoval` — each
carrying a small, uniform set of operations (`eList`, `eLoad`, `eCreate`, `eUpdate`, `eRemove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Hackage. Install it from the GitHub
release tag (`haskell/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)) or
from a source checkout. The runtime has no third-party dependencies (only the
GHC boot libraries: `base`, `containers`, `array`, `time`), so the
bundled Makefile drives stock GHC with no cabal solve:

```bash
cd haskell && make test
```

A `.cabal` file is also generated for use with `cabal`/`stack`:

```bash
cd haskell && cabal build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```haskell
import System.Environment (lookupEnv)
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..), emptyMap)
import SdkHelpers (jo)

main :: IO ()
main = do
  mkey <- lookupEnv "BLUEFIN_SHIELDCONEX_MGMT_APIKEY"
  opts <- jo [("apikey", maybe VNoval VStr mkey)]
  sdk <- Sdk.newSdk opts
```

Entity operations raise on error (via `Control.Exception.throwIO`) and
return the bare result `Value`. Wrap a call in `Control.Exception.try`
to recover from failures.

### 2. List client records

`eList ent match ctrl` returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  clients <- Sdk.eList ent match ctrl
  print clients
```

### 3. Load a client

`eLoad ent match ctrl` returns the bare record and raises on error.

```haskell
  ent2 <- Sdk.client sdk VNoval
  m <- jo [("id", VStr "example_id")]
  ctrl2 <- emptyMap
  client <- Sdk.eLoad ent2 m ctrl2
  print client
```

### 4. Create, update, and remove

```haskell
  createEnt <- Sdk.client sdk VNoval
  d <- jo [("billing_id", VStr "example_billing_id"), ("contact", VNoval)]
  cctrl <- emptyMap
  created <- Sdk.eCreate createEnt d cctrl
  print created
```

```haskell
  removeEnt <- Sdk.client sdk VNoval
  rm <- jo [("id", VStr "example_id")]
  rctrl <- emptyMap
  _ <- Sdk.eRemove removeEnt rm rctrl
  return ()
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

For endpoints not covered by entity accessors, use `direct` — it never
raises and returns a result `Value` you branch on via its `ok` field:

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..))
import SdkHelpers (jo, getp)

main :: IO ()
main = do
  sdk <- Sdk.newSdk0
  params <- jo [("id", VStr "example")]
  args <- jo [("path", VStr "/api/resource/{id}"), ("method", VStr "GET"), ("params", params)]
  result <- F.direct sdk args
  ok <- getp result "ok"
  case ok of
    VBool True -> do
      status <- getp result "status"   -- e.g. VNum 200
      body <- getp result "data"       -- the response body
      print (status, body)
    _ -> do
      -- A non-2xx response carries status + data (the error body); a
      -- transport-level failure carries err instead.
      status <- getp result "status"
      err <- getp result "err"
      print (status, err)
```

### Prepare a request without sending it

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..))
import SdkHelpers (jo, getp)

main :: IO ()
main = do
  sdk <- Sdk.newSdk0
  params <- jo [("id", VStr "example")]
  args <- jo [("path", VStr "/api/resource/{id}"), ("method", VStr "DELETE"), ("params", params)]
  -- prepare returns the fetch definition and raises on error.
  fetchdef <- F.prepare sdk args
  url <- getp fetchdef "url"
  method <- getp fetchdef "method"
  print (url, method)
```

### Use test mode

Create a mock client for unit testing — no server required:

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..), emptyMap)
import SdkHelpers (jo)

main :: IO ()
main = do
  sdk <- Sdk.testSdk0
  ent <- Sdk.partner sdk VNoval
  arg <- emptyMap
  ctrl <- emptyMap
  -- Entity ops return the bare record and raise on error.
  partner <- Sdk.eList ent arg ctrl
  print partner
```

### Use a custom fetch function

Replace the HTTP transport with your own `VFunc` under `system.fetch`:

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo, jsonThunk)

customClient :: IO Sdk.Client
customClient = do
  let mockFetch = VFunc (\_ _ _ _ -> do
        body <- jo [("id", VStr "mock01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk body)])
  sys <- jo [("fetch", mockFetch)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  Sdk.newSdk opts
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run the suite (stock GHC, no third-party dependencies):

```bash
cd haskell && make test
```


## Reference

### Client constructors

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo)

makeClient :: IO Sdk.Client
makeClient = do
  opts <- jo [("base", VStr "https://api.example.com")]
  Sdk.newSdk opts
```

`newSdk :: Value -> IO Client` constructs a client from an options map;
`newSdk0 :: IO Client` is the no-argument convenience form.

| Option (map key) | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `headers` | `Value` | Custom headers for all requests. |
| `feature` | `Value` | Feature activation flags. |
| `system` | `Value` | System overrides (e.g. custom `fetch` function). |

### Test client

```haskell
client <- Sdk.testSdk testopts sdkopts
```

`testSdk :: Value -> Value -> IO Client` constructs a test-mode client with
mock transport (`testSdk0 :: IO Client` for the no-argument form). Pass
`VNoval` for defaults.

### Client functions

| Function | Signature | Description |
| --- | --- | --- |
| `newSdk` | `Value -> IO Client` | Construct a live client from options. |
| `newSdk0` | `IO Client` | Construct a live client with defaults. |
| `testSdk` | `Value -> Value -> IO Client` | Construct a test-mode client. |
| `prepare` | `Client -> Value -> IO Value` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `Client -> Value -> IO Value` | Build and send an HTTP request. Returns a result `Value` (branch on `ok`). |
| `client` | `Client -> Value -> IO Entity` | Create a Client entity instance. |
| `clone` | `Client -> Value -> IO Entity` | Create a Clone entity instance. |
| `partner` | `Client -> Value -> IO Entity` | Create a Partner entity instance. |
| `template` | `Client -> Value -> IO Entity` | Create a Template entity instance. |
| `transaction` | `Client -> Value -> IO Entity` | Create a Transaction entity instance. |
| `update_result` | `Client -> Value -> IO Entity` | Create an UpdateResult entity instance. |
| `user` | `Client -> Value -> IO Entity` | Create an User entity instance. |

### Entity interface

All entities share the same record interface (fields of the `Entity` type).

| Field | Signature | Description |
| --- | --- | --- |
| `eLoad` | `Value -> Value -> IO Value` | Load a single entity by match criteria. Raises on error. |
| `eList` | `Value -> Value -> IO Value` | List entities matching the criteria. Raises on error. |
| `eCreate` | `Value -> Value -> IO Value` | Create a new entity. Raises on error. |
| `eUpdate` | `Value -> Value -> IO Value` | Update an existing entity. Raises on error. |
| `eRemove` | `Value -> Value -> IO Value` | Remove an entity. Raises on error. |
| `eDataGet` | `IO Value` | Get entity data. |
| `eDataSet` | `Value -> IO ()` | Set entity data. |
| `eStream` | `String -> Value -> Value -> IO [Value]` | Run an op as a lazy stream of items. |
| `eMake` | `IO Entity` | Create a new instance with the same options. |
| `eName` | `String` | The entity name. |

### Result shape

Entity operations return the bare result `Value` (a map for single-entity
ops, a list for `eList`) and raise on error. Wrap calls in
`Control.Exception.try` to handle failures.

The `direct` escape hatch never raises — it returns a result `Value`
you branch on via its `ok` field (read with `getp result "ok"`):

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `True` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Value` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

On error, `ok` is `False` and `err` carries the error value.

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

Create an instance: `client <- Sdk.client sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eRemove ent match ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `contact` | `Value` |  |
| `created` | `String` |  |
| `direct_partner` | `Value` |  |
| `id` | `Int` |  |
| `is_active` | `Bool` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `Value` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.client sdk VNoval
  match <- jo [("id", VStr "client_id")]
  ctrl <- emptyMap
  client <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  clients <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.client sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  client <- Sdk.eCreate ent d ctrl
```


### Clone

Create an instance: `clone <- Sdk.clone sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Int` |  |
| `name` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.clone sdk VNoval
  d <- jo
    [ ("template_id", VStr "example_template_id")   -- String
    ]
  ctrl <- emptyMap
  clone <- Sdk.eCreate ent d ctrl
```


### Partner

Create an instance: `partner <- Sdk.partner sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `contact` | `Value` |  |
| `created` | `String` |  |
| `id` | `Int` |  |
| `is_active` | `Bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `Value` |  |
| `reference` | `String` |  |
| `verification_phrase` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- jo [("id", VStr "partner_id")]
  ctrl <- emptyMap
  partner <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  partners <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.partner sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  partner <- Sdk.eCreate ent d ctrl
```


### Template

Create an instance: `template <- Sdk.template sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eRemove ent match ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `Value` |  |
| `active` | `Bool` |  |
| `client` | `Value` |  |
| `field_template` | `[Value]` |  |
| `id` | `Int` |  |
| `name` | `String` |  |
| `option` | `Value` |  |
| `partner` | `Value` |  |
| `reference` | `String` |  |
| `type` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.template sdk VNoval
  match <- jo [("id", VStr "template_id")]
  ctrl <- emptyMap
  template <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.template sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  templates <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.template sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  template <- Sdk.eCreate ent d ctrl
```


### Transaction

Create an instance: `transaction <- Sdk.transaction sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `String` |  |
| `client` | `Value` |  |
| `complete_date` | `String` |  |
| `direct_partner` | `Value` |  |
| `err_code` | `String` |  |
| `err_message` | `String` |  |
| `id` | `Int` |  |
| `ip_address` | `String` |  |
| `message_id` | `String` |  |
| `partner` | `Value` |  |
| `reference` | `String` |  |
| `success` | `Bool` |  |
| `template_id` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- jo [("id", VStr "transaction_id")]
  ctrl <- emptyMap
  transaction <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  transactions <- Sdk.eList ent match ctrl
```


### UpdateResult

Create an instance: `update_result <- Sdk.update_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eUpdate ent data ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `client` | `Value` |  |
| `contact` | `Value` |  |
| `direct_partner` | `Value` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `Int` |  |
| `is_active` | `Bool` |  |
| `last_name` | `String` |  |
| `mid` | `String` |  |
| `name` | `String` |  |
| `parent` | `Value` |  |
| `partner` | `Value` |  |
| `phone` | `String` |  |
| `reference` | `String` |  |
| `send_welcome_email` | `Bool` |  |
| `user_name` | `String` |  |
| `user_role` | `Value` |  |
| `verification_phrase` | `String` |  |
| `version` | `Int` |  |

#### Example: List

```haskell
  ent <- Sdk.update_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  update_results <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.update_result sdk VNoval
  d <- jo
    [ ("contact", VNoval)   -- Value
    , ("email", VStr "example_email")   -- String
    , ("first_name", VStr "example_first_name")   -- String
    , ("last_name", VStr "example_last_name")   -- String
    , ("phone", VStr "example_phone")   -- String
    , ("user_name", VStr "example_user_name")   -- String
    , ("user_role", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  update_result <- Sdk.eCreate ent d ctrl
```


### User

Create an instance: `user <- Sdk.user sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `Int` |  |
| `is_active` | `Bool` |  |
| `last_name` | `String` |  |
| `modified` | `String` |  |
| `partner` | `Value` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `Value` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.user sdk VNoval
  match <- jo [("id", VStr "user_id")]
  ctrl <- emptyMap
  user <- Sdk.eLoad ent match ctrl
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

### Data as struct Values

The Haskell SDK models every API record as the dynamic `Value` type (from
the vendored `VoxgigStruct` module) rather than bespoke Haskell records.
This mirrors the dynamic nature of the API and keeps the SDK flexible — no
new datatypes or code generation are needed when the API schema changes.

Build request maps with `jo [(key, value)]` and read fields back with
`getp value "field"`; scalars are the `VStr` / `VNum` / `VBool`
constructors, and `VNoval` stands for an absent property.

### Module structure

```
haskell/
├── src/
│   ├── VoxgigStruct.hs   -- vendored dependency-free struct library (Value)
│   ├── Vregex.hs         -- vendored regex support
│   ├── SdkTypes.hs       -- core types (Client, Entity, Feature)
│   ├── SdkHelpers.hs     -- helper functions (jo, getp, ...)
│   ├── SdkRuntime.hs     -- the generic operation pipeline
│   ├── SdkFeatures.hs    -- built-in features + makeEntity
│   ├── SdkConfig.hs      -- generated API configuration + feature factory
│   └── SdkClient.hs      -- generated public client (newSdk, entity accessors)
├── test/                 -- test suites
├── Makefile              -- stock-GHC build/test (no third-party deps)
└── bluefinshieldconexmgmt-sdk.cabal      -- package manifest (for Hackage)
```

The public module (`SdkClient`) exports the SDK constructors (`newSdk`,
`testSdk`) and one accessor per entity. Import `VoxgigStruct` for the
`Value` constructors and `SdkHelpers` for `jo` / `getp`.

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
