# Typed models for the BluefinShieldconexMgmt SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels. The SDK carries data as string-keyed struct value
# nodes, so each alias is an open string-keyed map; the @typedoc member lists
# document the concrete shapes. Do not edit by hand.

defmodule BluefinShieldconexMgmt.Types do
  @moduledoc """
  Documented shapes for the BluefinShieldconexMgmt SDK entities and operation payloads.

  Every alias resolves to an open string-keyed map because the SDK carries
  data as string-keyed struct value nodes; consult each type's member list for
  the concrete field/param types.
  """

  @typedoc """
  Client entity data model.

  Members:
    * `"billingId"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"directPartner"` — map() (optional)
    * `"id"` — integer() (optional)
    * `"isActive"` — boolean() (optional)
    * `"mid"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type client :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Client load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type client_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Client list.

  Members:
    * `"partner"` — String.t() (required)
    * `"skip"` — integer() (optional)
    * `"take"` — integer() (optional)
  """
  @type client_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Client create.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"contact_email"` — String.t() (required)
    * `"contact_first_name"` — String.t() (required)
    * `"contact_is_active"` — boolean() (required)
    * `"contact_last_name"` — String.t() (required)
    * `"contact_phone"` — String.t() (required)
    * `"contact_send_welcome_email"` — boolean() (required)
    * `"contact_user_name"` — String.t() (required)
    * `"contact_user_role"` — String.t() (required)
    * `"direct_partner_id"` — integer() (required)
    * `"direct_partner_name"` — String.t() (required)
    * `"is_active"` — boolean() (required)
    * `"mid"` — String.t() (optional)
    * `"name"` — String.t() (required)
    * `"billingId"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"directPartner"` — map() (optional)
    * `"id"` — integer() (optional)
    * `"isActive"` — boolean() (optional)
    * `"modified"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type client_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Client remove.

  Members:
    * `"id"` — String.t() (required)
  """
  @type client_remove_match :: %{optional(String.t()) => any()}

  @typedoc """
  Clone entity data model.

  Members:
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
  """
  @type clone :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Clone create.

  Members:
    * `"template_id"` — String.t() (required)
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
  """
  @type clone_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Partner entity data model.

  Members:
    * `"billingId"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"isActive"` — boolean() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"verificationPhrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type partner :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Partner load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type partner_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Partner list.

  Members:
    * `"partner"` — String.t() (optional)
    * `"skip"` — integer() (optional)
    * `"take"` — integer() (optional)
  """
  @type partner_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Partner create.

  Members:
    * `"billing_id"` — String.t() (required)
    * `"contact_email"` — String.t() (required)
    * `"contact_first_name"` — String.t() (required)
    * `"contact_is_active"` — boolean() (required)
    * `"contact_last_name"` — String.t() (required)
    * `"contact_phone"` — String.t() (required)
    * `"contact_send_welcome_email"` — boolean() (required)
    * `"contact_user_name"` — String.t() (required)
    * `"contact_user_role"` — String.t() (required)
    * `"is_active"` — boolean() (required)
    * `"name"` — String.t() (required)
    * `"parent_id"` — integer() (optional)
    * `"parent_name"` — String.t() (optional)
    * `"reference"` — String.t() (required)
    * `"verification_phrase"` — String.t() (optional)
    * `"billingId"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"isActive"` — boolean() (optional)
    * `"modified"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"verificationPhrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type partner_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Template entity data model.

  Members:
    * `"accessMode"` — any() (optional)
    * `"active"` — boolean() (optional)
    * `"client"` — map() (optional)
    * `"fieldTemplates"` — list() (optional)
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
    * `"options"` — map() (optional)
    * `"partner"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"type"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type template :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Template load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type template_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Template list.

  Members:
    * `"client"` — String.t() (optional)
    * `"partner"` — String.t() (optional)
    * `"skip"` — integer() (optional)
    * `"take"` — integer() (optional)
  """
  @type template_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Template create.

  Members:
    * `"access_mode"` — String.t() (optional)
    * `"active"` — boolean() (required)
    * `"client_id"` — integer() (required)
    * `"client_name"` — String.t() (required)
    * `"field_template"` — list() (optional)
    * `"name"` — String.t() (required)
    * `"options_custom_style"` — String.t() (optional)
    * `"options_custom_style_file"` — String.t() (optional)
    * `"options_domain"` — list() (optional)
    * `"options_security_active_from"` — String.t() (optional)
    * `"options_security_active_to"` — String.t() (optional)
    * `"options_security_irreversible"` — boolean() (optional)
    * `"partner_id"` — integer() (required)
    * `"partner_name"` — String.t() (required)
    * `"reference"` — String.t() (required)
    * `"type"` — String.t() (optional)
    * `"version"` — integer() (optional)
    * `"accessMode"` — any() (optional)
    * `"client"` — map() (optional)
    * `"fieldTemplates"` — list() (optional)
    * `"id"` — integer() (optional)
    * `"options"` — map() (optional)
    * `"partner"` — map() (optional)
  """
  @type template_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Template remove.

  Members:
    * `"id"` — String.t() (required)
  """
  @type template_remove_match :: %{optional(String.t()) => any()}

  @typedoc """
  Transaction entity data model.

  Members:
    * `"bfid"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"completeDate"` — String.t() (optional)
    * `"directPartner"` — map() (optional)
    * `"errCode"` — String.t() (optional)
    * `"errMessage"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"ipAddress"` — String.t() (optional)
    * `"messageId"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"success"` — boolean() (optional)
    * `"templateId"` — String.t() (optional)
  """
  @type transaction :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Transaction load.

  Members:
    * `"id"` — String.t() (required)
    * `"transaction_type"` — String.t() (optional)
  """
  @type transaction_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Transaction list.

  Members:
    * `"client"` — String.t() (optional)
    * `"date_from"` — String.t() (optional)
    * `"date_to"` — String.t() (optional)
    * `"message_id"` — String.t() (optional)
    * `"paging_mode"` — String.t() (optional)
    * `"partner"` — String.t() (optional)
    * `"reference"` — String.t() (optional)
    * `"skip"` — integer() (optional)
    * `"success"` — boolean() (optional)
    * `"take"` — integer() (optional)
    * `"transaction_type"` — String.t() (optional)
  """
  @type transaction_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  UpdateResult entity data model.

  Members:
    * `"billingId"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"contact"` — map() (required)
    * `"directPartner"` — map() (optional)
    * `"email"` — String.t() (required)
    * `"firstName"` — String.t() (required)
    * `"id"` — integer() (optional)
    * `"isActive"` — boolean() (optional)
    * `"lastName"` — String.t() (required)
    * `"mid"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (required)
    * `"reference"` — String.t() (optional)
    * `"sendWelcomeEmail"` — boolean() (optional)
    * `"userName"` — String.t() (required)
    * `"userRole"` — map() (required)
    * `"verificationPhrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type update_result :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for UpdateResult list.

  Members:
    * `"client"` — String.t() (optional)
    * `"partner"` — String.t() (optional)
    * `"skip"` — integer() (optional)
    * `"take"` — integer() (optional)
  """
  @type update_result_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for UpdateResult create.

  Members:
    * `"client"` — map() (optional)
    * `"email"` — String.t() (required)
    * `"first_name"` — String.t() (required)
    * `"is_active"` — boolean() (required)
    * `"last_name"` — String.t() (required)
    * `"partner"` — map() (optional)
    * `"phone"` — integer() (required)
    * `"send_welcome_email"` — boolean() (required)
    * `"user_role"` — map() (required)
    * `"username"` — String.t() (required)
    * `"billingId"` — String.t() (optional)
    * `"contact"` — map() (required)
    * `"directPartner"` — map() (optional)
    * `"firstName"` — String.t() (required)
    * `"id"` — integer() (optional)
    * `"isActive"` — boolean() (optional)
    * `"lastName"` — String.t() (required)
    * `"mid"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"sendWelcomeEmail"` — boolean() (optional)
    * `"userName"` — String.t() (required)
    * `"userRole"` — map() (required)
    * `"verificationPhrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type update_result_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for UpdateResult update.

  Members:
    * `"id"` — String.t() (required)
    * `"access_mode"` — String.t() (optional)
    * `"active"` — boolean() (optional)
    * `"client_id"` — integer() (optional)
    * `"client_name"` — String.t() (optional)
    * `"field_template"` — list() (optional)
    * `"name"` — String.t() (optional)
    * `"options_custom_style"` — String.t() (optional)
    * `"options_custom_style_file"` — String.t() (optional)
    * `"options_domain"` — list() (optional)
    * `"options_security_active_from"` — String.t() (optional)
    * `"options_security_active_to"` — String.t() (optional)
    * `"options_security_irreversible"` — boolean() (optional)
    * `"partner_id"` — integer() (optional)
    * `"partner_name"` — String.t() (optional)
    * `"reference"` — String.t() (optional)
    * `"type"` — String.t() (optional)
    * `"version"` — integer() (optional)
    * `"billing_id"` — String.t() (optional)
    * `"contact_id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"parent_id"` — integer() (optional)
    * `"parent_name"` — String.t() (optional)
    * `"verification_phrase"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"email"` — String.t() (optional)
    * `"first_name"` — String.t() (optional)
    * `"last_name"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — integer() (optional)
    * `"send_welcome_email"` — boolean() (optional)
    * `"username"` — String.t() (optional)
    * `"direct_partner_id"` — integer() (optional)
    * `"direct_partner_name"` — String.t() (optional)
    * `"mid"` — String.t() (optional)
    * `"billingId"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"directPartner"` — map() (optional)
    * `"firstName"` — String.t() (optional)
    * `"isActive"` — boolean() (optional)
    * `"lastName"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"sendWelcomeEmail"` — boolean() (optional)
    * `"userName"` — String.t() (optional)
    * `"userRole"` — map() (optional)
    * `"verificationPhrase"` — String.t() (optional)
  """
  @type update_result_update_data :: %{optional(String.t()) => any()}

  @typedoc """
  User entity data model.

  Members:
    * `"client"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"email"` — String.t() (optional)
    * `"firstName"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"isActive"` — boolean() (optional)
    * `"lastName"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (optional)
    * `"userName"` — String.t() (optional)
    * `"userRole"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type user :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for User load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type user_load_match :: %{optional(String.t()) => any()}

end
