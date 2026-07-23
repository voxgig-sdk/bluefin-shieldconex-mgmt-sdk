// Typed models for the BluefinShieldconexMgmt SDK (JSDoc typedefs).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
// edit by hand.

/**
 * @typedef {Object} Client
 * @property {string} [billing_id]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [direct_partner]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [mid]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [partner]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ClientLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} ClientListMatch
 * @property {string} [billing_id]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [direct_partner]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [mid]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [partner]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ClientCreateData
 * @property {string} [billing_id]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [direct_partner]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [mid]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [partner]
 * @property {number} [version]
 */

/**
 * @typedef {Object} ClientRemoveMatch
 * @property {string} id
 */

/**
 * @typedef {Object} Clone
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} CloneCreateData
 * @property {string} template_id
 */

/**
 * @typedef {Object} Partner
 * @property {string} [billing_id]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [reference]
 * @property {string} [verification_phrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} PartnerLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} PartnerListMatch
 * @property {string} [billing_id]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [reference]
 * @property {string} [verification_phrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} PartnerCreateData
 * @property {string} [billing_id]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [reference]
 * @property {string} [verification_phrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} Template
 * @property {*} [access_mode]
 * @property {boolean} [active]
 * @property {Object} [client]
 * @property {Array} [field_template]
 * @property {number} [id]
 * @property {string} [name]
 * @property {Object} [option]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {string} [type]
 * @property {number} [version]
 */

/**
 * @typedef {Object} TemplateLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} TemplateListMatch
 * @property {*} [access_mode]
 * @property {boolean} [active]
 * @property {Object} [client]
 * @property {Array} [field_template]
 * @property {number} [id]
 * @property {string} [name]
 * @property {Object} [option]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {string} [type]
 * @property {number} [version]
 */

/**
 * @typedef {Object} TemplateCreateData
 * @property {*} [access_mode]
 * @property {boolean} [active]
 * @property {Object} [client]
 * @property {Array} [field_template]
 * @property {number} [id]
 * @property {string} [name]
 * @property {Object} [option]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {string} [type]
 * @property {number} [version]
 */

/**
 * @typedef {Object} TemplateRemoveMatch
 * @property {string} id
 */

/**
 * @typedef {Object} Transaction
 * @property {string} [bfid]
 * @property {Object} [client]
 * @property {string} [complete_date]
 * @property {Object} [direct_partner]
 * @property {string} [err_code]
 * @property {string} [err_message]
 * @property {number} [id]
 * @property {string} [ip_address]
 * @property {string} [message_id]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {boolean} [success]
 * @property {string} [template_id]
 */

/**
 * @typedef {Object} TransactionLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} TransactionListMatch
 * @property {string} [bfid]
 * @property {Object} [client]
 * @property {string} [complete_date]
 * @property {Object} [direct_partner]
 * @property {string} [err_code]
 * @property {string} [err_message]
 * @property {number} [id]
 * @property {string} [ip_address]
 * @property {string} [message_id]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {boolean} [success]
 * @property {string} [template_id]
 */

/**
 * @typedef {Object} UpdateResult
 * @property {string} [billing_id]
 * @property {Object} [client]
 * @property {Object} contact
 * @property {Object} [direct_partner]
 * @property {string} email
 * @property {string} first_name
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} last_name
 * @property {string} [mid]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {Object} [partner]
 * @property {string} phone
 * @property {string} [reference]
 * @property {boolean} [send_welcome_email]
 * @property {string} user_name
 * @property {Object} user_role
 * @property {string} [verification_phrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultListMatch
 * @property {string} [billing_id]
 * @property {Object} [client]
 * @property {Object} [contact]
 * @property {Object} [direct_partner]
 * @property {string} [email]
 * @property {string} [first_name]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [last_name]
 * @property {string} [mid]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [reference]
 * @property {boolean} [send_welcome_email]
 * @property {string} [user_name]
 * @property {Object} [user_role]
 * @property {string} [verification_phrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultCreateData
 * @property {string} [billing_id]
 * @property {Object} [client]
 * @property {Object} contact
 * @property {Object} [direct_partner]
 * @property {string} email
 * @property {string} first_name
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} last_name
 * @property {string} [mid]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {Object} [partner]
 * @property {string} phone
 * @property {string} [reference]
 * @property {boolean} [send_welcome_email]
 * @property {string} user_name
 * @property {Object} user_role
 * @property {string} [verification_phrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultUpdateData
 * @property {string} id
 */

/**
 * @typedef {Object} User
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [email]
 * @property {string} [first_name]
 * @property {number} [id]
 * @property {boolean} [is_active]
 * @property {string} [last_name]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [user_name]
 * @property {Object} [user_role]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UserLoadMatch
 * @property {string} id
 */

