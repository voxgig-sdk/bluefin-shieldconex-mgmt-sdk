# frozen_string_literal: true

# Typed models for the BluefinShieldconexMgmt SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Client entity data model.
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] mid
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Client = Struct.new(
  :billingId,
  :contact,
  :created,
  :directPartner,
  :id,
  :isActive,
  :mid,
  :modified,
  :name,
  :partner,
  :version,
  keyword_init: true
)

# Request payload for Client#load.
#
# @!attribute [rw] id
#   @return [String]
ClientLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Client#list.
#
# @!attribute [rw] partner
#   @return [String]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
ClientListMatch = Struct.new(
  :partner,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for Client#create.
#
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] contact_email
#   @return [String]
#
# @!attribute [rw] contact_first_name
#   @return [String]
#
# @!attribute [rw] contact_is_active
#   @return [Boolean]
#
# @!attribute [rw] contact_last_name
#   @return [String]
#
# @!attribute [rw] contact_phone
#   @return [String]
#
# @!attribute [rw] contact_send_welcome_email
#   @return [Boolean]
#
# @!attribute [rw] contact_user_name
#   @return [String]
#
# @!attribute [rw] contact_user_role
#   @return [String]
#
# @!attribute [rw] direct_partner_id
#   @return [Integer]
#
# @!attribute [rw] direct_partner_name
#   @return [String]
#
# @!attribute [rw] is_active
#   @return [Boolean]
#
# @!attribute [rw] mid
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String]
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
ClientCreateData = Struct.new(
  :billing_id,
  :contact_email,
  :contact_first_name,
  :contact_is_active,
  :contact_last_name,
  :contact_phone,
  :contact_send_welcome_email,
  :contact_user_name,
  :contact_user_role,
  :direct_partner_id,
  :direct_partner_name,
  :is_active,
  :mid,
  :name,
  :billingId,
  :contact,
  :created,
  :directPartner,
  :id,
  :isActive,
  :modified,
  :partner,
  :version,
  keyword_init: true
)

# Request payload for Client#remove.
#
# @!attribute [rw] id
#   @return [String]
ClientRemoveMatch = Struct.new(
  :id,
  keyword_init: true
)

# Clone entity data model.
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
Clone = Struct.new(
  :id,
  :name,
  keyword_init: true
)

# Request payload for Clone#create.
#
# @!attribute [rw] template_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
CloneCreateData = Struct.new(
  :template_id,
  :id,
  :name,
  keyword_init: true
)

# Partner entity data model.
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] parent
#   @return [Hash, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] verificationPhrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Partner = Struct.new(
  :billingId,
  :contact,
  :created,
  :id,
  :isActive,
  :modified,
  :name,
  :parent,
  :reference,
  :verificationPhrase,
  :version,
  keyword_init: true
)

# Request payload for Partner#load.
#
# @!attribute [rw] id
#   @return [String]
PartnerLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Partner#list.
#
# @!attribute [rw] partner
#   @return [String, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
PartnerListMatch = Struct.new(
  :partner,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for Partner#create.
#
# @!attribute [rw] billing_id
#   @return [String]
#
# @!attribute [rw] contact_email
#   @return [String]
#
# @!attribute [rw] contact_first_name
#   @return [String]
#
# @!attribute [rw] contact_is_active
#   @return [Boolean]
#
# @!attribute [rw] contact_last_name
#   @return [String]
#
# @!attribute [rw] contact_phone
#   @return [String]
#
# @!attribute [rw] contact_send_welcome_email
#   @return [Boolean]
#
# @!attribute [rw] contact_user_name
#   @return [String]
#
# @!attribute [rw] contact_user_role
#   @return [String]
#
# @!attribute [rw] is_active
#   @return [Boolean]
#
# @!attribute [rw] name
#   @return [String]
#
# @!attribute [rw] parent_id
#   @return [Integer, nil]
#
# @!attribute [rw] parent_name
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String]
#
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] parent
#   @return [Hash, nil]
#
# @!attribute [rw] verificationPhrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
PartnerCreateData = Struct.new(
  :billing_id,
  :contact_email,
  :contact_first_name,
  :contact_is_active,
  :contact_last_name,
  :contact_phone,
  :contact_send_welcome_email,
  :contact_user_name,
  :contact_user_role,
  :is_active,
  :name,
  :parent_id,
  :parent_name,
  :reference,
  :verification_phrase,
  :billingId,
  :contact,
  :created,
  :id,
  :isActive,
  :modified,
  :parent,
  :verificationPhrase,
  :version,
  keyword_init: true
)

# Template entity data model.
#
# @!attribute [rw] accessMode
#   @return [Object, nil]
#
# @!attribute [rw] active
#   @return [Boolean, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] fieldTemplates
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] options
#   @return [Hash, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Template = Struct.new(
  :accessMode,
  :active,
  :client,
  :fieldTemplates,
  :id,
  :name,
  :options,
  :partner,
  :reference,
  :type,
  :version,
  keyword_init: true
)

# Request payload for Template#load.
#
# @!attribute [rw] id
#   @return [String]
TemplateLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Template#list.
#
# @!attribute [rw] client
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [String, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
TemplateListMatch = Struct.new(
  :client,
  :partner,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for Template#create.
#
# @!attribute [rw] access_mode
#   @return [String, nil]
#
# @!attribute [rw] active
#   @return [Boolean]
#
# @!attribute [rw] client_id
#   @return [Integer]
#
# @!attribute [rw] client_name
#   @return [String]
#
# @!attribute [rw] field_template
#   @return [Array, nil]
#
# @!attribute [rw] name
#   @return [String]
#
# @!attribute [rw] options_custom_style
#   @return [String, nil]
#
# @!attribute [rw] options_custom_style_file
#   @return [String, nil]
#
# @!attribute [rw] options_domain
#   @return [Array, nil]
#
# @!attribute [rw] options_security_active_from
#   @return [String, nil]
#
# @!attribute [rw] options_security_active_to
#   @return [String, nil]
#
# @!attribute [rw] options_security_irreversible
#   @return [Boolean, nil]
#
# @!attribute [rw] partner_id
#   @return [Integer]
#
# @!attribute [rw] partner_name
#   @return [String]
#
# @!attribute [rw] reference
#   @return [String]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
#
# @!attribute [rw] accessMode
#   @return [Object, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] fieldTemplates
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] options
#   @return [Hash, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
TemplateCreateData = Struct.new(
  :access_mode,
  :active,
  :client_id,
  :client_name,
  :field_template,
  :name,
  :options_custom_style,
  :options_custom_style_file,
  :options_domain,
  :options_security_active_from,
  :options_security_active_to,
  :options_security_irreversible,
  :partner_id,
  :partner_name,
  :reference,
  :type,
  :version,
  :accessMode,
  :client,
  :fieldTemplates,
  :id,
  :options,
  :partner,
  keyword_init: true
)

# Request payload for Template#remove.
#
# @!attribute [rw] id
#   @return [String]
TemplateRemoveMatch = Struct.new(
  :id,
  keyword_init: true
)

# Transaction entity data model.
#
# @!attribute [rw] bfid
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] completeDate
#   @return [String, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] errCode
#   @return [String, nil]
#
# @!attribute [rw] errMessage
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] ipAddress
#   @return [String, nil]
#
# @!attribute [rw] messageId
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] templateId
#   @return [String, nil]
Transaction = Struct.new(
  :bfid,
  :client,
  :completeDate,
  :directPartner,
  :errCode,
  :errMessage,
  :id,
  :ipAddress,
  :messageId,
  :partner,
  :reference,
  :success,
  :templateId,
  keyword_init: true
)

# Request payload for Transaction#load.
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] transaction_type
#   @return [String, nil]
TransactionLoadMatch = Struct.new(
  :id,
  :transaction_type,
  keyword_init: true
)

# Request payload for Transaction#list.
#
# @!attribute [rw] client
#   @return [String, nil]
#
# @!attribute [rw] date_from
#   @return [String, nil]
#
# @!attribute [rw] date_to
#   @return [String, nil]
#
# @!attribute [rw] message_id
#   @return [String, nil]
#
# @!attribute [rw] paging_mode
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
#
# @!attribute [rw] transaction_type
#   @return [String, nil]
TransactionListMatch = Struct.new(
  :client,
  :date_from,
  :date_to,
  :message_id,
  :paging_mode,
  :partner,
  :reference,
  :skip,
  :success,
  :take,
  :transaction_type,
  keyword_init: true
)

# UpdateResult entity data model.
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] contact
#   @return [Hash]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String]
#
# @!attribute [rw] firstName
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] lastName
#   @return [String]
#
# @!attribute [rw] mid
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] parent
#   @return [Hash, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [String]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] sendWelcomeEmail
#   @return [Boolean, nil]
#
# @!attribute [rw] userName
#   @return [String]
#
# @!attribute [rw] userRole
#   @return [Hash]
#
# @!attribute [rw] verificationPhrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResult = Struct.new(
  :billingId,
  :client,
  :contact,
  :directPartner,
  :email,
  :firstName,
  :id,
  :isActive,
  :lastName,
  :mid,
  :name,
  :parent,
  :partner,
  :phone,
  :reference,
  :sendWelcomeEmail,
  :userName,
  :userRole,
  :verificationPhrase,
  :version,
  keyword_init: true
)

# Request payload for UpdateResult#list.
#
# @!attribute [rw] client
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [String, nil]
#
# @!attribute [rw] skip
#   @return [Integer, nil]
#
# @!attribute [rw] take
#   @return [Integer, nil]
UpdateResultListMatch = Struct.new(
  :client,
  :partner,
  :skip,
  :take,
  keyword_init: true
)

# Request payload for UpdateResult#create.
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String]
#
# @!attribute [rw] first_name
#   @return [String]
#
# @!attribute [rw] is_active
#   @return [Boolean]
#
# @!attribute [rw] last_name
#   @return [String]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [Integer]
#
# @!attribute [rw] send_welcome_email
#   @return [Boolean]
#
# @!attribute [rw] user_role
#   @return [Hash]
#
# @!attribute [rw] username
#   @return [String]
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] contact
#   @return [Hash]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] firstName
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] lastName
#   @return [String]
#
# @!attribute [rw] mid
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] parent
#   @return [Hash, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] sendWelcomeEmail
#   @return [Boolean, nil]
#
# @!attribute [rw] userName
#   @return [String]
#
# @!attribute [rw] userRole
#   @return [Hash]
#
# @!attribute [rw] verificationPhrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResultCreateData = Struct.new(
  :client,
  :email,
  :first_name,
  :is_active,
  :last_name,
  :partner,
  :phone,
  :send_welcome_email,
  :user_role,
  :username,
  :billingId,
  :contact,
  :directPartner,
  :firstName,
  :id,
  :isActive,
  :lastName,
  :mid,
  :name,
  :parent,
  :reference,
  :sendWelcomeEmail,
  :userName,
  :userRole,
  :verificationPhrase,
  :version,
  keyword_init: true
)

# Request payload for UpdateResult#update.
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] access_mode
#   @return [String, nil]
#
# @!attribute [rw] active
#   @return [Boolean, nil]
#
# @!attribute [rw] client_id
#   @return [Integer, nil]
#
# @!attribute [rw] client_name
#   @return [String, nil]
#
# @!attribute [rw] field_template
#   @return [Array, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] options_custom_style
#   @return [String, nil]
#
# @!attribute [rw] options_custom_style_file
#   @return [String, nil]
#
# @!attribute [rw] options_domain
#   @return [Array, nil]
#
# @!attribute [rw] options_security_active_from
#   @return [String, nil]
#
# @!attribute [rw] options_security_active_to
#   @return [String, nil]
#
# @!attribute [rw] options_security_irreversible
#   @return [Boolean, nil]
#
# @!attribute [rw] partner_id
#   @return [Integer, nil]
#
# @!attribute [rw] partner_name
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
#
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] contact_id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] parent_id
#   @return [Integer, nil]
#
# @!attribute [rw] parent_name
#   @return [String, nil]
#
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] first_name
#   @return [String, nil]
#
# @!attribute [rw] last_name
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [Integer, nil]
#
# @!attribute [rw] send_welcome_email
#   @return [Boolean, nil]
#
# @!attribute [rw] username
#   @return [String, nil]
#
# @!attribute [rw] direct_partner_id
#   @return [Integer, nil]
#
# @!attribute [rw] direct_partner_name
#   @return [String, nil]
#
# @!attribute [rw] mid
#   @return [String, nil]
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] firstName
#   @return [String, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] lastName
#   @return [String, nil]
#
# @!attribute [rw] parent
#   @return [Hash, nil]
#
# @!attribute [rw] sendWelcomeEmail
#   @return [Boolean, nil]
#
# @!attribute [rw] userName
#   @return [String, nil]
#
# @!attribute [rw] userRole
#   @return [Hash, nil]
#
# @!attribute [rw] verificationPhrase
#   @return [String, nil]
UpdateResultUpdateData = Struct.new(
  :id,
  :access_mode,
  :active,
  :client_id,
  :client_name,
  :field_template,
  :name,
  :options_custom_style,
  :options_custom_style_file,
  :options_domain,
  :options_security_active_from,
  :options_security_active_to,
  :options_security_irreversible,
  :partner_id,
  :partner_name,
  :reference,
  :type,
  :version,
  :billing_id,
  :contact_id,
  :is_active,
  :parent_id,
  :parent_name,
  :verification_phrase,
  :client,
  :email,
  :first_name,
  :last_name,
  :partner,
  :phone,
  :send_welcome_email,
  :username,
  :direct_partner_id,
  :direct_partner_name,
  :mid,
  :billingId,
  :contact,
  :directPartner,
  :firstName,
  :isActive,
  :lastName,
  :parent,
  :sendWelcomeEmail,
  :userName,
  :userRole,
  :verificationPhrase,
  keyword_init: true
)

# User entity data model.
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] firstName
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] isActive
#   @return [Boolean, nil]
#
# @!attribute [rw] lastName
#   @return [String, nil]
#
# @!attribute [rw] modified
#   @return [String, nil]
#
# @!attribute [rw] partner
#   @return [Hash, nil]
#
# @!attribute [rw] phone
#   @return [String, nil]
#
# @!attribute [rw] userName
#   @return [String, nil]
#
# @!attribute [rw] userRole
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
User = Struct.new(
  :client,
  :created,
  :email,
  :firstName,
  :id,
  :isActive,
  :lastName,
  :modified,
  :partner,
  :phone,
  :userName,
  :userRole,
  :version,
  keyword_init: true
)

# Request payload for User#load.
#
# @!attribute [rw] id
#   @return [String]
UserLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

