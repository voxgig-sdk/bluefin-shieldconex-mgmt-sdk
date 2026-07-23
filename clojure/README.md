# BluefinShieldconexMgmt Clojure SDK



The Clojure SDK for the BluefinShieldconexMgmt API — an entity-oriented client
following idiomatic Clojure conventions (plain functions, immutable data, and
the vendored `voxgig.struct` value model).

The SDK exposes the API as capitalised, semantic **Entities** — for example `(api/client client nil)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Clojars. Depend on it directly from the
GitHub release tag (`clojure/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)),
using a `tools.deps` git dependency:

```clojure
;; deps.edn
{:deps {bluefinshieldconexmgmt/sdk
        {:git/url "https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk"
         :git/tag "clojure/vX.Y.Z"
         :git/sha "..."
         :deps/root "clojure"}}}
```

Or from a local source checkout:

```clojure
;; deps.edn
{:deps {bluefinshieldconexmgmt/sdk {:local/root "../clojure"}}}
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```clojure
(require '[sdk.api :as api]
         '[sdk.entity.client :as e-client]
         '[voxgig.struct :as vs])

(def client (api/make-sdk (vs/jm "apikey" (System/getenv "BLUEFIN_SHIELDCONEX_MGMT_APIKEY"))))
```

### 2. List client records

`list` returns a vector of records (each a map) and raises on error —
iterate it directly.

```clojure
(try
  (doseq [client (e-client/list (api/client client nil) nil nil)]
    (println client))
  (catch Exception err
    (println "list failed:" (.getMessage err))))
```

### 3. Load a client

`load` returns the bare record (a map) and raises on error.

```clojure
(try
  (let [client (e-client/load (api/client client nil) (vs/jm "id" "example_id") nil)]
    (println client))
  (catch Exception err
    (println "load failed:" (.getMessage err))))
```

### 4. Create, update, and remove

```clojure
;; Create — returns the bare created record (a map)
(def created (e-client/create (api/client client nil) (vs/jm "billing_id" "example_billing_id" "contact" (vs/jm)) nil))

;; Remove
(e-client/remove (api/client client nil) (vs/jm "id" (vs/getprop created "id")) nil)
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

For endpoints not covered by entity operations:

```clojure
(def result
  (api/direct client
    (vs/jm "path" "/api/resource/{id}"
           "method" "GET"
           "params" (vs/jm "id" "example"))))

(if (vs/getprop result "ok")
  (do
    (println (vs/getprop result "status"))  ;; 200
    (println (vs/getprop result "data")))   ;; response body
  ;; A non-2xx response carries status + data (the error body); a
  ;; transport-level failure carries err instead. Only one is present.
  (println (vs/getprop result "status") (vs/getprop result "err")))
```

### Prepare a request without sending it

```clojure
;; prepare returns the fetch definition and raises on error.
(def fetchdef
  (api/prepare client
    (vs/jm "path" "/api/resource/{id}"
           "method" "DELETE"
           "params" (vs/jm "id" "example"))))

(println (vs/getprop fetchdef "url"))
(println (vs/getprop fetchdef "method"))
(println (vs/getprop fetchdef "headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```clojure
(require '[sdk.api :as api]
         '[sdk.entity.partner :as e-partner]
         '[voxgig.struct :as vs])

(def client (api/test-sdk nil nil))

;; Entity ops return the bare record and raise on error.
(def partner (e-partner/list (api/partner client nil) nil nil))
;; partner contains the mock response record
(println partner)
```

### Use a custom fetch function

Replace the HTTP transport with your own function. A fetch fn takes the
URL and fetch definition and returns a `[response err]` pair; `response`
is a struct map carrying `status`, `headers`, and a `json` thunk:

```clojure
(defn mock-fetch [url fetchdef]
  [(vs/jm "status" 200
          "statusText" "OK"
          "headers" (vs/jm)
          "json" (fn [] (vs/jm "id" "mock01")))
   nil])

(def client
  (api/make-sdk
    (vs/jm "base" "http://localhost:8080"
           "system" (vs/jm "fetch" mock-fetch))))
```

### Run the test suite

The generated suite (pipeline, features, netsim, primary utility and the
vendored struct corpus) runs offline through a single `tools.deps` entry
point:

```bash
cd clojure && make test
```

To exercise the SDK against the live API, construct a client with real
credentials and call its operations directly.


## Reference

### make-sdk

```clojure
(require '[sdk.api :as api]
         '[voxgig.struct :as vs])

(def client (api/make-sdk options))
```

Creates a new SDK client. `options` is a `voxgig.struct` map (or `nil`).

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `extend` | `vector` | Additional feature atoms to load. |
| `system` | `map` | System overrides (e.g. custom `fetch` fn). |

### test-sdk

```clojure
(def client (api/test-sdk testopts sdkopts))
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### Client functions

| Function | Signature | Description |
| --- | --- | --- |
| `options-map` | `(client) -> map` | Deep copy of current SDK options. |
| `get-utility` | `(client) -> utility` | Copy of the SDK utility object. |
| `prepare` | `(client fetchargs) -> map` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(client fetchargs) -> map` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `client` | `(client data) -> Client entity` | Create a Client entity instance. |
| `clone` | `(client data) -> Clone entity` | Create a Clone entity instance. |
| `partner` | `(client data) -> Partner entity` | Create a Partner entity instance. |
| `template` | `(client data) -> Template entity` | Create a Template entity instance. |
| `transaction` | `(client data) -> Transaction entity` | Create a Transaction entity instance. |
| `update_result` | `(client data) -> UpdateResult entity` | Create an UpdateResult entity instance. |
| `user` | `(client data) -> User entity` | Create an User entity instance. |

### Entity interface

All entities share the same interface. Operations are functions in the
entity namespace (`sdk.entity.<name>`); state accessors are stored on the
entity map and are called via keyword lookup.

| Member | Signature | Description |
| --- | --- | --- |
| `load` | `(ent reqmatch ctrl) -> map` | Load a single entity by match criteria. Raises on error. |
| `list` | `(ent reqmatch ctrl) -> vector` | List entities matching the criteria. Raises on error. |
| `create` | `(ent reqdata ctrl) -> map` | Create a new entity. Raises on error. |
| `update` | `(ent reqdata ctrl) -> map` | Update an existing entity. Raises on error. |
| `remove` | `(ent reqmatch ctrl) -> map` | Remove an entity. Raises on error. |
| `:data-get` | `() -> map` | Get entity data. |
| `:data-set` | `(data)` | Set entity data. |
| `:match-get` | `() -> map` | Get entity match criteria. |
| `:match-set` | `(match)` | Set entity match criteria. |
| `:make` | `() -> entity` | Create a new instance with the same options. |
| `:get-name` | `() -> string` | Return the entity name. |

State accessors are called by looking up the fn and applying it, e.g.
`((:data-get ent))` or `((:data-set ent) (vs/jm "k" "v"))`.

### Result shape

Entity operations return the bare result data (a `map` for single-entity
ops, a `vector` for `list`) and raise (via `ex-info`) on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct` escape hatch never raises — it returns a result `map` you
branch on via `(vs/getprop result "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean` | `true` if the HTTP status is 2xx. |
| `status` | `long` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

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

Create an instance: `(def client (api/client client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(remove ent match ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `map` |  |
| `created` | `string` |  |
| `direct_partner` | `map` |  |
| `id` | `long` |  |
| `is_active` | `boolean` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `map` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def client (e-client/load (api/client client nil) (vs/jm "id" "client_id") nil))
```

#### Example: List

```clojure
(def clients (e-client/list (api/client client nil) nil nil))
```

#### Example: Create

```clojure
(def client
  (e-client/create (api/client client nil)
    (vs/jm
      )
    nil))
```


### Clone

Create an instance: `(def clone (api/clone client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `long` |  |
| `name` | `string` |  |

#### Example: Create

```clojure
(def clone
  (e-clone/create (api/clone client nil)
    (vs/jm
      "template_id" "example_template_id"  ;; string
      )
    nil))
```


### Partner

Create an instance: `(def partner (api/partner client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `map` |  |
| `created` | `string` |  |
| `id` | `long` |  |
| `is_active` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `map` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def partner (e-partner/load (api/partner client nil) (vs/jm "id" "partner_id") nil))
```

#### Example: List

```clojure
(def partners (e-partner/list (api/partner client nil) nil nil))
```

#### Example: Create

```clojure
(def partner
  (e-partner/create (api/partner client nil)
    (vs/jm
      )
    nil))
```


### Template

Create an instance: `(def template (api/template client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(remove ent match ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `any` |  |
| `active` | `boolean` |  |
| `client` | `map` |  |
| `field_template` | `vector` |  |
| `id` | `long` |  |
| `name` | `string` |  |
| `option` | `map` |  |
| `partner` | `map` |  |
| `reference` | `string` |  |
| `type` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def template (e-template/load (api/template client nil) (vs/jm "id" "template_id") nil))
```

#### Example: List

```clojure
(def templates (e-template/list (api/template client nil) nil nil))
```

#### Example: Create

```clojure
(def template
  (e-template/create (api/template client nil)
    (vs/jm
      )
    nil))
```


### Transaction

Create an instance: `(def transaction (api/transaction client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `string` |  |
| `client` | `map` |  |
| `complete_date` | `string` |  |
| `direct_partner` | `map` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `long` |  |
| `ip_address` | `string` |  |
| `message_id` | `string` |  |
| `partner` | `map` |  |
| `reference` | `string` |  |
| `success` | `boolean` |  |
| `template_id` | `string` |  |

#### Example: Load

```clojure
(def transaction (e-transaction/load (api/transaction client nil) (vs/jm "id" "transaction_id") nil))
```

#### Example: List

```clojure
(def transactions (e-transaction/list (api/transaction client nil) nil nil))
```


### UpdateResult

Create an instance: `(def update_result (api/update_result client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(update ent data ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client` | `map` |  |
| `contact` | `map` |  |
| `direct_partner` | `map` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `long` |  |
| `is_active` | `boolean` |  |
| `last_name` | `string` |  |
| `mid` | `string` |  |
| `name` | `string` |  |
| `parent` | `map` |  |
| `partner` | `map` |  |
| `phone` | `string` |  |
| `reference` | `string` |  |
| `send_welcome_email` | `boolean` |  |
| `user_name` | `string` |  |
| `user_role` | `map` |  |
| `verification_phrase` | `string` |  |
| `version` | `long` |  |

#### Example: List

```clojure
(def update_results (e-update_result/list (api/update_result client nil) nil nil))
```

#### Example: Create

```clojure
(def update_result
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


### User

Create an instance: `(def user (api/user client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `long` |  |
| `is_active` | `boolean` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `map` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `map` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def user (e-user/load (api/user client nil) (vs/jm "id" "user_id") nil))
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

### Data as struct value maps

The Clojure SDK represents API data with the vendored `voxgig.struct`
value model (ordered, Java-backed maps and lists) rather than typed
records. This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with `(vs/jm "k" v ...)` and lists with
`(vs/jt v ...)`; read values with `(vs/getprop m "k")`. Use
`(vs/ismap x)` to safely check that a value is a map.

### Namespace structure

```
clojure/
├── src/sdk/api.clj        -- public API namespace (entity accessors)
├── src/sdk/client.clj     -- client constructors (make-sdk, test-sdk)
├── src/sdk/config.clj     -- generated configuration
├── src/sdk/core.clj       -- core types, context and pipeline
├── src/sdk/features.clj   -- feature factory
├── src/sdk/entity/        -- entity namespaces (one per entity)
├── src/voxgig/struct.clj  -- vendored struct value library
└── test/                  -- test suites
```

Require `[sdk.api :as api]` for the public surface, and an entity
namespace (e.g. `[sdk.entity.bluefinshieldconexmgmt :as e-bluefinshieldconexmgmt]`)
only when you call its operations directly.

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
