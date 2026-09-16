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

`eList ent match ctrl` resolves to one ENTITY per record and raises on
error. Read a record with `eDataGet`.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  clients <- Sdk.eList ent match ctrl
  mapM_ (\en -> print =<< Sdk.eDataGet en) clients
```

### 3. Load a client

`eLoad ent match ctrl` resolves to the ENTITY and raises on error;
`eDataGet` gives the record.

```haskell
  ent2 <- Sdk.client sdk VNoval
  m <- jo [("id", VStr "example_id")]
  ctrl2 <- emptyMap
  client <- Sdk.eLoad ent2 m ctrl2
  print =<< Sdk.eDataGet client
```

### 4. Create, update, and remove

```haskell
  createEnt <- Sdk.client sdk VNoval
  d <- jo [("contact_email", VStr "example_contact_email"), ("contact_first_name", VStr "example_contact_first_name"), ("contact_is_active", VBool True), ("contact_last_name", VStr "example_contact_last_name"), ("contact_phone", VStr "example_contact_phone"), ("contact_send_welcome_email", VBool True), ("contact_user_name", VStr "example_contact_user_name"), ("contact_user_role", VStr "example_contact_user_role"), ("direct_partner_id", VNum 1), ("direct_partner_name", VStr "example_direct_partner_name"), ("is_active", VBool True), ("name", VStr "example_name")]
  cctrl <- emptyMap
  created <- Sdk.eCreate createEnt d cctrl
  print =<< Sdk.eDataGet created
```

```haskell
  removeEnt <- Sdk.client sdk VNoval
  rm <- jo [("id", VStr "example_id")]
  rctrl <- emptyMap
  -- Resolves to the entity, marked deleted; it keeps the data it held.
  removed <- Sdk.eRemove removeEnt rm rctrl
  print =<< readIORef (Sdk.eDeleted removed)
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
| `eLoad` | `Value -> Value -> IO Entity` | Load a single entity by match criteria. Resolves to the entity. Raises on error. |
| `eList` | `Value -> Value -> IO [Entity]` | List entities matching the criteria. Resolves to one entity per record. Raises on error. |
| `eCreate` | `Value -> Value -> IO Entity` | Create a new entity. Resolves to the entity. Raises on error. |
| `eUpdate` | `Value -> Value -> IO Entity` | Update an existing entity. Resolves to the entity. Raises on error. |
| `eRemove` | `Value -> Value -> IO Entity` | Remove an entity. Resolves to the entity, marked deleted. Raises on error. |
| `eDataGet` | `IO Value` | Get entity data. |
| `eDataSet` | `Value -> IO ()` | Set entity data. |
| `eStream` | `String -> Value -> Value -> IO [Value]` | Run an op as a lazy stream of items. |
| `eMake` | `IO Entity` | Create a new instance with the same options. |
| `eName` | `String` | The entity name. |

### Result shape

Entity operations resolve to the ENTITY, not the raw record — `eList` to
one entity per record — and raise on error. The record is reached through
`eDataGet`, which returns the entity's data container. `eRemove` resolves to
the entity marked deleted (`eDeleted`); it keeps the data it held. Wrap calls
in `Control.Exception.try` to handle failures.

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

Create an instance: `client <- Sdk.client sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `eRemove ent match ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` | Billing ID |
| `contact` | `Value` |  |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Value` | Reference to the associated Partner. |
| `id` | `Int` | This resource's unique identifier. |
| `isActive` | `Bool` | This property indicates if the Client account is active or disabled. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Client's name. |
| `partner` | `Value` | Reference to the associated Partner. |
| `version` | `Int` | The number of times that this resource has been updated. |

#### Example: Load

```haskell
  ent <- Sdk.client sdk VNoval
  match <- jo [("id", VStr "client_id")]
  ctrl <- emptyMap
  client <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  clientData <- Sdk.eDataGet client
```

#### Example: List

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  clients <- Sdk.eList ent match ctrl
  clientDatas <- mapM Sdk.eDataGet clients
```

#### Example: Create

```haskell
  ent <- Sdk.client sdk VNoval
  d <- jo
    [ ("contact_email", VStr "example_contact_email")   -- String
    , ("contact_first_name", VStr "example_contact_first_name")   -- String
    , ("contact_is_active", VBool True)   -- Bool
    , ("contact_last_name", VStr "example_contact_last_name")   -- String
    , ("contact_phone", VStr "example_contact_phone")   -- String
    , ("contact_send_welcome_email", VBool True)   -- Bool
    , ("contact_user_name", VStr "example_contact_user_name")   -- String
    , ("contact_user_role", VStr "example_contact_user_role")   -- String
    , ("direct_partner_id", VNum 1)   -- Int
    , ("direct_partner_name", VStr "example_direct_partner_name")   -- String
    , ("is_active", VBool True)   -- Bool
    , ("name", VStr "example_name")   -- String
    ]
  ctrl <- emptyMap
  client <- Sdk.eCreate ent d ctrl
  clientData <- Sdk.eDataGet client
```


### Clone

Create an instance: `clone <- Sdk.clone sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Int` | Unique identifier of newly added element. |
| `name` | `String` | Name of Template |

#### Example: Create

```haskell
  ent <- Sdk.clone sdk VNoval
  d <- jo
    [ ("template_id", VStr "example_template_id")   -- String
    ]
  ctrl <- emptyMap
  clone <- Sdk.eCreate ent d ctrl
  cloneData <- Sdk.eDataGet clone
```


### Partner

Create an instance: `partner <- Sdk.partner sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` | The Partner's billing identifier. |
| `contact` | `Value` |  |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `id` | `Int` | This resource's unique identifier. |
| `isActive` | `Bool` | This property indicates if the Parter account is active or disabled. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Partner's name. |
| `parent` | `Value` | Reference to the associated Partner. |
| `reference` | `String` | The Partner's reference string. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `Int` | The number of times that this resource has been updated. |

#### Example: Load

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- jo [("id", VStr "partner_id")]
  ctrl <- emptyMap
  partner <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  partnerData <- Sdk.eDataGet partner
```

#### Example: List

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  partners <- Sdk.eList ent match ctrl
  partnerDatas <- mapM Sdk.eDataGet partners
```

#### Example: Create

```haskell
  ent <- Sdk.partner sdk VNoval
  d <- jo
    [ ("billing_id", VStr "example_billing_id")   -- String
    , ("contact_email", VStr "example_contact_email")   -- String
    , ("contact_first_name", VStr "example_contact_first_name")   -- String
    , ("contact_is_active", VBool True)   -- Bool
    , ("contact_last_name", VStr "example_contact_last_name")   -- String
    , ("contact_phone", VStr "example_contact_phone")   -- String
    , ("contact_send_welcome_email", VBool True)   -- Bool
    , ("contact_user_name", VStr "example_contact_user_name")   -- String
    , ("contact_user_role", VStr "example_contact_user_role")   -- String
    , ("is_active", VBool True)   -- Bool
    , ("name", VStr "example_name")   -- String
    , ("reference", VStr "example_reference")   -- String
    ]
  ctrl <- emptyMap
  partner <- Sdk.eCreate ent d ctrl
  partnerData <- Sdk.eDataGet partner
```


### Template

Create an instance: `template <- Sdk.template sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `eRemove ent match ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `accessMode` | `Value` | The Template's access mode. |
| `active` | `Bool` | This property indicates if the Template is active or inactive. |
| `client` | `Value` | Reference to the associated Client resource. |
| `fieldTemplates` | `[Value]` | Field Template list items |
| `id` | `Int` | Unique identifier of newly added element. |
| `name` | `String` | The Template's name. |
| `options` | `Value` |  |
| `partner` | `Value` | Reference to the associated Partner. |
| `reference` | `String` | The Template's unique reference. |
| `type` | `String` | The Template's type. |
| `version` | `Int` | The number of times that this resource has been updated. |

#### Example: Load

```haskell
  ent <- Sdk.template sdk VNoval
  match <- jo [("id", VStr "template_id")]
  ctrl <- emptyMap
  template <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  templateData <- Sdk.eDataGet template
```

#### Example: List

```haskell
  ent <- Sdk.template sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  templates <- Sdk.eList ent match ctrl
  templateDatas <- mapM Sdk.eDataGet templates
```

#### Example: Create

```haskell
  ent <- Sdk.template sdk VNoval
  d <- jo
    [ ("active", VBool True)   -- Bool
    , ("client_id", VNum 1)   -- Int
    , ("client_name", VStr "example_client_name")   -- String
    , ("name", VStr "example_name")   -- String
    , ("partner_id", VNum 1)   -- Int
    , ("partner_name", VStr "example_partner_name")   -- String
    , ("reference", VStr "example_reference")   -- String
    ]
  ctrl <- emptyMap
  template <- Sdk.eCreate ent d ctrl
  templateData <- Sdk.eDataGet template
```


### Transaction

Create an instance: `transaction <- Sdk.transaction sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `String` | BFID |
| `client` | `Value` | Reference to the associated Client resource. |
| `completeDate` | `String` | Timestamp from the beginning of the transaction. |
| `directPartner` | `Value` | Reference to the associated Partner. |
| `errCode` | `String` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `Int` | This resource's unique identifier. |
| `ipAddress` | `String` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String` | Message ID. |
| `partner` | `Value` | Reference to the associated Partner. |
| `reference` | `String` | The reference property that the Client includes in the decrypt API call. |
| `success` | `Bool` | The success indicator. |
| `templateId` | `String` | The Template's unique identifier. |

#### Example: Load

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- jo [("id", VStr "transaction_id")]
  ctrl <- emptyMap
  transaction <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  transactionData <- Sdk.eDataGet transaction
```

#### Example: List

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  transactions <- Sdk.eList ent match ctrl
  transactionDatas <- mapM Sdk.eDataGet transactions
```


### UpdateResult

Create an instance: `update_result <- Sdk.update_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eUpdate ent data ctrl` | Update an existing entity. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` | The Partner's billing identifier. |
| `client` | `Value` | Reference to the associated Client resource. |
| `contact` | `Value` |  |
| `directPartner` | `Value` | Reference to the associated Partner. |
| `email` | `String` | The User's email address. |
| `firstName` | `String` | The User's name. |
| `id` | `Int` | Unique identifier of newly added element. |
| `isActive` | `Bool` | This property indicates if the User account is active or disabled. |
| `lastName` | `String` | The User's Surname. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | The Partner's name. |
| `parent` | `Value` | Reference to the associated Partner. |
| `partner` | `Value` | Reference to the associated Partner. |
| `phone` | `String` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String` | The Partner's reference string. |
| `sendWelcomeEmail` | `Bool` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String` | The User's unique username. |
| `userRole` | `Value` | Reference to the associated User Role. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `Int` | The number of times that this resource has been updated. |

#### Example: List

```haskell
  ent <- Sdk.update_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  update_results <- Sdk.eList ent match ctrl
  update_resultDatas <- mapM Sdk.eDataGet update_results
```

#### Example: Create

```haskell
  ent <- Sdk.update_result sdk VNoval
  d <- jo
    [ ("email", VStr "example_email")   -- String
    , ("first_name", VStr "example_first_name")   -- String
    , ("is_active", VBool True)   -- Bool
    , ("last_name", VStr "example_last_name")   -- String
    , ("phone", VNum 1)   -- Int
    , ("send_welcome_email", VBool True)   -- Bool
    , ("user_role", VNoval)   -- Value
    , ("username", VStr "example_username")   -- String
    , ("contact", VNoval)   -- Value
    , ("firstName", VStr "example_firstName")   -- String
    , ("lastName", VStr "example_lastName")   -- String
    , ("userName", VStr "example_userName")   -- String
    , ("userRole", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  update_result <- Sdk.eCreate ent d ctrl
  update_resultData <- Sdk.eDataGet update_result
```


### User

Create an instance: `user <- Sdk.user sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `Int` | This resource's unique identifier. |
| `isActive` | `Bool` |  |
| `lastName` | `String` |  |
| `modified` | `String` | Last modified timestamp. |
| `partner` | `Value` | Reference to the associated Partner. |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Value` | Reference to the associated User Role. |
| `version` | `Int` | The number of times that this resource has been updated. |

#### Example: Load

```haskell
  ent <- Sdk.user sdk VNoval
  match <- jo [("id", VStr "user_id")]
  ctrl <- emptyMap
  user <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  userData <- Sdk.eDataGet user
```

## Features

This SDK ships 12 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Structured audit trail of operations |
| [`clienttrack`](#clienttrack) | Client identity and per-request correlation headers |
| [`debug`](#debug) | Request/response capture ring buffer for debugging |
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

### debug

Request/response capture ring buffer for debugging.

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

Set `feature.debug.active` to enable it, then override any of the options above.

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
- **DebugFeature**: Request/response capture ring buffer for debugging
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
