// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Client {
  billing_id?: string
  contact?: Record<string, any>
  created?: string
  direct_partner?: Record<string, any>
  id?: number
  is_active?: boolean
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
  billing_id?: string
  contact?: Record<string, any>
  created?: string
  direct_partner?: Record<string, any>
  id?: number
  is_active?: boolean
  mid?: string
  modified?: string
  name?: string
  partner?: Record<string, any>
  version?: number
}

export interface ClientCreateData {
  billing_id?: string
  contact?: Record<string, any>
  created?: string
  direct_partner?: Record<string, any>
  id?: number
  is_active?: boolean
  mid?: string
  modified?: string
  name?: string
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
}

export interface Partner {
  billing_id?: string
  contact?: Record<string, any>
  created?: string
  id?: number
  is_active?: boolean
  modified?: string
  name?: string
  parent?: Record<string, any>
  reference?: string
  verification_phrase?: string
  version?: number
}

export interface PartnerLoadMatch {
  id: string
}

export interface PartnerListMatch {
  billing_id?: string
  contact?: Record<string, any>
  created?: string
  id?: number
  is_active?: boolean
  modified?: string
  name?: string
  parent?: Record<string, any>
  reference?: string
  verification_phrase?: string
  version?: number
}

export interface PartnerCreateData {
  billing_id?: string
  contact?: Record<string, any>
  created?: string
  id?: number
  is_active?: boolean
  modified?: string
  name?: string
  parent?: Record<string, any>
  reference?: string
  verification_phrase?: string
  version?: number
}

export interface Template {
  access_mode?: any
  active?: boolean
  client?: Record<string, any>
  field_template?: any[]
  id?: number
  name?: string
  option?: Record<string, any>
  partner?: Record<string, any>
  reference?: string
  type?: string
  version?: number
}

export interface TemplateLoadMatch {
  id: string
}

export interface TemplateListMatch {
  access_mode?: any
  active?: boolean
  client?: Record<string, any>
  field_template?: any[]
  id?: number
  name?: string
  option?: Record<string, any>
  partner?: Record<string, any>
  reference?: string
  type?: string
  version?: number
}

export interface TemplateCreateData {
  access_mode?: any
  active?: boolean
  client?: Record<string, any>
  field_template?: any[]
  id?: number
  name?: string
  option?: Record<string, any>
  partner?: Record<string, any>
  reference?: string
  type?: string
  version?: number
}

export interface TemplateRemoveMatch {
  id: string
}

export interface Transaction {
  bfid?: string
  client?: Record<string, any>
  complete_date?: string
  direct_partner?: Record<string, any>
  err_code?: string
  err_message?: string
  id?: number
  ip_address?: string
  message_id?: string
  partner?: Record<string, any>
  reference?: string
  success?: boolean
  template_id?: string
}

export interface TransactionLoadMatch {
  id: string
}

export interface TransactionListMatch {
  bfid?: string
  client?: Record<string, any>
  complete_date?: string
  direct_partner?: Record<string, any>
  err_code?: string
  err_message?: string
  id?: number
  ip_address?: string
  message_id?: string
  partner?: Record<string, any>
  reference?: string
  success?: boolean
  template_id?: string
}

export interface UpdateResult {
  billing_id?: string
  client?: Record<string, any>
  contact: Record<string, any>
  direct_partner?: Record<string, any>
  email: string
  first_name: string
  id?: number
  is_active?: boolean
  last_name: string
  mid?: string
  name?: string
  parent?: Record<string, any>
  partner?: Record<string, any>
  phone: string
  reference?: string
  send_welcome_email?: boolean
  user_name: string
  user_role: Record<string, any>
  verification_phrase?: string
  version?: number
}

export interface UpdateResultListMatch {
  billing_id?: string
  client?: Record<string, any>
  contact?: Record<string, any>
  direct_partner?: Record<string, any>
  email?: string
  first_name?: string
  id?: number
  is_active?: boolean
  last_name?: string
  mid?: string
  name?: string
  parent?: Record<string, any>
  partner?: Record<string, any>
  phone?: string
  reference?: string
  send_welcome_email?: boolean
  user_name?: string
  user_role?: Record<string, any>
  verification_phrase?: string
  version?: number
}

export interface UpdateResultCreateData {
  billing_id?: string
  client?: Record<string, any>
  contact: Record<string, any>
  direct_partner?: Record<string, any>
  email: string
  first_name: string
  id?: number
  is_active?: boolean
  last_name: string
  mid?: string
  name?: string
  parent?: Record<string, any>
  partner?: Record<string, any>
  phone: string
  reference?: string
  send_welcome_email?: boolean
  user_name: string
  user_role: Record<string, any>
  verification_phrase?: string
  version?: number
}

export interface UpdateResultUpdateData {
  id: string
}

export interface User {
  client?: Record<string, any>
  created?: string
  email?: string
  first_name?: string
  id?: number
  is_active?: boolean
  last_name?: string
  modified?: string
  partner?: Record<string, any>
  phone?: string
  user_name?: string
  user_role?: Record<string, any>
  version?: number
}

export interface UserLoadMatch {
  id: string
}

