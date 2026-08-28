package voxgig.bluefinshieldconexmgmtsdk.core

// Typed reference models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These case classes are documentation/DX reference shapes ONLY. The SDK ops
// take and return the loose object model (java.util.Map[String, Object] /
// Object) at runtime, so these types are not wired into the op signatures —
// use them to describe a payload before converting it to a map. Every
// component is a boxed (nullable) type, so an optional (req:false) key needs
// no distinct rendering.

object BluefinShieldconexMgmtTypes {

  final case class Client(billingId: String, contact: java.util.Map[String, Object], created: String, directPartner: java.util.Map[String, Object], id: java.lang.Long, isActive: java.lang.Boolean, mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientLoadMatch(id: String)

  final case class ClientListMatch(partner: String, skip: java.lang.Long, take: java.lang.Long)

  final case class ClientCreateData(billing_id: String, contact_email: String, contact_first_name: String, contact_is_active: java.lang.Boolean, contact_last_name: String, contact_phone: String, contact_send_welcome_email: java.lang.Boolean, contact_user_name: String, contact_user_role: String, direct_partner_id: java.lang.Long, direct_partner_name: String, is_active: java.lang.Boolean, mid: String, name: String, billingId: String, contact: java.util.Map[String, Object], created: String, directPartner: java.util.Map[String, Object], id: java.lang.Long, isActive: java.lang.Boolean, modified: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientRemoveMatch(id: String)

  final case class Clone(id: java.lang.Long, name: String)

  final case class CloneCreateData(template_id: String, id: java.lang.Long, name: String)

  final case class Partner(billingId: String, contact: java.util.Map[String, Object], created: String, id: java.lang.Long, isActive: java.lang.Boolean, modified: String, name: String, parent: java.util.Map[String, Object], reference: String, verificationPhrase: String, version: java.lang.Long)

  final case class PartnerLoadMatch(id: String)

  final case class PartnerListMatch(partner: String, skip: java.lang.Long, take: java.lang.Long)

  final case class PartnerCreateData(billing_id: String, contact_email: String, contact_first_name: String, contact_is_active: java.lang.Boolean, contact_last_name: String, contact_phone: String, contact_send_welcome_email: java.lang.Boolean, contact_user_name: String, contact_user_role: String, is_active: java.lang.Boolean, name: String, parent_id: java.lang.Long, parent_name: String, reference: String, verification_phrase: String, billingId: String, contact: java.util.Map[String, Object], created: String, id: java.lang.Long, isActive: java.lang.Boolean, modified: String, parent: java.util.Map[String, Object], verificationPhrase: String, version: java.lang.Long)

  final case class Template(accessMode: Object, active: java.lang.Boolean, client: java.util.Map[String, Object], fieldTemplates: java.util.List[Object], id: java.lang.Long, name: String, options: java.util.Map[String, Object], partner: java.util.Map[String, Object], reference: String, version: java.lang.Long)

  final case class TemplateLoadMatch(id: String)

  final case class TemplateListMatch(client: String, partner: String, skip: java.lang.Long, take: java.lang.Long)

  final case class TemplateCreateData(access_mode: String, active: java.lang.Boolean, client_id: java.lang.Long, client_name: String, field_template: java.util.List[Object], name: String, options_custom_style: String, options_custom_style_file: String, options_domain: java.util.List[Object], options_security_active_from: String, options_security_active_to: String, options_security_irreversible: java.lang.Boolean, partner_id: java.lang.Long, partner_name: String, reference: String, version: java.lang.Long, accessMode: Object, client: java.util.Map[String, Object], fieldTemplates: java.util.List[Object], id: java.lang.Long, options: java.util.Map[String, Object], partner: java.util.Map[String, Object])

  final case class TemplateRemoveMatch(id: String)

  final case class Transaction(bfid: String, client: java.util.Map[String, Object], completeDate: String, directPartner: java.util.Map[String, Object], errCode: String, errMessage: String, id: java.lang.Long, ipAddress: String, messageId: String, partner: java.util.Map[String, Object], reference: String, success: java.lang.Boolean, templateId: String)

  final case class TransactionLoadMatch(id: String, transaction_type: String)

  final case class TransactionListMatch(client: String, date_from: String, date_to: String, message_id: String, paging_mode: String, partner: String, reference: String, skip: java.lang.Long, success: java.lang.Boolean, take: java.lang.Long, transaction_type: String)

  final case class UpdateResult(billingId: String, client: java.util.Map[String, Object], contact: java.util.Map[String, Object], directPartner: java.util.Map[String, Object], email: String, firstName: String, id: java.lang.Long, isActive: java.lang.Boolean, lastName: String, mid: String, name: String, parent: java.util.Map[String, Object], partner: java.util.Map[String, Object], phone: String, reference: String, sendWelcomeEmail: java.lang.Boolean, userName: String, userRole: java.util.Map[String, Object], verificationPhrase: String, version: java.lang.Long)

  final case class UpdateResultListMatch(client: String, partner: String, skip: java.lang.Long, take: java.lang.Long)

  final case class UpdateResultCreateData(client: java.util.Map[String, Object], email: String, first_name: String, is_active: java.lang.Boolean, last_name: String, partner: java.util.Map[String, Object], phone: java.lang.Long, send_welcome_email: java.lang.Boolean, user_role: java.util.Map[String, Object], username: String, billingId: String, contact: java.util.Map[String, Object], directPartner: java.util.Map[String, Object], firstName: String, id: java.lang.Long, isActive: java.lang.Boolean, lastName: String, mid: String, name: String, parent: java.util.Map[String, Object], reference: String, sendWelcomeEmail: java.lang.Boolean, userName: String, userRole: java.util.Map[String, Object], verificationPhrase: String, version: java.lang.Long)

  final case class UpdateResultUpdateData(id: String, access_mode: String, active: java.lang.Boolean, client_id: java.lang.Long, client_name: String, field_template: java.util.List[Object], name: String, options_custom_style: String, options_custom_style_file: String, options_domain: java.util.List[Object], options_security_active_from: String, options_security_active_to: String, options_security_irreversible: java.lang.Boolean, partner_id: java.lang.Long, partner_name: String, reference: String, version: java.lang.Long, billing_id: String, contact_id: java.lang.Long, is_active: java.lang.Boolean, parent_id: java.lang.Long, parent_name: String, verification_phrase: String, client: java.util.Map[String, Object], email: String, first_name: String, last_name: String, partner: java.util.Map[String, Object], phone: java.lang.Long, send_welcome_email: java.lang.Boolean, username: String, direct_partner_id: java.lang.Long, direct_partner_name: String, mid: String, billingId: String, contact: java.util.Map[String, Object], directPartner: java.util.Map[String, Object], firstName: String, isActive: java.lang.Boolean, lastName: String, parent: java.util.Map[String, Object], sendWelcomeEmail: java.lang.Boolean, userName: String, userRole: java.util.Map[String, Object], verificationPhrase: String)

  final case class User(client: java.util.Map[String, Object], created: String, email: String, firstName: String, id: java.lang.Long, isActive: java.lang.Boolean, lastName: String, modified: String, partner: java.util.Map[String, Object], phone: String, userName: String, userRole: java.util.Map[String, Object], version: java.lang.Long)

  final case class UserLoadMatch(id: String)

}
