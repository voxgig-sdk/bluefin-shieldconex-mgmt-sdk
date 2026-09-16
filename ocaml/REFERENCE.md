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
| `billingId` | `string` | No | Billing ID |
| `contact` | `value map` | No |  |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `value map` | No | Reference to the associated Partner. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Client's name. |
| `partner` | `value map` | No | Reference to the associated Partner. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_create (jo [
    ("contact_email", (Str "example_contact_email"));  (* string *)
    ("contact_first_name", (Str "example_contact_first_name"));  (* string *)
    ("contact_is_active", (Bool true));  (* bool *)
    ("contact_last_name", (Str "example_contact_last_name"));  (* string *)
    ("contact_phone", (Str "example_contact_phone"));  (* string *)
    ("contact_send_welcome_email", (Bool true));  (* bool *)
    ("contact_user_name", (Str "example_contact_user_name"));  (* string *)
    ("contact_user_role", (Str "example_contact_user_role"));  (* string *)
    ("direct_partner_id", (Num 1.));  (* int *)
    ("direct_partner_name", (Str "example_direct_partner_name"));  (* string *)
    ("is_active", (Bool true));  (* bool *)
    ("name", (Str "example_name"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.client client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_load (jo [("id", (Str "client_id"))]) Noval
let result_data = result.e_data_get ()
```

#### `e_remove reqmatch ctrl : entity_obj`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`e_deleted`); it keeps the data it held. Raises on error.

```ocaml
let result = (Sdk_client.client client Noval).e_remove (jo [("id", (Str "client_id"))]) Noval
let result_data = result.e_data_get ()
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
| `id` | `int` | No | Unique identifier of newly added element. |
| `name` | `string` | No | Name of Template |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.clone client Noval).e_create (jo [
    ("template_id", (Str "example_template_id"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `contact` | `value map` | No |  |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `value map` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The Partner's reference string. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.partner client Noval).e_create (jo [
    ("billing_id", (Str "example_billing_id"));  (* string *)
    ("contact_email", (Str "example_contact_email"));  (* string *)
    ("contact_first_name", (Str "example_contact_first_name"));  (* string *)
    ("contact_is_active", (Bool true));  (* bool *)
    ("contact_last_name", (Str "example_contact_last_name"));  (* string *)
    ("contact_phone", (Str "example_contact_phone"));  (* string *)
    ("contact_send_welcome_email", (Bool true));  (* bool *)
    ("contact_user_name", (Str "example_contact_user_name"));  (* string *)
    ("contact_user_role", (Str "example_contact_user_role"));  (* string *)
    ("is_active", (Bool true));  (* bool *)
    ("name", (Str "example_name"));  (* string *)
    ("reference", (Str "example_reference"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.partner client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.partner client Noval).e_load (jo [("id", (Str "partner_id"))]) Noval
let result_data = result.e_data_get ()
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
| `accessMode` | `value` | No | The Template's access mode. |
| `active` | `bool` | No | This property indicates if the Template is active or inactive. |
| `client` | `value map` | No | Reference to the associated Client resource. |
| `fieldTemplates` | `value list` | No | Field Template list items |
| `id` | `int` | No | Unique identifier of newly added element. |
| `name` | `string` | No | The Template's name. |
| `options` | `value map` | No |  |
| `partner` | `value map` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The Template's unique reference. |
| `type` | `string` | No | The Template's type. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.template client Noval).e_create (jo [
    ("active", (Bool true));  (* bool *)
    ("client_id", (Num 1.));  (* int *)
    ("client_name", (Str "example_client_name"));  (* string *)
    ("name", (Str "example_name"));  (* string *)
    ("partner_id", (Num 1.));  (* int *)
    ("partner_name", (Str "example_partner_name"));  (* string *)
    ("reference", (Str "example_reference"));  (* string *)
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.template client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.template client Noval).e_load (jo [("id", (Str "template_id"))]) Noval
let result_data = result.e_data_get ()
```

#### `e_remove reqmatch ctrl : entity_obj`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`e_deleted`); it keeps the data it held. Raises on error.

```ocaml
let result = (Sdk_client.template client Noval).e_remove (jo [("id", (Str "template_id"))]) Noval
let result_data = result.e_data_get ()
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
| `bfid` | `string` | No | BFID |
| `client` | `value map` | No | Reference to the associated Client resource. |
| `completeDate` | `string` | No | Timestamp from the beginning of the transaction. |
| `directPartner` | `value map` | No | Reference to the associated Partner. |
| `errCode` | `string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `int` | No | This resource's unique identifier. |
| `ipAddress` | `string` | No | The IP address of the http client that makes the decrypt API call. |
| `messageId` | `string` | No | Message ID. |
| `partner` | `value map` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The reference property that the Client includes in the decrypt API call. |
| `success` | `bool` | No | The success indicator. |
| `templateId` | `string` | No | The Template's unique identifier. |

### Operations

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.transaction client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.transaction client Noval).e_load (jo [("id", (Str "transaction_id"))]) Noval
let result_data = result.e_data_get ()
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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `client` | `value map` | No | Reference to the associated Client resource. |
| `contact` | `value map` | Yes |  |
| `directPartner` | `value map` | No | Reference to the associated Partner. |
| `email` | `string` | Yes | The User's email address. |
| `firstName` | `string` | Yes | The User's name. |
| `id` | `int` | No | Unique identifier of newly added element. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `lastName` | `string` | Yes | The User's Surname. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `value map` | No | Reference to the associated Partner. |
| `partner` | `value map` | No | Reference to the associated Partner. |
| `phone` | `string` | Yes | The User's phone number without dashes, spaces, or brackets (e.g. |
| `reference` | `string` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | No | If this property is set to 'true' the newly created user will be sent a welcome email. |
| `userName` | `string` | Yes | The User's unique username. |
| `userRole` | `value map` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int` | No | The number of times that this resource has been updated. |

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

#### `e_create reqdata ctrl : entity_obj`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.update_result client Noval).e_create (jo [
    ("email", (Str "example_email"));  (* string *)
    ("first_name", (Str "example_first_name"));  (* string *)
    ("is_active", (Bool true));  (* bool *)
    ("last_name", (Str "example_last_name"));  (* string *)
    ("phone", (Num 1.));  (* int *)
    ("send_welcome_email", (Bool true));  (* bool *)
    ("user_role", (empty_map ()));  (* value map *)
    ("username", (Str "example_username"));  (* string *)
    ("contact", (empty_map ()));  (* value map *)
    ("firstName", (Str "example_firstName"));  (* string *)
    ("lastName", (Str "example_lastName"));  (* string *)
    ("userName", (Str "example_userName"));  (* string *)
    ("userRole", (empty_map ()));  (* value map *)
]) Noval
let result_data = result.e_data_get ()
```

#### `e_list reqmatch ctrl : entity_obj list`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Resolves to one ENTITY per record and raises on error.

```ocaml
(* One ENTITY per record; the record is reached with e_data_get. *)
let results = (Sdk_client.update_result client Noval).e_list (empty_map ()) Noval in
List.iter (fun e -> print_endline (stringify (e.e_data_get ()))) results
```

#### `e_update reqdata ctrl : entity_obj`

Update an existing entity. The data must include the entity `id`. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.update_result client Noval).e_update (jo [
    ("id", (Str "id"));
    (* Fields to update *)
]) Noval
let result_data = result.e_data_get ()
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
| `client` | `value map` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `int` | No | This resource's unique identifier. |
| `isActive` | `bool` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `value map` | No | Reference to the associated Partner. |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `value map` | No | Reference to the associated User Role. |
| `version` | `int` | No | The number of times that this resource has been updated. |

### Operations

#### `e_load reqmatch ctrl : entity_obj`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `e_data_get`) and raises on error.

```ocaml
let result = (Sdk_client.user client Noval).e_load (jo [("id", (Str "user_id"))]) Noval
let result_data = result.e_data_get ()
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
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
| `debug` | 0.0.1 | Request/response capture ring buffer for debugging |
| `idempotency` | 0.0.1 | Idempotency keys for safe retries of mutating operations |
| `log` | 0.0.1 | Structured request and response logging |
| `metrics` | 0.0.1 | Statistics capture: per-operation counters and latency |
| `paging` | 0.0.1 | Pagination signals for list operations |
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `telemetry` | 0.0.1 | Distributed tracing spans with W3C trace-context propagation |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```ocaml
let client = Sdk_client.make (jo [
    ("feature", jo [
        ("audit", jo [("active", Bool true)]);
        ("clienttrack", jo [("active", Bool true)]);
        ("debug", jo [("active", Bool true)]);
        ("idempotency", jo [("active", Bool true)]);
        ("log", jo [("active", Bool true)]);
        ("metrics", jo [("active", Bool true)]);
        ("paging", jo [("active", Bool true)]);
        ("ratelimit", jo [("active", Bool true)]);
        ("retry", jo [("active", Bool true)]);
        ("telemetry", jo [("active", Bool true)]);
        ("test", jo [("active", Bool true)]);
        ("timeout", jo [("active", Bool true)]);
    ]);
])
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`ratelimit`, `retry`, `timeout` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`audit`, `clienttrack`, `debug`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Structured audit trail of operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

| Option | Type |
|---|---|
| `now` | function |
| `sink` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client identity and per-request correlation headers.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

| Option | Type |
|---|---|
| `clientName` | string |
| `headers` | map |
| `idgen` | function |
| `sessionId` | string |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `debug`

Request/response capture ring buffer for debugging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

| Option | Type |
|---|---|
| `now` | function |
| `onEntry` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.debug.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency keys for safe retries of mutating operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

| Option | Type |
|---|---|
| `keygen` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Structured request and response logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

| Option | Type |
|---|---|
| `level` | string |
| `logger` | any |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Statistics capture: per-operation counters and latency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Pagination signals for list operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

| Option | Type |
|---|---|
| `limit` | number |
| `ops` | list |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Client-side rate limiting via a token bucket.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

| Option | Type |
|---|---|
| `now` | function |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Automatic retry of transient failures with exponential backoff.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

| Option | Type |
|---|---|
| `jitter` | boolean |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Distributed tracing spans with W3C trace-context propagation.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `exporter` | function |
| `headers` | map |
| `idgen` | function |
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

#### `timeout`

Per-request timeout with transport abort.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

| Option | Type |
|---|---|
| `clearTimer` | function |
| `setTimer` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

