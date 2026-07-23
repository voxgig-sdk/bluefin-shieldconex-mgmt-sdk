# BluefinShieldconexMgmt OCaml SDK Reference

Complete API reference for the BluefinShieldconexMgmt OCaml SDK.


## Sdk_client

### Constructor

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make options
```

Create a new SDK client instance from a `value` options map. Use
`Sdk_client.make0 ()` for defaults.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `value` | SDK configuration options (a Map). |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides (e.g. custom fetch). |


### Static constructors

#### `Sdk_client.test testopts sdkopts`

Create a test client with mock features active. Both arguments may be `Noval`
(`Sdk_client.test ()` uses defaults, `Sdk_client.test_with` takes explicit
options).

```ocaml
let client = Sdk_client.test ()
```


### Instance functions

#### `Sdk_client.client client entopts : entity_obj`

Create a `Client` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.clone client entopts : entity_obj`

Create a `Clone` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.partner client entopts : entity_obj`

Create a `Partner` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.template client entopts : entity_obj`

Create a `Template` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.transaction client entopts : entity_obj`

Create a `Transaction` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.update_result client entopts : entity_obj`

Create a `UpdateResult` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.user client entopts : entity_obj`

Create a `User` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.direct client fetchargs : value`

Make a direct HTTP request to any API endpoint. Returns a result `value` map
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch never raises — branch on `getp result "ok"`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `value` | Request body (Maps are JSON-serialized). |

**Returns:** a result `value` map.

#### `Sdk_client.prepare client fetchargs : value`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises
on error.


---

## Client

```ocaml
let client = Sdk_client.client client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `value map` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `value map` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `value map` | No |  |
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_create (jo [
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.client client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_load (jo [("id", (Str "client_id"))]) Noval
```

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_remove (jo [("id", (Str "client_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Client` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Clone

```ocaml
let clone = Sdk_client.clone client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `string` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.clone client Noval).e_create (jo [
    ("template_id", (Str "example_template_id"));  (* string *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Clone` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Partner

```ocaml
let partner = Sdk_client.partner client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `value map` | No |  |
| `created` | `string` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `value map` | No |  |
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.partner client Noval).e_create (jo [
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.partner client Noval).e_load (jo [("id", (Str "partner_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Partner` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Template

```ocaml
let template = Sdk_client.template client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `value` | No |  |
| `active` | `bool` | No |  |
| `client` | `value map` | No |  |
| `field_template` | `value list` | No |  |
| `id` | `int` | No |  |
| `name` | `string` | No |  |
| `option` | `value map` | No |  |
| `partner` | `value map` | No |  |
| `reference` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.template client Noval).e_create (jo [
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.template client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.template client Noval).e_load (jo [("id", (Str "template_id"))]) Noval
```

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.template client Noval).e_remove (jo [("id", (Str "template_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Template` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Transaction

```ocaml
let transaction = Sdk_client.transaction client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `string` | No |  |
| `client` | `value map` | No |  |
| `complete_date` | `string` | No |  |
| `direct_partner` | `value map` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `int` | No |  |
| `ip_address` | `string` | No |  |
| `message_id` | `string` | No |  |
| `partner` | `value map` | No |  |
| `reference` | `string` | No |  |
| `success` | `bool` | No |  |
| `template_id` | `string` | No |  |

### Operations

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.transaction client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.transaction client Noval).e_load (jo [("id", (Str "transaction_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Transaction` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## UpdateResult

```ocaml
let update_result = Sdk_client.update_result client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client` | `value map` | No |  |
| `contact` | `value map` | Yes |  |
| `direct_partner` | `value map` | No |  |
| `email` | `string` | Yes |  |
| `first_name` | `string` | Yes |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `string` | Yes |  |
| `mid` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `value map` | No |  |
| `partner` | `value map` | No |  |
| `phone` | `string` | Yes |  |
| `reference` | `string` | No |  |
| `send_welcome_email` | `bool` | No |  |
| `user_name` | `string` | Yes |  |
| `user_role` | `value map` | Yes |  |
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.update_result client Noval).e_create (jo [
    ("contact", (empty_map ()));  (* value map *)
    ("email", (Str "example_email"));  (* string *)
    ("first_name", (Str "example_first_name"));  (* string *)
    ("last_name", (Str "example_last_name"));  (* string *)
    ("phone", (Str "example_phone"));  (* string *)
    ("user_name", (Str "example_user_name"));  (* string *)
    ("user_role", (empty_map ()));  (* value map *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.update_result client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_update reqdata ctrl : value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```ocaml
let result = (Sdk_client.update_result client Noval).e_update (jo [
    ("id", (Str "id"));
    (* Fields to update *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `UpdateResult` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## User

```ocaml
let user = Sdk_client.user client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `value map` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `int` | No |  |
| `is_active` | `bool` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `value map` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `value map` | No |  |
| `version` | `int` | No |  |

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.user client Noval).e_load (jo [("id", (Str "user_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `User` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ocaml
let client = Sdk_client.make (jo [
    ("feature", jo [
        ("test", jo [("active", Bool true)]);
    ]);
])
```

