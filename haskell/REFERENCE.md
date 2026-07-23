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
| `billing_id` | `String` | No |  |
| `contact` | `Value` | No |  |
| `created` | `String` | No |  |
| `direct_partner` | `Value` | No |  |
| `id` | `Int` | No |  |
| `is_active` | `Bool` | No |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `Value` | No |  |
| `version` | `Int` | No |  |

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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- jo [("id", VStr "client_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Value`

Remove the entity matching the given criteria. Raises on error.

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
| `id` | `Int` | No |  |
| `name` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.clone sdk VNoval
  d <- jo
    [ ("template_id", VStr "example_template_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
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
| `billing_id` | `String` | No |  |
| `contact` | `Value` | No |  |
| `created` | `String` | No |  |
| `id` | `Int` | No |  |
| `is_active` | `Bool` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Value` | No |  |
| `reference` | `String` | No |  |
| `verification_phrase` | `String` | No |  |
| `version` | `Int` | No |  |

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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.partner sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

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
| `access_mode` | `Value` | No |  |
| `active` | `Bool` | No |  |
| `client` | `Value` | No |  |
| `field_template` | `[Value]` | No |  |
| `id` | `Int` | No |  |
| `name` | `String` | No |  |
| `option` | `Value` | No |  |
| `partner` | `Value` | No |  |
| `reference` | `String` | No |  |
| `type` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.template sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.template sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.template sdk VNoval
  match <- jo [("id", VStr "template_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Value`

Remove the entity matching the given criteria. Raises on error.

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
| `bfid` | `String` | No |  |
| `client` | `Value` | No |  |
| `complete_date` | `String` | No |  |
| `direct_partner` | `Value` | No |  |
| `err_code` | `String` | No |  |
| `err_message` | `String` | No |  |
| `id` | `Int` | No |  |
| `ip_address` | `String` | No |  |
| `message_id` | `String` | No |  |
| `partner` | `Value` | No |  |
| `reference` | `String` | No |  |
| `success` | `Bool` | No |  |
| `template_id` | `String` | No |  |

### Operations

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

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
| `billing_id` | `String` | No |  |
| `client` | `Value` | No |  |
| `contact` | `Value` | Yes |  |
| `direct_partner` | `Value` | No |  |
| `email` | `String` | Yes |  |
| `first_name` | `String` | Yes |  |
| `id` | `Int` | No |  |
| `is_active` | `Bool` | No |  |
| `last_name` | `String` | Yes |  |
| `mid` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Value` | No |  |
| `partner` | `Value` | No |  |
| `phone` | `String` | Yes |  |
| `reference` | `String` | No |  |
| `send_welcome_email` | `Bool` | No |  |
| `user_name` | `String` | Yes |  |
| `user_role` | `Value` | Yes |  |
| `verification_phrase` | `String` | No |  |
| `version` | `Int` | No |  |

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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

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
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.update_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

#### `eUpdate ent data ctrl :: IO Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```haskell
  ent <- Sdk.update_result sdk VNoval
  d <- jo
    [ ("id", VStr "id")
    ]  -- fields to update
  ctrl <- emptyMap
  result <- Sdk.eUpdate ent d ctrl
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
| `client` | `Value` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `Int` | No |  |
| `is_active` | `Bool` | No |  |
| `last_name` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Value` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `Value` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

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
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```haskell
  active <- jo [("active", VBool True)]
  featureCfg <- jo
    [ ("test", active)
    ]
  opts <- jo [("feature", featureCfg)]
  client <- Sdk.newSdk opts
```

