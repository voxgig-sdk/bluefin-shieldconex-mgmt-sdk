# BluefinShieldconexMgmt Perl SDK Reference

Complete API reference for the BluefinShieldconexMgmt Perl SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```perl
use lib 'lib';
use BluefinShieldconexMgmtSDK;

my $client = BluefinShieldconexMgmtSDK->new($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `hashref` | SDK configuration options. |
| `$options->{apikey}` | `string` | API key for authentication. |
| `$options->{base}` | `string` | Base URL for API requests. |
| `$options->{prefix}` | `string` | URL prefix appended after base. |
| `$options->{suffix}` | `string` | URL suffix appended after path. |
| `$options->{headers}` | `hashref` | Custom headers for all requests. |
| `$options->{feature}` | `hashref` | Feature configuration. |
| `$options->{system}` | `hashref` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinShieldconexMgmtSDK->test($testopts, $sdkopts)`

Create a test client with mock features active. Both arguments may be `undef`.

```perl
my $client = BluefinShieldconexMgmtSDK->test();
```


### Instance Methods

#### `Client($data)`

Create a new `Client` entity instance. Pass `undef` for no initial data.

#### `Clone($data)`

Create a new `Clone` entity instance. Pass `undef` for no initial data.

#### `Partner($data)`

Create a new `Partner` entity instance. Pass `undef` for no initial data.

#### `Template($data)`

Create a new `Template` entity instance. Pass `undef` for no initial data.

#### `Transaction($data)`

Create a new `Transaction` entity instance. Pass `undef` for no initial data.

#### `UpdateResult($data)`

Create a new `UpdateResult` entity instance. Pass `undef` for no initial data.

#### `User($data)`

Create a new `User` entity instance. Pass `undef` for no initial data.

#### `options_map() -> hashref`

Return a deep copy of the current SDK options.

#### `get_utility() -> utility`

Return a copy of the SDK utility object.

#### `direct($fetchargs) -> hashref`

Make a direct HTTP request to any API endpoint. Returns a result `hashref` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never dies — branch on `$result->{ok}`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs->{path}` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs->{method}` | `string` | HTTP method (default: `'GET'`). |
| `$fetchargs->{params}` | `hashref` | Path parameter values. |
| `$fetchargs->{query}` | `hashref` | Query string parameters. |
| `$fetchargs->{headers}` | `hashref` | Request headers (merged with defaults). |
| `$fetchargs->{body}` | `any` | Request body (hashrefs are JSON-serialized). |

**Returns:** `hashref`

#### `prepare($fetchargs) -> hashref`

Prepare a fetch definition without sending. Returns the `fetchdef` and dies on error.


---

## Client entity

```perl
my $client = $client->Client;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `hashref` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `hashref` | No |  |
| `id` | `integer` | No |  |
| `is_active` | `boolean` | No |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `version` | `integer` | No |  |

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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Client->create({
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Client->list;
for my $client (@$results) {
    print "$client->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Client->load({ 'id' => 'client_id' });
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->Client->remove({ 'id' => 'client_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Client` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Clone entity

```perl
my $clone = $client->Clone;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `integer` | No |  |
| `name` | `string` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Clone->create({
    'template_id' => 'example_template_id',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Clone` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Partner entity

```perl
my $partner = $client->Partner;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `hashref` | No |  |
| `created` | `string` | No |  |
| `id` | `integer` | No |  |
| `is_active` | `boolean` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `hashref` | No |  |
| `reference` | `string` | No |  |
| `verification_phrase` | `string` | No |  |
| `version` | `integer` | No |  |

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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Partner->create({
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Partner->list;
for my $partner (@$results) {
    print "$partner->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Partner->load({ 'id' => 'partner_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Partner` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Template entity

```perl
my $template = $client->Template;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `scalar` | No |  |
| `active` | `boolean` | No |  |
| `client` | `hashref` | No |  |
| `field_template` | `arrayref` | No |  |
| `id` | `integer` | No |  |
| `name` | `string` | No |  |
| `option` | `hashref` | No |  |
| `partner` | `hashref` | No |  |
| `reference` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Template->create({
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Template->list;
for my $template (@$results) {
    print "$template->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Template->load({ 'id' => 'template_id' });
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->Template->remove({ 'id' => 'template_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Template` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Transaction entity

```perl
my $transaction = $client->Transaction;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `string` | No |  |
| `client` | `hashref` | No |  |
| `complete_date` | `string` | No |  |
| `direct_partner` | `hashref` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `integer` | No |  |
| `ip_address` | `string` | No |  |
| `message_id` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `reference` | `string` | No |  |
| `success` | `boolean` | No |  |
| `template_id` | `string` | No |  |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Transaction->list;
for my $transaction (@$results) {
    print "$transaction->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Transaction->load({ 'id' => 'transaction_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Transaction` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## UpdateResult entity

```perl
my $update_result = $client->UpdateResult;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client` | `hashref` | No |  |
| `contact` | `hashref` | Yes |  |
| `direct_partner` | `hashref` | No |  |
| `email` | `string` | Yes |  |
| `first_name` | `string` | Yes |  |
| `id` | `integer` | No |  |
| `is_active` | `boolean` | No |  |
| `last_name` | `string` | Yes |  |
| `mid` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `hashref` | No |  |
| `partner` | `hashref` | No |  |
| `phone` | `string` | Yes |  |
| `reference` | `string` | No |  |
| `send_welcome_email` | `boolean` | No |  |
| `user_name` | `string` | Yes |  |
| `user_role` | `hashref` | Yes |  |
| `verification_phrase` | `string` | No |  |
| `version` | `integer` | No |  |

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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->UpdateResult->create({
    'contact' => {},  # hashref
    'email' => 'example_email',  # string
    'first_name' => 'example_first_name',  # string
    'last_name' => 'example_last_name',  # string
    'phone' => 'example_phone',  # string
    'user_name' => 'example_user_name',  # string
    'user_role' => {},  # hashref
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->UpdateResult->list;
for my $update_result (@$results) {
    print "$update_result->{id}\n";
}
```

#### `update($reqdata, $ctrl) -> hashref`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and dies on error.

```perl
my $result = $client->UpdateResult->update({
    'id' => 'id',
    # Fields to update
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `UpdateResult` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## User entity

```perl
my $user = $client->User;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `hashref` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `integer` | No |  |
| `is_active` | `boolean` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `hashref` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `hashref` | No |  |
| `version` | `integer` | No |  |

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->User->load({ 'id' => 'user_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `User` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```perl
my $client = BluefinShieldconexMgmtSDK->new({
    'feature' => {
        'test' => { 'active' => 1 },
    },
});
```

