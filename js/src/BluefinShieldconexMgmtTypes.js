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
 * @typedef {Object} ClientCreateData
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
 * @typedef {Object} PartnerCreateData
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
 * @typedef {Object} TemplateCreateData
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
 */

/**
 * @typedef {Object} TransactionListMatch
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
 * @property {string} [billingId]
 * @property {Object} [client]
 * @property {Object} [contact]
 * @property {Object} [directPartner]
 * @property {string} [email]
 * @property {string} [firstName]
 * @property {number} [id]
 * @property {boolean} [isActive]
 * @property {string} [lastName]
 * @property {string} [mid]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [reference]
 * @property {boolean} [sendWelcomeEmail]
 * @property {string} [userName]
 * @property {Object} [userRole]
 * @property {string} [verificationPhrase]
 * @property {number} [version]
 */

/**
 * @typedef {Object} UpdateResultCreateData
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
 * @typedef {Object} UpdateResultUpdateData
 * @property {string} id
 * @property {string} [billingId]
 * @property {Object} [client]
 * @property {Object} [contact]
 * @property {Object} [directPartner]
 * @property {string} [email]
 * @property {string} [firstName]
 * @property {boolean} [isActive]
 * @property {string} [lastName]
 * @property {string} [mid]
 * @property {string} [name]
 * @property {Object} [parent]
 * @property {Object} [partner]
 * @property {string} [phone]
 * @property {string} [reference]
 * @property {boolean} [sendWelcomeEmail]
 * @property {string} [userName]
 * @property {Object} [userRole]
 * @property {string} [verificationPhrase]
 * @property {number} [version]
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

