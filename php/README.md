# BluefinShieldconexMgmt PHP SDK



The PHP SDK for the BluefinShieldconexMgmt API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Client()` — with named operations (`list`/`load`/`create`/`update`/`remove`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'bluefinshieldconexmgmt_sdk.php';

$client = new BluefinShieldconexMgmtSDK([
    "apikey" => getenv("BLUEFIN_SHIELDCONEX_MGMT_APIKEY"),
]);
```

### 2. List client records

```php
try {
    // list() returns an array of Client records — iterate directly.
    $clients = $client->Client()->list();
    foreach ($clients as $item) {
        echo $item["id"] . " " . $item["billing_id"] . "\n";
    }
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

### 3. Load a client

```php
try {
    // load() returns the bare Client record (throws on error).
    $client = $client->Client()->load(["id" => "example_id"]);
    print_r($client);
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

### 4. Create, update, and remove

```php
// create() returns the bare created Client record.
$created = $client->Client()->create(["billing_id" => "example_billing_id", "contact" => []]);

// Remove
$client->Client()->remove(["id" => $created["id"]]);
```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $partners = $client->Partner()->list();
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```php
$client = BluefinShieldconexMgmtSDK::test([
    "entity" => ["partner" => ["test01" => ["id" => "test01"]]],
]);

// Entity ops return the bare mock record (throws on error).
$partner = $client->Partner()->list();
print_r($partner);
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new BluefinShieldconexMgmtSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### BluefinShieldconexMgmtSDK

```php
require_once 'bluefinshieldconexmgmt_sdk.php';
$client = new BluefinShieldconexMgmtSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = BluefinShieldconexMgmtSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `Client` | `($data): ClientEntity` | Create a Client entity instance. |
| `Clone` | `($data): CloneEntity` | Create a Clone entity instance. |
| `Partner` | `($data): PartnerEntity` | Create a Partner entity instance. |
| `Template` | `($data): TemplateEntity` | Create a Template entity instance. |
| `Transaction` | `($data): TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `($data): UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User` | `($data): UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `(?array $reqmatch = null, $ctrl): array` | List entities matching the criteria (call with no argument to list all). |
| `create` | `($reqdata, $ctrl): array` | Create a new entity. |
| `update` | `($reqdata, $ctrl): array` | Update an existing entity. |
| `remove` | `($reqmatch, $ctrl): array` | Remove an entity. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

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

Create an instance: `$client = $client->Client();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `array` |  |
| `created` | `string` |  |
| `direct_partner` | `array` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `array` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the bare Client record (throws on error).
$client = $client->Client()->load(["id" => "client_id"]);
```

#### Example: List

```php
// list() returns an array of Client records (throws on error).
$clients = $client->Client()->list();
```

#### Example: Create

```php
$client = $client->Client()->create([
]);
```


### Clone

Create an instance: `$clone = $client->Clone();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: Create

```php
$clone = $client->Clone()->create([
    "template_id" => null, // string
]);
```


### Partner

Create an instance: `$partner = $client->Partner();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `array` |  |
| `created` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `array` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the bare Partner record (throws on error).
$partner = $client->Partner()->load(["id" => "partner_id"]);
```

#### Example: List

```php
// list() returns an array of Partner records (throws on error).
$partners = $client->Partner()->list();
```

#### Example: Create

```php
$partner = $client->Partner()->create([
]);
```


### Template

Create an instance: `$template = $client->Template();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `mixed` |  |
| `active` | `bool` |  |
| `client` | `array` |  |
| `field_template` | `array` |  |
| `id` | `int` |  |
| `name` | `string` |  |
| `option` | `array` |  |
| `partner` | `array` |  |
| `reference` | `string` |  |
| `type` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the bare Template record (throws on error).
$template = $client->Template()->load(["id" => "template_id"]);
```

#### Example: List

```php
// list() returns an array of Template records (throws on error).
$templates = $client->Template()->list();
```

#### Example: Create

```php
$template = $client->Template()->create([
]);
```


### Transaction

Create an instance: `$transaction = $client->Transaction();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `string` |  |
| `client` | `array` |  |
| `complete_date` | `string` |  |
| `direct_partner` | `array` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `int` |  |
| `ip_address` | `string` |  |
| `message_id` | `string` |  |
| `partner` | `array` |  |
| `reference` | `string` |  |
| `success` | `bool` |  |
| `template_id` | `string` |  |

#### Example: Load

```php
// load() returns the bare Transaction record (throws on error).
$transaction = $client->Transaction()->load(["id" => "transaction_id"]);
```

#### Example: List

```php
// list() returns an array of Transaction records (throws on error).
$transactions = $client->Transaction()->list();
```


### UpdateResult

Create an instance: `$update_result = $client->UpdateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client` | `array` |  |
| `contact` | `array` |  |
| `direct_partner` | `array` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `last_name` | `string` |  |
| `mid` | `string` |  |
| `name` | `string` |  |
| `parent` | `array` |  |
| `partner` | `array` |  |
| `phone` | `string` |  |
| `reference` | `string` |  |
| `send_welcome_email` | `bool` |  |
| `user_name` | `string` |  |
| `user_role` | `array` |  |
| `verification_phrase` | `string` |  |
| `version` | `int` |  |

#### Example: List

```php
// list() returns an array of UpdateResult records (throws on error).
$update_results = $client->UpdateResult()->list();
```

#### Example: Create

```php
$update_result = $client->UpdateResult()->create([
    "contact" => null, // array
    "email" => null, // string
    "first_name" => null, // string
    "last_name" => null, // string
    "phone" => null, // string
    "user_name" => null, // string
    "user_role" => null, // array
]);
```


### User

Create an instance: `$user = $client->User();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `array` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `array` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `array` |  |
| `version` | `int` |  |

#### Example: Load

```php
// load() returns the bare User record (throws on error).
$user = $client->User()->load(["id" => "user_id"]);
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

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── bluefinshieldconexmgmt_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`bluefinshieldconexmgmt_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```php
$partner = $client->Partner();
$partner->list();

// $partner->data_get() now returns the partner data from the last list
// $partner->match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
