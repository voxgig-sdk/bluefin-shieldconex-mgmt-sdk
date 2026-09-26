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

`load()` returns the ENTITY — call data_get for the record — and dies on error.

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
# Create — returns the ENTITY (call data_get for the record)
my $created = $client->Client->create({ 'contact_email' => 'example_contact_email', 'contact_first_name' => 'example_contact_first_name', 'contact_is_active' => 1, 'contact_last_name' => 'example_contact_last_name', 'contact_phone' => 'example_contact_phone', 'contact_send_welcome_email' => 1, 'contact_user_name' => 'example_contact_user_name', 'contact_user_role' => 'example_contact_user_role', 'direct_partner_id' => 1, 'direct_partner_name' => 'example_direct_partner_name', 'is_active' => 1, 'name' => 'example_name' });

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

# Entity ops return the ENTITY and dies on error;
# call data_get for the record.
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

Entity operations return the ENTITY (call data_get for the record) (a `hashref` for single-entity
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
| `billingId` | `string` | Billing ID |
| `contact` | `hashref` |  |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `hashref` | Reference to the associated Partner. |
| `id` | `integer` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the Client account is active or disabled. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Client's name. |
| `partner` | `hashref` | Reference to the associated Partner. |
| `version` | `integer` | The number of times that this resource has been updated. |

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
    'contact_email' => 'example_contact_email',  # string
    'contact_first_name' => 'example_contact_first_name',  # string
    'contact_is_active' => 1,  # boolean
    'contact_last_name' => 'example_contact_last_name',  # string
    'contact_phone' => 'example_contact_phone',  # string
    'contact_send_welcome_email' => 1,  # boolean
    'contact_user_name' => 'example_contact_user_name',  # string
    'contact_user_role' => 'example_contact_user_role',  # string
    'direct_partner_id' => 1,  # integer
    'direct_partner_name' => 'example_direct_partner_name',  # string
    'is_active' => 1,  # boolean
    'name' => 'example_name',  # string
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
| `id` | `integer` | Unique identifier of newly added element. |
| `name` | `string` | Name of Template |

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
| `billingId` | `string` | The Partner's billing identifier. |
| `contact` | `hashref` |  |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `integer` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the Parter account is active or disabled. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Partner's name. |
| `parent` | `hashref` | Reference to the associated Partner. |
| `reference` | `string` | The Partner's reference string. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `integer` | The number of times that this resource has been updated. |

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
    'billing_id' => 'example_billing_id',  # string
    'contact_email' => 'example_contact_email',  # string
    'contact_first_name' => 'example_contact_first_name',  # string
    'contact_is_active' => 1,  # boolean
    'contact_last_name' => 'example_contact_last_name',  # string
    'contact_phone' => 'example_contact_phone',  # string
    'contact_send_welcome_email' => 1,  # boolean
    'contact_user_name' => 'example_contact_user_name',  # string
    'contact_user_role' => 'example_contact_user_role',  # string
    'is_active' => 1,  # boolean
    'name' => 'example_name',  # string
    'reference' => 'example_reference',  # string
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
| `accessMode` | `scalar` | The Template's access mode. |
| `active` | `boolean` | This property indicates if the Template is active or inactive. |
| `client` | `hashref` | Reference to the associated Client resource. |
| `fieldTemplates` | `arrayref` | Field Template list items |
| `id` | `integer` | Unique identifier of newly added element. |
| `name` | `string` | The Template's name. |
| `options` | `hashref` |  |
| `partner` | `hashref` | Reference to the associated Partner. |
| `reference` | `string` | The Template's unique reference. |
| `type` | `string` | The Template's type. |
| `version` | `integer` | The number of times that this resource has been updated. |

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
    'active' => 1,  # boolean
    'client_id' => 1,  # integer
    'client_name' => 'example_client_name',  # string
    'name' => 'example_name',  # string
    'partner_id' => 1,  # integer
    'partner_name' => 'example_partner_name',  # string
    'reference' => 'example_reference',  # string
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
| `bfid` | `string` | BFID |
| `client` | `hashref` | Reference to the associated Client resource. |
| `completeDate` | `string` | Timestamp from the beginning of the transaction. |
| `directPartner` | `hashref` | Reference to the associated Partner. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `integer` | This resource's unique identifier. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `string` | Message ID. |
| `partner` | `hashref` | Reference to the associated Partner. |
| `reference` | `string` | The reference property that the Client includes in the decrypt API call. |
| `success` | `boolean` | The success indicator. |
| `templateId` | `string` | The Template's unique identifier. |

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
| `billingId` | `string` | The Partner's billing identifier. |
| `client` | `hashref` | Reference to the associated Client resource. |
| `contact` | `hashref` |  |
| `directPartner` | `hashref` | Reference to the associated Partner. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `integer` | Unique identifier of newly added element. |
| `isActive` | `boolean` | This property indicates if the User account is active or disabled. |
| `lastName` | `string` | The User's Surname. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | The Partner's name. |
| `parent` | `hashref` | Reference to the associated Partner. |
| `partner` | `hashref` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `string` | The Partner's reference string. |
| `sendWelcomeEmail` | `boolean` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `hashref` | Reference to the associated User Role. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: List

```perl
my $update_results = $client->UpdateResult->list;
```

#### Example: Create

```perl
my $update_result = $client->UpdateResult->create({
    'email' => 'example_email',  # string
    'first_name' => 'example_first_name',  # string
    'is_active' => 1,  # boolean
    'last_name' => 'example_last_name',  # string
    'phone' => 1,  # integer
    'send_welcome_email' => 1,  # boolean
    'user_role' => {},  # hashref
    'username' => 'example_username',  # string
    'contact' => {},  # hashref
    'firstName' => 'example_firstName',  # string
    'lastName' => 'example_lastName',  # string
    'userName' => 'example_userName',  # string
    'userRole' => {},  # hashref
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
| `client` | `hashref` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `integer` | This resource's unique identifier. |
| `isActive` | `boolean` |  |
| `lastName` | `string` |  |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `hashref` | Reference to the associated Partner. |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `hashref` | Reference to the associated User Role. |
| `version` | `integer` | The number of times that this resource has been updated. |

#### Example: Load

```perl
my $user = $client->User->load({ 'id' => 'user_id' });
```

## Features

This SDK ships 12 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Audit trail |
| [`clienttrack`](#clienttrack) | Client tracking |
| [`debug`](#debug) | Debug capture |
| [`idempotency`](#idempotency) | Idempotency |
| [`log`](#log) | Logging |
| [`metrics`](#metrics) | Metrics |
| [`paging`](#paging) | Paging |
| [`ratelimit`](#ratelimit) | Rate limiting |
| [`retry`](#retry) | Retry |
| [`telemetry`](#telemetry) | Telemetry |
| [`test`](#test) | Test transport |
| [`timeout`](#timeout) | Timeout |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### audit

Audit trail.

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Set `feature.audit.active` to enable it, then override any of the options above.

### clienttrack

Client tracking.

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Set `feature.clienttrack.active` to enable it, then override any of the options above.

### debug

Debug capture.

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

Set `feature.debug.active` to enable it, then override any of the options above.

### idempotency

Idempotency.

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Set `feature.idempotency.active` to enable it, then override any of the options above.

### log

Logging.

| Option | Default |
|---|---|
| `active` | `true` |

Set `feature.log.active` to enable it, then override any of the options above.

### metrics

Metrics.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.metrics.active` to enable it, then override any of the options above.

### paging

Paging.

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

Rate limiting.

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

Retry.

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

Telemetry.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.telemetry.active` to enable it, then override any of the options above.

### test

Test transport.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Timeout.

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

- **AuditFeature**: Audit trail
- **ClienttrackFeature**: Client tracking
- **DebugFeature**: Debug capture
- **IdempotencyFeature**: Idempotency
- **LogFeature**: Logging
- **MetricsFeature**: Metrics
- **PagingFeature**: Paging
- **RatelimitFeature**: Rate limiting
- **RetryFeature**: Retry
- **TelemetryFeature**: Telemetry
- **TestFeature**: Test transport
- **TimeoutFeature**: Timeout

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
├── schema.pm                    -- Generated option + entity specs
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
