// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
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

export interface ClientCreateData {
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

export interface PartnerCreateData {
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

export interface TemplateCreateData {
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
}

export interface TransactionListMatch {
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
  billingId?: string
  client?: Record<string, any>
  contact?: Record<string, any>
  directPartner?: Record<string, any>
  email?: string
  firstName?: string
  id?: number
  isActive?: boolean
  lastName?: string
  mid?: string
  name?: string
  parent?: Record<string, any>
  partner?: Record<string, any>
  phone?: string
  reference?: string
  sendWelcomeEmail?: boolean
  userName?: string
  userRole?: Record<string, any>
  verificationPhrase?: string
  version?: number
}

export interface UpdateResultCreateData {
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

export interface UpdateResultUpdateData {
  id: string
  billingId?: string
  client?: Record<string, any>
  contact?: Record<string, any>
  directPartner?: Record<string, any>
  email?: string
  firstName?: string
  isActive?: boolean
  lastName?: string
  mid?: string
  name?: string
  parent?: Record<string, any>
  partner?: Record<string, any>
  phone?: string
  reference?: string
  sendWelcomeEmail?: boolean
  userName?: string
  userRole?: Record<string, any>
  verificationPhrase?: string
  version?: number
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

