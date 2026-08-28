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

  data class Client(val billingId: String?, val contact: Map<String, Any?>?, val created: String?, val directPartner: Map<String, Any?>?, val id: Long?, val isActive: Boolean?, val mid: String?, val modified: String?, val name: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientLoadMatch(val id: String?)

  data class ClientListMatch(val partner: String?, val skip: Long?, val take: Long?)

  data class ClientCreateData(val billing_id: String?, val contact_email: String?, val contact_first_name: String?, val contact_is_active: Boolean?, val contact_last_name: String?, val contact_phone: String?, val contact_send_welcome_email: Boolean?, val contact_user_name: String?, val contact_user_role: String?, val direct_partner_id: Long?, val direct_partner_name: String?, val is_active: Boolean?, val mid: String?, val name: String?, val billingId: String?, val contact: Map<String, Any?>?, val created: String?, val directPartner: Map<String, Any?>?, val id: Long?, val isActive: Boolean?, val modified: String?, val partner: Map<String, Any?>?, val version: Long?)

  data class ClientRemoveMatch(val id: String?)

  data class Clone(val id: Long?, val name: String?)

  data class CloneCreateData(val template_id: String?, val id: Long?, val name: String?)

  data class Partner(val billingId: String?, val contact: Map<String, Any?>?, val created: String?, val id: Long?, val isActive: Boolean?, val modified: String?, val name: String?, val parent: Map<String, Any?>?, val reference: String?, val verificationPhrase: String?, val version: Long?)

  data class PartnerLoadMatch(val id: String?)

  data class PartnerListMatch(val partner: String?, val skip: Long?, val take: Long?)

  data class PartnerCreateData(val billing_id: String?, val contact_email: String?, val contact_first_name: String?, val contact_is_active: Boolean?, val contact_last_name: String?, val contact_phone: String?, val contact_send_welcome_email: Boolean?, val contact_user_name: String?, val contact_user_role: String?, val is_active: Boolean?, val name: String?, val parent_id: Long?, val parent_name: String?, val reference: String?, val verification_phrase: String?, val billingId: String?, val contact: Map<String, Any?>?, val created: String?, val id: Long?, val isActive: Boolean?, val modified: String?, val parent: Map<String, Any?>?, val verificationPhrase: String?, val version: Long?)

  data class Template(val accessMode: Any?, val active: Boolean?, val client: Map<String, Any?>?, val fieldTemplates: List<Any?>?, val id: Long?, val name: String?, val options: Map<String, Any?>?, val partner: Map<String, Any?>?, val reference: String?, val type: String?, val version: Long?)

  data class TemplateLoadMatch(val id: String?)

  data class TemplateListMatch(val client: String?, val partner: String?, val skip: Long?, val take: Long?)

  data class TemplateCreateData(val access_mode: String?, val active: Boolean?, val client_id: Long?, val client_name: String?, val field_template: List<Any?>?, val name: String?, val options_custom_style: String?, val options_custom_style_file: String?, val options_domain: List<Any?>?, val options_security_active_from: String?, val options_security_active_to: String?, val options_security_irreversible: Boolean?, val partner_id: Long?, val partner_name: String?, val reference: String?, val type: String?, val version: Long?, val accessMode: Any?, val client: Map<String, Any?>?, val fieldTemplates: List<Any?>?, val id: Long?, val options: Map<String, Any?>?, val partner: Map<String, Any?>?)

  data class TemplateRemoveMatch(val id: String?)

  data class Transaction(val bfid: String?, val client: Map<String, Any?>?, val completeDate: String?, val directPartner: Map<String, Any?>?, val errCode: String?, val errMessage: String?, val id: Long?, val ipAddress: String?, val messageId: String?, val partner: Map<String, Any?>?, val reference: String?, val success: Boolean?, val templateId: String?)

  data class TransactionLoadMatch(val id: String?, val transaction_type: String?)

  data class TransactionListMatch(val client: String?, val date_from: String?, val date_to: String?, val message_id: String?, val paging_mode: String?, val partner: String?, val reference: String?, val skip: Long?, val success: Boolean?, val take: Long?, val transaction_type: String?)

  data class UpdateResult(val billingId: String?, val client: Map<String, Any?>?, val contact: Map<String, Any?>?, val directPartner: Map<String, Any?>?, val email: String?, val firstName: String?, val id: Long?, val isActive: Boolean?, val lastName: String?, val mid: String?, val name: String?, val parent: Map<String, Any?>?, val partner: Map<String, Any?>?, val phone: String?, val reference: String?, val sendWelcomeEmail: Boolean?, val userName: String?, val userRole: Map<String, Any?>?, val verificationPhrase: String?, val version: Long?)

  data class UpdateResultListMatch(val client: String?, val partner: String?, val skip: Long?, val take: Long?)

  data class UpdateResultCreateData(val client: Map<String, Any?>?, val email: String?, val first_name: String?, val is_active: Boolean?, val last_name: String?, val partner: Map<String, Any?>?, val phone: Long?, val send_welcome_email: Boolean?, val user_role: Map<String, Any?>?, val username: String?, val billingId: String?, val contact: Map<String, Any?>?, val directPartner: Map<String, Any?>?, val firstName: String?, val id: Long?, val isActive: Boolean?, val lastName: String?, val mid: String?, val name: String?, val parent: Map<String, Any?>?, val reference: String?, val sendWelcomeEmail: Boolean?, val userName: String?, val userRole: Map<String, Any?>?, val verificationPhrase: String?, val version: Long?)

  data class UpdateResultUpdateData(val id: String?, val access_mode: String?, val active: Boolean?, val client_id: Long?, val client_name: String?, val field_template: List<Any?>?, val name: String?, val options_custom_style: String?, val options_custom_style_file: String?, val options_domain: List<Any?>?, val options_security_active_from: String?, val options_security_active_to: String?, val options_security_irreversible: Boolean?, val partner_id: Long?, val partner_name: String?, val reference: String?, val type: String?, val version: Long?, val billing_id: String?, val contact_id: Long?, val is_active: Boolean?, val parent_id: Long?, val parent_name: String?, val verification_phrase: String?, val client: Map<String, Any?>?, val email: String?, val first_name: String?, val last_name: String?, val partner: Map<String, Any?>?, val phone: Long?, val send_welcome_email: Boolean?, val username: String?, val direct_partner_id: Long?, val direct_partner_name: String?, val mid: String?, val billingId: String?, val contact: Map<String, Any?>?, val directPartner: Map<String, Any?>?, val firstName: String?, val isActive: Boolean?, val lastName: String?, val parent: Map<String, Any?>?, val sendWelcomeEmail: Boolean?, val userName: String?, val userRole: Map<String, Any?>?, val verificationPhrase: String?)

  data class User(val client: Map<String, Any?>?, val created: String?, val email: String?, val firstName: String?, val id: Long?, val isActive: Boolean?, val lastName: String?, val modified: String?, val partner: Map<String, Any?>?, val phone: String?, val userName: String?, val userRole: Map<String, Any?>?, val version: Long?)

  data class UserLoadMatch(val id: String?)

}
