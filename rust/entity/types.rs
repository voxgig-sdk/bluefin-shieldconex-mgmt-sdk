// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.
#![allow(dead_code, non_snake_case, unused_imports)]

use crate::utility::voxgigstruct::Value;

/// Client is the typed data model for the client entity.
#[derive(Debug, Clone)]
pub struct Client {
    pub billingid: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub mid: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// ClientLoadMatch is the typed request payload for Client.load.
#[derive(Debug, Clone)]
pub struct ClientLoadMatch {
    pub id: String,
}

/// ClientListMatch is the typed request payload for Client.list.
#[derive(Debug, Clone)]
pub struct ClientListMatch {
    pub billingid: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub mid: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// ClientCreateData is the typed request payload for Client.create.
#[derive(Debug, Clone)]
pub struct ClientCreateData {
    pub billingid: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub mid: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// ClientRemoveMatch is the typed request payload for Client.remove.
#[derive(Debug, Clone)]
pub struct ClientRemoveMatch {
    pub id: String,
}

/// Clone is the typed data model for the clone entity.
#[derive(Debug, Clone)]
pub struct Clone {
    pub id: Option<i64>,
    pub name: Option<String>,
}

/// CloneCreateData is the typed request payload for Clone.create.
#[derive(Debug, Clone)]
pub struct CloneCreateData {
    pub template_id: String,
    pub id: Option<i64>,
    pub name: Option<String>,
}

/// Partner is the typed data model for the partner entity.
#[derive(Debug, Clone)]
pub struct Partner {
    pub billingid: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub verificationphrase: Option<String>,
    pub version: Option<i64>,
}

/// PartnerLoadMatch is the typed request payload for Partner.load.
#[derive(Debug, Clone)]
pub struct PartnerLoadMatch {
    pub id: String,
}

/// PartnerListMatch is the typed request payload for Partner.list.
#[derive(Debug, Clone)]
pub struct PartnerListMatch {
    pub billingid: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub verificationphrase: Option<String>,
    pub version: Option<i64>,
}

/// PartnerCreateData is the typed request payload for Partner.create.
#[derive(Debug, Clone)]
pub struct PartnerCreateData {
    pub billingid: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub verificationphrase: Option<String>,
    pub version: Option<i64>,
}

/// Template is the typed data model for the template entity.
#[derive(Debug, Clone)]
pub struct Template {
    pub accessmode: Option<Value>,
    pub active: Option<bool>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub fieldtemplates: Option<Vec<Value>>,
    pub id: Option<i64>,
    pub name: Option<String>,
    pub options: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub type_: Option<String>,
    pub version: Option<i64>,
}

/// TemplateLoadMatch is the typed request payload for Template.load.
#[derive(Debug, Clone)]
pub struct TemplateLoadMatch {
    pub id: String,
}

/// TemplateListMatch is the typed request payload for Template.list.
#[derive(Debug, Clone)]
pub struct TemplateListMatch {
    pub accessmode: Option<Value>,
    pub active: Option<bool>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub fieldtemplates: Option<Vec<Value>>,
    pub id: Option<i64>,
    pub name: Option<String>,
    pub options: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub type_: Option<String>,
    pub version: Option<i64>,
}

/// TemplateCreateData is the typed request payload for Template.create.
#[derive(Debug, Clone)]
pub struct TemplateCreateData {
    pub accessmode: Option<Value>,
    pub active: Option<bool>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub fieldtemplates: Option<Vec<Value>>,
    pub id: Option<i64>,
    pub name: Option<String>,
    pub options: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub type_: Option<String>,
    pub version: Option<i64>,
}

/// TemplateRemoveMatch is the typed request payload for Template.remove.
#[derive(Debug, Clone)]
pub struct TemplateRemoveMatch {
    pub id: String,
}

/// Transaction is the typed data model for the transaction entity.
#[derive(Debug, Clone)]
pub struct Transaction {
    pub bfid: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub completedate: Option<String>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub errcode: Option<String>,
    pub errmessage: Option<String>,
    pub id: Option<i64>,
    pub ipaddress: Option<String>,
    pub messageid: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub success: Option<bool>,
    pub templateid: Option<String>,
}

/// TransactionLoadMatch is the typed request payload for Transaction.load.
#[derive(Debug, Clone)]
pub struct TransactionLoadMatch {
    pub id: String,
}

/// TransactionListMatch is the typed request payload for Transaction.list.
#[derive(Debug, Clone)]
pub struct TransactionListMatch {
    pub bfid: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub completedate: Option<String>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub errcode: Option<String>,
    pub errmessage: Option<String>,
    pub id: Option<i64>,
    pub ipaddress: Option<String>,
    pub messageid: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub success: Option<bool>,
    pub templateid: Option<String>,
}

/// UpdateResult is the typed data model for the update_result entity.
#[derive(Debug, Clone)]
pub struct UpdateResult {
    pub billingid: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub contact: std::collections::HashMap<String, Value>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub email: String,
    pub firstname: String,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub lastname: String,
    pub mid: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: String,
    pub reference: Option<String>,
    pub sendwelcomeemail: Option<bool>,
    pub username: String,
    pub userrole: std::collections::HashMap<String, Value>,
    pub verificationphrase: Option<String>,
    pub version: Option<i64>,
}

/// UpdateResultListMatch is the typed request payload for UpdateResult.list.
#[derive(Debug, Clone)]
pub struct UpdateResultListMatch {
    pub billingid: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub email: Option<String>,
    pub firstname: Option<String>,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub lastname: Option<String>,
    pub mid: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub reference: Option<String>,
    pub sendwelcomeemail: Option<bool>,
    pub username: Option<String>,
    pub userrole: Option<std::collections::HashMap<String, Value>>,
    pub verificationphrase: Option<String>,
    pub version: Option<i64>,
}

/// UpdateResultCreateData is the typed request payload for UpdateResult.create.
#[derive(Debug, Clone)]
pub struct UpdateResultCreateData {
    pub billingid: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub contact: std::collections::HashMap<String, Value>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub email: String,
    pub firstname: String,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub lastname: String,
    pub mid: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: String,
    pub reference: Option<String>,
    pub sendwelcomeemail: Option<bool>,
    pub username: String,
    pub userrole: std::collections::HashMap<String, Value>,
    pub verificationphrase: Option<String>,
    pub version: Option<i64>,
}

/// UpdateResultUpdateData is the typed request payload for UpdateResult.update.
#[derive(Debug, Clone)]
pub struct UpdateResultUpdateData {
    pub id: String,
    pub billingid: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub directpartner: Option<std::collections::HashMap<String, Value>>,
    pub email: Option<String>,
    pub firstname: Option<String>,
    pub isactive: Option<bool>,
    pub lastname: Option<String>,
    pub mid: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub reference: Option<String>,
    pub sendwelcomeemail: Option<bool>,
    pub username: Option<String>,
    pub userrole: Option<std::collections::HashMap<String, Value>>,
    pub verificationphrase: Option<String>,
    pub version: Option<i64>,
}

/// User is the typed data model for the user entity.
#[derive(Debug, Clone)]
pub struct User {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub email: Option<String>,
    pub firstname: Option<String>,
    pub id: Option<i64>,
    pub isactive: Option<bool>,
    pub lastname: Option<String>,
    pub modified: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub username: Option<String>,
    pub userrole: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// UserLoadMatch is the typed request payload for User.load.
#[derive(Debug, Clone)]
pub struct UserLoadMatch {
    pub id: String,
}

