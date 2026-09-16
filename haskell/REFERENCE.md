# BluefinShieldconexMgmt Haskell SDK Reference

Complete API reference for the BluefinShieldconexMgmt Haskell SDK.


## Client

### Constructors

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo)

makeClient :: IO Sdk.Client
makeClient = do
  opts <- jo [("base", VStr "https://api.example.com")]
  Sdk.newSdk opts
```

Construct a live SDK client.

**Functions:**

| Function | Signature | Description |
| --- | --- | --- |
| `newSdk` | `Value -> IO Client` | Construct a client from an options map. |
| `newSdk0` | `IO Client` | Construct a client with defaults. |

**Options (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL for API requests. |
| `prefix` | `String` | URL prefix appended after base. |
| `suffix` | `String` | URL suffix appended after path. |
| `headers` | `Value` | Custom headers for all requests. |
| `feature` | `Value` | Feature configuration. |
| `system` | `Value` | System overrides (e.g. custom fetch). |


### Test constructors

```haskell
client <- Sdk.testSdk0
```

`testSdk :: Value -> Value -> IO Client` constructs a test client with mock
features active (`testSdk0 :: IO Client` for the no-argument form). Pass
`VNoval` for defaults.


### Entity accessors

#### `client :: Client -> Value -> IO Entity`

Construct a `Client` entity bound to the client. Pass `VNoval` for no initial options.

#### `clone :: Client -> Value -> IO Entity`

Construct a `Clone` entity bound to the client. Pass `VNoval` for no initial options.

#### `partner :: Client -> Value -> IO Entity`

Construct a `Partner` entity bound to the client. Pass `VNoval` for no initial options.

#### `template :: Client -> Value -> IO Entity`

Construct a `Template` entity bound to the client. Pass `VNoval` for no initial options.

#### `transaction :: Client -> Value -> IO Entity`

Construct a `Transaction` entity bound to the client. Pass `VNoval` for no initial options.

#### `update_result :: Client -> Value -> IO Entity`

Construct a `UpdateResult` entity bound to the client. Pass `VNoval` for no initial options.

#### `user :: Client -> Value -> IO Entity`

Construct a `User` entity bound to the client. Pass `VNoval` for no initial options.

### HTTP escape hatches

#### `direct :: Client -> Value -> IO Value` (module `SdkFeatures`)

Make a direct HTTP request to any API endpoint. Returns a result `Value` with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `getp result "ok"`.

**Argument (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String` | URL path with optional `{param}` placeholders. |
| `method` | `String` | HTTP method (default: `"GET"`). |
| `params` | `Value` | Path parameter values. |
| `query` | `Value` | Query string parameters. |
| `headers` | `Value` | Request headers (merged with defaults). |
| `body` | `Value` | Request body (maps are JSON-serialized). |

#### `prepare :: Client -> Value -> IO Value` (module `SdkFeatures`)

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Client

```haskell
  ent <- Sdk.client sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No | Billing ID |
| `contact` | `Value` | No |  |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Value` | No | Reference to the associated Partner. |
| `id` | `Int` | No | This resource's unique identifier. |
| `isActive` | `Bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Client's name. |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

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

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- jo [("id", VStr "client_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`eDeleted`); it keeps the data it held. Raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- jo [("id", VStr "client_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Client` entity with the same options.

#### `eName :: String`

The entity name.


---

## Clone

```haskell
  ent <- Sdk.clone sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Int` | No | Unique identifier of newly added element. |
| `name` | `String` | No | Name of Template |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.clone sdk VNoval
  d <- jo
    [ ("template_id", VStr "example_template_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Clone` entity with the same options.

#### `eName :: String`

The entity name.


---

## Partner

```haskell
  ent <- Sdk.partner sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No | The Partner's billing identifier. |
| `contact` | `Value` | No |  |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `Int` | No | This resource's unique identifier. |
| `isActive` | `Bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `Value` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The Partner's reference string. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

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

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- jo [("id", VStr "partner_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Partner` entity with the same options.

#### `eName :: String`

The entity name.


---

## Template

```haskell
  ent <- Sdk.template sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `accessMode` | `Value` | No | The Template's access mode. |
| `active` | `Bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `Value` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `[Value]` | No | Field Template list items |
| `id` | `Int` | No | Unique identifier of newly added element. |
| `name` | `String` | No | The Template's name. |
| `options` | `Value` | No |  |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The Template's unique reference. |
| `type` | `String` | No | The Template's type. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.template sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.template sdk VNoval
  match <- jo [("id", VStr "template_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`eDeleted`); it keeps the data it held. Raises on error.

```haskell
  ent <- Sdk.template sdk VNoval
  match <- jo [("id", VStr "template_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Template` entity with the same options.

#### `eName :: String`

The entity name.


---

## Transaction

```haskell
  ent <- Sdk.transaction sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `String` | No | BFID |
| `client` | `Value` | No | Reference to the associated Client resource. |
| `completeDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `Value` | No | Reference to the associated Partner. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `Int` | No | This resource's unique identifier. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String` | No | Message ID. |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `Bool` | No | The success indicator. |
| `templateId` | `String` | No | The Template's unique identifier. |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- jo [("id", VStr "transaction_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Transaction` entity with the same options.

#### `eName :: String`

The entity name.


---

## UpdateResult

```haskell
  ent <- Sdk.update_result sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No | The Partner's billing identifier. |
| `client` | `Value` | No | Reference to the associated Client resource. |
| `contact` | `Value` | Yes |  |
| `directPartner` | `Value` | No | Reference to the associated Partner. |
| `email` | `String` | Yes | The User's email address. |
| `firstName` | `String` | Yes | The User's name. |
| `id` | `Int` | No | Unique identifier of newly added element. |
| `isActive` | `Bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `String` | Yes | The User's Surname. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `Value` | No | Reference to the associated Partner. |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `phone` | `String` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `Bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String` | Yes | The User's unique username. |
| `userRole` | `Value` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

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

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.update_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eUpdate ent data ctrl :: IO Entity`

Update an existing entity. The data must include the entity `id`. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.update_result sdk VNoval
  d <- jo
    [ ("id", VStr "id")
    ]  -- fields to update
  ctrl <- emptyMap
  result <- Sdk.eUpdate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `UpdateResult` entity with the same options.

#### `eName :: String`

The entity name.


---

## User

```haskell
  ent <- Sdk.user sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Value` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `Int` | No | This resource's unique identifier. |
| `isActive` | `Bool` | No |  |
| `lastName` | `String` | No |  |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `Value` | No | Reference to the associated User Role. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.user sdk VNoval
  match <- jo [("id", VStr "user_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `User` entity with the same options.

#### `eName :: String`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
| `debug` | 0.0.1 | Request/response capture ring buffer for debugging |
| `idempotency` | 0.0.1 | Idempotency keys for safe retries of mutating operations |
| `log` | 0.0.1 | Structured request and response logging |
| `metrics` | 0.0.1 | Statistics capture: per-operation counters and latency |
| `paging` | 0.0.1 | Pagination signals for list operations |
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `telemetry` | 0.0.1 | Distributed tracing spans with W3C trace-context propagation |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```haskell
  active <- jo [("active", VBool True)]
  featureCfg <- jo
    [ ("audit", active)
    , ("clienttrack", active)
    , ("debug", active)
    , ("idempotency", active)
    , ("log", active)
    , ("metrics", active)
    , ("paging", active)
    , ("ratelimit", active)
    , ("retry", active)
    , ("telemetry", active)
    , ("test", active)
    , ("timeout", active)
    ]
  opts <- jo [("feature", featureCfg)]
  client <- Sdk.newSdk opts
```

