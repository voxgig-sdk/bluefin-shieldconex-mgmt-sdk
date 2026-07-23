# Typed models for the BluefinShieldconexMgmt SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
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
    * `"billing_id"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
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
    * `"billing_id"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"mid"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"version"` — integer() (optional)
  """
  @type client_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Client create.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"mid"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
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
  """
  @type clone_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Partner entity data model.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"verification_phrase"` — String.t() (optional)
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
    * `"billing_id"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"verification_phrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type partner_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Partner create.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"contact"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"modified"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"verification_phrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type partner_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Template entity data model.

  Members:
    * `"access_mode"` — any() (optional)
    * `"active"` — boolean() (optional)
    * `"client"` — map() (optional)
    * `"field_template"` — list() (optional)
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
    * `"option"` — map() (optional)
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
    * `"access_mode"` — any() (optional)
    * `"active"` — boolean() (optional)
    * `"client"` — map() (optional)
    * `"field_template"` — list() (optional)
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
    * `"option"` — map() (optional)
    * `"partner"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"type"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type template_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Template create.

  Members:
    * `"access_mode"` — any() (optional)
    * `"active"` — boolean() (optional)
    * `"client"` — map() (optional)
    * `"field_template"` — list() (optional)
    * `"id"` — integer() (optional)
    * `"name"` — String.t() (optional)
    * `"option"` — map() (optional)
    * `"partner"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"type"` — String.t() (optional)
    * `"version"` — integer() (optional)
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
    * `"complete_date"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"err_code"` — String.t() (optional)
    * `"err_message"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"ip_address"` — String.t() (optional)
    * `"message_id"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"success"` — boolean() (optional)
    * `"template_id"` — String.t() (optional)
  """
  @type transaction :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Transaction load.

  Members:
    * `"id"` — String.t() (required)
  """
  @type transaction_load_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for Transaction list.

  Members:
    * `"bfid"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"complete_date"` — String.t() (optional)
    * `"direct_partner"` — map() (optional)
    * `"err_code"` — String.t() (optional)
    * `"err_message"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"ip_address"` — String.t() (optional)
    * `"message_id"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"reference"` — String.t() (optional)
    * `"success"` — boolean() (optional)
    * `"template_id"` — String.t() (optional)
  """
  @type transaction_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  UpdateResult entity data model.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"contact"` — map() (required)
    * `"direct_partner"` — map() (optional)
    * `"email"` — String.t() (required)
    * `"first_name"` — String.t() (required)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"last_name"` — String.t() (required)
    * `"mid"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (required)
    * `"reference"` — String.t() (optional)
    * `"send_welcome_email"` — boolean() (optional)
    * `"user_name"` — String.t() (required)
    * `"user_role"` — map() (required)
    * `"verification_phrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type update_result :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for UpdateResult list.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"contact"` — map() (optional)
    * `"direct_partner"` — map() (optional)
    * `"email"` — String.t() (optional)
    * `"first_name"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"last_name"` — String.t() (optional)
    * `"mid"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (optional)
    * `"reference"` — String.t() (optional)
    * `"send_welcome_email"` — boolean() (optional)
    * `"user_name"` — String.t() (optional)
    * `"user_role"` — map() (optional)
    * `"verification_phrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type update_result_list_match :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for UpdateResult create.

  Members:
    * `"billing_id"` — String.t() (optional)
    * `"client"` — map() (optional)
    * `"contact"` — map() (required)
    * `"direct_partner"` — map() (optional)
    * `"email"` — String.t() (required)
    * `"first_name"` — String.t() (required)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"last_name"` — String.t() (required)
    * `"mid"` — String.t() (optional)
    * `"name"` — String.t() (optional)
    * `"parent"` — map() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (required)
    * `"reference"` — String.t() (optional)
    * `"send_welcome_email"` — boolean() (optional)
    * `"user_name"` — String.t() (required)
    * `"user_role"` — map() (required)
    * `"verification_phrase"` — String.t() (optional)
    * `"version"` — integer() (optional)
  """
  @type update_result_create_data :: %{optional(String.t()) => any()}

  @typedoc """
  Request payload for UpdateResult update.

  Members:
    * `"id"` — String.t() (required)
  """
  @type update_result_update_data :: %{optional(String.t()) => any()}

  @typedoc """
  User entity data model.

  Members:
    * `"client"` — map() (optional)
    * `"created"` — String.t() (optional)
    * `"email"` — String.t() (optional)
    * `"first_name"` — String.t() (optional)
    * `"id"` — integer() (optional)
    * `"is_active"` — boolean() (optional)
    * `"last_name"` — String.t() (optional)
    * `"modified"` — String.t() (optional)
    * `"partner"` — map() (optional)
    * `"phone"` — String.t() (optional)
    * `"user_name"` — String.t() (optional)
    * `"user_role"` — map() (optional)
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
