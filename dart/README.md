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
      ref: dart/v0.1.1
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
  final client_s = await client.Client().list({ partner: "example" });
  for (final item in client_s) {
    print(item.data());
  }
} catch (err) {
  print('list failed: $err');
}
```

### 3. Load a client

`load()` returns the ENTITY — call data() for the record — and throws on error.

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
// Create — returns the ENTITY (call data() for the record)
final created = await client.Client().create({'contact_email': 'example_contact_email', 'contact_first_name': 'example_contact_first_name', 'contact_is_active': true, 'contact_last_name': 'example_contact_last_name', 'contact_phone': 'example_contact_phone', 'contact_send_welcome_email': true, 'contact_user_name': 'example_contact_user_name', 'contact_user_role': 'example_contact_user_role', 'direct_partner_id': 1, 'direct_partner_name': 'example_direct_partner_name', 'is_active': true, 'name': 'example_name'});

// Remove
await client.Client().remove({'id': created.data()['id']});
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

// Entity ops return the ENTITY and throws on error;
// call data() for the record.
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

Entity operations return the ENTITY (call data() for the record) (a `Map` for single-entity
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
| `billingId` | `String` | Billing ID |
| `contact` | `Map<String, dynamic>` |  |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Client's name. |
| `partner` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```dart
final client_ = await client.Client().load({'id': 'client_id'});
```

#### Example: List

```dart
final client_s = await client.Client().list({ partner: "example" });
```

#### Example: Create

```dart
final client_ = await client.Client().create({
  'contact_email': 'example_contact_email',  // String
  'contact_first_name': 'example_contact_first_name',  // String
  'contact_is_active': true,  // bool
  'contact_last_name': 'example_contact_last_name',  // String
  'contact_phone': 'example_contact_phone',  // String
  'contact_send_welcome_email': true,  // bool
  'contact_user_name': 'example_contact_user_name',  // String
  'contact_user_role': 'example_contact_user_role',  // String
  'direct_partner_id': 1,  // int
  'direct_partner_name': 'example_direct_partner_name',  // String
  'is_active': true,  // bool
  'name': 'example_name',  // String
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
| `id` | `int` | Unique identifier of newly added element. |
| `name` | `String` | Name of Template |

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
| `billingId` | `String` | The Partner's billing identifier. |
| `contact` | `Map<String, dynamic>` |  |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Partner's name. |
| `parent` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `reference` | `String` | The Partner's reference string. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `int` | The number of times that this resource has been updated. |

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
  'billing_id': 'example_billing_id',  // String
  'contact_email': 'example_contact_email',  // String
  'contact_first_name': 'example_contact_first_name',  // String
  'contact_is_active': true,  // bool
  'contact_last_name': 'example_contact_last_name',  // String
  'contact_phone': 'example_contact_phone',  // String
  'contact_send_welcome_email': true,  // bool
  'contact_user_name': 'example_contact_user_name',  // String
  'contact_user_role': 'example_contact_user_role',  // String
  'is_active': true,  // bool
  'name': 'example_name',  // String
  'reference': 'example_reference',  // String
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
| `accessMode` | `dynamic` | The Template's access mode. |
| `active` | `bool` | This property indicates if the Template is active or inactive. |
| `client` | `Map<String, dynamic>` | Reference to the associated Client resource. |
| `fieldTemplates` | `List<dynamic>` | Field Template list items |
| `id` | `int` | Unique identifier of newly added element. |
| `name` | `String` | The Template's name. |
| `options` | `Map<String, dynamic>` |  |
| `partner` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `reference` | `String` | The Template's unique reference. |
| `type` | `String` | The Template's type. |
| `version` | `int` | The number of times that this resource has been updated. |

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
  'active': true,  // bool
  'client_id': 1,  // int
  'client_name': 'example_client_name',  // String
  'name': 'example_name',  // String
  'partner_id': 1,  // int
  'partner_name': 'example_partner_name',  // String
  'reference': 'example_reference',  // String
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
| `bfid` | `String` | BFID |
| `client` | `Map<String, dynamic>` | Reference to the associated Client resource. |
| `completeDate` | `String` | Timestamp from the beginning of the transaction. |
| `directPartner` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `errCode` | `String` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int` | This resource's unique identifier. |
| `ipAddress` | `String` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String` | Message ID. |
| `partner` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `reference` | `String` | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | The success indicator. |
| `templateId` | `String` | The Template's unique identifier. |

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
| `billingId` | `String` | The Partner's billing identifier. |
| `client` | `Map<String, dynamic>` | Reference to the associated Client resource. |
| `contact` | `Map<String, dynamic>` |  |
| `directPartner` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `email` | `String` | The User's email address. |
| `firstName` | `String` | The User's name. |
| `id` | `int` | Unique identifier of newly added element. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `lastName` | `String` | The User's Surname. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | The Partner's name. |
| `parent` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `partner` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `phone` | `String` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String` | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String` | The User's unique username. |
| `userRole` | `Map<String, dynamic>` | Reference to the associated User Role. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: List

```dart
final update_results = await client.UpdateResult().list();
```

#### Example: Create

```dart
final update_result = await client.UpdateResult().create({
  'email': 'example_email',  // String
  'first_name': 'example_first_name',  // String
  'is_active': true,  // bool
  'last_name': 'example_last_name',  // String
  'phone': 1,  // int
  'send_welcome_email': true,  // bool
  'user_role': <String, dynamic>{},  // Map<String, dynamic>
  'username': 'example_username',  // String
  'contact': <String, dynamic>{},  // Map<String, dynamic>
  'firstName': 'example_firstName',  // String
  'lastName': 'example_lastName',  // String
  'userName': 'example_userName',  // String
  'userRole': <String, dynamic>{},  // Map<String, dynamic>
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
| `client` | `Map<String, dynamic>` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` |  |
| `lastName` | `String` |  |
| `modified` | `String` | Last modified timestamp. |
| `partner` | `Map<String, dynamic>` | Reference to the associated Partner. |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Map<String, dynamic>` | Reference to the associated User Role. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```dart
final user = await client.User().load({'id': 'user_id'});
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
