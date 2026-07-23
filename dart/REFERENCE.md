# BluefinShieldconexMgmt Dart SDK Reference

Complete API reference for the BluefinShieldconexMgmt Dart SDK.

## BluefinShieldconexMgmtSDK

### Constructor

```dart
import 'package:bluefin_shieldconex_mgmt_sdk/BluefinShieldconexMgmtSDK.dart';

final client = BluefinShieldconexMgmtSDK(options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options['apikey']` | `String` | API key for authentication. |
| `options['base']` | `String` | Base URL for API requests. |
| `options['prefix']` | `String` | URL prefix appended after base. |
| `options['suffix']` | `String` | URL suffix appended after path. |
| `options['headers']` | `Map` | Custom headers for all requests. |
| `options['feature']` | `Map` | Feature configuration. |
| `options['system']` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinShieldconexMgmtSDK.test([testopts, sdkopts])`

Create a test client with mock features active. Both arguments may be `null`.

```dart
final client = BluefinShieldconexMgmtSDK.test();
```


### Instance Methods

#### `Client([entopts])`

Create a new `ClientEntity` instance. Pass no argument for no initial data.

#### `Clone([entopts])`

Create a new `CloneEntity` instance. Pass no argument for no initial data.

#### `Partner([entopts])`

Create a new `PartnerEntity` instance. Pass no argument for no initial data.

#### `Template([entopts])`

Create a new `TemplateEntity` instance. Pass no argument for no initial data.

#### `Transaction([entopts])`

Create a new `TransactionEntity` instance. Pass no argument for no initial data.

#### `UpdateResult([entopts])`

Create a new `UpdateResultEntity` instance. Pass no argument for no initial data.

#### `User([entopts])`

Create a new `UserEntity` instance. Pass no argument for no initial data.

#### `options() -> Map`

Return a deep copy of the current SDK options.

#### `utility() -> Utility`

Return the SDK utility object.

#### `direct([fetchargs]) -> Future<Map>`

Make a direct HTTP request to any API endpoint. Returns a result `Map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `result['ok']`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs['path']` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs['method']` | `String` | HTTP method (default: `'GET'`). |
| `fetchargs['params']` | `Map` | Path parameter values. |
| `fetchargs['query']` | `Map` | Query string parameters. |
| `fetchargs['headers']` | `Map` | Request headers (merged with defaults). |
| `fetchargs['body']` | `dynamic` | Request body (maps are JSON-serialized). |

**Returns:** `Future<Map>`

#### `prepare([fetchargs]) -> Future`

Prepare a fetch definition without sending. Returns the `fetchdef` (or an error value on failure).


---

## ClientEntity

```dart
final client_ = client.Client();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `contact` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No |  |
| `direct_partner` | `Map<String, dynamic>` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `version` | `int` | No |  |

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Client().create({
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Client().list();
for (final client_ in results) {
  print(client_.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.Client().load({'id': 'client_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

```dart
final result = await client.Client().remove({'id': 'client_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ClientEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## CloneEntity

```dart
final clone = client.Clone();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `String` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Clone().create({
  'template_id': 'example_template_id',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `CloneEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## PartnerEntity

```dart
final partner = client.Partner();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `contact` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Map<String, dynamic>` | No |  |
| `reference` | `String` | No |  |
| `verification_phrase` | `String` | No |  |
| `version` | `int` | No |  |

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Partner().create({
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Partner().list();
for (final partner in results) {
  print(partner.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.Partner().load({'id': 'partner_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `PartnerEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## TemplateEntity

```dart
final template = client.Template();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `dynamic` | No |  |
| `active` | `bool` | No |  |
| `client` | `Map<String, dynamic>` | No |  |
| `field_template` | `List<dynamic>` | No |  |
| `id` | `int` | No |  |
| `name` | `String` | No |  |
| `option` | `Map<String, dynamic>` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `reference` | `String` | No |  |
| `type` | `String` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Template().create({
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Template().list();
for (final template in results) {
  print(template.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.Template().load({'id': 'template_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

```dart
final result = await client.Template().remove({'id': 'template_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `TemplateEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## TransactionEntity

```dart
final transaction = client.Transaction();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `String` | No |  |
| `client` | `Map<String, dynamic>` | No |  |
| `complete_date` | `String` | No |  |
| `direct_partner` | `Map<String, dynamic>` | No |  |
| `err_code` | `String` | No |  |
| `err_message` | `String` | No |  |
| `id` | `int` | No |  |
| `ip_address` | `String` | No |  |
| `message_id` | `String` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `reference` | `String` | No |  |
| `success` | `bool` | No |  |
| `template_id` | `String` | No |  |

### Operations

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Transaction().list();
for (final transaction in results) {
  print(transaction.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.Transaction().load({'id': 'transaction_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `TransactionEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## UpdateResultEntity

```dart
final update_result = client.UpdateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String` | No |  |
| `client` | `Map<String, dynamic>` | No |  |
| `contact` | `Map<String, dynamic>` | Yes |  |
| `direct_partner` | `Map<String, dynamic>` | No |  |
| `email` | `String` | Yes |  |
| `first_name` | `String` | Yes |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `String` | Yes |  |
| `mid` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Map<String, dynamic>` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `phone` | `String` | Yes |  |
| `reference` | `String` | No |  |
| `send_welcome_email` | `bool` | No |  |
| `user_name` | `String` | Yes |  |
| `user_role` | `Map<String, dynamic>` | Yes |  |
| `verification_phrase` | `String` | No |  |
| `version` | `int` | No |  |

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.UpdateResult().create({
  'contact': <String, dynamic>{},  // Map<String, dynamic>
  'email': 'example_email',  // String
  'first_name': 'example_first_name',  // String
  'last_name': 'example_last_name',  // String
  'phone': 'example_phone',  // String
  'user_name': 'example_user_name',  // String
  'user_role': <String, dynamic>{},  // Map<String, dynamic>
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.UpdateResult().list();
for (final update_result in results) {
  print(update_result.data());
}
```

#### `update(reqdata, [ctrl]) -> Future<dynamic>`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```dart
final result = await client.UpdateResult().update({
  'id': 'id',
  // Fields to update
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `UpdateResultEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## UserEntity

```dart
final user = client.User();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Map<String, dynamic>` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `Map<String, dynamic>` | No |  |
| `version` | `int` | No |  |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.User().load({'id': 'user_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `UserEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```dart
final client = BluefinShieldconexMgmtSDK({
  'feature': {
    'test': {'active': true},
  },
});
```

