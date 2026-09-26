// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Client {
  billingId?: string
  contact?: Record<string, any>
  created?: string
  directPartner?: Record<string, any>
  id?: number
  isActive?: boolean
  mid?: string
  modified?: string
  name?: string
  partner?: Record<string, any>
  version?: number
}

export interface ClientLoadMatch {
  id: string
}

export interface ClientListMatch {
  partner: string
  skip?: number
  take?: number
}

export interface ClientCreateData {
  billing_id?: string
  contact_email: string
  contact_first_name: string
  contact_is_active: boolean
  contact_last_name: string
  contact_phone: string
  contact_send_welcome_email: boolean
  contact_user_name: string
  contact_user_role: string
  direct_partner_id: number
  direct_partner_name: string
  is_active: boolean
  mid?: string
  name: string
  billingId?: string
  contact?: Record<string, any>
  created?: string
  directPartner?: Record<string, any>
  id?: number
  isActive?: boolean
  modified?: string
  partner?: Record<string, any>
  version?: number
}

export interface ClientRemoveMatch {
  id: string
}

export interface Clone {
  id?: number
  name?: string
}

export interface CloneCreateData {
  template_id: string
  id?: number
  name?: string
}

export interface Partner {
  billingId?: string
  contact?: Record<string, any>
  created?: string
  id?: number
  isActive?: boolean
  modified?: string
  name?: string
  parent?: Record<string, any>
  reference?: string
  verificationPhrase?: string
  version?: number
}

export interface PartnerLoadMatch {
  id: string
}

export interface PartnerListMatch {
  partner?: string
  skip?: number
  take?: number
}

export interface PartnerCreateData {
  billing_id: string
  contact_email: string
  contact_first_name: string
  contact_is_active: boolean
  contact_last_name: string
  contact_phone: string
  contact_send_welcome_email: boolean
  contact_user_name: string
  contact_user_role: string
  is_active: boolean
  name: string
  parent_id?: number
  parent_name?: string
  reference: string
  verification_phrase?: string
  billingId?: string
  contact?: Record<string, any>
  created?: string
  id?: number
  isActive?: boolean
  modified?: string
  parent?: Record<string, any>
  verificationPhrase?: string
  version?: number
}

export interface Template {
  accessMode?: any
  active?: boolean
  client?: Record<string, any>
  fieldTemplates?: any[]
  id?: number
  name?: string
  options?: Record<string, any>
  partner?: Record<string, any>
  reference?: string
  type?: string
  version?: number
}

export interface TemplateLoadMatch {
  id: string
}

export interface TemplateListMatch {
  client?: string
  partner?: string
  skip?: number
  take?: number
}

export interface TemplateCreateData {
  access_mode?: string
  active: boolean
  client_id: number
  client_name: string
  field_template?: any[]
  name: string
  options_custom_style?: string
  options_custom_style_file?: string
  options_domain?: any[]
  options_security_active_from?: string
  options_security_active_to?: string
  options_security_irreversible?: boolean
  partner_id: number
  partner_name: string
  reference: string
  type?: string
  version?: number
  accessMode?: any
  client?: Record<string, any>
  fieldTemplates?: any[]
  id?: number
  options?: Record<string, any>
  partner?: Record<string, any>
}

export interface TemplateRemoveMatch {
  id: string
}

export interface Transaction {
  bfid?: string
  client?: Record<string, any>
  completeDate?: string
  directPartner?: Record<string, any>
  errCode?: string
  errMessage?: string
  id?: number
  ipAddress?: string
  messageId?: string
  partner?: Record<string, any>
  reference?: string
  success?: boolean
  templateId?: string
}

export interface TransactionLoadMatch {
  id: string
  transaction_type?: string
}

export interface TransactionListMatch {
  client?: string
  date_from?: string
  date_to?: string
  message_id?: string
  paging_mode?: string
  partner?: string
  reference?: string
  skip?: number
  success?: boolean
  take?: number
  transaction_type?: string
}

export interface UpdateResult {
  billingId?: string
  client?: Record<string, any>
  contact: Record<string, any>
  directPartner?: Record<string, any>
  email: string
  firstName: string
  id?: number
  isActive?: boolean
  lastName: string
  mid?: string
  name?: string
  parent?: Record<string, any>
  partner?: Record<string, any>
  phone: string
  reference?: string
  sendWelcomeEmail?: boolean
  userName: string
  userRole: Record<string, any>
  verificationPhrase?: string
  version?: number
}

export interface UpdateResultListMatch {
  client?: string
  partner?: string
  skip?: number
  take?: number
}

export interface UpdateResultCreateData {
  client?: Record<string, any>
  email: string
  first_name: string
  is_active: boolean
  last_name: string
  partner?: Record<string, any>
  phone: number
  send_welcome_email: boolean
  user_role: Record<string, any>
  username: string
  billingId?: string
  contact: Record<string, any>
  directPartner?: Record<string, any>
  firstName: string
  id?: number
  isActive?: boolean
  lastName: string
  mid?: string
  name?: string
  parent?: Record<string, any>
  reference?: string
  sendWelcomeEmail?: boolean
  userName: string
  userRole: Record<string, any>
  verificationPhrase?: string
  version?: number
}

export interface UpdateResultUpdateData {
  id: string
  access_mode?: string
  active?: boolean
  client_id?: number
  client_name?: string
  field_template?: any[]
  name?: string
  options_custom_style?: string
  options_custom_style_file?: string
  options_domain?: any[]
  options_security_active_from?: string
  options_security_active_to?: string
  options_security_irreversible?: boolean
  partner_id?: number
  partner_name?: string
  reference?: string
  type?: string
  version?: number
  billing_id?: string
  contact_id?: number
  is_active?: boolean
  parent_id?: number
  parent_name?: string
  verification_phrase?: string
  client?: Record<string, any>
  email?: string
  first_name?: string
  last_name?: string
  partner?: Record<string, any>
  phone?: number
  send_welcome_email?: boolean
  username?: string
  direct_partner_id?: number
  direct_partner_name?: string
  mid?: string
  billingId?: string
  contact?: Record<string, any>
  directPartner?: Record<string, any>
  firstName?: string
  isActive?: boolean
  lastName?: string
  parent?: Record<string, any>
  sendWelcomeEmail?: boolean
  userName?: string
  userRole?: Record<string, any>
  verificationPhrase?: string
}

export interface User {
  client?: Record<string, any>
  created?: string
  email?: string
  firstName?: string
  id?: number
  isActive?: boolean
  lastName?: string
  modified?: string
  partner?: Record<string, any>
  phone?: string
  userName?: string
  userRole?: Record<string, any>
  version?: number
}

export interface UserLoadMatch {
  id: string
}

