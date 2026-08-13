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

  final case class ClientListMatch(billingId: String, contact: java.util.Map[String, Object], created: String, directPartner: java.util.Map[String, Object], id: java.lang.Long, isActive: java.lang.Boolean, mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientCreateData(billingId: String, contact: java.util.Map[String, Object], created: String, directPartner: java.util.Map[String, Object], id: java.lang.Long, isActive: java.lang.Boolean, mid: String, modified: String, name: String, partner: java.util.Map[String, Object], version: java.lang.Long)

  final case class ClientRemoveMatch(id: String)

  final case class Clone(id: java.lang.Long, name: String)

  final case class CloneCreateData(template_id: String, id: java.lang.Long, name: String)

  final case class Partner(billingId: String, contact: java.util.Map[String, Object], created: String, id: java.lang.Long, isActive: java.lang.Boolean, modified: String, name: String, parent: java.util.Map[String, Object], reference: String, verificationPhrase: String, version: java.lang.Long)

  final case class PartnerLoadMatch(id: String)

  final case class PartnerListMatch(billingId: String, contact: java.util.Map[String, Object], created: String, id: java.lang.Long, isActive: java.lang.Boolean, modified: String, name: String, parent: java.util.Map[String, Object], reference: String, verificationPhrase: String, version: java.lang.Long)

  final case class PartnerCreateData(billingId: String, contact: java.util.Map[String, Object], created: String, id: java.lang.Long, isActive: java.lang.Boolean, modified: String, name: String, parent: java.util.Map[String, Object], reference: String, verificationPhrase: String, version: java.lang.Long)

  final case class Template(accessMode: Object, active: java.lang.Boolean, client: java.util.Map[String, Object], fieldTemplates: java.util.List[Object], id: java.lang.Long, name: String, options: java.util.Map[String, Object], partner: java.util.Map[String, Object], reference: String, version: java.lang.Long)

  final case class TemplateLoadMatch(id: String)

  final case class TemplateListMatch(accessMode: Object, active: java.lang.Boolean, client: java.util.Map[String, Object], fieldTemplates: java.util.List[Object], id: java.lang.Long, name: String, options: java.util.Map[String, Object], partner: java.util.Map[String, Object], reference: String, version: java.lang.Long)

  final case class TemplateCreateData(accessMode: Object, active: java.lang.Boolean, client: java.util.Map[String, Object], fieldTemplates: java.util.List[Object], id: java.lang.Long, name: String, options: java.util.Map[String, Object], partner: java.util.Map[String, Object], reference: String, version: java.lang.Long)

  final case class TemplateRemoveMatch(id: String)

  final case class Transaction(bfid: String, client: java.util.Map[String, Object], completeDate: String, directPartner: java.util.Map[String, Object], errCode: String, errMessage: String, id: java.lang.Long, ipAddress: String, messageId: String, partner: java.util.Map[String, Object], reference: String, success: java.lang.Boolean, templateId: String)

  final case class TransactionLoadMatch(id: String)

  final case class TransactionListMatch(bfid: String, client: java.util.Map[String, Object], completeDate: String, directPartner: java.util.Map[String, Object], errCode: String, errMessage: String, id: java.lang.Long, ipAddress: String, messageId: String, partner: java.util.Map[String, Object], reference: String, success: java.lang.Boolean, templateId: String)

  final case class UpdateResult(billingId: String, client: java.util.Map[String, Object], contact: java.util.Map[String, Object], directPartner: java.util.Map[String, Object], email: String, firstName: String, id: java.lang.Long, isActive: java.lang.Boolean, lastName: String, mid: String, name: String, parent: java.util.Map[String, Object], partner: java.util.Map[String, Object], phone: String, reference: String, sendWelcomeEmail: java.lang.Boolean, userName: String, userRole: java.util.Map[String, Object], verificationPhrase: String, version: java.lang.Long)

  final case class UpdateResultListMatch(billingId: String, client: java.util.Map[String, Object], contact: java.util.Map[String, Object], directPartner: java.util.Map[String, Object], email: String, firstName: String, id: java.lang.Long, isActive: java.lang.Boolean, lastName: String, mid: String, name: String, parent: java.util.Map[String, Object], partner: java.util.Map[String, Object], phone: String, reference: String, sendWelcomeEmail: java.lang.Boolean, userName: String, userRole: java.util.Map[String, Object], verificationPhrase: String, version: java.lang.Long)

  final case class UpdateResultCreateData(billingId: String, client: java.util.Map[String, Object], contact: java.util.Map[String, Object], directPartner: java.util.Map[String, Object], email: String, firstName: String, id: java.lang.Long, isActive: java.lang.Boolean, lastName: String, mid: String, name: String, parent: java.util.Map[String, Object], partner: java.util.Map[String, Object], phone: String, reference: String, sendWelcomeEmail: java.lang.Boolean, userName: String, userRole: java.util.Map[String, Object], verificationPhrase: String, version: java.lang.Long)

  final case class UpdateResultUpdateData(id: String, billingId: String, client: java.util.Map[String, Object], contact: java.util.Map[String, Object], directPartner: java.util.Map[String, Object], email: String, firstName: String, isActive: java.lang.Boolean, lastName: String, mid: String, name: String, parent: java.util.Map[String, Object], partner: java.util.Map[String, Object], phone: String, reference: String, sendWelcomeEmail: java.lang.Boolean, userName: String, userRole: java.util.Map[String, Object], verificationPhrase: String, version: java.lang.Long)

  final case class User(client: java.util.Map[String, Object], created: String, email: String, firstName: String, id: java.lang.Long, isActive: java.lang.Boolean, lastName: String, modified: String, partner: java.util.Map[String, Object], phone: String, userName: String, userRole: java.util.Map[String, Object], version: java.lang.Long)

  final case class UserLoadMatch(id: String)

}
