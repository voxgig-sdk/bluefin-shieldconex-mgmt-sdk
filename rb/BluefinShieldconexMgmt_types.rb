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
ClientListMatch = Struct.new(
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

# Request payload for Client#create.
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
ClientCreateData = Struct.new(
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
PartnerListMatch = Struct.new(
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

# Request payload for Partner#create.
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
PartnerCreateData = Struct.new(
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
TemplateListMatch = Struct.new(
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

# Request payload for Template#create.
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
TemplateCreateData = Struct.new(
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
TransactionListMatch = Struct.new(
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
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
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
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResultListMatch = Struct.new(
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

# Request payload for UpdateResult#create.
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
UpdateResultCreateData = Struct.new(
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

# Request payload for UpdateResult#update.
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] billingId
#   @return [String, nil]
#
# @!attribute [rw] client
#   @return [Hash, nil]
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] directPartner
#   @return [Hash, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
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
#
# @!attribute [rw] version
#   @return [Integer, nil]
UpdateResultUpdateData = Struct.new(
  :id,
  :billingId,
  :client,
  :contact,
  :directPartner,
  :email,
  :firstName,
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

