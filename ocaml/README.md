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

`e_list` resolves to one ENTITY per record and raises on error. Read a
record with `e_data_get`.

```ocaml
(try
   let clients = (Sdk_client.client client Noval).e_list (empty_map ()) Noval in
   List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) clients
 with Sdk_error.E err -> Printf.eprintf "list failed: %s\n" (Sdk_error.message err))
```

### 3. Load a client

`e_load` resolves to the ENTITY and raises on error; `e_data_get` gives the
record.

```ocaml
(try
   let client = (Sdk_client.client client Noval).e_load (jo [("id", (Str "example_id"))]) Noval in
   print_endline (stringify (client.e_data_get ()))
 with Sdk_error.E err -> Printf.eprintf "load failed: %s\n" (Sdk_error.message err))
```

### 4. Create, update, and remove

```ocaml
(* Create — resolves to the ENTITY; e_data_get gives the record *)
let created = (Sdk_client.client client Noval).e_create (jo [("billingId", (Str "example_billingId")); ("contact", (empty_map ()))]) Noval in
print_endline (stringify (created.e_data_get ()));

(* Remove — resolves to the entity, marked deleted; it keeps its data *)
let removed = (Sdk_client.client client Noval).e_remove (jo [("id", (getp created "id"))]) Noval in
Printf.printf "deleted: %b\n" removed.e_deleted
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
  (* Entity ops resolve to the ENTITY (list: one per record) and raise on error. *)
  let partners = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval in
  List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) partners  (* the mock records *)
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
| `e_load` | `value -> value -> entity_obj` | Load a single entity by match criteria. Resolves to the entity. Raises on error. |
| `e_list` | `value -> value -> entity_obj list` | List entities matching the criteria. Resolves to one entity per record. Raises on error. |
| `e_create` | `value -> value -> entity_obj` | Create a new entity. Resolves to the entity. Raises on error. |
| `e_update` | `value -> value -> entity_obj` | Update an existing entity. Resolves to the entity. Raises on error. |
| `e_remove` | `value -> value -> entity_obj` | Remove an entity. Resolves to the entity, marked deleted. Raises on error. |
| `e_data_get` | `unit -> value` | Get entity data. |
| `e_data_set` | `value -> unit` | Set entity data. |
| `e_match_get` | `unit -> value` | Get entity match criteria. |
| `e_match_set` | `value -> unit` | Set entity match criteria. |
| `e_make` | `unit -> entity_obj` | Create a new instance with the same options. |
| `e_name` | `string` | The entity name. |

### Result shape

Entity operations resolve to the ENTITY, not the raw record — `e_list` to
one entity per record — and raise `Sdk_error.E` on error. The record is
reached through `e_data_get`, which returns the entity's data container.
`e_remove` resolves to the entity marked deleted (`e_deleted`); it keeps the
data it held. Wrap calls in `try`/`with` to handle failures.

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

Create an instance: `let client = Sdk_client.client client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `e_remove reqmatch ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` | Billing ID |
| `contact` | `value map` |  |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `value map` | Reference to the associated Partner. |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Client's name. |
| `partner` | `value map` | Reference to the associated Partner. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let client = (Sdk_client.client client Noval).e_load (jo [("id", (Str "client_id"))]) Noval
let client_data = client.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let clients = (Sdk_client.client client Noval).e_list (empty_map ()) Noval
let client_datas = List.map (fun e -> e.e_data_get ()) clients
```

#### Example: Create

```ocaml
let client = (Sdk_client.client client Noval).e_create (jo [
]) Noval
let client_data = client.e_data_get ()
```


### Clone

Create an instance: `let clone = Sdk_client.clone client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` | Unique identifier of newly added element. |
| `name` | `string` | Name of Template |

#### Example: Create

```ocaml
let clone = (Sdk_client.clone client Noval).e_create (jo [
    ("template_id", (Str "example_template_id"));  (* string *)
]) Noval
let clone_data = clone.e_data_get ()
```


### Partner

Create an instance: `let partner = Sdk_client.partner client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` | The Partner's billing identifier. |
| `contact` | `value map` |  |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Partner's name. |
| `parent` | `value map` | Reference to the associated Partner. |
| `reference` | `string` | The Partner's reference string. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let partner = (Sdk_client.partner client Noval).e_load (jo [("id", (Str "partner_id"))]) Noval
let partner_data = partner.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let partners = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval
let partner_datas = List.map (fun e -> e.e_data_get ()) partners
```

#### Example: Create

```ocaml
let partner = (Sdk_client.partner client Noval).e_create (jo [
]) Noval
let partner_data = partner.e_data_get ()
```


### Template

Create an instance: `let template = Sdk_client.template client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `e_remove reqmatch ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `accessMode` | `value` | The Template's access mode. |
| `active` | `bool` | This property indicates if the Template is active or inactive. |
| `client` | `value map` | Reference to the associated Client resource. |
| `fieldTemplates` | `value list` | Field Template list items |
| `id` | `int` | Unique identifier of newly added element. |
| `name` | `string` | The Template's name. |
| `options` | `value map` |  |
| `partner` | `value map` | Reference to the associated Partner. |
| `reference` | `string` | The Template's unique reference. |
| `type` | `string` | The Template's type. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let template = (Sdk_client.template client Noval).e_load (jo [("id", (Str "template_id"))]) Noval
let template_data = template.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let templates = (Sdk_client.template client Noval).e_list (empty_map ()) Noval
let template_datas = List.map (fun e -> e.e_data_get ()) templates
```

#### Example: Create

```ocaml
let template = (Sdk_client.template client Noval).e_create (jo [
]) Noval
let template_data = template.e_data_get ()
```


### Transaction

Create an instance: `let transaction = Sdk_client.transaction client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `string` | BFID |
| `client` | `value map` | Reference to the associated Client resource. |
| `completeDate` | `string` | Timestamp from the beginning of the transaction. |
| `directPartner` | `value map` | Reference to the associated Partner. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int` | This resource's unique identifier. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `string` | Message ID. |
| `partner` | `value map` | Reference to the associated Partner. |
| `reference` | `string` | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | The success indicator. |
| `templateId` | `string` | The Template's unique identifier. |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let transaction = (Sdk_client.transaction client Noval).e_load (jo [("id", (Str "transaction_id"))]) Noval
let transaction_data = transaction.e_data_get ()
```

#### Example: List

```ocaml
(* One ENTITY per record. *)
let transactions = (Sdk_client.transaction client Noval).e_list (empty_map ()) Noval
let transaction_datas = List.map (fun e -> e.e_data_get ()) transactions
```


### UpdateResult

Create an instance: `let update_result = Sdk_client.update_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `e_update reqdata ctrl` | Update an existing entity. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` | The Partner's billing identifier. |
| `client` | `value map` | Reference to the associated Client resource. |
| `contact` | `value map` |  |
| `directPartner` | `value map` | Reference to the associated Partner. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `int` | Unique identifier of newly added element. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `lastName` | `string` | The User's Surname. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | The Partner's name. |
| `parent` | `value map` | Reference to the associated Partner. |
| `partner` | `value map` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `string` | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `value map` | Reference to the associated User Role. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: List

```ocaml
(* One ENTITY per record. *)
let update_results = (Sdk_client.update_result client Noval).e_list (empty_map ()) Noval
let update_result_datas = List.map (fun e -> e.e_data_get ()) update_results
```

#### Example: Create

```ocaml
let update_result = (Sdk_client.update_result client Noval).e_create (jo [
    ("contact", (empty_map ()));  (* value map *)
    ("email", (Str "example_email"));  (* string *)
    ("firstName", (Str "example_firstName"));  (* string *)
    ("lastName", (Str "example_lastName"));  (* string *)
    ("phone", (Str "example_phone"));  (* string *)
    ("userName", (Str "example_userName"));  (* string *)
    ("userRole", (empty_map ()));  (* value map *)
]) Noval
let update_result_data = update_result.e_data_get ()
```


### User

Create an instance: `let user = Sdk_client.user client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `value map` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` |  |
| `lastName` | `string` |  |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `value map` | Reference to the associated Partner. |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `value map` | Reference to the associated User Role. |
| `version` | `int` | The number of times that this resource has been updated. |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let user = (Sdk_client.user client Noval).e_load (jo [("id", (Str "user_id"))]) Noval
let user_data = user.e_data_get ()
```


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
