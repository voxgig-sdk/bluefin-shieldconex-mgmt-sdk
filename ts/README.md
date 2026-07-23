# BluefinShieldconexMgmt TypeScript SDK



The TypeScript SDK for the BluefinShieldconexMgmt API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.Client()` — each with a small set of operations (`list`, `load`, `create`, `update`, `remove`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to npm. Install it from the GitHub
release tag (`ts/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases](https://github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { BluefinShieldconexMgmtSDK } from '@voxgig-sdk/bluefin-shieldconex-mgmt'

const client = new BluefinShieldconexMgmtSDK({
  apikey: process.env.BLUEFIN_SHIELDCONEX_MGMT_APIKEY,
})
```

### 2. List client records

`list()` resolves to an array of Client objects — iterate it directly:

```ts
const client_s = await client.Client().list()

for (const client_ of client_s) {
  console.log(client_)
}
```

### 3. Load a client

`load()` returns the entity directly and throws on failure:

```ts
try {
  const client_ = await client.Client().load({ id: 'example_id' })
  console.log(client_)
} catch (err) {
  console.error('load failed:', err)
}
```

### 4. Create, update, and remove

```ts
// Create — returns the created Client
const created = await client.Client().create({
  billing_id: 'example_billing_id',
  contact: {},
})

// Remove
await client.Client().remove({
  id: 'example_id',
})
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

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result instanceof Error) {
  throw result
}
if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = BluefinShieldconexMgmtSDK.test()

const partner = await client.Partner().list()
// partner is a bare entity populated with mock response data
console.log(partner)
```

You can also use the instance method:

```ts
const client = new BluefinShieldconexMgmtSDK({ apikey: '...' })
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Partner()

// First call runs the operation and stores its result
await entity.list()

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data.id)
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new BluefinShieldconexMgmtSDK({
  apikey: '...',
  extend: [logger],
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_SHIELDCONEX_MGMT_TEST_LIVE=TRUE
BLUEFIN_SHIELDCONEX_MGMT_APIKEY=<your-key>
```

Then run:

```bash
cd ts && npm test
```


## Reference

### BluefinShieldconexMgmtSDK

#### Constructor

```ts
new BluefinShieldconexMgmtSDK(options?: {
  apikey?: string
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `Client(data?)` | `ClientEntity` | Create a Client entity instance. |
| `Clone(data?)` | `CloneEntity` | Create a Clone entity instance. |
| `Partner(data?)` | `PartnerEntity` | Create a Partner entity instance. |
| `Template(data?)` | `TemplateEntity` | Create a Template entity instance. |
| `Transaction(data?)` | `TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult(data?)` | `UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User(data?)` | `UserEntity` | Create an User entity instance. |
| `tester(testopts?, sdkopts?)` | `BluefinShieldconexMgmtSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `BluefinShieldconexMgmtSDK.test(testopts?, sdkopts?)` | `BluefinShieldconexMgmtSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Entity>` | Create a new entity. |
| `update` | `update(reqdata?, ctrl?): Promise<Entity>` | Update an existing entity. |
| `remove` | `remove(reqmatch?, ctrl?): Promise<void>` | Remove an entity. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): BluefinShieldconexMgmtSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load`, `create` and `update` resolve to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).
- `remove` resolves to `void`.

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

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

Operations: create, list, load, remove.

API path: `/clients`

#### Clone

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: create.

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

Operations: create, list, load.

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

Operations: create, list, load, remove.

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

Operations: list, load.

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

Operations: create, list, update.

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

Operations: load.

API path: `/users/{id}`



## Entities


### Client

Create an instance: `const client_ = client.Client()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `Record<string, any>` |  |
| `created` | `string` |  |
| `direct_partner` | `Record<string, any>` |  |
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `Record<string, any>` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const client_ = await client.Client().load({ id: 'client_id' })
```

#### Example: List

```ts
const client_s = await client.Client().list()
```

#### Example: Create

```ts
const client_ = await client.Client().create({
})
```


### Clone

Create an instance: `const clone = client.Clone()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `number` |  |
| `name` | `string` |  |

#### Example: Create

```ts
const clone = await client.Clone().create({
  template_id: 'example_template_id',
})
```


### Partner

Create an instance: `const partner = client.Partner()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `contact` | `Record<string, any>` |  |
| `created` | `string` |  |
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `Record<string, any>` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const partner = await client.Partner().load({ id: 'partner_id' })
```

#### Example: List

```ts
const partners = await client.Partner().list()
```

#### Example: Create

```ts
const partner = await client.Partner().create({
})
```


### Template

Create an instance: `const template = client.Template()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `access_mode` | `any` |  |
| `active` | `boolean` |  |
| `client` | `Record<string, any>` |  |
| `field_template` | `any[]` |  |
| `id` | `number` |  |
| `name` | `string` |  |
| `option` | `Record<string, any>` |  |
| `partner` | `Record<string, any>` |  |
| `reference` | `string` |  |
| `type` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const template = await client.Template().load({ id: 'template_id' })
```

#### Example: List

```ts
const templates = await client.Template().list()
```

#### Example: Create

```ts
const template = await client.Template().create({
})
```


### Transaction

Create an instance: `const transaction = client.Transaction()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bfid` | `string` |  |
| `client` | `Record<string, any>` |  |
| `complete_date` | `string` |  |
| `direct_partner` | `Record<string, any>` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `number` |  |
| `ip_address` | `string` |  |
| `message_id` | `string` |  |
| `partner` | `Record<string, any>` |  |
| `reference` | `string` |  |
| `success` | `boolean` |  |
| `template_id` | `string` |  |

#### Example: Load

```ts
const transaction = await client.Transaction().load({ id: 'transaction_id' })
```

#### Example: List

```ts
const transactions = await client.Transaction().list()
```


### UpdateResult

Create an instance: `const update_result = client.UpdateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client` | `Record<string, any>` |  |
| `contact` | `Record<string, any>` |  |
| `direct_partner` | `Record<string, any>` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `last_name` | `string` |  |
| `mid` | `string` |  |
| `name` | `string` |  |
| `parent` | `Record<string, any>` |  |
| `partner` | `Record<string, any>` |  |
| `phone` | `string` |  |
| `reference` | `string` |  |
| `send_welcome_email` | `boolean` |  |
| `user_name` | `string` |  |
| `user_role` | `Record<string, any>` |  |
| `verification_phrase` | `string` |  |
| `version` | `number` |  |

#### Example: List

```ts
const update_results = await client.UpdateResult().list()
```

#### Example: Create

```ts
const update_result = await client.UpdateResult().create({
  contact: {},
  email: 'example_email',
  first_name: 'example_first_name',
  last_name: 'example_last_name',
  phone: 'example_phone',
  user_name: 'example_user_name',
  user_role: {},
})
```


### User

Create an instance: `const user = client.User()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Record<string, any>` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `Record<string, any>` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `Record<string, any>` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const user = await client.User().load({ id: 'user_id' })
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

### Module structure

```
bluefin-shieldconex-mgmt/
├── src/
│   ├── BluefinShieldconexMgmtSDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { BluefinShieldconexMgmtSDK } from '@voxgig-sdk/bluefin-shieldconex-mgmt'
```

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
