package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "BluefinShieldconexMgmt",
			"slug": "bluefin-shieldconex-mgmt",
			"version": "0.1.1",
			"target": "go",
		},
		"feature": map[string]any{
			"audit": map[string]any{
				"options": map[string]any{
					"active": false,
					"actor": "anonymous",
					"max": 1000,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sink": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"clienttrack": map[string]any{
				"options": map[string]any{
					"active": false,
					"clientVersion": "0.0.1",
				},
				"optspec": map[string]any{
					"clientName": "`$STRING`",
					"clientVersion": "`$STRING`",
					"headers": "`$MAP`",
					"idgen": "`$FUNCTION`",
					"sessionId": "`$STRING`",
				},
				"strict": false,
				"transport": "none",
			},
			"debug": map[string]any{
				"options": map[string]any{
					"active": false,
					"max": 100,
					"redact": []any{
						"authorization",
						"cookie",
						"set-cookie",
						"api-key",
						"apikey",
						"x-api-key",
						"idempotency-key",
					},
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"onEntry": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"idempotency": map[string]any{
				"options": map[string]any{
					"active": false,
					"header": "Idempotency-Key",
					"methods": []any{
						"POST",
						"PUT",
						"PATCH",
						"DELETE",
					},
					"ops": []any{
						"create",
						"update",
						"remove",
					},
				},
				"optspec": map[string]any{
					"keygen": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"log": map[string]any{
				"options": map[string]any{
					"active": true,
				},
				"optspec": map[string]any{
					"level": "`$STRING`",
					"logger": "`$ANY`",
				},
				"strict": false,
				"transport": "none",
			},
			"metrics": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"paging": map[string]any{
				"options": map[string]any{
					"active": false,
					"afterVar": "after",
					"cursorParam": "cursor",
					"firstVar": "first",
					"limitParam": "limit",
					"pageParam": "page",
					"startPage": 1,
				},
				"optspec": map[string]any{
					"limit": "`$NUMBER`",
					"ops": "`$LIST`",
				},
				"strict": false,
				"transport": "none",
			},
			"ratelimit": map[string]any{
				"options": map[string]any{
					"active": false,
					"burst": 5,
					"rate": 5,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"retry": map[string]any{
				"options": map[string]any{
					"active": false,
					"factor": 2,
					"maxDelay": 2000,
					"minDelay": 50,
					"retries": 2,
					"statuses": []any{
						408,
						425,
						429,
						500,
						502,
						503,
						504,
					},
				},
				"optspec": map[string]any{
					"jitter": "`$BOOLEAN`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"telemetry": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"exporter": "`$FUNCTION`",
					"headers": "`$MAP`",
					"idgen": "`$FUNCTION`",
					"now": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "none",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"entity": "`$MAP`",
					"net": "`$MAP`",
				},
				"strict": false,
				"transport": "base",
			},
			"timeout": map[string]any{
				"options": map[string]any{
					"active": false,
					"ms": 30000,
				},
				"optspec": map[string]any{
					"clearTimer": "`$FUNCTION`",
					"setTimer": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
		},
		"options": map[string]any{
			"base": "https://portal-cert.shieldconex.com:4010/api/v1",
			"auth": map[string]any{
				"prefix": "Basic",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"client": map[string]any{},
				"clone": map[string]any{},
				"partner": map[string]any{},
				"template": map[string]any{},
				"transaction": map[string]any{},
				"update_result": map[string]any{},
				"user": map[string]any{},
			},
		},
		"entity": map[string]any{
			"client": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "billingId",
						"title": "Billing Id",
						"type": "`$STRING`",
						"short": "Billing ID",
					},
					map[string]any{
						"name": "contact",
						"title": "Contact",
						"type": "`$OBJECT`",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
							"list": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "date-time",
					},
					map[string]any{
						"name": "directPartner",
						"title": "Direct Partner",
						"type": "`$OBJECT`",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "This resource's unique identifier.",
						"format": "int64",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the Client account is active or disabled.",
					},
					map[string]any{
						"name": "mid",
						"title": "Mid",
						"type": "`$STRING`",
						"short": "Some Partners will have an merchant ids on their own software offerings.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "date-time",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"short": "The Client's name.",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "client",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/clients",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
								},
								"parts": []any{
									"clients",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "billing_id",
											"orig": "billing_id",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "contact_email",
											"orig": "contact_email",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_first_name",
											"orig": "contact_first_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_is_active",
											"orig": "contact_is_active",
											"type": "`$BOOLEAN`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_last_name",
											"orig": "contact_last_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_phone",
											"orig": "contact_phone",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_send_welcome_email",
											"orig": "contact_send_welcome_email",
											"type": "`$BOOLEAN`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_user_name",
											"orig": "contact_user_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_user_role",
											"orig": "contact_user_role",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "direct_partner_id",
											"orig": "direct_partner_id",
											"type": "`$INTEGER`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "direct_partner_name",
											"orig": "direct_partner_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "is_active",
											"orig": "is_active",
											"type": "`$BOOLEAN`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "mid",
											"orig": "mid",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"billing_id",
										"contact_email",
										"contact_first_name",
										"contact_is_active",
										"contact_last_name",
										"contact_phone",
										"contact_send_welcome_email",
										"contact_user_name",
										"contact_user_role",
										"direct_partner_id",
										"direct_partner_name",
										"is_active",
										"mid",
										"name",
									},
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/clients",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
								},
								"parts": []any{
									"clients",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"partner",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/clients/{id}",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"clients",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "DELETE",
								"orig": "/clients/{id}",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"clients",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"clone": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "Unique identifier of newly added element.",
						"format": "int64",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "Name of Template",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "clone",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/templates/{id}/clone",
								"segments": []any{
									map[string]any{
										"lit": "templates",
									},
									map[string]any{
										"var": "template_id",
									},
									map[string]any{
										"lit": "clone",
									},
								},
								"parts": []any{
									"templates",
									"{template_id}",
									"clone",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"id": "template_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "template_id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"template_id",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"$.main.kit.entity.template",
						},
					},
				},
			},
			"partner": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "billingId",
						"title": "Billing Id",
						"type": "`$STRING`",
						"short": "The Partner's billing identifier.",
					},
					map[string]any{
						"name": "contact",
						"title": "Contact",
						"type": "`$OBJECT`",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
							"list": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "date-time",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "This resource's unique identifier.",
						"format": "int64",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the Parter account is active or disabled.",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "date-time",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"short": "The Partner's name.",
					},
					map[string]any{
						"name": "parent",
						"title": "Parent",
						"type": "`$OBJECT`",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "reference",
						"title": "Reference",
						"type": "`$STRING`",
						"short": "The Partner's reference string.",
					},
					map[string]any{
						"name": "verificationPhrase",
						"title": "Verification Phrase",
						"type": "`$STRING`",
						"short": "The verification phrase is a message that the Partner creates.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "partner",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/partners",
								"segments": []any{
									map[string]any{
										"lit": "partners",
									},
								},
								"parts": []any{
									"partners",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "billing_id",
											"orig": "billing_id",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_email",
											"orig": "contact_email",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_first_name",
											"orig": "contact_first_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_is_active",
											"orig": "contact_is_active",
											"type": "`$BOOLEAN`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_last_name",
											"orig": "contact_last_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_phone",
											"orig": "contact_phone",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_send_welcome_email",
											"orig": "contact_send_welcome_email",
											"type": "`$BOOLEAN`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_user_name",
											"orig": "contact_user_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "contact_user_role",
											"orig": "contact_user_role",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "is_active",
											"orig": "is_active",
											"type": "`$BOOLEAN`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "parent_id",
											"orig": "parent_id",
											"type": "`$INTEGER`",
											"kind": "query",
										},
										map[string]any{
											"name": "parent_name",
											"orig": "parent_name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "verification_phrase",
											"orig": "verification_phrase",
											"type": "`$STRING`",
											"kind": "query",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"billing_id",
										"contact_email",
										"contact_first_name",
										"contact_is_active",
										"contact_last_name",
										"contact_phone",
										"contact_send_welcome_email",
										"contact_user_name",
										"contact_user_role",
										"is_active",
										"name",
										"parent_id",
										"parent_name",
										"reference",
										"verification_phrase",
									},
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/partners",
								"segments": []any{
									map[string]any{
										"lit": "partners",
									},
								},
								"parts": []any{
									"partners",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"partner",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/partners/{id}",
								"segments": []any{
									map[string]any{
										"lit": "partners",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"partners",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"template": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "accessMode",
						"title": "Access Mode",
						"type": "`$ANY`",
						"short": "The Template's access mode.",
					},
					map[string]any{
						"name": "active",
						"title": "Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the Template is active or inactive.",
					},
					map[string]any{
						"name": "client",
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "fieldTemplates",
						"title": "Field Templates",
						"type": "`$ARRAY`",
						"short": "Field Template list items",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "Unique identifier of newly added element.",
						"format": "int64",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The Template's name.",
					},
					map[string]any{
						"name": "options",
						"title": "Options",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "reference",
						"title": "Reference",
						"type": "`$STRING`",
						"short": "The Template's unique reference.",
					},
					map[string]any{
						"name": "type",
						"title": "Type",
						"type": "`$STRING`",
						"short": "The Template's type.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "template",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/templates",
								"segments": []any{
									map[string]any{
										"lit": "templates",
									},
								},
								"parts": []any{
									"templates",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "access_mode",
											"orig": "access_mode",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "active",
											"orig": "active",
											"type": "`$BOOLEAN`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "client_id",
											"orig": "client_id",
											"type": "`$INTEGER`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "client_name",
											"orig": "client_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "field_template",
											"orig": "field_template",
											"type": "`$ARRAY`",
											"kind": "query",
										},
										map[string]any{
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "options_custom_style",
											"orig": "options_custom_style",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_custom_style_file",
											"orig": "options_custom_style_file",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_domain",
											"orig": "options_domain",
											"type": "`$ARRAY`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_security_active_from",
											"orig": "options_security_active_from",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_security_active_to",
											"orig": "options_security_active_to",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_security_irreversible",
											"orig": "options_security_irreversible",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "partner_id",
											"orig": "partner_id",
											"type": "`$INTEGER`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "partner_name",
											"orig": "partner_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "version",
											"orig": "version",
											"type": "`$INTEGER`",
											"kind": "query",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"access_mode",
										"active",
										"client_id",
										"client_name",
										"field_template",
										"name",
										"options_custom_style",
										"options_custom_style_file",
										"options_domain",
										"options_security_active_from",
										"options_security_active_to",
										"options_security_irreversible",
										"partner_id",
										"partner_name",
										"reference",
										"type",
										"version",
									},
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/templates",
								"segments": []any{
									map[string]any{
										"lit": "templates",
									},
								},
								"parts": []any{
									"templates",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"partner",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/templates/{id}",
								"segments": []any{
									map[string]any{
										"lit": "templates",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"templates",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "DELETE",
								"orig": "/templates/{id}",
								"segments": []any{
									map[string]any{
										"lit": "templates",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"templates",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"transaction": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "bfid",
						"title": "Bfid",
						"type": "`$STRING`",
						"short": "BFID",
					},
					map[string]any{
						"name": "client",
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "completeDate",
						"title": "Complete Date",
						"type": "`$STRING`",
						"short": "Timestamp from the beginning of the transaction.",
						"format": "date-time",
					},
					map[string]any{
						"name": "directPartner",
						"title": "Direct Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "errCode",
						"title": "Err Code",
						"type": "`$STRING`",
						"short": "The error code that is sent in response to a failed decrypt API call.",
					},
					map[string]any{
						"name": "errMessage",
						"title": "Err Message",
						"type": "`$STRING`",
						"short": "The error messge that is sent in response to a failed decrypt API call.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "This resource's unique identifier.",
						"format": "int64",
					},
					map[string]any{
						"name": "ipAddress",
						"title": "Ip Address",
						"type": "`$STRING`",
						"short": "The IP address of the http client that makes the decrypt API call.",
					},
					map[string]any{
						"name": "messageId",
						"title": "Message Id",
						"type": "`$STRING`",
						"short": "Message ID.",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "reference",
						"title": "Reference",
						"type": "`$STRING`",
						"short": "The reference property that the Client includes in the decrypt API call.",
					},
					map[string]any{
						"name": "success",
						"title": "Success",
						"type": "`$BOOLEAN`",
						"short": "The success indicator.",
					},
					map[string]any{
						"name": "templateId",
						"title": "Template Id",
						"type": "`$STRING`",
						"short": "The Template's unique identifier.",
						"format": "int32",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "transaction",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/transactions",
								"segments": []any{
									map[string]any{
										"lit": "transactions",
									},
								},
								"parts": []any{
									"transactions",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "date_from",
											"orig": "date_from",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "date_to",
											"orig": "date_to",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "message_id",
											"orig": "message_id",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "paging_mode",
											"orig": "paging_mode",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "success",
											"orig": "success",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
										map[string]any{
											"name": "transaction_type",
											"orig": "transaction_type",
											"type": "`$STRING`",
											"kind": "query",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"date_from",
										"date_to",
										"message_id",
										"paging_mode",
										"partner",
										"reference",
										"skip",
										"success",
										"take",
										"transaction_type",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/transactions/{id}",
								"segments": []any{
									map[string]any{
										"lit": "transactions",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"transactions",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
									"query": []any{
										map[string]any{
											"name": "transaction_type",
											"orig": "transaction_type",
											"type": "`$STRING`",
											"kind": "query",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"transaction_type",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"update_result": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "billingId",
						"title": "Billing Id",
						"type": "`$STRING`",
						"short": "The Partner's billing identifier.",
					},
					map[string]any{
						"name": "client",
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "contact",
						"title": "Contact",
						"type": "`$OBJECT`",
						"req": true,
					},
					map[string]any{
						"name": "directPartner",
						"title": "Direct Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "email",
						"title": "Email",
						"type": "`$STRING`",
						"req": true,
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"short": "The User's email address.",
					},
					map[string]any{
						"name": "firstName",
						"title": "First Name",
						"type": "`$STRING`",
						"req": true,
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"short": "The User's name.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "Unique identifier of newly added element.",
						"format": "int64",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
						"short": "This property indicates if the User account is active or disabled.",
					},
					map[string]any{
						"name": "lastName",
						"title": "Last Name",
						"type": "`$STRING`",
						"req": true,
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"short": "The User's Surname.",
					},
					map[string]any{
						"name": "mid",
						"title": "Mid",
						"type": "`$STRING`",
						"short": "Some Partners will have an merchant ids on their own software offerings.",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The Partner's name.",
					},
					map[string]any{
						"name": "parent",
						"title": "Parent",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "phone",
						"title": "Phone",
						"type": "`$STRING`",
						"req": true,
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"short": "The User's phone number without dashes, spaces, or brackets (e.g.",
					},
					map[string]any{
						"name": "reference",
						"title": "Reference",
						"type": "`$STRING`",
						"short": "The Partner's reference string.",
					},
					map[string]any{
						"name": "sendWelcomeEmail",
						"title": "Send Welcome Email",
						"type": "`$BOOLEAN`",
						"short": "If this property is set to 'true' the newly created user will be sent a welcome email.",
					},
					map[string]any{
						"name": "userName",
						"title": "User Name",
						"type": "`$STRING`",
						"req": true,
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"short": "The User's unique username.",
					},
					map[string]any{
						"name": "userRole",
						"title": "User Role",
						"type": "`$OBJECT`",
						"req": true,
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$OBJECT`",
							},
							"update": map[string]any{
								"type": "`$OBJECT`",
							},
						},
						"short": "Reference to the associated User Role.",
					},
					map[string]any{
						"name": "verificationPhrase",
						"title": "Verification Phrase",
						"type": "`$STRING`",
						"short": "The verification phrase is a message that the Partner creates.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "update_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/users",
								"segments": []any{
									map[string]any{
										"lit": "users",
									},
								},
								"parts": []any{
									"users",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$OBJECT`",
											"kind": "query",
										},
										map[string]any{
											"name": "email",
											"orig": "email",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "first_name",
											"orig": "first_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "is_active",
											"orig": "is_active",
											"type": "`$BOOLEAN`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "last_name",
											"orig": "last_name",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$OBJECT`",
											"kind": "query",
										},
										map[string]any{
											"name": "phone",
											"orig": "phone",
											"type": "`$INTEGER`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "send_welcome_email",
											"orig": "send_welcome_email",
											"type": "`$BOOLEAN`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "user_role",
											"orig": "user_role",
											"type": "`$OBJECT`",
											"kind": "query",
											"reqd": true,
										},
										map[string]any{
											"name": "username",
											"orig": "username",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"email",
										"first_name",
										"is_active",
										"last_name",
										"partner",
										"phone",
										"send_welcome_email",
										"user_role",
										"username",
									},
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/users",
								"segments": []any{
									map[string]any{
										"lit": "users",
									},
								},
								"parts": []any{
									"users",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 0,
										},
										map[string]any{
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 10,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"partner",
										"skip",
										"take",
									},
								},
							},
						},
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/templates/{id}",
								"segments": []any{
									map[string]any{
										"lit": "templates",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"templates",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
									"query": []any{
										map[string]any{
											"name": "access_mode",
											"orig": "access_mode",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "active",
											"orig": "active",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "client_id",
											"orig": "client_id",
											"type": "`$INTEGER`",
											"kind": "query",
										},
										map[string]any{
											"name": "client_name",
											"orig": "client_name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "field_template",
											"orig": "field_template",
											"type": "`$ARRAY`",
											"kind": "query",
										},
										map[string]any{
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_custom_style",
											"orig": "options_custom_style",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_custom_style_file",
											"orig": "options_custom_style_file",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_domain",
											"orig": "options_domain",
											"type": "`$ARRAY`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_security_active_from",
											"orig": "options_security_active_from",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_security_active_to",
											"orig": "options_security_active_to",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "options_security_irreversible",
											"orig": "options_security_irreversible",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "partner_id",
											"orig": "partner_id",
											"type": "`$INTEGER`",
											"kind": "query",
										},
										map[string]any{
											"name": "partner_name",
											"orig": "partner_name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "version",
											"orig": "version",
											"type": "`$INTEGER`",
											"kind": "query",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"access_mode",
										"active",
										"client_id",
										"client_name",
										"field_template",
										"id",
										"name",
										"options_custom_style",
										"options_custom_style_file",
										"options_domain",
										"options_security_active_from",
										"options_security_active_to",
										"options_security_irreversible",
										"partner_id",
										"partner_name",
										"reference",
										"type",
										"version",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/partners/{id}",
								"segments": []any{
									map[string]any{
										"lit": "partners",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"partners",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
									"query": []any{
										map[string]any{
											"name": "billing_id",
											"orig": "billing_id",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "contact_id",
											"orig": "contact_id",
											"type": "`$INTEGER`",
											"kind": "query",
										},
										map[string]any{
											"name": "is_active",
											"orig": "is_active",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "parent_id",
											"orig": "parent_id",
											"type": "`$INTEGER`",
											"kind": "query",
										},
										map[string]any{
											"name": "parent_name",
											"orig": "parent_name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "verification_phrase",
											"orig": "verification_phrase",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "version",
											"orig": "version",
											"type": "`$INTEGER`",
											"kind": "query",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"billing_id",
										"contact_id",
										"id",
										"is_active",
										"name",
										"parent_id",
										"parent_name",
										"reference",
										"verification_phrase",
										"version",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/users/{id}",
								"segments": []any{
									map[string]any{
										"lit": "users",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"users",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
									"query": []any{
										map[string]any{
											"name": "client",
											"orig": "client",
											"type": "`$OBJECT`",
											"kind": "query",
										},
										map[string]any{
											"name": "email",
											"orig": "email",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "first_name",
											"orig": "first_name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "is_active",
											"orig": "is_active",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "last_name",
											"orig": "last_name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "partner",
											"orig": "partner",
											"type": "`$OBJECT`",
											"kind": "query",
										},
										map[string]any{
											"name": "phone",
											"orig": "phone",
											"type": "`$INTEGER`",
											"kind": "query",
										},
										map[string]any{
											"name": "send_welcome_email",
											"orig": "send_welcome_email",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "username",
											"orig": "username",
											"type": "`$STRING`",
											"kind": "query",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"email",
										"first_name",
										"id",
										"is_active",
										"last_name",
										"partner",
										"phone",
										"send_welcome_email",
										"username",
									},
								},
							},
							map[string]any{
								"kind": "http",
								"method": "PATCH",
								"orig": "/clients/{id}",
								"segments": []any{
									map[string]any{
										"lit": "clients",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"clients",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
									"query": []any{
										map[string]any{
											"name": "billing_id",
											"orig": "billing_id",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "contact_id",
											"orig": "contact_id",
											"type": "`$INTEGER`",
											"kind": "query",
										},
										map[string]any{
											"name": "direct_partner_id",
											"orig": "direct_partner_id",
											"type": "`$INTEGER`",
											"kind": "query",
										},
										map[string]any{
											"name": "direct_partner_name",
											"orig": "direct_partner_name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "is_active",
											"orig": "is_active",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "mid",
											"orig": "mid",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "version",
											"orig": "version",
											"type": "`$INTEGER`",
											"kind": "query",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"billing_id",
										"contact_id",
										"direct_partner_id",
										"direct_partner_name",
										"id",
										"is_active",
										"mid",
										"name",
										"version",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"user": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "client",
						"title": "Client",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Client resource.",
					},
					map[string]any{
						"name": "created",
						"title": "Created",
						"type": "`$STRING`",
						"short": "Creation timestamp in ISO 8601 format.",
						"format": "date-time",
					},
					map[string]any{
						"name": "email",
						"title": "Email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "firstName",
						"title": "First Name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$INTEGER`",
						"short": "This resource's unique identifier.",
						"format": "int64",
					},
					map[string]any{
						"name": "isActive",
						"title": "Is Active",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "lastName",
						"title": "Last Name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"title": "Modified",
						"type": "`$STRING`",
						"short": "Last modified timestamp.",
						"format": "date-time",
					},
					map[string]any{
						"name": "partner",
						"title": "Partner",
						"type": "`$OBJECT`",
						"short": "Reference to the associated Partner.",
					},
					map[string]any{
						"name": "phone",
						"title": "Phone",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userName",
						"title": "User Name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userRole",
						"title": "User Role",
						"type": "`$OBJECT`",
						"short": "Reference to the associated User Role.",
					},
					map[string]any{
						"name": "version",
						"title": "Version",
						"type": "`$INTEGER`",
						"short": "The number of times that this resource has been updated.",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "user",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/users/{id}",
								"segments": []any{
									map[string]any{
										"lit": "users",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"users",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "audit":
		if NewAuditFeatureFunc != nil {
			return NewAuditFeatureFunc()
		}
	case "clienttrack":
		if NewClienttrackFeatureFunc != nil {
			return NewClienttrackFeatureFunc()
		}
	case "debug":
		if NewDebugFeatureFunc != nil {
			return NewDebugFeatureFunc()
		}
	case "idempotency":
		if NewIdempotencyFeatureFunc != nil {
			return NewIdempotencyFeatureFunc()
		}
	case "log":
		if NewLogFeatureFunc != nil {
			return NewLogFeatureFunc()
		}
	case "metrics":
		if NewMetricsFeatureFunc != nil {
			return NewMetricsFeatureFunc()
		}
	case "paging":
		if NewPagingFeatureFunc != nil {
			return NewPagingFeatureFunc()
		}
	case "ratelimit":
		if NewRatelimitFeatureFunc != nil {
			return NewRatelimitFeatureFunc()
		}
	case "retry":
		if NewRetryFeatureFunc != nil {
			return NewRetryFeatureFunc()
		}
	case "telemetry":
		if NewTelemetryFeatureFunc != nil {
			return NewTelemetryFeatureFunc()
		}
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	case "timeout":
		if NewTimeoutFeatureFunc != nil {
			return NewTimeoutFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
