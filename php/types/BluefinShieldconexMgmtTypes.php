<?php
declare(strict_types=1);

// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Client entity data model. */
class Client
{
    public ?string $billing_id = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?array $direct_partner = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $mid = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $partner = null;
    public ?int $version = null;
}

/** Request payload for Client#load. */
class ClientLoadMatch
{
    public string $id;
}

/** Request payload for Client#list. */
class ClientListMatch
{
    public ?string $billing_id = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?array $direct_partner = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $mid = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $partner = null;
    public ?int $version = null;
}

/** Request payload for Client#create. */
class ClientCreateData
{
    public ?string $billing_id = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?array $direct_partner = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $mid = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $partner = null;
    public ?int $version = null;
}

/** Request payload for Client#remove. */
class ClientRemoveMatch
{
    public string $id;
}

/** Clone entity data model. */
class Clone
{
    public ?int $id = null;
    public ?string $name = null;
}

/** Request payload for Clone#create. */
class CloneCreateData
{
    public string $template_id;
}

/** Partner entity data model. */
class Partner
{
    public ?string $billing_id = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?string $reference = null;
    public ?string $verification_phrase = null;
    public ?int $version = null;
}

/** Request payload for Partner#load. */
class PartnerLoadMatch
{
    public string $id;
}

/** Request payload for Partner#list. */
class PartnerListMatch
{
    public ?string $billing_id = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?string $reference = null;
    public ?string $verification_phrase = null;
    public ?int $version = null;
}

/** Request payload for Partner#create. */
class PartnerCreateData
{
    public ?string $billing_id = null;
    public ?array $contact = null;
    public ?string $created = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $modified = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?string $reference = null;
    public ?string $verification_phrase = null;
    public ?int $version = null;
}

/** Template entity data model. */
class Template
{
    public mixed $access_mode = null;
    public ?bool $active = null;
    public ?array $client = null;
    public ?array $field_template = null;
    public ?int $id = null;
    public ?string $name = null;
    public ?array $option = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?string $type = null;
    public ?int $version = null;
}

/** Request payload for Template#load. */
class TemplateLoadMatch
{
    public string $id;
}

/** Request payload for Template#list. */
class TemplateListMatch
{
    public mixed $access_mode = null;
    public ?bool $active = null;
    public ?array $client = null;
    public ?array $field_template = null;
    public ?int $id = null;
    public ?string $name = null;
    public ?array $option = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?string $type = null;
    public ?int $version = null;
}

/** Request payload for Template#create. */
class TemplateCreateData
{
    public mixed $access_mode = null;
    public ?bool $active = null;
    public ?array $client = null;
    public ?array $field_template = null;
    public ?int $id = null;
    public ?string $name = null;
    public ?array $option = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?string $type = null;
    public ?int $version = null;
}

/** Request payload for Template#remove. */
class TemplateRemoveMatch
{
    public string $id;
}

/** Transaction entity data model. */
class Transaction
{
    public ?string $bfid = null;
    public ?array $client = null;
    public ?string $complete_date = null;
    public ?array $direct_partner = null;
    public ?string $err_code = null;
    public ?string $err_message = null;
    public ?int $id = null;
    public ?string $ip_address = null;
    public ?string $message_id = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?bool $success = null;
    public ?string $template_id = null;
}

/** Request payload for Transaction#load. */
class TransactionLoadMatch
{
    public string $id;
}

/** Request payload for Transaction#list. */
class TransactionListMatch
{
    public ?string $bfid = null;
    public ?array $client = null;
    public ?string $complete_date = null;
    public ?array $direct_partner = null;
    public ?string $err_code = null;
    public ?string $err_message = null;
    public ?int $id = null;
    public ?string $ip_address = null;
    public ?string $message_id = null;
    public ?array $partner = null;
    public ?string $reference = null;
    public ?bool $success = null;
    public ?string $template_id = null;
}

/** UpdateResult entity data model. */
class UpdateResult
{
    public ?string $billing_id = null;
    public ?array $client = null;
    public array $contact;
    public ?array $direct_partner = null;
    public string $email;
    public string $first_name;
    public ?int $id = null;
    public ?bool $is_active = null;
    public string $last_name;
    public ?string $mid = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?array $partner = null;
    public string $phone;
    public ?string $reference = null;
    public ?bool $send_welcome_email = null;
    public string $user_name;
    public array $user_role;
    public ?string $verification_phrase = null;
    public ?int $version = null;
}

/** Request payload for UpdateResult#list. */
class UpdateResultListMatch
{
    public ?string $billing_id = null;
    public ?array $client = null;
    public ?array $contact = null;
    public ?array $direct_partner = null;
    public ?string $email = null;
    public ?string $first_name = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $last_name = null;
    public ?string $mid = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $reference = null;
    public ?bool $send_welcome_email = null;
    public ?string $user_name = null;
    public ?array $user_role = null;
    public ?string $verification_phrase = null;
    public ?int $version = null;
}

/** Request payload for UpdateResult#create. */
class UpdateResultCreateData
{
    public ?string $billing_id = null;
    public ?array $client = null;
    public array $contact;
    public ?array $direct_partner = null;
    public string $email;
    public string $first_name;
    public ?int $id = null;
    public ?bool $is_active = null;
    public string $last_name;
    public ?string $mid = null;
    public ?string $name = null;
    public ?array $parent = null;
    public ?array $partner = null;
    public string $phone;
    public ?string $reference = null;
    public ?bool $send_welcome_email = null;
    public string $user_name;
    public array $user_role;
    public ?string $verification_phrase = null;
    public ?int $version = null;
}

/** Request payload for UpdateResult#update. */
class UpdateResultUpdateData
{
    public string $id;
}

/** User entity data model. */
class User
{
    public ?array $client = null;
    public ?string $created = null;
    public ?string $email = null;
    public ?string $first_name = null;
    public ?int $id = null;
    public ?bool $is_active = null;
    public ?string $last_name = null;
    public ?string $modified = null;
    public ?array $partner = null;
    public ?string $phone = null;
    public ?string $user_name = null;
    public ?array $user_role = null;
    public ?int $version = null;
}

/** Request payload for User#load. */
class UserLoadMatch
{
    public string $id;
}

