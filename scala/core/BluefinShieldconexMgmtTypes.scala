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

  final case class Client(billing_id: String, contact: java.util.Map[String, Object], created: String, direct_partner: java.util.Map[String, Object], id: java.lang.Long, is_active: java.lang.Boolean, mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientLoadMatch(id: String)

  final case class ClientListMatch(billing_id: String, contact: java.util.Map[String, Object], created: String, direct_partner: java.util.Map[String, Object], id: java.lang.Long, is_active: java.lang.Boolean, mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientCreateData(billing_id: String, contact: java.util.Map[String, Object], created: String, direct_partner: java.util.Map[String, Object], id: java.lang.Long, is_active: java.lang.Boolean, mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientRemoveMatch(id: String)

  final case class Clone(id: java.lang.Long, name: String)

  final case class CloneCreateData(template_id: String)

  final case class Partner(billing_id: String, contact: java.util.Map[String, Object], created: String, id: java.lang.Long, is_active: java.lang.Boolean, modified: String, name: String, parent: java.util.Map[String, Object], reference: String, verification_phrase: String, version: java.lang.Long)

  final case class PartnerLoadMatch(id: String)

  final case class PartnerListMatch(billing_id: String, contact: java.util.Map[String, Object], created: String, id: java.lang.Long, is_active: java.lang.Boolean, modified: String, name: String, parent: java.util.Map[String, Object], reference: String, verification_phrase: String, version: java.lang.Long)

  final case class PartnerCreateData(billing_id: String, contact: java.util.Map[String, Object], created: String, id: java.lang.Long, is_active: java.lang.Boolean, modified: String, name: String, parent: java.util.Map[String, Object], reference: String, verification_phrase: String, version: java.lang.Long)

  final case class Template(access_mode: Object, active: java.lang.Boolean, client: java.util.Map[String, Object], field_template: java.util.List[Object], id: java.lang.Long, name: String, option: java.util.Map[String, Object], partner: java.util.Map[String, Object], reference: String, version: java.lang.Long)

  final case class TemplateLoadMatch(id: String)

  final case class TemplateListMatch(access_mode: Object, active: java.lang.Boolean, client: java.util.Map[String, Object], field_template: java.util.List[Object], id: java.lang.Long, name: String, option: java.util.Map[String, Object], partner: java.util.Map[String, Object], reference: String, version: java.lang.Long)

  final case class TemplateCreateData(access_mode: Object, active: java.lang.Boolean, client: java.util.Map[String, Object], field_template: java.util.List[Object], id: java.lang.Long, name: String, option: java.util.Map[String, Object], partner: java.util.Map[String, Object], reference: String, version: java.lang.Long)

  final case class TemplateRemoveMatch(id: String)

  final case class Transaction(bfid: String, client: java.util.Map[String, Object], complete_date: String, direct_partner: java.util.Map[String, Object], err_code: String, err_message: String, id: java.lang.Long, ip_address: String, message_id: String, partner: java.util.Map[String, Object], reference: String, success: java.lang.Boolean, template_id: String)

  final case class TransactionLoadMatch(id: String)

  final case class TransactionListMatch(bfid: String, client: java.util.Map[String, Object], complete_date: String, direct_partner: java.util.Map[String, Object], err_code: String, err_message: String, id: java.lang.Long, ip_address: String, message_id: String, partner: java.util.Map[String, Object], reference: String, success: java.lang.Boolean, template_id: String)

  final case class UpdateResult(billing_id: String, client: java.util.Map[String, Object], contact: java.util.Map[String, Object], direct_partner: java.util.Map[String, Object], email: String, first_name: String, id: java.lang.Long, is_active: java.lang.Boolean, last_name: String, mid: String, name: String, parent: java.util.Map[String, Object], partner: java.util.Map[String, Object], phone: String, reference: String, send_welcome_email: java.lang.Boolean, user_name: String, user_role: java.util.Map[String, Object], verification_phrase: String, version: java.lang.Long)

  final case class UpdateResultListMatch(billing_id: String, client: java.util.Map[String, Object], contact: java.util.Map[String, Object], direct_partner: java.util.Map[String, Object], email: String, first_name: String, id: java.lang.Long, is_active: java.lang.Boolean, last_name: String, mid: String, name: String, parent: java.util.Map[String, Object], partner: java.util.Map[String, Object], phone: String, reference: String, send_welcome_email: java.lang.Boolean, user_name: String, user_role: java.util.Map[String, Object], verification_phrase: String, version: java.lang.Long)

  final case class UpdateResultCreateData(billing_id: String, client: java.util.Map[String, Object], contact: java.util.Map[String, Object], direct_partner: java.util.Map[String, Object], email: String, first_name: String, id: java.lang.Long, is_active: java.lang.Boolean, last_name: String, mid: String, name: String, parent: java.util.Map[String, Object], partner: java.util.Map[String, Object], phone: String, reference: String, send_welcome_email: java.lang.Boolean, user_name: String, user_role: java.util.Map[String, Object], verification_phrase: String, version: java.lang.Long)

  final case class UpdateResultUpdateData(id: String)

  final case class User(client: java.util.Map[String, Object], created: String, email: String, first_name: String, id: java.lang.Long, is_active: java.lang.Boolean, last_name: String, modified: String, partner: java.util.Map[String, Object], phone: String, user_name: String, user_role: java.util.Map[String, Object], version: java.lang.Long)

  final case class UserLoadMatch(id: String)

}
