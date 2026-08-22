# BluefinShieldconexMgmt Zig SDK Reference

Complete API reference for the BluefinShieldconexMgmt Zig SDK.


## BluefinShieldconexMgmtSDK

### Constructor

```zig
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinShieldconexMgmtSDK.new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`h.vnull()` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) *BluefinShieldconexMgmtSDK`

Create a test client with mock features active. Both arguments may be
`h.vnull()`.

```zig
const client = sdk.test_sdk(h.vnull(), h.vnull());
```


### Instance Methods

#### `client(entopts: Value) *ClientEntity`

Create a new `ClientEntity` instance. Pass `h.vnull()` for no
initial options.

#### `clone(entopts: Value) *CloneEntity`

Create a new `CloneEntity` instance. Pass `h.vnull()` for no
initial options.

#### `partner(entopts: Value) *PartnerEntity`

Create a new `PartnerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `template(entopts: Value) *TemplateEntity`

Create a new `TemplateEntity` instance. Pass `h.vnull()` for no
initial options.

#### `transaction(entopts: Value) *TransactionEntity`

Create a new `TransactionEntity` instance. Pass `h.vnull()` for no
initial options.

#### `update_result(entopts: Value) *UpdateResultEntity`

Create a new `UpdateResultEntity` instance. Pass `h.vnull()` for no
initial options.

#### `user(entopts: Value) *UserEntity`

Create a new `UserEntity` instance. Pass `h.vnull()` for no
initial options.

#### `options_map() Value`

Return a deep copy of the current SDK options.

#### `get_utility() *Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) Value`

Make a direct HTTP request to any API endpoint. Returns a result `Value`
map with `ok`, `status`, `headers`, and `data` (or `err` on failure).
This escape hatch returns a map even on a non-2xx response — branch on
`h.get_bool(result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) E!Value`

Prepare a fetch definition without sending. Returns the fetchdef (use
`catch`/`try` to handle the error union).


---

## ClientEntity

```zig
const client = client.client(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `[]const u8` | No | Billing ID |
| `contact` | `Value (object)` | No |  |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Value (object)` | No | Reference to the associated Partner. |
| `id` | `i64` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `[]const u8` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `name` | `[]const u8` | No | The Client's name. |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.client(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.client(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.client(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("client_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.client(h.vnull()).remove(h.jo(&.{.{ "id", h.vstr("client_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## CloneEntity

```zig
const clone = client.clone(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `i64` | No | Unique identifier of newly added element. |
| `name` | `[]const u8` | No | Name of Template |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.clone(h.vnull()).create(h.jo(&.{
    .{ "template_id", h.vstr("example_template_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## PartnerEntity

```zig
const partner = client.partner(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `[]const u8` | No | The Partner's billing identifier. |
| `contact` | `Value (object)` | No |  |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `id` | `i64` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `name` | `[]const u8` | No | The Partner's name. |
| `parent` | `Value (object)` | No | Reference to the associated Partner. |
| `reference` | `[]const u8` | No | The Partner's reference string. |
| `verificationPhrase` | `[]const u8` | No | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.partner(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.partner(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.partner(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("partner_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## TemplateEntity

```zig
const template = client.template(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `accessMode` | `Value` | No | The Template's access mode. |
| `active` | `bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `Value (array)` | No | Field Template list items |
| `id` | `i64` | No | Unique identifier of newly added element. |
| `name` | `[]const u8` | No | The Template's name. |
| `options` | `Value (object)` | No |  |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `reference` | `[]const u8` | No | The Template's unique reference. |
| `type` | `[]const u8` | No | The Template's type. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.template(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.template(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.template(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("template_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.template(h.vnull()).remove(h.jo(&.{.{ "id", h.vstr("template_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## TransactionEntity

```zig
const transaction = client.transaction(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `[]const u8` | No | BFID |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `completeDate` | `[]const u8` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `Value (object)` | No | Reference to the associated Partner. |
| `errCode` | `[]const u8` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `[]const u8` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `i64` | No | This resource's unique identifier. |
| `ipAddress` | `[]const u8` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `[]const u8` | No | Message ID. |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `reference` | `[]const u8` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | No | The success indicator. |
| `templateId` | `[]const u8` | No | The Template's unique identifier. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.transaction(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.transaction(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("transaction_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## UpdateResultEntity

```zig
const update_result = client.update_result(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `[]const u8` | No | The Partner's billing identifier. |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `contact` | `Value (object)` | Yes |  |
| `directPartner` | `Value (object)` | No | Reference to the associated Partner. |
| `email` | `[]const u8` | Yes | The User's email address. |
| `firstName` | `[]const u8` | Yes | The User's name. |
| `id` | `i64` | No | Unique identifier of newly added element. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `[]const u8` | Yes | The User's Surname. |
| `mid` | `[]const u8` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `[]const u8` | No | The Partner's name. |
| `parent` | `Value (object)` | No | Reference to the associated Partner. |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `phone` | `[]const u8` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `[]const u8` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `[]const u8` | Yes | The User's unique username. |
| `userRole` | `Value (object)` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `[]const u8` | No | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.update_result(h.vnull()).create(h.jo(&.{
    .{ "contact", h.omap() }, // Value (object)
    .{ "email", h.vstr("example_email") }, // []const u8
    .{ "firstName", h.vstr("example_firstName") }, // []const u8
    .{ "lastName", h.vstr("example_lastName") }, // []const u8
    .{ "phone", h.vstr("example_phone") }, // []const u8
    .{ "userName", h.vstr("example_userName") }, // []const u8
    .{ "userRole", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.update_result(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `update(reqdata: Value, ctrl: Value) OpResult`

Update an existing entity. The data must include the entity id. `.ok` carries the updated entity data.

```zig
switch (client.update_result(h.vnull()).update(h.jo(&.{
    .{ "id", h.vstr("id") },
    // Fields to update
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("update failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## UserEntity

```zig
const user = client.user(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `email` | `[]const u8` | No |  |
| `firstName` | `[]const u8` | No |  |
| `id` | `i64` | No | This resource's unique identifier. |
| `isActive` | `bool` | No |  |
| `lastName` | `[]const u8` | No |  |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `phone` | `[]const u8` | No |  |
| `userName` | `[]const u8` | No |  |
| `userRole` | `Value (object)` | No | Reference to the associated User Role. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.user(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("user_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```zig
const client = sdk.BluefinShieldconexMgmtSDK.new(h.jo(&.{
    .{ "feature", h.jo(&.{
        .{ "test", h.jo(&.{.{ "active", h.vbool(true) }}) },
    }) },
}));
```

