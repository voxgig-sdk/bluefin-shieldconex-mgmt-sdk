# BluefinShieldconexMgmt PHP SDK Reference

Complete API reference for the BluefinShieldconexMgmt PHP SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```php
require_once __DIR__ . '/bluefinshieldconexmgmt_sdk.php';

$client = new BluefinShieldconexMgmtSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinShieldconexMgmtSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = BluefinShieldconexMgmtSDK::test();
```


### Instance Methods

#### `Client($data = null)`

Create a new `ClientEntity` instance. Pass `null` for no initial data.

#### `Clone($data = null)`

Create a new `CloneEntity` instance. Pass `null` for no initial data.

#### `Partner($data = null)`

Create a new `PartnerEntity` instance. Pass `null` for no initial data.

#### `Template($data = null)`

Create a new `TemplateEntity` instance. Pass `null` for no initial data.

#### `Transaction($data = null)`

Create a new `TransactionEntity` instance. Pass `null` for no initial data.

#### `UpdateResult($data = null)`

Create a new `UpdateResultEntity` instance. Pass `null` for no initial data.

#### `User($data = null)`

Create a new `UserEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): BluefinShieldconexMgmtUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## ClientEntity

```php
$client = $client->Client();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `array` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `array` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `array` | No |  |
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Client()->create([
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Client()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Client()->load(["id" => "client_id"]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->Client()->remove(["id" => "client_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ClientEntity`

Create a new `ClientEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## CloneEntity

```php
$clone = $client->Clone();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `string` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Clone()->create([
  "template_id" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): CloneEntity`

Create a new `CloneEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PartnerEntity

```php
$partner = $client->Partner();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `array` | No |  |
| `created` | `string` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `array` | No |  |
| `reference` | `string` | No |  |
| `verification_phrase` | `string` | No |  |
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Partner()->create([
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Partner()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Partner()->load(["id" => "partner_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PartnerEntity`

Create a new `PartnerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TemplateEntity

```php
$template = $client->Template();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `mixed` | No |  |
| `active` | `bool` | No |  |
| `client` | `array` | No |  |
| `field_template` | `array` | No |  |
| `id` | `int` | No |  |
| `name` | `string` | No |  |
| `option` | `array` | No |  |
| `partner` | `array` | No |  |
| `reference` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Template()->create([
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Template()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Template()->load(["id" => "template_id"]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->Template()->remove(["id" => "template_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TemplateEntity`

Create a new `TemplateEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TransactionEntity

```php
$transaction = $client->Transaction();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `string` | No |  |
| `client` | `array` | No |  |
| `complete_date` | `string` | No |  |
| `direct_partner` | `array` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `int` | No |  |
| `ip_address` | `string` | No |  |
| `message_id` | `string` | No |  |
| `partner` | `array` | No |  |
| `reference` | `string` | No |  |
| `success` | `bool` | No |  |
| `template_id` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Transaction()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Transaction()->load(["id" => "transaction_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TransactionEntity`

Create a new `TransactionEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## UpdateResultEntity

```php
$update_result = $client->UpdateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client` | `array` | No |  |
| `contact` | `array` | Yes |  |
| `direct_partner` | `array` | No |  |
| `email` | `string` | Yes |  |
| `first_name` | `string` | Yes |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `string` | Yes |  |
| `mid` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `array` | No |  |
| `partner` | `array` | No |  |
| `phone` | `string` | Yes |  |
| `reference` | `string` | No |  |
| `send_welcome_email` | `bool` | No |  |
| `user_name` | `string` | Yes |  |
| `user_role` | `array` | Yes |  |
| `verification_phrase` | `string` | No |  |
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->UpdateResult()->create([
  "contact" => null, // array
  "email" => null, // string
  "first_name" => null, // string
  "last_name" => null, // string
  "phone" => null, // string
  "user_name" => null, // string
  "user_role" => null, // array
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->UpdateResult()->list();
```

#### `update(array $reqdata, ?array $ctrl = null): mixed`

Update an existing entity. The data must include the entity `id`. Throws on error.

```php
$result = $client->UpdateResult()->update([
  "id" => "id",
  // Fields to update
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): UpdateResultEntity`

Create a new `UpdateResultEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## UserEntity

```php
$user = $client->User();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `array` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `array` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `array` | No |  |
| `version` | `int` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->User()->load(["id" => "user_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): UserEntity`

Create a new `UserEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new BluefinShieldconexMgmtSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

