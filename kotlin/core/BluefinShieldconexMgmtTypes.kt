package voxgig.bluefinshieldconexmgmtsdk.core

// Typed reference models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These types are documentation/DX reference shapes ONLY. The SDK ops take and
// return the loose object model (MutableMap<String, Any?> / Any?) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a nullable type, so
// an optional (req:false) key needs no distinct rendering.

@Suppress("unused")
object BluefinShieldconexMgmtTypes {

  data class Client(val billing_id: String?, val contact: Map<String, Any?>?, val created: String?, val direct_partner: Map<String, Any?>?, val id: Long?, val is_active: Boolean?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientLoadMatch(val id: String?)

  data class ClientListMatch(val billing_id: String?, val contact: Map<String, Any?>?, val created: String?, val direct_partner: Map<String, Any?>?, val id: Long?, val is_active: Boolean?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientCreateData(val billing_id: String?, val contact: Map<String, Any?>?, val created: String?, val direct_partner: Map<String, Any?>?, val id: Long?, val is_active: Boolean?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientRemoveMatch(val id: String?)

  data class Clone(val id: Long?, val name: String?)

  data class CloneCreateData(val template_id: String?)

  data class Partner(val billing_id: String?, val contact: Map<String, Any?>?, val created: String?, val id: Long?, val is_active: Boolean?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val reference: String?, val verification_phrase: String?, val version: Long?)

  data class PartnerLoadMatch(val id: String?)

  data class PartnerListMatch(val billing_id: String?, val contact: Map<String, Any?>?, val created: String?, val id: Long?, val is_active: Boolean?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val reference: String?, val verification_phrase: String?, val version: Long?)

  data class PartnerCreateData(val billing_id: String?, val contact: Map<String, Any?>?, val created: String?, val id: Long?, val is_active: Boolean?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val reference: String?, val verification_phrase: String?, val version: Long?)

  data class Template(val access_mode: Any?, val active: Boolean?, val client: Map<String, Any?>?, val field_template: List<Any?>?, val id: Long?, val name: String?, val option: Map<String, Any?>?, val partner: Map<String, Any?>?, val reference: String?, val type: String?, val version: Long?)

  data class TemplateLoadMatch(val id: String?)

  data class TemplateListMatch(val access_mode: Any?, val active: Boolean?, val client: Map<String, Any?>?, val field_template: List<Any?>?, val id: Long?, val name: String?, val option: Map<String, Any?>?, val partner: Map<String, Any?>?, val reference: String?, val type: String?, val version: Long?)

  data class TemplateCreateData(val access_mode: Any?, val active: Boolean?, val client: Map<String, Any?>?, val field_template: List<Any?>?, val id: Long?, val name: String?, val option: Map<String, Any?>?, val partner: Map<String, Any?>?, val reference: String?, val type: String?, val version: Long?)

  data class TemplateRemoveMatch(val id: String?)

  data class Transaction(val bfid: String?, val client: Map<String, Any?>?, val complete_date: String?, val direct_partner: Map<String, Any?>?, val err_code: String?, val err_message: String?, val id: Long?, val ip_address: String?, val message_id: String?, val partner: Map<String, Any?>?, val reference: String?, val success: Boolean?, val template_id: String?)

  data class TransactionLoadMatch(val id: String?)

  data class TransactionListMatch(val bfid: String?, val client: Map<String, Any?>?, val complete_date: String?, val direct_partner: Map<String, Any?>?, val err_code: String?, val err_message: String?, val id: Long?, val ip_address: String?, val message_id: String?, val partner: Map<String, Any?>?, val reference: String?, val success: Boolean?, val template_id: String?)

  data class UpdateResult(val billing_id: String?, val client: Map<String, Any?>?, val contact: Map<String, Any?>?, val direct_partner: Map<String, Any?>?, val email: String?, val first_name: String?, val id: Long?, val is_active: Boolean?, val last_name: String?, val mid: String?, val name: String?, val parent: Map<String, Any?>?, val partner: Map<String, Any?>?, val phone: String?, val reference: String?, val send_welcome_email: Boolean?, val user_name: String?, val user_role: Map<String, Any?>?, val verification_phrase: String?, val version: Long?)

  data class UpdateResultListMatch(val billing_id: String?, val client: Map<String, Any?>?, val contact: Map<String, Any?>?, val direct_partner: Map<String, Any?>?, val email: String?, val first_name: String?, val id: Long?, val is_active: Boolean?, val last_name: String?, val mid: String?, val name: String?, val parent: Map<String, Any?>?, val partner: Map<String, Any?>?, val phone: String?, val reference: String?, val send_welcome_email: Boolean?, val user_name: String?, val user_role: Map<String, Any?>?, val verification_phrase: String?, val version: Long?)

  data class UpdateResultCreateData(val billing_id: String?, val client: Map<String, Any?>?, val contact: Map<String, Any?>?, val direct_partner: Map<String, Any?>?, val email: String?, val first_name: String?, val id: Long?, val is_active: Boolean?, val last_name: String?, val mid: String?, val name: String?, val parent: Map<String, Any?>?, val partner: Map<String, Any?>?, val phone: String?, val reference: String?, val send_welcome_email: Boolean?, val user_name: String?, val user_role: Map<String, Any?>?, val verification_phrase: String?, val version: Long?)

  data class UpdateResultUpdateData(val id: String?)

  data class User(val client: Map<String, Any?>?, val created: String?, val email: String?, val first_name: String?, val id: Long?, val is_active: Boolean?, val last_name: String?, val modified: String?, val partner: Map<String, Any?>?, val phone: String?, val user_name: String?, val user_role: Map<String, Any?>?, val version: Long?)

  data class UserLoadMatch(val id: String?)

}
