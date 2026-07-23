-- Typed models for the BluefinShieldconexMgmt SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Client
---@field billing_id? string
---@field contact? table
---@field created? string
---@field direct_partner? table
---@field id? number
---@field is_active? boolean
---@field mid? string
---@field modified? string
---@field name? string
---@field partner? table
---@field version? number

---@class ClientLoadMatch
---@field id string

---@class ClientListMatch
---@field billing_id? string
---@field contact? table
---@field created? string
---@field direct_partner? table
---@field id? number
---@field is_active? boolean
---@field mid? string
---@field modified? string
---@field name? string
---@field partner? table
---@field version? number

---@class ClientCreateData
---@field billing_id? string
---@field contact? table
---@field created? string
---@field direct_partner? table
---@field id? number
---@field is_active? boolean
---@field mid? string
---@field modified? string
---@field name? string
---@field partner? table
---@field version? number

---@class ClientRemoveMatch
---@field id string

---@class Clone
---@field id? number
---@field name? string

---@class CloneCreateData
---@field template_id string

---@class Partner
---@field billing_id? string
---@field contact? table
---@field created? string
---@field id? number
---@field is_active? boolean
---@field modified? string
---@field name? string
---@field parent? table
---@field reference? string
---@field verification_phrase? string
---@field version? number

---@class PartnerLoadMatch
---@field id string

---@class PartnerListMatch
---@field billing_id? string
---@field contact? table
---@field created? string
---@field id? number
---@field is_active? boolean
---@field modified? string
---@field name? string
---@field parent? table
---@field reference? string
---@field verification_phrase? string
---@field version? number

---@class PartnerCreateData
---@field billing_id? string
---@field contact? table
---@field created? string
---@field id? number
---@field is_active? boolean
---@field modified? string
---@field name? string
---@field parent? table
---@field reference? string
---@field verification_phrase? string
---@field version? number

---@class Template
---@field access_mode? any
---@field active? boolean
---@field client? table
---@field field_template? table
---@field id? number
---@field name? string
---@field option? table
---@field partner? table
---@field reference? string
---@field type? string
---@field version? number

---@class TemplateLoadMatch
---@field id string

---@class TemplateListMatch
---@field access_mode? any
---@field active? boolean
---@field client? table
---@field field_template? table
---@field id? number
---@field name? string
---@field option? table
---@field partner? table
---@field reference? string
---@field type? string
---@field version? number

---@class TemplateCreateData
---@field access_mode? any
---@field active? boolean
---@field client? table
---@field field_template? table
---@field id? number
---@field name? string
---@field option? table
---@field partner? table
---@field reference? string
---@field type? string
---@field version? number

---@class TemplateRemoveMatch
---@field id string

---@class Transaction
---@field bfid? string
---@field client? table
---@field complete_date? string
---@field direct_partner? table
---@field err_code? string
---@field err_message? string
---@field id? number
---@field ip_address? string
---@field message_id? string
---@field partner? table
---@field reference? string
---@field success? boolean
---@field template_id? string

---@class TransactionLoadMatch
---@field id string

---@class TransactionListMatch
---@field bfid? string
---@field client? table
---@field complete_date? string
---@field direct_partner? table
---@field err_code? string
---@field err_message? string
---@field id? number
---@field ip_address? string
---@field message_id? string
---@field partner? table
---@field reference? string
---@field success? boolean
---@field template_id? string

---@class UpdateResult
---@field billing_id? string
---@field client? table
---@field contact table
---@field direct_partner? table
---@field email string
---@field first_name string
---@field id? number
---@field is_active? boolean
---@field last_name string
---@field mid? string
---@field name? string
---@field parent? table
---@field partner? table
---@field phone string
---@field reference? string
---@field send_welcome_email? boolean
---@field user_name string
---@field user_role table
---@field verification_phrase? string
---@field version? number

---@class UpdateResultListMatch
---@field billing_id? string
---@field client? table
---@field contact? table
---@field direct_partner? table
---@field email? string
---@field first_name? string
---@field id? number
---@field is_active? boolean
---@field last_name? string
---@field mid? string
---@field name? string
---@field parent? table
---@field partner? table
---@field phone? string
---@field reference? string
---@field send_welcome_email? boolean
---@field user_name? string
---@field user_role? table
---@field verification_phrase? string
---@field version? number

---@class UpdateResultCreateData
---@field billing_id? string
---@field client? table
---@field contact table
---@field direct_partner? table
---@field email string
---@field first_name string
---@field id? number
---@field is_active? boolean
---@field last_name string
---@field mid? string
---@field name? string
---@field parent? table
---@field partner? table
---@field phone string
---@field reference? string
---@field send_welcome_email? boolean
---@field user_name string
---@field user_role table
---@field verification_phrase? string
---@field version? number

---@class UpdateResultUpdateData
---@field id string

---@class User
---@field client? table
---@field created? string
---@field email? string
---@field first_name? string
---@field id? number
---@field is_active? boolean
---@field last_name? string
---@field modified? string
---@field partner? table
---@field phone? string
---@field user_name? string
---@field user_role? table
---@field version? number

---@class UserLoadMatch
---@field id string

local M = {}

return M
