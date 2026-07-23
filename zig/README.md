# BluefinShieldconexMgmt Zig SDK



The Zig SDK for the BluefinShieldconexMgmt API — an entity-oriented client following idiomatic Zig conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.client(h.vnull())` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
Zig has no central package registry, so this package is distributed as a
git tag (`zig/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)). Add it to
your `build.zig.zon` dependencies, or build from a source checkout:

```bash
cd zig && zig build
```

To depend on it from another project, add the tagged archive to
`build.zig.zon`:

```zig
.dependencies = .{
    .sdk = .{
        .url = "<repo-url>/archive/refs/tags/zig/vX.Y.Z.tar.gz",
        // .hash = "...", // filled in by `zig fetch`
    },
},
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```zig
const std = @import("std");
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinShieldconexMgmtSDK.new(h.jo(&.{
    .{ "apikey", h.vstr(std.posix.getenv("BLUEFIN_SHIELDCONEX_MGMT_APIKEY") orelse "") },
}));
```

### 2. List client records

`list()` returns an `OpResult` whose `.ok` is a `Value` array —
`switch` on it.

```zig
switch (client.client(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |clients| std.debug.print("{s}\n", .{h.stringify(clients)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### 3. Load a client

`load()`'s `.ok` carries the bare record.

```zig
switch (client.client(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("example_id") }}), h.vnull())) {
    .ok => |client| std.debug.print("{s}\n", .{h.stringify(client)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### 4. Create, update, and remove

```zig
// Create — .ok carries the created record
switch (client.client(h.vnull()).create(h.jo(&.{.{ "billing_id", h.vstr("example_billing_id") }, .{ "contact", h.omap() }}), h.vnull())) {
    .ok => |created| std.debug.print("{s}\n", .{h.stringify(created)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}

// Remove
switch (client.client(h.vnull()).remove(h.jo(&.{.{ "id", h.vstr("example_id") }}), h.vnull())) {
    .ok => |_| std.debug.print("removed\n", .{}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
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

```zig
const result = client.direct(h.jo(&.{
    .{ "path", h.vstr("/api/resource/{id}") },
    .{ "method", h.vstr("GET") },
    .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
}));

if (h.get_bool(result, "ok") orelse false) {
    std.debug.print("{d}\n", .{h.to_int(h.getp(result, "status"))}); // 200
    std.debug.print("{s}\n", .{h.stringify(h.getp(result, "data"))}); // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    std.debug.print("{s}\n", .{h.get_str(result, "err") orelse ""});
}
```

### Prepare a request without sending it

```zig
// prepare() returns the fetch definition (an error union — use `catch`/`try`).
const fetchdef = client.prepare(h.jo(&.{
    .{ "path", h.vstr("/api/resource/{id}") },
    .{ "method", h.vstr("DELETE") },
    .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
})) catch unreachable;

std.debug.print("{s}\n", .{h.get_str(fetchdef, "url") orelse ""});
std.debug.print("{s}\n", .{h.get_str(fetchdef, "method") orelse ""});
std.debug.print("{s}\n", .{h.stringify(h.getp(fetchdef, "headers"))});
```

### Use test mode

Create a mock client for unit testing — no server required:

```zig
const client = sdk.test_sdk(h.vnull(), h.vnull());

// Entity ops return an OpResult — .ok carries the record, .err the error.
switch (client.partner(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |partner| std.debug.print("{s}\n", .{h.stringify(partner)}), // the mock record
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### Point at a different server

Override the base URL to reach a local or staging server:

```zig
const client = sdk.BluefinShieldconexMgmtSDK.new(h.jo(&.{
    .{ "base", h.vstr("http://localhost:8080") },
}));
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd zig && zig build test
```


## Reference

### BluefinShieldconexMgmtSDK

```zig
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinShieldconexMgmtSDK.new(options);
```

Creates a new SDK client. `options` is a `Value` map (`h.vnull()` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```zig
const client = sdk.test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`h.vnull()`.

### BluefinShieldconexMgmtSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() Value` | Deep copy of the current SDK options. |
| `get_utility` | `() *Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) E!Value` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) Value` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `client` | `(entopts: Value) *ClientEntity` | Create a Client entity instance. |
| `clone` | `(entopts: Value) *CloneEntity` | Create a Clone entity instance. |
| `partner` | `(entopts: Value) *PartnerEntity` | Create a Partner entity instance. |
| `template` | `(entopts: Value) *TemplateEntity` | Create a Template entity instance. |
| `transaction` | `(entopts: Value) *TransactionEntity` | Create a Transaction entity instance. |
| `update_result` | `(entopts: Value) *UpdateResultEntity` | Create an UpdateResult entity instance. |
| `user` | `(entopts: Value) *UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) OpResult` | Load a single entity by match criteria. |
| `list` | `(reqmatch: Value, ctrl: Value) OpResult` | List entities matching the criteria (`.ok` is a `Value` array). |
| `create` | `(reqdata: Value, ctrl: Value) OpResult` | Create a new entity. |
| `update` | `(reqdata: Value, ctrl: Value) OpResult` | Update an existing entity. |
| `remove` | `(reqmatch: Value, ctrl: Value) OpResult` | Remove an entity. |
| `stream` | `(action: []const u8, args: Value, callopts: Value) []Value` | Run an op through the pipeline and materialise its result items. |
| `data` | `(args: ?Value) Value` | Get entity data (pass a map to set). |
| `matchv` | `(args: ?Value) Value` | Get entity match criteria (pass a map to set). |
| `get_name` | `() []const u8` | Return the entity name. |

### Result shape

Entity operations return an `OpResult` union — `switch` on it: `.ok`
carries the bare result data (a `Value` object for single-entity ops, a
`Value` array for `list`), `.err` carries the branded error pointer.

The `direct()` escape hatch returns a result `Value` map directly (no
error union) — even on a non-2xx response — that you branch on via
`h.get_bool(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error message.

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

Create an instance: `const client = client.client(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `[]const u8` |  |
| `contact` | `Value (object)` |  |
| `created` | `[]const u8` |  |
| `direct_partner` | `Value (object)` |  |
| `id` | `i64` |  |
| `is_active` | `bool` |  |
| `mid` | `[]const u8` |  |
| `modified` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `partner` | `Value (object)` |  |
| `version` | `i64` |  |

#### Example: Load

```zig
switch (client.client(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("client_id") }}), h.vnull())) {
    .ok => |client| std.debug.print("{s}\n", .{h.stringify(client)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.client(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |clients| std.debug.print("{s}\n", .{h.stringify(clients)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.client(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |client| std.debug.print("{s}\n", .{h.stringify(client)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Clone

Create an instance: `const clone = client.clone(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` |  |
| `name` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.clone(h.vnull()).create(h.jo(&.{
    .{ "template_id", h.vstr("example_template_id") }, // []const u8
}), h.vnull())) {
    .ok => |clone| std.debug.print("{s}\n", .{h.stringify(clone)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Partner

Create an instance: `const partner = client.partner(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `[]const u8` |  |
| `contact` | `Value (object)` |  |
| `created` | `[]const u8` |  |
| `id` | `i64` |  |
| `is_active` | `bool` |  |
| `modified` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `parent` | `Value (object)` |  |
| `reference` | `[]const u8` |  |
| `verification_phrase` | `[]const u8` |  |
| `version` | `i64` |  |

#### Example: Load

```zig
switch (client.partner(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("partner_id") }}), h.vnull())) {
    .ok => |partner| std.debug.print("{s}\n", .{h.stringify(partner)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.partner(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |partners| std.debug.print("{s}\n", .{h.stringify(partners)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.partner(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |partner| std.debug.print("{s}\n", .{h.stringify(partner)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Template

Create an instance: `const template = client.template(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `Value` |  |
| `active` | `bool` |  |
| `client` | `Value (object)` |  |
| `field_template` | `Value (array)` |  |
| `id` | `i64` |  |
| `name` | `[]const u8` |  |
| `option` | `Value (object)` |  |
| `partner` | `Value (object)` |  |
| `reference` | `[]const u8` |  |
| `type` | `[]const u8` |  |
| `version` | `i64` |  |

#### Example: Load

```zig
switch (client.template(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("template_id") }}), h.vnull())) {
    .ok => |template| std.debug.print("{s}\n", .{h.stringify(template)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.template(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |templates| std.debug.print("{s}\n", .{h.stringify(templates)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.template(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |template| std.debug.print("{s}\n", .{h.stringify(template)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Transaction

Create an instance: `const transaction = client.transaction(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `[]const u8` |  |
| `client` | `Value (object)` |  |
| `complete_date` | `[]const u8` |  |
| `direct_partner` | `Value (object)` |  |
| `err_code` | `[]const u8` |  |
| `err_message` | `[]const u8` |  |
| `id` | `i64` |  |
| `ip_address` | `[]const u8` |  |
| `message_id` | `[]const u8` |  |
| `partner` | `Value (object)` |  |
| `reference` | `[]const u8` |  |
| `success` | `bool` |  |
| `template_id` | `[]const u8` |  |

#### Example: Load

```zig
switch (client.transaction(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("transaction_id") }}), h.vnull())) {
    .ok => |transaction| std.debug.print("{s}\n", .{h.stringify(transaction)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.transaction(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |transactions| std.debug.print("{s}\n", .{h.stringify(transactions)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```


### UpdateResult

Create an instance: `const update_result = client.update_result(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `[]const u8` |  |
| `client` | `Value (object)` |  |
| `contact` | `Value (object)` |  |
| `direct_partner` | `Value (object)` |  |
| `email` | `[]const u8` |  |
| `first_name` | `[]const u8` |  |
| `id` | `i64` |  |
| `is_active` | `bool` |  |
| `last_name` | `[]const u8` |  |
| `mid` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `parent` | `Value (object)` |  |
| `partner` | `Value (object)` |  |
| `phone` | `[]const u8` |  |
| `reference` | `[]const u8` |  |
| `send_welcome_email` | `bool` |  |
| `user_name` | `[]const u8` |  |
| `user_role` | `Value (object)` |  |
| `verification_phrase` | `[]const u8` |  |
| `version` | `i64` |  |

#### Example: List

```zig
switch (client.update_result(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |update_results| std.debug.print("{s}\n", .{h.stringify(update_results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.update_result(h.vnull()).create(h.jo(&.{
    .{ "contact", h.omap() }, // Value (object)
    .{ "email", h.vstr("example_email") }, // []const u8
    .{ "first_name", h.vstr("example_first_name") }, // []const u8
    .{ "last_name", h.vstr("example_last_name") }, // []const u8
    .{ "phone", h.vstr("example_phone") }, // []const u8
    .{ "user_name", h.vstr("example_user_name") }, // []const u8
    .{ "user_role", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |update_result| std.debug.print("{s}\n", .{h.stringify(update_result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### User

Create an instance: `const user = client.user(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value (object)` |  |
| `created` | `[]const u8` |  |
| `email` | `[]const u8` |  |
| `first_name` | `[]const u8` |  |
| `id` | `i64` |  |
| `is_active` | `bool` |  |
| `last_name` | `[]const u8` |  |
| `modified` | `[]const u8` |  |
| `partner` | `Value (object)` |  |
| `phone` | `[]const u8` |  |
| `user_name` | `[]const u8` |  |
| `user_role` | `Value (object)` |  |
| `version` | `i64` |  |

#### Example: Load

```zig
switch (client.user(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("user_id") }}), h.vnull())) {
    .ok => |user| std.debug.print("{s}\n", .{h.stringify(user)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
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

### Data as `Value`

The Zig SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port's
`JsonValue` (a JSON-shaped tagged union: `.string`, `.integer`,
`.float`, `.bool`, `.array`, `.object`, `.null`). This mirrors the
dynamic nature of the API and keeps the SDK flexible — no code generation is
needed when the API schema changes.

Build request maps with the `h.jo` / `h.ja` helpers and read fields back
with `h.getp` (or the typed `h.get_str` / `h.get_bool` / `h.to_int`
accessors); use `h.to_map` to safely coerce a value to a map.

### Module structure

```
zig/
├── root.zig                     -- Module root (re-exports the public surface)
├── build.zig                    -- Build + test wiring
├── core/                        -- Pipeline types, config, client (sdk.zig)
├── entity/                      -- Per-entity clients (one file each)
├── feature/                     -- Built-in features (base, test, log)
├── utility/                     -- Utilities + the vendored voxgig struct port
└── test/                        -- Test suites
```

The public API is re-exported from `root.zig`, so `@import("sdk")` reaches
the SDK client, `Value`, and the `h` (helpers) namespace directly. Import
entity or utility modules only when needed.

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
