# BluefinShieldconexMgmt Perl SDK



The Perl SDK for the BluefinShieldconexMgmt API — an entity-oriented client
following idiomatic Perl conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Client` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to CPAN. Install it from the GitHub
release tag (`perl/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)) or
from a source checkout.

The SDK is pure Perl with zero non-core runtime dependencies, so no build
step is required — just put its `lib` directory on `@INC`:

```perl
use lib 'lib';
use BluefinShieldconexMgmtSDK;
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```perl
use lib 'lib';
use BluefinShieldconexMgmtSDK;

my $client = BluefinShieldconexMgmtSDK->new({
    'apikey' => $ENV{'BLUEFIN_SHIELDCONEX_MGMT_APIKEY'},
});
```

### 2. List client records

`list()` returns an `arrayref` of records (each a `hashref`) and dies on
error — iterate it directly.

```perl
my $clients = eval { $client->Client->list };
if (my $err = $@) {
    print "list failed: $err\n";
}
else {
    for my $client (@$clients) {
        print "$client->{id}\n";
    }
}
```

### 3. Load a client

`load()` returns the bare record (a `hashref`) and dies on error.

```perl
my $client = eval { $client->Client->load({ 'id' => 'example_id' }) };
if (my $err = $@) {
    print "load failed: $err\n";
}
else {
    print "$client->{id}\n";
}
```

### 4. Create, update, and remove

```perl
# Create — returns the bare created record (a hashref)
my $created = $client->Client->create({ 'billing_id' => 'example_billing_id', 'contact' => {} });

# Remove
$client->Client->remove({ 'id' => $created->{id} });
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

```perl
my $result = $client->direct({
    'path' => '/api/resource/{id}',
    'method' => 'GET',
    'params' => { 'id' => 'example' },
});

if ($result->{ok}) {
    print $result->{status}, "\n";  # 200
    print $result->{data}, "\n";    # response body
}
else {
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read whichever is defined.
    print $result->{status}, ' ', ($result->{err} // ''), "\n";
}
```

### Prepare a request without sending it

```perl
# prepare() returns the fetch definition and dies on error.
my $fetchdef = $client->prepare({
    'path' => '/api/resource/{id}',
    'method' => 'DELETE',
    'params' => { 'id' => 'example' },
});

print $fetchdef->{url}, "\n";
print $fetchdef->{method}, "\n";
print $fetchdef->{headers}, "\n";
```

### Use test mode

Create a mock client for unit testing — no server required:

```perl
my $client = BluefinShieldconexMgmtSDK->test(undef, undef);

# Entity ops return the bare record and die on error.
my $partner = $client->Partner->list();
# $partner contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own coderef:

```perl
my $mock_fetch = sub {
    my ($url, $init) = @_;
    return ({
        'status' => 200,
        'statusText' => 'OK',
        'headers' => {},
        'json' => sub { { 'id' => 'mock01' } },
    }, undef);
};

my $client = BluefinShieldconexMgmtSDK->new({
    'base' => 'http://localhost:8080',
    'system' => { 'fetch' => $mock_fetch },
});
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd perl && prove -Ilib t/
```


## Reference

### BluefinShieldconexMgmtSDK

```perl
use lib 'lib';
use BluefinShieldconexMgmtSDK;

my $client = BluefinShieldconexMgmtSDK->new($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `hashref` | Feature activation flags. |
| `extend` | `arrayref` | Additional feature instances to load. |
| `system` | `hashref` | System overrides (e.g. custom `fetch` coderef). |

### test

```perl
my $client = BluefinShieldconexMgmtSDK->test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `undef`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> hashref` | Deep copy of current SDK options. |
| `get_utility` | `() -> utility` | Copy of the SDK utility object. |
| `prepare` | `($fetchargs) -> hashref` | Build an HTTP request definition without sending. Dies on error. |
| `direct` | `($fetchargs) -> hashref` | Build and send an HTTP request. Returns a result hashref (branch on `ok`). |
| `Client` | `($data) -> Client entity` | Create a Client entity instance. |
| `Clone` | `($data) -> Clone entity` | Create a Clone entity instance. |
| `Partner` | `($data) -> Partner entity` | Create a Partner entity instance. |
| `Template` | `($data) -> Template entity` | Create a Template entity instance. |
| `Transaction` | `($data) -> Transaction entity` | Create a Transaction entity instance. |
| `UpdateResult` | `($data) -> UpdateResult entity` | Create an UpdateResult entity instance. |
| `User` | `($data) -> User entity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl) -> hashref` | Load a single entity by match criteria. Dies on error. |
| `list` | `($reqmatch, $ctrl) -> arrayref` | List entities matching the criteria. Dies on error. |
| `create` | `($reqdata, $ctrl) -> hashref` | Create a new entity. Dies on error. |
| `update` | `($reqdata, $ctrl) -> hashref` | Update an existing entity. Dies on error. |
| `remove` | `($reqmatch, $ctrl) -> hashref` | Remove an entity. Dies on error. |
| `data_get` | `() -> hashref` | Get entity data. |
| `data_set` | `($data)` | Set entity data. |
| `match_get` | `() -> hashref` | Get entity match criteria. |
| `match_set` | `($match)` | Set entity match criteria. |
| `make` | `() -> entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `hashref` for single-entity
ops, an `arrayref` for `list`) and die on error. Wrap calls in
`eval { ... }` and inspect `$@` to handle failures.

The `direct()` escape hatch never dies — it returns a result `hashref`
you branch on via `$result->{ok}`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean` | True if the HTTP status is 2xx. |
| `status` | `integer` | HTTP status code. |
| `headers` | `hashref` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is false and `err` contains the error value.

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

Create an instance: `my $client = $client->Client;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `hashref` |  |
| `created` | `string` |  |
| `direct_partner` | `hashref` |  |
| `id` | `integer` |  |
| `is_active` | `boolean` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `hashref` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $client = $client->Client->load({ 'id' => 'client_id' });
```

#### Example: List

```perl
my $clients = $client->Client->list;
```

#### Example: Create

```perl
my $client = $client->Client->create({
});
```


### Clone

Create an instance: `my $clone = $client->Clone;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `integer` |  |
| `name` | `string` |  |

#### Example: Create

```perl
my $clone = $client->Clone->create({
    'template_id' => 'example_template_id',  # string
});
```


### Partner

Create an instance: `my $partner = $client->Partner;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `hashref` |  |
| `created` | `string` |  |
| `id` | `integer` |  |
| `is_active` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `hashref` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $partner = $client->Partner->load({ 'id' => 'partner_id' });
```

#### Example: List

```perl
my $partners = $client->Partner->list;
```

#### Example: Create

```perl
my $partner = $client->Partner->create({
});
```


### Template

Create an instance: `my $template = $client->Template;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `scalar` |  |
| `active` | `boolean` |  |
| `client` | `hashref` |  |
| `field_template` | `arrayref` |  |
| `id` | `integer` |  |
| `name` | `string` |  |
| `option` | `hashref` |  |
| `partner` | `hashref` |  |
| `reference` | `string` |  |
| `type` | `string` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $template = $client->Template->load({ 'id' => 'template_id' });
```

#### Example: List

```perl
my $templates = $client->Template->list;
```

#### Example: Create

```perl
my $template = $client->Template->create({
});
```


### Transaction

Create an instance: `my $transaction = $client->Transaction;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `string` |  |
| `client` | `hashref` |  |
| `complete_date` | `string` |  |
| `direct_partner` | `hashref` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `integer` |  |
| `ip_address` | `string` |  |
| `message_id` | `string` |  |
| `partner` | `hashref` |  |
| `reference` | `string` |  |
| `success` | `boolean` |  |
| `template_id` | `string` |  |

#### Example: Load

```perl
my $transaction = $client->Transaction->load({ 'id' => 'transaction_id' });
```

#### Example: List

```perl
my $transactions = $client->Transaction->list;
```


### UpdateResult

Create an instance: `my $update_result = $client->UpdateResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `update($data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client` | `hashref` |  |
| `contact` | `hashref` |  |
| `direct_partner` | `hashref` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `integer` |  |
| `is_active` | `boolean` |  |
| `last_name` | `string` |  |
| `mid` | `string` |  |
| `name` | `string` |  |
| `parent` | `hashref` |  |
| `partner` | `hashref` |  |
| `phone` | `string` |  |
| `reference` | `string` |  |
| `send_welcome_email` | `boolean` |  |
| `user_name` | `string` |  |
| `user_role` | `hashref` |  |
| `verification_phrase` | `string` |  |
| `version` | `integer` |  |

#### Example: List

```perl
my $update_results = $client->UpdateResult->list;
```

#### Example: Create

```perl
my $update_result = $client->UpdateResult->create({
    'contact' => {},  # hashref
    'email' => 'example_email',  # string
    'first_name' => 'example_first_name',  # string
    'last_name' => 'example_last_name',  # string
    'phone' => 'example_phone',  # string
    'user_name' => 'example_user_name',  # string
    'user_role' => {},  # hashref
});
```


### User

Create an instance: `my $user = $client->User;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `hashref` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `integer` |  |
| `is_active` | `boolean` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `hashref` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `hashref` |  |
| `version` | `integer` |  |

#### Example: Load

```perl
my $user = $client->User->load({ 'id' => 'user_id' });
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

### Data as hashrefs

The Perl SDK uses plain hashrefs and arrayrefs throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `BluefinShieldconexMgmtHelpers::to_map()` to safely validate that a value
is a hashref.

### Module structure

```
perl/
├── lib/BluefinShieldconexMgmtSDK.pm    -- Main SDK module (package BluefinShieldconexMgmtSDK)
├── config.pm                    -- Configuration
├── features.pm                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (base, test, log)
├── utility/                     -- Utility functions
├── lib/Voxgig/Struct.pm         -- Vendored struct library
└── t/                           -- Test suites
```

Load the main module with `use lib 'lib'; use BluefinShieldconexMgmtSDK;` — it
pulls in the config, features, and core modules for you. Require entity or
utility modules directly only when needed.

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
