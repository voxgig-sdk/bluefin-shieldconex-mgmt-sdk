// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.

import Foundation

/// Client is the typed data model for the client entity.
public struct Client {
  public var billingId: String?
  public var contact: VMap?
  public var created: String?
  public var directPartner: VMap?
  public var id: Int?
  public var isActive: Bool?
  public var mid: String?
  public var modified: String?
  public var name: String?
  public var partner: VMap?
  public var version: Int?
}

/// ClientLoadMatch is the typed request payload for Client.load.
public struct ClientLoadMatch {
  public var id: String
}

/// ClientListMatch is the typed request payload for Client.list.
public struct ClientListMatch {
  public var billingId: String?
  public var contact: VMap?
  public var created: String?
  public var directPartner: VMap?
  public var id: Int?
  public var isActive: Bool?
  public var mid: String?
  public var modified: String?
  public var name: String?
  public var partner: VMap?
  public var version: Int?
}

/// ClientCreateData is the typed request payload for Client.create.
public struct ClientCreateData {
  public var billingId: String?
  public var contact: VMap?
  public var created: String?
  public var directPartner: VMap?
  public var id: Int?
  public var isActive: Bool?
  public var mid: String?
  public var modified: String?
  public var name: String?
  public var partner: VMap?
  public var version: Int?
}

/// ClientRemoveMatch is the typed request payload for Client.remove.
public struct ClientRemoveMatch {
  public var id: String
}

/// Clone is the typed data model for the clone entity.
public struct Clone {
  public var id: Int?
  public var name: String?
}

/// CloneCreateData is the typed request payload for Clone.create.
public struct CloneCreateData {
  public var templateId: String
}

/// Partner is the typed data model for the partner entity.
public struct Partner {
  public var billingId: String?
  public var contact: VMap?
  public var created: String?
  public var id: Int?
  public var isActive: Bool?
  public var modified: String?
  public var name: String?
  public var parent: VMap?
  public var reference: String?
  public var verificationPhrase: String?
  public var version: Int?
}

/// PartnerLoadMatch is the typed request payload for Partner.load.
public struct PartnerLoadMatch {
  public var id: String
}

/// PartnerListMatch is the typed request payload for Partner.list.
public struct PartnerListMatch {
  public var billingId: String?
  public var contact: VMap?
  public var created: String?
  public var id: Int?
  public var isActive: Bool?
  public var modified: String?
  public var name: String?
  public var parent: VMap?
  public var reference: String?
  public var verificationPhrase: String?
  public var version: Int?
}

/// PartnerCreateData is the typed request payload for Partner.create.
public struct PartnerCreateData {
  public var billingId: String?
  public var contact: VMap?
  public var created: String?
  public var id: Int?
  public var isActive: Bool?
  public var modified: String?
  public var name: String?
  public var parent: VMap?
  public var reference: String?
  public var verificationPhrase: String?
  public var version: Int?
}

/// Template is the typed data model for the template entity.
public struct Template {
  public var accessMode: Value?
  public var active: Bool?
  public var client: VMap?
  public var fieldTemplate: [Value]?
  public var id: Int?
  public var name: String?
  public var option: VMap?
  public var partner: VMap?
  public var reference: String?
  public var type: String?
  public var version: Int?
}

/// TemplateLoadMatch is the typed request payload for Template.load.
public struct TemplateLoadMatch {
  public var id: String
}

/// TemplateListMatch is the typed request payload for Template.list.
public struct TemplateListMatch {
  public var accessMode: Value?
  public var active: Bool?
  public var client: VMap?
  public var fieldTemplate: [Value]?
  public var id: Int?
  public var name: String?
  public var option: VMap?
  public var partner: VMap?
  public var reference: String?
  public var type: String?
  public var version: Int?
}

/// TemplateCreateData is the typed request payload for Template.create.
public struct TemplateCreateData {
  public var accessMode: Value?
  public var active: Bool?
  public var client: VMap?
  public var fieldTemplate: [Value]?
  public var id: Int?
  public var name: String?
  public var option: VMap?
  public var partner: VMap?
  public var reference: String?
  public var type: String?
  public var version: Int?
}

/// TemplateRemoveMatch is the typed request payload for Template.remove.
public struct TemplateRemoveMatch {
  public var id: String
}

/// Transaction is the typed data model for the transaction entity.
public struct Transaction {
  public var bfid: String?
  public var client: VMap?
  public var completeDate: String?
  public var directPartner: VMap?
  public var errCode: String?
  public var errMessage: String?
  public var id: Int?
  public var ipAddress: String?
  public var messageId: String?
  public var partner: VMap?
  public var reference: String?
  public var success: Bool?
  public var templateId: String?
}

/// TransactionLoadMatch is the typed request payload for Transaction.load.
public struct TransactionLoadMatch {
  public var id: String
}

/// TransactionListMatch is the typed request payload for Transaction.list.
public struct TransactionListMatch {
  public var bfid: String?
  public var client: VMap?
  public var completeDate: String?
  public var directPartner: VMap?
  public var errCode: String?
  public var errMessage: String?
  public var id: Int?
  public var ipAddress: String?
  public var messageId: String?
  public var partner: VMap?
  public var reference: String?
  public var success: Bool?
  public var templateId: String?
}

/// UpdateResult is the typed data model for the update_result entity.
public struct UpdateResult {
  public var billingId: String?
  public var client: VMap?
  public var contact: VMap
  public var directPartner: VMap?
  public var email: String
  public var firstName: String
  public var id: Int?
  public var isActive: Bool?
  public var lastName: String
  public var mid: String?
  public var name: String?
  public var parent: VMap?
  public var partner: VMap?
  public var phone: String
  public var reference: String?
  public var sendWelcomeEmail: Bool?
  public var userName: String
  public var userRole: VMap
  public var verificationPhrase: String?
  public var version: Int?
}

/// UpdateResultListMatch is the typed request payload for UpdateResult.list.
public struct UpdateResultListMatch {
  public var billingId: String?
  public var client: VMap?
  public var contact: VMap?
  public var directPartner: VMap?
  public var email: String?
  public var firstName: String?
  public var id: Int?
  public var isActive: Bool?
  public var lastName: String?
  public var mid: String?
  public var name: String?
  public var parent: VMap?
  public var partner: VMap?
  public var phone: String?
  public var reference: String?
  public var sendWelcomeEmail: Bool?
  public var userName: String?
  public var userRole: VMap?
  public var verificationPhrase: String?
  public var version: Int?
}

/// UpdateResultCreateData is the typed request payload for UpdateResult.create.
public struct UpdateResultCreateData {
  public var billingId: String?
  public var client: VMap?
  public var contact: VMap
  public var directPartner: VMap?
  public var email: String
  public var firstName: String
  public var id: Int?
  public var isActive: Bool?
  public var lastName: String
  public var mid: String?
  public var name: String?
  public var parent: VMap?
  public var partner: VMap?
  public var phone: String
  public var reference: String?
  public var sendWelcomeEmail: Bool?
  public var userName: String
  public var userRole: VMap
  public var verificationPhrase: String?
  public var version: Int?
}

/// UpdateResultUpdateData is the typed request payload for UpdateResult.update.
public struct UpdateResultUpdateData {
  public var id: String
}

/// User is the typed data model for the user entity.
public struct User {
  public var client: VMap?
  public var created: String?
  public var email: String?
  public var firstName: String?
  public var id: Int?
  public var isActive: Bool?
  public var lastName: String?
  public var modified: String?
  public var partner: VMap?
  public var phone: String?
  public var userName: String?
  public var userRole: VMap?
  public var version: Int?
}

/// UserLoadMatch is the typed request payload for User.load.
public struct UserLoadMatch {
  public var id: String
}

