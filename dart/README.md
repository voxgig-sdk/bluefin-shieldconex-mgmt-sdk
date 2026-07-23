# BluefinShieldconexMgmt Dart SDK



The Dart SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic Dart conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Client()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to pub.dev. Add it as a git
dependency (pinned to a release tag `dart/vX.Y.Z`, see
[Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)) in your `pubspec.yaml`:

```yaml
dependencies:
  bluefin_shieldconex_mgmt_sdk:
    git:
      url: https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk
      path: dart
      ref: dart/v0.0.1
```

Or depend on a local source checkout:

```yaml
dependencies:
  bluefin_shieldconex_mgmt_sdk:
    path: ../dart
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```dart
import 'dart:io';
import 'package:bluefin_shieldconex_mgmt_sdk/BluefinShieldconexMgmtSDK.dart';

final client = BluefinShieldconexMgmtSDK({
  'apikey': Platform.environment['BLUEFIN_SHIELDCONEX_MGMT_APIKEY'],
});
```

### 2. List client records

`list()` returns a `List` of entity instances and throws on error — iterate
it and read each record's data via `.data()`.

```dart
try {
  final client_s = await client.Client().list();
  for (final item in client_s) {
    print(item.data());
  }
} catch (err) {
  print('list failed: $err');
}
```

### 3. Load a client

`load()` returns the bare record (a `Map`) and throws on error.

```dart
try {
  final client_ = await client.Client().load({'id': 'example_id'});
  print(client_);
} catch (err) {
  print('load failed: $err');
}
```

### 4. Create, update, and remove

```dart
// Create — returns the bare created record (a Map)
final created = await client.Client().create({'billing_id': 'example_billing_id', 'contact': <String, dynamic>{}});

// Remove
await client.Client().remove({'id': created['id']});
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

```dart
final result = await client.direct({
  'path': '/api/resource/{id}',
  'method': 'GET',
  'params': {'id': 'example'},
});

if (true == result['ok']) {
  print(result['status']);  // 200
  print(result['data']);    // response body
} else {
  // A non-2xx response carries status + data (the error body); a
  // transport-level failure carries err instead. direct() never throws —
  // branch on result['ok'].
  print(result['status']);
  print(result['err']);
}
```

### Prepare a request without sending it

```dart
// prepare() returns the fetch definition (or an error value on failure).
final fetchdef = await client.prepare({
  'path': '/api/resource/{id}',
  'method': 'DELETE',
  'params': {'id': 'example'},
});

print(fetchdef['url']);
print(fetchdef['method']);
print(fetchdef['headers']);
```

### Use test mode

Create a mock client for unit testing — no server required:

```dart
final client = BluefinShieldconexMgmtSDK.test();

// Entity ops return the bare record and throw on error.
final partner = await client.Partner().list();
// partner contains the mock response record
print(partner);
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```dart
Future<dynamic> mockFetch(dynamic url, dynamic init) async {
  return {
    'status': 200,
    'statusText': 'OK',
    'headers': <String, dynamic>{},
    'json': () => {'id': 'mock01'},
  };
}

final client = BluefinShieldconexMgmtSDK({
  'base': 'http://localhost:8080',
  'system': {
    'fetch': mockFetch,
  },
});
```

### Run live tests

Set the live-mode environment variables:

```bash
export BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
export BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd dart && dart run test/main.dart
```


## Reference

### BluefinShieldconexMgmtSDK

```dart
import 'package:bluefin_shieldconex_mgmt_sdk/BluefinShieldconexMgmtSDK.dart';

final client = BluefinShieldconexMgmtSDK(options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### test

```dart
final client = BluefinShieldconexMgmtSDK.test(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options` | `() -> Map` | Deep copy of current SDK options. |
| `utility` | `() -> Utility` | The SDK utility object. |
| `prepare` | `([fetchargs]) -> Future` | Build an HTTP request definition without sending. Returns an error value on failure. |
| `direct` | `([fetchargs]) -> Future<Map>` | Build and send an HTTP request. Returns a result map (branch on `ok`); never throws. |
| `Client` | `([entopts]) -> ClientEntity` | Create a Client entity instance. |
| `Clone` | `([entopts]) -> CloneEntity` | Create a Clone entity instance. |
| `Partner` | `([entopts]) -> PartnerEntity` | Create a Partner entity instance. |
| `Template` | `([entopts]) -> TemplateEntity` | Create a Template entity instance. |
| `Transaction` | `([entopts]) -> TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `([entopts]) -> UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User` | `([entopts]) -> UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, [ctrl]) -> Future<dynamic>` | Load a single entity by match criteria. Throws on error. |
| `list` | `(reqmatch, [ctrl]) -> Future<List>` | List entities matching the criteria (a list of entity instances). Throws on error. |
| `create` | `(reqdata, [ctrl]) -> Future<dynamic>` | Create a new entity. Throws on error. |
| `update` | `(reqdata, [ctrl]) -> Future<dynamic>` | Update an existing entity. Throws on error. |
| `remove` | `(reqmatch, [ctrl]) -> Future<dynamic>` | Remove an entity. Throws on error. |
| `data` | `([d]) -> Map` | Get (or, with an argument, set) entity data. |
| `match` | `([m]) -> Map` | Get (or, with an argument, set) entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `entopts` | `() -> Map` | Return the entity options. |
| `Name` | `String` | The entity name (a public field). |

### Result shape

Entity operations return the bare result data (a `Map` for single-entity
ops, a `List` of entity instances for `list`) and throw on error. Wrap calls
in `try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `Map` you
branch on via `result['ok']`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `dynamic` | Parsed JSON response body. |

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

Create an instance: `final client_ = client.Client();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `contact` | `Map<String, dynamic>` |  |
| `created` | `String` |  |
| `direct_partner` | `Map<String, dynamic>` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `Map<String, dynamic>` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final client_ = await client.Client().load({'id': 'client_id'});
```

#### Example: List

```dart
final client_s = await client.Client().list();
```

#### Example: Create

```dart
final client_ = await client.Client().create({
});
```


### Clone

Create an instance: `final clone = client.Clone();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `String` |  |

#### Example: Create

```dart
final clone = await client.Clone().create({
  'template_id': 'example_template_id',  // String
});
```


### Partner

Create an instance: `final partner = client.Partner();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `contact` | `Map<String, dynamic>` |  |
| `created` | `String` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `Map<String, dynamic>` |  |
| `reference` | `String` |  |
| `verification_phrase` | `String` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final partner = await client.Partner().load({'id': 'partner_id'});
```

#### Example: List

```dart
final partners = await client.Partner().list();
```

#### Example: Create

```dart
final partner = await client.Partner().create({
});
```


### Template

Create an instance: `final template = client.Template();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `dynamic` |  |
| `active` | `bool` |  |
| `client` | `Map<String, dynamic>` |  |
| `field_template` | `List<dynamic>` |  |
| `id` | `int` |  |
| `name` | `String` |  |
| `option` | `Map<String, dynamic>` |  |
| `partner` | `Map<String, dynamic>` |  |
| `reference` | `String` |  |
| `type` | `String` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final template = await client.Template().load({'id': 'template_id'});
```

#### Example: List

```dart
final templates = await client.Template().list();
```

#### Example: Create

```dart
final template = await client.Template().create({
});
```


### Transaction

Create an instance: `final transaction = client.Transaction();`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `String` |  |
| `client` | `Map<String, dynamic>` |  |
| `complete_date` | `String` |  |
| `direct_partner` | `Map<String, dynamic>` |  |
| `err_code` | `String` |  |
| `err_message` | `String` |  |
| `id` | `int` |  |
| `ip_address` | `String` |  |
| `message_id` | `String` |  |
| `partner` | `Map<String, dynamic>` |  |
| `reference` | `String` |  |
| `success` | `bool` |  |
| `template_id` | `String` |  |

#### Example: Load

```dart
final transaction = await client.Transaction().load({'id': 'transaction_id'});
```

#### Example: List

```dart
final transactions = await client.Transaction().list();
```


### UpdateResult

Create an instance: `final update_result = client.UpdateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `client` | `Map<String, dynamic>` |  |
| `contact` | `Map<String, dynamic>` |  |
| `direct_partner` | `Map<String, dynamic>` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `last_name` | `String` |  |
| `mid` | `String` |  |
| `name` | `String` |  |
| `parent` | `Map<String, dynamic>` |  |
| `partner` | `Map<String, dynamic>` |  |
| `phone` | `String` |  |
| `reference` | `String` |  |
| `send_welcome_email` | `bool` |  |
| `user_name` | `String` |  |
| `user_role` | `Map<String, dynamic>` |  |
| `verification_phrase` | `String` |  |
| `version` | `int` |  |

#### Example: List

```dart
final update_results = await client.UpdateResult().list();
```

#### Example: Create

```dart
final update_result = await client.UpdateResult().create({
  'contact': <String, dynamic>{},  // Map<String, dynamic>
  'email': 'example_email',  // String
  'first_name': 'example_first_name',  // String
  'last_name': 'example_last_name',  // String
  'phone': 'example_phone',  // String
  'user_name': 'example_user_name',  // String
  'user_role': <String, dynamic>{},  // Map<String, dynamic>
});
```


### User

Create an instance: `final user = client.User();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Map<String, dynamic>` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `last_name` | `String` |  |
| `modified` | `String` |  |
| `partner` | `Map<String, dynamic>` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `Map<String, dynamic>` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final user = await client.User().load({'id': 'user_id'});
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

### Maps in, typed models alongside

The Dart SDK passes plain `Map<String, dynamic>` values through the
operation pipeline rather than requiring typed objects at every call. This
mirrors the dynamic nature of the API and keeps calls terse — a create is
just `create({'name': 'example'})`.

For a typed, documented view of each entity and operation, the generated
`BluefinShieldconexMgmtTypes.dart` provides a class per entity plus per-op request/match
classes (e.g. `BluefinShieldconexMgmt.fromMap(entity.data())` and `model.toMap()`), so you
can convert to and from those maps wherever you want compile-time structure.

### Package structure

```
dart/
├── lib/
│   ├── BluefinShieldconexMgmtSDK.dart          -- Main SDK library (exported entry point)
│   ├── BluefinShieldconexMgmtTypes.dart        -- Typed entity + request/match models
│   ├── BluefinShieldconexMgmtEntityBase.dart   -- Base class for entities
│   ├── BluefinShieldconexMgmtError.dart        -- SDK error type
│   ├── Config.dart              -- Configuration
│   ├── entity/                  -- Entity implementations
│   ├── feature/                 -- Built-in features (base, test, log, ...)
│   └── utility/                 -- Utility functions and vendored struct library
└── test/                        -- Test suites (dart run test/main.dart)
```

The main library (`BluefinShieldconexMgmtSDK.dart`) re-exports the SDK class, the typed
models, and every entity class, so a single
`import 'package:bluefin_shieldconex_mgmt_sdk/BluefinShieldconexMgmtSDK.dart';`
brings in everything you need.

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
