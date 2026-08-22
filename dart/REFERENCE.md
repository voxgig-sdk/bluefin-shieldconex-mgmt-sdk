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
| `billingId` | `String` | No | Billing ID |
| `contact` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Client's name. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `id` | `int` | No | Unique identifier of newly added element. |
| `name` | `String` | No | Name of Template |

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
| `billingId` | `String` | No | The Partner's billing identifier. |
| `contact` | `Map<String, dynamic>` | No |  |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The Partner's reference string. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `accessMode` | `dynamic` | No | The Template's access mode. |
| `active` | `bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `List<dynamic>` | No | Field Template list items |
| `id` | `int` | No | Unique identifier of newly added element. |
| `name` | `String` | No | The Template's name. |
| `options` | `Map<String, dynamic>` | No |  |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The Template's unique reference. |
| `type` | `String` | No | The Template's type. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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
| `bfid` | `String` | No | BFID |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `completeDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int` | No | This resource's unique identifier. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `String` | No | Message ID. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | No | The success indicator. |
| `templateId` | `String` | No | The Template's unique identifier. |

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
| `billingId` | `String` | No | The Partner's billing identifier. |
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `contact` | `Map<String, dynamic>` | Yes |  |
| `directPartner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `email` | `String` | Yes | The User's email address. |
| `firstName` | `String` | Yes | The User's name. |
| `id` | `int` | No | Unique identifier of newly added element. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `String` | Yes | The User's Surname. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `phone` | `String` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `String` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `String` | Yes | The User's unique username. |
| `userRole` | `Map<String, dynamic>` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.UpdateResult().create({
  'contact': <String, dynamic>{},  // Map<String, dynamic>
  'email': 'example_email',  // String
  'firstName': 'example_firstName',  // String
  'lastName': 'example_lastName',  // String
  'phone': 'example_phone',  // String
  'userName': 'example_userName',  // String
  'userRole': <String, dynamic>{},  // Map<String, dynamic>
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
| `client` | `Map<String, dynamic>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No |  |
| `lastName` | `String` | No |  |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Map<String, dynamic>` | No | Reference to the associated Partner. |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `Map<String, dynamic>` | No | Reference to the associated User Role. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

