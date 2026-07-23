# frozen_string_literal: true

# Typed models for the BluefinShieldconexMgmt SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Client entity data model.
#
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
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
  :billing_id,
  :contact,
  :created,
  :direct_partner,
  :id,
  :is_active,
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
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
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
ClientListMatch = Struct.new(
  :billing_id,
  :contact,
  :created,
  :direct_partner,
  :id,
  :is_active,
  :mid,
  :modified,
  :name,
  :partner,
  :version,
  keyword_init: true
)

# Request payload for Client#create.
#
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
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
ClientCreateData = Struct.new(
  :billing_id,
  :contact,
  :created,
  :direct_partner,
  :id,
  :is_active,
  :mid,
  :modified,
  :name,
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
CloneCreateData = Struct.new(
  :template_id,
  keyword_init: true
)

# Partner entity data model.
#
# @!attribute [rw] billing_id
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
# @!attribute [rw] is_active
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
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
Partner = Struct.new(
  :billing_id,
  :contact,
  :created,
  :id,
  :is_active,
  :modified,
  :name,
  :parent,
  :reference,
  :verification_phrase,
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
# @!attribute [rw] billing_id
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
# @!attribute [rw] is_active
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
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
PartnerListMatch = Struct.new(
  :billing_id,
  :contact,
  :created,
  :id,
  :is_active,
  :modified,
  :name,
  :parent,
  :reference,
  :verification_phrase,
  :version,
  keyword_init: true
)

# Request payload for Partner#create.
#
# @!attribute [rw] billing_id
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
# @!attribute [rw] is_active
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
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
PartnerCreateData = Struct.new(
  :billing_id,
  :contact,
  :created,
  :id,
  :is_active,
  :modified,
  :name,
  :parent,
  :reference,
  :verification_phrase,
  :version,
  keyword_init: true
)

# Template entity data model.
#
# @!attribute [rw] access_mode
#   @return [Object, nil]
#
# @!attribute [rw] active
#   @return [Boolean, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] field_template
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] option
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
  :access_mode,
  :active,
  :client,
  :field_template,
  :id,
  :name,
  :option,
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
# @!attribute [rw] access_mode
#   @return [Object, nil]
#
# @!attribute [rw] active
#   @return [Boolean, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] field_template
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] option
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
TemplateListMatch = Struct.new(
  :access_mode,
  :active,
  :client,
  :field_template,
  :id,
  :name,
  :option,
  :partner,
  :reference,
  :type,
  :version,
  keyword_init: true
)

# Request payload for Template#create.
#
# @!attribute [rw] access_mode
#   @return [Object, nil]
#
# @!attribute [rw] active
#   @return [Boolean, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] field_template
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] option
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
TemplateCreateData = Struct.new(
  :access_mode,
  :active,
  :client,
  :field_template,
  :id,
  :name,
  :option,
  :partner,
  :reference,
  :type,
  :version,
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
# @!attribute [rw] complete_date
#   @return [String, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] err_code
#   @return [String, nil]
#
# @!attribute [rw] err_message
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] ip_address
#   @return [String, nil]
#
# @!attribute [rw] message_id
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
# @!attribute [rw] template_id
#   @return [String, nil]
Transaction = Struct.new(
  :bfid,
  :client,
  :complete_date,
  :direct_partner,
  :err_code,
  :err_message,
  :id,
  :ip_address,
  :message_id,
  :partner,
  :reference,
  :success,
  :template_id,
  keyword_init: true
)

# Request payload for Transaction#load.
#
# @!attribute [rw] id
#   @return [String]
TransactionLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Transaction#list.
#
# @!attribute [rw] bfid
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] complete_date
#   @return [String, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] err_code
#   @return [String, nil]
#
# @!attribute [rw] err_message
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] ip_address
#   @return [String, nil]
#
# @!attribute [rw] message_id
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
# @!attribute [rw] template_id
#   @return [String, nil]
TransactionListMatch = Struct.new(
  :bfid,
  :client,
  :complete_date,
  :direct_partner,
  :err_code,
  :err_message,
  :id,
  :ip_address,
  :message_id,
  :partner,
  :reference,
  :success,
  :template_id,
  keyword_init: true
)

# UpdateResult entity data model.
#
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] contact
#   @return [Hash]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String]
#
# @!attribute [rw] first_name
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] last_name
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
# @!attribute [rw] send_welcome_email
#   @return [Boolean, nil]
#
# @!attribute [rw] user_name
#   @return [String]
#
# @!attribute [rw] user_role
#   @return [Hash]
#
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResult = Struct.new(
  :billing_id,
  :client,
  :contact,
  :direct_partner,
  :email,
  :first_name,
  :id,
  :is_active,
  :last_name,
  :mid,
  :name,
  :parent,
  :partner,
  :phone,
  :reference,
  :send_welcome_email,
  :user_name,
  :user_role,
  :verification_phrase,
  :version,
  keyword_init: true
)

# Request payload for UpdateResult#list.
#
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] first_name
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] last_name
#   @return [String, nil]
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
#   @return [String, nil]
#
# @!attribute [rw] reference
#   @return [String, nil]
#
# @!attribute [rw] send_welcome_email
#   @return [Boolean, nil]
#
# @!attribute [rw] user_name
#   @return [String, nil]
#
# @!attribute [rw] user_role
#   @return [Hash, nil]
#
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResultListMatch = Struct.new(
  :billing_id,
  :client,
  :contact,
  :direct_partner,
  :email,
  :first_name,
  :id,
  :is_active,
  :last_name,
  :mid,
  :name,
  :parent,
  :partner,
  :phone,
  :reference,
  :send_welcome_email,
  :user_name,
  :user_role,
  :verification_phrase,
  :version,
  keyword_init: true
)

# Request payload for UpdateResult#create.
#
# @!attribute [rw] billing_id
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] contact
#   @return [Hash]
#
# @!attribute [rw] direct_partner
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String]
#
# @!attribute [rw] first_name
#   @return [String]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] last_name
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
# @!attribute [rw] send_welcome_email
#   @return [Boolean, nil]
#
# @!attribute [rw] user_name
#   @return [String]
#
# @!attribute [rw] user_role
#   @return [Hash]
#
# @!attribute [rw] verification_phrase
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResultCreateData = Struct.new(
  :billing_id,
  :client,
  :contact,
  :direct_partner,
  :email,
  :first_name,
  :id,
  :is_active,
  :last_name,
  :mid,
  :name,
  :parent,
  :partner,
  :phone,
  :reference,
  :send_welcome_email,
  :user_name,
  :user_role,
  :verification_phrase,
  :version,
  keyword_init: true
)

# Request payload for UpdateResult#update.
#
# @!attribute [rw] id
#   @return [String]
UpdateResultUpdateData = Struct.new(
  :id,
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
# @!attribute [rw] first_name
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_active
#   @return [Boolean, nil]
#
# @!attribute [rw] last_name
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
# @!attribute [rw] user_name
#   @return [String, nil]
#
# @!attribute [rw] user_role
#   @return [Hash, nil]
#
# @!attribute [rw] version
#   @return [Integer, nil]
User = Struct.new(
  :client,
  :created,
  :email,
  :first_name,
  :id,
  :is_active,
  :last_name,
  :modified,
  :partner,
  :phone,
  :user_name,
  :user_role,
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

