# BluefinShieldconexMgmt Clojure SDK Reference

Complete API reference for the BluefinShieldconexMgmt Clojure SDK.


## Client

### make-sdk

```clojure
(require '[sdk.api :as api]
         '[voxgig.struct :as vs])

(def client (api/make-sdk options))
```

Create a new SDK client instance. `options` is a `voxgig.struct` map.

**Options:**

| Key | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides (e.g. custom fetch). |


### Test client

#### `(api/test-sdk testopts sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```clojure
(def client (api/test-sdk nil nil))
```


### Client functions

#### `(api/client client data)`

Create a new `Client` entity instance. Pass `nil` for no initial data.

#### `(api/clone client data)`

Create a new `Clone` entity instance. Pass `nil` for no initial data.

#### `(api/partner client data)`

Create a new `Partner` entity instance. Pass `nil` for no initial data.

#### `(api/template client data)`

Create a new `Template` entity instance. Pass `nil` for no initial data.

#### `(api/transaction client data)`

Create a new `Transaction` entity instance. Pass `nil` for no initial data.

#### `(api/update_result client data)`

Create a new `UpdateResult` entity instance. Pass `nil` for no initial data.

#### `(api/user client data)`

Create a new `User` entity instance. Pass `nil` for no initial data.

#### `(api/options-map client) -> map`

Return a deep copy of the current SDK options.

#### `(api/get-utility client) -> utility`

Return a copy of the SDK utility object.

#### `(api/direct client fetchargs) -> map`

Make a direct HTTP request to any API endpoint. Returns a result `map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `(vs/getprop result "ok")`.

**Fetch args:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

**Returns:** a result `map`.

#### `(api/prepare client fetchargs) -> map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Client

```clojure
(require '[sdk.entity.client :as e-client])

(def client (api/client client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `map` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `map` | No |  |
| `id` | `long` | No |  |
| `is_active` | `boolean` | No |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `map` | No |  |
| `version` | `long` | No |  |

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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-client/create (api/client client nil)
    (vs/jm
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [client (e-client/list (api/client client nil) nil nil)]
  (println client))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-client/load (api/client client nil) (vs/jm "id" "client_id") nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-client/remove (api/client client nil) (vs/jm "id" "client_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Client` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Clone

```clojure
(require '[sdk.entity.clone :as e-clone])

(def clone (api/clone client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `long` | No |  |
| `name` | `string` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-clone/create (api/clone client nil)
    (vs/jm
      "template_id" "example_template_id"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Clone` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Partner

```clojure
(require '[sdk.entity.partner :as e-partner])

(def partner (api/partner client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `contact` | `map` | No |  |
| `created` | `string` | No |  |
| `id` | `long` | No |  |
| `is_active` | `boolean` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `map` | No |  |
| `reference` | `string` | No |  |
| `verification_phrase` | `string` | No |  |
| `version` | `long` | No |  |

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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-partner/create (api/partner client nil)
    (vs/jm
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [partner (e-partner/list (api/partner client nil) nil nil)]
  (println partner))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-partner/load (api/partner client nil) (vs/jm "id" "partner_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Partner` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Template

```clojure
(require '[sdk.entity.template :as e-template])

(def template (api/template client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `access_mode` | `any` | No |  |
| `active` | `boolean` | No |  |
| `client` | `map` | No |  |
| `field_template` | `vector` | No |  |
| `id` | `long` | No |  |
| `name` | `string` | No |  |
| `option` | `map` | No |  |
| `partner` | `map` | No |  |
| `reference` | `string` | No |  |
| `type` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-template/create (api/template client nil)
    (vs/jm
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [template (e-template/list (api/template client nil) nil nil)]
  (println template))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-template/load (api/template client nil) (vs/jm "id" "template_id") nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-template/remove (api/template client nil) (vs/jm "id" "template_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Template` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Transaction

```clojure
(require '[sdk.entity.transaction :as e-transaction])

(def transaction (api/transaction client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bfid` | `string` | No |  |
| `client` | `map` | No |  |
| `complete_date` | `string` | No |  |
| `direct_partner` | `map` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `long` | No |  |
| `ip_address` | `string` | No |  |
| `message_id` | `string` | No |  |
| `partner` | `map` | No |  |
| `reference` | `string` | No |  |
| `success` | `boolean` | No |  |
| `template_id` | `string` | No |  |

### Operations

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [transaction (e-transaction/list (api/transaction client nil) nil nil)]
  (println transaction))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-transaction/load (api/transaction client nil) (vs/jm "id" "transaction_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Transaction` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## UpdateResult

```clojure
(require '[sdk.entity.update_result :as e-update_result])

(def update_result (api/update_result client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client` | `map` | No |  |
| `contact` | `map` | Yes |  |
| `direct_partner` | `map` | No |  |
| `email` | `string` | Yes |  |
| `first_name` | `string` | Yes |  |
| `id` | `long` | No |  |
| `is_active` | `boolean` | No |  |
| `last_name` | `string` | Yes |  |
| `mid` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `map` | No |  |
| `partner` | `map` | No |  |
| `phone` | `string` | Yes |  |
| `reference` | `string` | No |  |
| `send_welcome_email` | `boolean` | No |  |
| `user_name` | `string` | Yes |  |
| `user_role` | `map` | Yes |  |
| `verification_phrase` | `string` | No |  |
| `version` | `long` | No |  |

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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-update_result/create (api/update_result client nil)
    (vs/jm
      "contact" (vs/jm)  ;; map
      "email" "example_email"  ;; string
      "first_name" "example_first_name"  ;; string
      "last_name" "example_last_name"  ;; string
      "phone" "example_phone"  ;; string
      "user_name" "example_user_name"  ;; string
      "user_role" (vs/jm)  ;; map
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [update_result (e-update_result/list (api/update_result client nil) nil nil)]
  (println update_result))
```

#### `(update ent reqdata ctrl) -> map`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```clojure
(def result
  (e-update_result/update (api/update_result client nil)
    (vs/jm
      "id" "id"
      ;; Fields to update
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `UpdateResult` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## User

```clojure
(require '[sdk.entity.user :as e-user])

(def user (api/user client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `long` | No |  |
| `is_active` | `boolean` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `map` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `map` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-user/load (api/user client nil) (vs/jm "id" "user_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `User` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```clojure
(def client
  (api/make-sdk
    (vs/jm "feature"
      (vs/jm
        "test" (vs/jm "active" true)
        ))))
```

