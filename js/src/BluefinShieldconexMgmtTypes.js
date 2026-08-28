// Typed models for the BluefinShieldconexMgmt SDK (JSDoc typedefs).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
// edit by hand.

/**
 * @typedef {Object} Client
 * @property {string} [billingId]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [directPartner]
 * @property {number} [id]
 * @property {boolean} [isActive]
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
 * @property {string} partner
 * @property {number} [skip]
 * @property {number} [take]
 */

/**
 * @typedef {Object} ClientCreateData
 * @property {string} [billing_id]
 * @property {string} contact_email
 * @property {string} contact_first_name
 * @property {boolean} contact_is_active
 * @property {string} contact_last_name
 * @property {string} contact_phone
 * @property {boolean} contact_send_welcome_email
 * @property {string} contact_user_name
 * @property {string} contact_user_role
 * @property {number} direct_partner_id
 * @property {string} direct_partner_name
 * @property {boolean} is_active
 * @property {string} [mid]
 * @property {string} name
 * @property {string} [billingId]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {Object} [directPartner]
 * @property {number} [id]
 * @property {boolean} [isActive]
 * @property {string} [modified]
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
 * @property {number} [id]
 * @property {string} [name]
 */

/**
 * @typedef {Object} Partner
 * @property {string} [billingId]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {number} [id]
 * @property {boolean} [isActive]
 * @property {string} [modified]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [reference]
 * @property {string} [verificationPhrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} PartnerLoadMatch
 * @property {string} id
 */

/**
 * @typedef {Object} PartnerListMatch
 * @property {string} [partner]
 * @property {number} [skip]
 * @property {number} [take]
 */

/**
 * @typedef {Object} PartnerCreateData
 * @property {string} billing_id
 * @property {string} contact_email
 * @property {string} contact_first_name
 * @property {boolean} contact_is_active
 * @property {string} contact_last_name
 * @property {string} contact_phone
 * @property {boolean} contact_send_welcome_email
 * @property {string} contact_user_name
 * @property {string} contact_user_role
 * @property {boolean} is_active
 * @property {string} name
 * @property {number} [parent_id]
 * @property {string} [parent_name]
 * @property {string} reference
 * @property {string} [verification_phrase]
 * @property {string} [billingId]
 * @property {Object} [contact]
 * @property {string} [created]
 * @property {number} [id]
 * @property {boolean} [isActive]
 * @property {string} [modified]
 * @property {Object} [parent]
 * @property {string} [verificationPhrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} Template
 * @property {*} [accessMode]
 * @property {boolean} [active]
 * @property {Object} [client]
 * @property {Array} [fieldTemplates]
 * @property {number} [id]
 * @property {string} [name]
 * @property {Object} [options]
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
 * @property {string} [client]
 * @property {string} [partner]
 * @property {number} [skip]
 * @property {number} [take]
 */

/**
 * @typedef {Object} TemplateCreateData
 * @property {string} [access_mode]
 * @property {boolean} active
 * @property {number} client_id
 * @property {string} client_name
 * @property {Array} [field_template]
 * @property {string} name
 * @property {string} [options_custom_style]
 * @property {string} [options_custom_style_file]
 * @property {Array} [options_domain]
 * @property {string} [options_security_active_from]
 * @property {string} [options_security_active_to]
 * @property {boolean} [options_security_irreversible]
 * @property {number} partner_id
 * @property {string} partner_name
 * @property {string} reference
 * @property {string} [type]
 * @property {number} [version]
 * @property {*} [accessMode]
 * @property {Object} [client]
 * @property {Array} [fieldTemplates]
 * @property {number} [id]
 * @property {Object} [options]
 * @property {Object} [partner]
 */

/**
 * @typedef {Object} TemplateRemoveMatch
 * @property {string} id
 */

/**
 * @typedef {Object} Transaction
 * @property {string} [bfid]
 * @property {Object} [client]
 * @property {string} [completeDate]
 * @property {Object} [directPartner]
 * @property {string} [errCode]
 * @property {string} [errMessage]
 * @property {number} [id]
 * @property {string} [ipAddress]
 * @property {string} [messageId]
 * @property {Object} [partner]
 * @property {string} [reference]
 * @property {boolean} [success]
 * @property {string} [templateId]
 */

/**
 * @typedef {Object} TransactionLoadMatch
 * @property {string} id
 * @property {string} [transaction_type]
 */

/**
 * @typedef {Object} TransactionListMatch
 * @property {string} [client]
 * @property {string} [date_from]
 * @property {string} [date_to]
 * @property {string} [message_id]
 * @property {string} [paging_mode]
 * @property {string} [partner]
 * @property {string} [reference]
 * @property {number} [skip]
 * @property {boolean} [success]
 * @property {number} [take]
 * @property {string} [transaction_type]
 */

/**
 * @typedef {Object} UpdateResult
 * @property {string} [billingId]
 * @property {Object} [client]
 * @property {Object} contact
 * @property {Object} [directPartner]
 * @property {string} email
 * @property {string} firstName
 * @property {number} [id]
 * @property {boolean} [isActive]
 * @property {string} lastName
 * @property {string} [mid]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {Object} [partner]
 * @property {string} phone
 * @property {string} [reference]
 * @property {boolean} [sendWelcomeEmail]
 * @property {string} userName
 * @property {Object} userRole
 * @property {string} [verificationPhrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultListMatch
 * @property {string} [client]
 * @property {string} [partner]
 * @property {number} [skip]
 * @property {number} [take]
 */

/**
 * @typedef {Object} UpdateResultCreateData
 * @property {Object} [client]
 * @property {string} email
 * @property {string} first_name
 * @property {boolean} is_active
 * @property {string} last_name
 * @property {Object} [partner]
 * @property {number} phone
 * @property {boolean} send_welcome_email
 * @property {Object} user_role
 * @property {string} username
 * @property {string} [billingId]
 * @property {Object} contact
 * @property {Object} [directPartner]
 * @property {string} firstName
 * @property {number} [id]
 * @property {boolean} [isActive]
 * @property {string} lastName
 * @property {string} [mid]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {string} [reference]
 * @property {boolean} [sendWelcomeEmail]
 * @property {string} userName
 * @property {Object} userRole
 * @property {string} [verificationPhrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultUpdateData
 * @property {string} id
 * @property {string} [access_mode]
 * @property {boolean} [active]
 * @property {number} [client_id]
 * @property {string} [client_name]
 * @property {Array} [field_template]
 * @property {string} [name]
 * @property {string} [options_custom_style]
 * @property {string} [options_custom_style_file]
 * @property {Array} [options_domain]
 * @property {string} [options_security_active_from]
 * @property {string} [options_security_active_to]
 * @property {boolean} [options_security_irreversible]
 * @property {number} [partner_id]
 * @property {string} [partner_name]
 * @property {string} [reference]
 * @property {string} [type]
 * @property {number} [version]
 * @property {string} [billing_id]
 * @property {number} [contact_id]
 * @property {boolean} [is_active]
 * @property {number} [parent_id]
 * @property {string} [parent_name]
 * @property {string} [verification_phrase]
 * @property {Object} [client]
 * @property {string} [email]
 * @property {string} [first_name]
 * @property {string} [last_name]
 * @property {Object} [partner]
 * @property {number} [phone]
 * @property {boolean} [send_welcome_email]
 * @property {string} [username]
 * @property {number} [direct_partner_id]
 * @property {string} [direct_partner_name]
 * @property {string} [mid]
 * @property {string} [billingId]
 * @property {Object} [contact]
 * @property {Object} [directPartner]
 * @property {string} [firstName]
 * @property {boolean} [isActive]
 * @property {string} [lastName]
 * @property {Object} [parent]
 * @property {boolean} [sendWelcomeEmail]
 * @property {string} [userName]
 * @property {Object} [userRole]
 * @property {string} [verificationPhrase]
 */

/**
 * @typedef {Object} User
 * @property {Object} [client]
 * @property {string} [created]
 * @property {string} [email]
 * @property {string} [firstName]
 * @property {number} [id]
 * @property {boolean} [isActive]
 * @property {string} [lastName]
 * @property {string} [modified]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [userName]
 * @property {Object} [userRole]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UserLoadMatch
 * @property {string} id
 */

