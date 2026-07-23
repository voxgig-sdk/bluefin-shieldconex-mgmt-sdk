# BluefinShieldconexMgmt OCaml SDK



The OCaml SDK for the BluefinShieldconexMgmt API — an entity-oriented client
following idiomatic OCaml conventions (a dependency-free library that compiles
with the stock `ocamlc`).

The SDK exposes the API as capitalised, semantic **Entities** — for example `Sdk_client.client client Noval` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to the opam registry. Install it from the
GitHub release tag (`ocaml/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases))
or from a source checkout. The SDK is dependency-free and compiles with the
stock `ocamlc` — no opam packages, no dune:

```bash
cd ocaml && make build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make (jo [("apikey", Str (Sys.getenv "BLUEFIN_SHIELDCONEX_MGMT_APIKEY"))])
```

### 2. List client records

`e_list` returns a `List` value of records (each a `Map`) and raises on
error — iterate it directly.

```ocaml
(try
   let clients = (Sdk_client.client client Noval).e_list (empty_map ()) Noval in
   (match clients with
    | List items -> List.iter (fun r -> print_endline (stringify r)) !items
    | _ -> ())
 with Sdk_error.E err -> Printf.eprintf "list failed: %s\n" (Sdk_error.message err))
```

### 3. Load a client

`e_load` returns the bare record (a `Map`) and raises on error.

```ocaml
(try
   let client = (Sdk_client.client client Noval).e_load (jo [("id", (Str "example_id"))]) Noval in
   print_endline (stringify client)
 with Sdk_error.E err -> Printf.eprintf "load failed: %s\n" (Sdk_error.message err))
```

### 4. Create, update, and remove

```ocaml
(* Create — returns the bare created record (a Map) *)
let created = (Sdk_client.client client Noval).e_create (jo [("billing_id", (Str "example_billing_id")); ("contact", (empty_map ()))]) Noval in
ignore created;

(* Remove *)
ignore ((Sdk_client.client client Noval).e_remove (jo [("id", (getp created "id"))]) Noval)
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

```ocaml
let result = Sdk_client.direct client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "GET");
    ("params", jo [("id", Str "example")]);
]) in
(match getp result "ok" with
 | Bool true ->
   print_endline (stringify (getp result "status"));  (* 200 *)
   print_endline (stringify (getp result "data"))      (* response body *)
 | _ ->
   (* A non-2xx response carries status + data (the error body); a transport
      failure carries err instead. Read whichever is present. *)
   print_endline (stringify (getp result "status"));
   print_endline (stringify (getp result "err")))
```

### Prepare a request without sending it

```ocaml
(* prepare returns the fetch definition and raises on error. *)
let fetchdef = Sdk_client.prepare client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "DELETE");
    ("params", jo [("id", Str "example")]);
]) in
print_endline (stringify (getp fetchdef "url"));
print_endline (stringify (getp fetchdef "method"));
print_endline (stringify (getp fetchdef "headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```ocaml
let () =
  let client = Sdk_client.test () in
  (* Entity ops return the bare record and raise on error. *)
  let partner = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval in
  print_endline (stringify partner)  (* the mock response record *)
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ocaml
let mock_fetch = Func (fun _ _args _ _ ->
    jo [("status", Num 200.); ("statusText", Str "OK"); ("headers", empty_map ());
        ("json", json_thunk (jo [("id", Str "mock01")]))]) in
let client = Sdk_client.make (jo [
    ("base", Str "http://localhost:8080");
    ("system", jo [("fetch", mock_fetch)]);
]) in
ignore client
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd ocaml && make test
```


## Reference

### Sdk_client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make options
```

Creates a new SDK client from a `value` options map. Use `Sdk_client.make0 ()`
for defaults.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `extend` | `list` | Additional feature instances to load. |
| `system` | `map` | System overrides (e.g. custom `fetch` function). |

### Sdk_client.test

```ocaml
let client = Sdk_client.test_with testopts sdkopts
```

Creates a test-mode client with mock transport. Both arguments may be `Noval`
(`Sdk_client.test ()` uses defaults).

### Sdk_client functions

| Function | Signature | Description |
| --- | --- | --- |
| `make` | `value -> sdk_client` | Construct a client from options. |
| `make0` | `unit -> sdk_client` | Construct a client with defaults. |
| `prepare` | `sdk_client -> value -> value` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `sdk_client -> value -> value` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `client` | `sdk_client -> value -> entity_obj` | A Client entity accessor. |
| `clone` | `sdk_client -> value -> entity_obj` | A Clone entity accessor. |
| `partner` | `sdk_client -> value -> entity_obj` | A Partner entity accessor. |
| `template` | `sdk_client -> value -> entity_obj` | A Template entity accessor. |
| `transaction` | `sdk_client -> value -> entity_obj` | A Transaction entity accessor. |
| `update_result` | `sdk_client -> value -> entity_obj` | An UpdateResult entity accessor. |
| `user` | `sdk_client -> value -> entity_obj` | An User entity accessor. |

### Entity interface

All entities are `entity_obj` records sharing the same fields.

| Field | Signature | Description |
| --- | --- | --- |
| `e_load` | `value -> value -> value` | Load a single entity by match criteria. Raises on error. |
| `e_list` | `value -> value -> value` | List entities matching the criteria (returns a List). Raises on error. |
| `e_create` | `value -> value -> value` | Create a new entity. Raises on error. |
| `e_update` | `value -> value -> value` | Update an existing entity. Raises on error. |
| `e_remove` | `value -> value -> value` | Remove an entity. Raises on error. |
| `e_data_get` | `unit -> value` | Get entity data. |
| `e_data_set` | `value -> unit` | Set entity data. |
| `e_match_get` | `unit -> value` | Get entity match criteria. |
| `e_match_set` | `value -> unit` | Set entity match criteria. |
| `e_make` | `unit -> entity_obj` | Create a new instance with the same options. |
| `e_name` | `string` | The entity name. |

### Result shape

Entity operations return the bare result value (a `Map` for single-entity
ops, a `List` for `e_list`) and raise `Sdk_error.E` on error. Wrap calls
in `try`/`with` to handle failures.

The `direct` escape hatch never raises — it returns a result `value` map
you branch on via `getp result "ok"`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `Bool true` if the HTTP status is 2xx. |
| `status` | `Num` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `value` | Parsed JSON response body. |

On error, `ok` is `Bool false` and `err` carries the error value.

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

Create an instance: `let client = Sdk_client.client client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_remove reqmatch ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `value map` |  |
| `created` | `string` |  |
| `direct_partner` | `value map` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `value map` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let client = (Sdk_client.client client Noval).e_load (jo [("id", (Str "client_id"))]) Noval
```

#### Example: List

```ocaml
let clients = (Sdk_client.client client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let client = (Sdk_client.client client Noval).e_create (jo [
]) Noval
```


### Clone

Create an instance: `let clone = Sdk_client.clone client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: Create

```ocaml
let clone = (Sdk_client.clone client Noval).e_create (jo [
    ("template_id", (Str "example_template_id"));  (* string *)
]) Noval
```


### Partner

Create an instance: `let partner = Sdk_client.partner client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `value map` |  |
| `created` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `value map` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let partner = (Sdk_client.partner client Noval).e_load (jo [("id", (Str "partner_id"))]) Noval
```

#### Example: List

```ocaml
let partners = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let partner = (Sdk_client.partner client Noval).e_create (jo [
]) Noval
```


### Template

Create an instance: `let template = Sdk_client.template client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_remove reqmatch ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `value` |  |
| `active` | `bool` |  |
| `client` | `value map` |  |
| `field_template` | `value list` |  |
| `id` | `int` |  |
| `name` | `string` |  |
| `option` | `value map` |  |
| `partner` | `value map` |  |
| `reference` | `string` |  |
| `type` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let template = (Sdk_client.template client Noval).e_load (jo [("id", (Str "template_id"))]) Noval
```

#### Example: List

```ocaml
let templates = (Sdk_client.template client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let template = (Sdk_client.template client Noval).e_create (jo [
]) Noval
```


### Transaction

Create an instance: `let transaction = Sdk_client.transaction client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `string` |  |
| `client` | `value map` |  |
| `complete_date` | `string` |  |
| `direct_partner` | `value map` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `int` |  |
| `ip_address` | `string` |  |
| `message_id` | `string` |  |
| `partner` | `value map` |  |
| `reference` | `string` |  |
| `success` | `bool` |  |
| `template_id` | `string` |  |

#### Example: Load

```ocaml
let transaction = (Sdk_client.transaction client Noval).e_load (jo [("id", (Str "transaction_id"))]) Noval
```

#### Example: List

```ocaml
let transactions = (Sdk_client.transaction client Noval).e_list (empty_map ()) Noval
```


### UpdateResult

Create an instance: `let update_result = Sdk_client.update_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_update reqdata ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client` | `value map` |  |
| `contact` | `value map` |  |
| `direct_partner` | `value map` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `last_name` | `string` |  |
| `mid` | `string` |  |
| `name` | `string` |  |
| `parent` | `value map` |  |
| `partner` | `value map` |  |
| `phone` | `string` |  |
| `reference` | `string` |  |
| `send_welcome_email` | `bool` |  |
| `user_name` | `string` |  |
| `user_role` | `value map` |  |
| `verification_phrase` | `string` |  |
| `version` | `int` |  |

#### Example: List

```ocaml
let update_results = (Sdk_client.update_result client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let update_result = (Sdk_client.update_result client Noval).e_create (jo [
    ("contact", (empty_map ()));  (* value map *)
    ("email", (Str "example_email"));  (* string *)
    ("first_name", (Str "example_first_name"));  (* string *)
    ("last_name", (Str "example_last_name"));  (* string *)
    ("phone", (Str "example_phone"));  (* string *)
    ("user_name", (Str "example_user_name"));  (* string *)
    ("user_role", (empty_map ()));  (* value map *)
]) Noval
```


### User

Create an instance: `let user = Sdk_client.user client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `value map` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `value map` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `value map` |  |
| `version` | `int` |  |

#### Example: Load

```ocaml
let user = (Sdk_client.user client Noval).e_load (jo [("id", (Str "user_id"))]) Noval
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

### Data as `value`

The OCaml SDK uses a single dynamic `value` type throughout rather than a
typed record per entity. `value` is the vendored voxgig struct port (a
JSON-shaped variant: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Module structure

```
ocaml/
├── sdk_client.ml               -- Main SDK client (constructors + accessors)
├── sdk_config.ml               -- Embedded API config + feature factory
├── sdk_error.ml                -- Branded error re-exports
├── sdk_entity_*.ml             -- Per-entity implementations (one each)
├── sdk_types.ml                -- Core pipeline types
├── sdk_helpers.ml              -- jo / ja / getp and friends
├── sdk_runtime.ml              -- Operation pipeline runner
├── sdk_features.ml             -- Built-in features (base, test, log)
├── utility/                    -- Vendored voxgig struct port
└── test/                       -- Test suites
```

The public surface lives in `Sdk_client` (the constructors and per-entity
accessors); `Sdk_helpers` carries the `jo` / `ja` / `getp` value
helpers. Open the runtime modules directly only when needed.

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
