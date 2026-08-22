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
| `billingId` | `string` | No | Billing ID |
| `contact` | `hashref` | No |  |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `hashref` | No | Reference to the associated Partner. |
| `id` | `integer` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Client's name. |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

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
| `id` | `integer` | No | Unique identifier of newly added element. |
| `name` | `string` | No | Name of Template |

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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `contact` | `hashref` | No |  |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `integer` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `hashref` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The Partner's reference string. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

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
| `accessMode` | `scalar` | No | The Template's access mode. |
| `active` | `boolean` | No | This property indicates if the Template is active or inactive. |
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `arrayref` | No | Field Template list items |
| `id` | `integer` | No | Unique identifier of newly added element. |
| `name` | `string` | No | The Template's name. |
| `options` | `hashref` | No |  |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The Template's unique reference. |
| `type` | `string` | No | The Template's type. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

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
| `bfid` | `string` | No | BFID |
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `completeDate` | `string` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `hashref` | No | Reference to the associated Partner. |
| `errCode` | `string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `integer` | No | This resource's unique identifier. |
| `ipAddress` | `string` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `string` | No | Message ID. |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `boolean` | No | The success indicator. |
| `templateId` | `string` | No | The Template's unique identifier. |

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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `contact` | `hashref` | Yes |  |
| `directPartner` | `hashref` | No | Reference to the associated Partner. |
| `email` | `string` | Yes | The User's email address. |
| `firstName` | `string` | Yes | The User's name. |
| `id` | `integer` | No | Unique identifier of newly added element. |
| `isActive` | `boolean` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `string` | Yes | The User's Surname. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `hashref` | No | Reference to the associated Partner. |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `phone` | `string` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `string` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `boolean` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `string` | Yes | The User's unique username. |
| `userRole` | `hashref` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->UpdateResult->create({
    'contact' => {},  # hashref
    'email' => 'example_email',  # string
    'firstName' => 'example_firstName',  # string
    'lastName' => 'example_lastName',  # string
    'phone' => 'example_phone',  # string
    'userName' => 'example_userName',  # string
    'userRole' => {},  # hashref
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
| `client` | `hashref` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `integer` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `hashref` | No | Reference to the associated Partner. |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `hashref` | No | Reference to the associated User Role. |
| `version` | `integer` | No | The number of times that this resource has been updated. |

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

