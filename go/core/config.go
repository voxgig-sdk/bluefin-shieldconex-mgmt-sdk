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
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
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
						"short": "Billing ID",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "contact",
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
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "directPartner",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "isActive",
						"short": "This property indicates if the Client account is active or disabled.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "mid",
						"short": "Some Partners will have an merchant ids on their own software offerings.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"short": "The Client's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
						"type": "`$INTEGER`",
					},
				},
				"name": "client",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "billing_id",
											"orig": "billing_id",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_email",
											"orig": "contact_email",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_first_name",
											"orig": "contact_first_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_is_active",
											"orig": "contact_is_active",
											"reqd": true,
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_last_name",
											"orig": "contact_last_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_phone",
											"orig": "contact_phone",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_send_welcome_email",
											"orig": "contact_send_welcome_email",
											"reqd": true,
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_user_name",
											"orig": "contact_user_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_user_role",
											"orig": "contact_user_role",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "direct_partner_id",
											"orig": "direct_partner_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "direct_partner_name",
											"orig": "direct_partner_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "is_active",
											"orig": "is_active",
											"reqd": true,
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "mid",
											"orig": "mid",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/clients",
								"parts": []any{
									"clients",
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/clients",
								"parts": []any{
									"clients",
								},
								"select": map[string]any{
									"exist": []any{
										"partner",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/clients/{id}",
								"parts": []any{
									"clients",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "DELETE",
								"orig": "/clients/{id}",
								"parts": []any{
									"clients",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
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
						"short": "Unique identifier of newly added element.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"short": "Name of Template",
						"type": "`$STRING`",
					},
				},
				"name": "clone",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "template_id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/templates/{id}/clone",
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
								"select": map[string]any{
									"exist": []any{
										"template_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"template",
						},
					},
				},
			},
			"partner": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "billingId",
						"short": "The Partner's billing identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "contact",
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
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "isActive",
						"short": "This property indicates if the Parter account is active or disabled.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"short": "The Partner's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "parent",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$OBJECT`",
							},
						},
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "reference",
						"short": "The Partner's reference string.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "verificationPhrase",
						"short": "The verification phrase is a message that the Partner creates.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
						"type": "`$INTEGER`",
					},
				},
				"name": "partner",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "billing_id",
											"orig": "billing_id",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_email",
											"orig": "contact_email",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_first_name",
											"orig": "contact_first_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_is_active",
											"orig": "contact_is_active",
											"reqd": true,
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_last_name",
											"orig": "contact_last_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_phone",
											"orig": "contact_phone",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_send_welcome_email",
											"orig": "contact_send_welcome_email",
											"reqd": true,
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_user_name",
											"orig": "contact_user_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_user_role",
											"orig": "contact_user_role",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "is_active",
											"orig": "is_active",
											"reqd": true,
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "parent_id",
											"orig": "parent_id",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "parent_name",
											"orig": "parent_name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "reference",
											"orig": "reference",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "verification_phrase",
											"orig": "verification_phrase",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/partners",
								"parts": []any{
									"partners",
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/partners",
								"parts": []any{
									"partners",
								},
								"select": map[string]any{
									"exist": []any{
										"partner",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/partners/{id}",
								"parts": []any{
									"partners",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
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
						"short": "The Template's access mode.",
						"type": "`$ANY`",
					},
					map[string]any{
						"name": "active",
						"short": "This property indicates if the Template is active or inactive.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "client",
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "fieldTemplates",
						"short": "Field Template list items",
						"type": "`$ARRAY`",
						"union": map[string]any{
							"branches": 9,
							"count": 1,
							"depth": 1,
						},
					},
					map[string]any{
						"name": "id",
						"short": "Unique identifier of newly added element.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"short": "The Template's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "options",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "reference",
						"short": "The Template's unique reference.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"short": "The Template's type.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
						"type": "`$INTEGER`",
					},
				},
				"name": "template",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "access_mode",
											"orig": "access_mode",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "active",
											"orig": "active",
											"reqd": true,
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "client_id",
											"orig": "client_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "client_name",
											"orig": "client_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "field_template",
											"orig": "field_template",
											"type": "`$ARRAY`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_custom_style",
											"orig": "options_custom_style",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_custom_style_file",
											"orig": "options_custom_style_file",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_domain",
											"orig": "options_domain",
											"type": "`$ARRAY`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_security_active_from",
											"orig": "options_security_active_from",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_security_active_to",
											"orig": "options_security_active_to",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_security_irreversible",
											"orig": "options_security_irreversible",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner_id",
											"orig": "partner_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner_name",
											"orig": "partner_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "reference",
											"orig": "reference",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "version",
											"orig": "version",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/templates",
								"parts": []any{
									"templates",
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/templates",
								"parts": []any{
									"templates",
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"partner",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/templates/{id}",
								"parts": []any{
									"templates",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "DELETE",
								"orig": "/templates/{id}",
								"parts": []any{
									"templates",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
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
						"short": "BFID",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "client",
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "completeDate",
						"short": "Timestamp from the beginning of the transaction.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "directPartner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "errCode",
						"short": "The error code that is sent in response to a failed decrypt API call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "errMessage",
						"short": "The error messge that is sent in response to a failed decrypt API call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "ipAddress",
						"short": "The IP address of the http client that makes the decrypt API call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "messageId",
						"short": "Message ID.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "reference",
						"short": "The reference property that the Client includes in the decrypt API call.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "success",
						"short": "The success indicator.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "templateId",
						"short": "The Template's unique identifier.",
						"type": "`$STRING`",
					},
				},
				"name": "transaction",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "date_from",
											"orig": "date_from",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "date_to",
											"orig": "date_to",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "message_id",
											"orig": "message_id",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "paging_mode",
											"orig": "paging_mode",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "success",
											"orig": "success",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "transaction_type",
											"orig": "transaction_type",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/transactions",
								"parts": []any{
									"transactions",
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "transaction_type",
											"orig": "transaction_type",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/transactions/{id}",
								"parts": []any{
									"transactions",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"transaction_type",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
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
						"short": "The Partner's billing identifier.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "client",
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "contact",
						"req": true,
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "directPartner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "email",
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"req": true,
						"short": "The User's email address.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "firstName",
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"req": true,
						"short": "The User's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "Unique identifier of newly added element.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "isActive",
						"short": "This property indicates if the User account is active or disabled.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "lastName",
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"req": true,
						"short": "The User's Surname.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mid",
						"short": "Some Partners will have an merchant ids on their own software offerings.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "The Partner's name.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "parent",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "phone",
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"req": true,
						"short": "The User's phone number without dashes, spaces, or brackets (e.g.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reference",
						"short": "The Partner's reference string.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "sendWelcomeEmail",
						"short": "If this property is set to 'true' the newly created user will be sent a welcome email.",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "userName",
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$STRING`",
							},
							"update": map[string]any{
								"type": "`$STRING`",
							},
						},
						"req": true,
						"short": "The User's unique username.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userRole",
						"op": map[string]any{
							"list": map[string]any{
								"type": "`$OBJECT`",
							},
							"update": map[string]any{
								"type": "`$OBJECT`",
							},
						},
						"req": true,
						"short": "Reference to the associated User Role.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "verificationPhrase",
						"short": "The verification phrase is a message that the Partner creates.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
						"type": "`$INTEGER`",
					},
				},
				"name": "update_result",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"type": "`$OBJECT`",
										},
										map[string]any{
											"kind": "query",
											"name": "email",
											"orig": "email",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "first_name",
											"orig": "first_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "is_active",
											"orig": "is_active",
											"reqd": true,
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "last_name",
											"orig": "last_name",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$OBJECT`",
										},
										map[string]any{
											"kind": "query",
											"name": "phone",
											"orig": "phone",
											"reqd": true,
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "send_welcome_email",
											"orig": "send_welcome_email",
											"reqd": true,
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "user_role",
											"orig": "user_role",
											"reqd": true,
											"type": "`$OBJECT`",
										},
										map[string]any{
											"kind": "query",
											"name": "username",
											"orig": "username",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/users",
								"parts": []any{
									"users",
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "skip",
											"orig": "skip",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "take",
											"orig": "take",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/users",
								"parts": []any{
									"users",
								},
								"select": map[string]any{
									"exist": []any{
										"client",
										"partner",
										"skip",
										"take",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.data`",
								},
							},
						},
					},
					"update": map[string]any{
						"input": "data",
						"name": "update",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "access_mode",
											"orig": "access_mode",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "active",
											"orig": "active",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "client_id",
											"orig": "client_id",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "client_name",
											"orig": "client_name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "field_template",
											"orig": "field_template",
											"type": "`$ARRAY`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_custom_style",
											"orig": "options_custom_style",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_custom_style_file",
											"orig": "options_custom_style_file",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_domain",
											"orig": "options_domain",
											"type": "`$ARRAY`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_security_active_from",
											"orig": "options_security_active_from",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_security_active_to",
											"orig": "options_security_active_to",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "options_security_irreversible",
											"orig": "options_security_irreversible",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner_id",
											"orig": "partner_id",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner_name",
											"orig": "partner_name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "version",
											"orig": "version",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/templates/{id}",
								"parts": []any{
									"templates",
									"{id}",
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "billing_id",
											"orig": "billing_id",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_id",
											"orig": "contact_id",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "is_active",
											"orig": "is_active",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "parent_id",
											"orig": "parent_id",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "parent_name",
											"orig": "parent_name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "reference",
											"orig": "reference",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "verification_phrase",
											"orig": "verification_phrase",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "version",
											"orig": "version",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/partners/{id}",
								"parts": []any{
									"partners",
									"{id}",
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "client",
											"orig": "client",
											"type": "`$OBJECT`",
										},
										map[string]any{
											"kind": "query",
											"name": "email",
											"orig": "email",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "first_name",
											"orig": "first_name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "is_active",
											"orig": "is_active",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "last_name",
											"orig": "last_name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "partner",
											"orig": "partner",
											"type": "`$OBJECT`",
										},
										map[string]any{
											"kind": "query",
											"name": "phone",
											"orig": "phone",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "send_welcome_email",
											"orig": "send_welcome_email",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "username",
											"orig": "username",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/users/{id}",
								"parts": []any{
									"users",
									"{id}",
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "billing_id",
											"orig": "billing_id",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contact_id",
											"orig": "contact_id",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "direct_partner_id",
											"orig": "direct_partner_id",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "direct_partner_name",
											"orig": "direct_partner_name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "is_active",
											"orig": "is_active",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "mid",
											"orig": "mid",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "version",
											"orig": "version",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "PATCH",
								"orig": "/clients/{id}",
								"parts": []any{
									"clients",
									"{id}",
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
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
						"short": "Reference to the associated Client resource.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "created",
						"short": "Creation timestamp in ISO 8601 format.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "firstName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"short": "This resource's unique identifier.",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "isActive",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "lastName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "modified",
						"short": "Last modified timestamp.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "partner",
						"short": "Reference to the associated Partner.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "phone",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "userRole",
						"short": "Reference to the associated User Role.",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "version",
						"short": "The number of times that this resource has been updated.",
						"type": "`$INTEGER`",
					},
				},
				"name": "user",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/users/{id}",
								"parts": []any{
									"users",
									"{id}",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
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
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
