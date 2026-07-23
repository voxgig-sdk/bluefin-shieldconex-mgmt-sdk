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
    pub billing_id: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
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
    pub billing_id: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub mid: Option<String>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// ClientCreateData is the typed request payload for Client.create.
#[derive(Debug, Clone)]
pub struct ClientCreateData {
    pub billing_id: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
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
}

/// Partner is the typed data model for the partner entity.
#[derive(Debug, Clone)]
pub struct Partner {
    pub billing_id: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub verification_phrase: Option<String>,
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
    pub billing_id: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub verification_phrase: Option<String>,
    pub version: Option<i64>,
}

/// PartnerCreateData is the typed request payload for Partner.create.
#[derive(Debug, Clone)]
pub struct PartnerCreateData {
    pub billing_id: Option<String>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub modified: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub verification_phrase: Option<String>,
    pub version: Option<i64>,
}

/// Template is the typed data model for the template entity.
#[derive(Debug, Clone)]
pub struct Template {
    pub access_mode: Option<Value>,
    pub active: Option<bool>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub field_template: Option<Vec<Value>>,
    pub id: Option<i64>,
    pub name: Option<String>,
    pub option: Option<std::collections::HashMap<String, Value>>,
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
    pub access_mode: Option<Value>,
    pub active: Option<bool>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub field_template: Option<Vec<Value>>,
    pub id: Option<i64>,
    pub name: Option<String>,
    pub option: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub type_: Option<String>,
    pub version: Option<i64>,
}

/// TemplateCreateData is the typed request payload for Template.create.
#[derive(Debug, Clone)]
pub struct TemplateCreateData {
    pub access_mode: Option<Value>,
    pub active: Option<bool>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub field_template: Option<Vec<Value>>,
    pub id: Option<i64>,
    pub name: Option<String>,
    pub option: Option<std::collections::HashMap<String, Value>>,
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
    pub complete_date: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub err_code: Option<String>,
    pub err_message: Option<String>,
    pub id: Option<i64>,
    pub ip_address: Option<String>,
    pub message_id: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub success: Option<bool>,
    pub template_id: Option<String>,
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
    pub complete_date: Option<String>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub err_code: Option<String>,
    pub err_message: Option<String>,
    pub id: Option<i64>,
    pub ip_address: Option<String>,
    pub message_id: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub reference: Option<String>,
    pub success: Option<bool>,
    pub template_id: Option<String>,
}

/// UpdateResult is the typed data model for the update_result entity.
#[derive(Debug, Clone)]
pub struct UpdateResult {
    pub billing_id: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub contact: std::collections::HashMap<String, Value>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub email: String,
    pub first_name: String,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub last_name: String,
    pub mid: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: String,
    pub reference: Option<String>,
    pub send_welcome_email: Option<bool>,
    pub user_name: String,
    pub user_role: std::collections::HashMap<String, Value>,
    pub verification_phrase: Option<String>,
    pub version: Option<i64>,
}

/// UpdateResultListMatch is the typed request payload for UpdateResult.list.
#[derive(Debug, Clone)]
pub struct UpdateResultListMatch {
    pub billing_id: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub contact: Option<std::collections::HashMap<String, Value>>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub email: Option<String>,
    pub first_name: Option<String>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub last_name: Option<String>,
    pub mid: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub reference: Option<String>,
    pub send_welcome_email: Option<bool>,
    pub user_name: Option<String>,
    pub user_role: Option<std::collections::HashMap<String, Value>>,
    pub verification_phrase: Option<String>,
    pub version: Option<i64>,
}

/// UpdateResultCreateData is the typed request payload for UpdateResult.create.
#[derive(Debug, Clone)]
pub struct UpdateResultCreateData {
    pub billing_id: Option<String>,
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub contact: std::collections::HashMap<String, Value>,
    pub direct_partner: Option<std::collections::HashMap<String, Value>>,
    pub email: String,
    pub first_name: String,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub last_name: String,
    pub mid: Option<String>,
    pub name: Option<String>,
    pub parent: Option<std::collections::HashMap<String, Value>>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: String,
    pub reference: Option<String>,
    pub send_welcome_email: Option<bool>,
    pub user_name: String,
    pub user_role: std::collections::HashMap<String, Value>,
    pub verification_phrase: Option<String>,
    pub version: Option<i64>,
}

/// UpdateResultUpdateData is the typed request payload for UpdateResult.update.
#[derive(Debug, Clone)]
pub struct UpdateResultUpdateData {
    pub id: String,
}

/// User is the typed data model for the user entity.
#[derive(Debug, Clone)]
pub struct User {
    pub client: Option<std::collections::HashMap<String, Value>>,
    pub created: Option<String>,
    pub email: Option<String>,
    pub first_name: Option<String>,
    pub id: Option<i64>,
    pub is_active: Option<bool>,
    pub last_name: Option<String>,
    pub modified: Option<String>,
    pub partner: Option<std::collections::HashMap<String, Value>>,
    pub phone: Option<String>,
    pub user_name: Option<String>,
    pub user_role: Option<std::collections::HashMap<String, Value>>,
    pub version: Option<i64>,
}

/// UserLoadMatch is the typed request payload for User.load.
#[derive(Debug, Clone)]
pub struct UserLoadMatch {
    pub id: String,
}

