# Typed models for the BluefinShieldconexMgmt SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Client(TypedDict, total=False):
    billingId: str
    contact: dict
    created: str
    directPartner: dict
    id: int
    isActive: bool
    mid: str
    modified: str
    name: str
    partner: dict
    version: int


class ClientLoadMatch(TypedDict):
    id: str


class ClientListMatchRequired(TypedDict):
    partner: str


class ClientListMatch(ClientListMatchRequired, total=False):
    skip: int
    take: int


class ClientCreateDataRequired(TypedDict):
    contact_email: str
    contact_first_name: str
    contact_is_active: bool
    contact_last_name: str
    contact_phone: str
    contact_send_welcome_email: bool
    contact_user_name: str
    contact_user_role: str
    direct_partner_id: int
    direct_partner_name: str
    is_active: bool
    name: str


class ClientCreateData(ClientCreateDataRequired, total=False):
    billing_id: str
    mid: str
    billingId: str
    contact: dict
    created: str
    directPartner: dict
    id: int
    isActive: bool
    modified: str
    partner: dict
    version: int


class ClientRemoveMatch(TypedDict):
    id: str


class Clone(TypedDict, total=False):
    id: int
    name: str


class CloneCreateDataRequired(TypedDict):
    template_id: str


class CloneCreateData(CloneCreateDataRequired, total=False):
    id: int
    name: str


class Partner(TypedDict, total=False):
    billingId: str
    contact: dict
    created: str
    id: int
    isActive: bool
    modified: str
    name: str
    parent: dict
    reference: str
    verificationPhrase: str
    version: int


class PartnerLoadMatch(TypedDict):
    id: str


class PartnerListMatch(TypedDict, total=False):
    partner: str
    skip: int
    take: int


class PartnerCreateDataRequired(TypedDict):
    billing_id: str
    contact_email: str
    contact_first_name: str
    contact_is_active: bool
    contact_last_name: str
    contact_phone: str
    contact_send_welcome_email: bool
    contact_user_name: str
    contact_user_role: str
    is_active: bool
    name: str
    reference: str


class PartnerCreateData(PartnerCreateDataRequired, total=False):
    parent_id: int
    parent_name: str
    verification_phrase: str
    billingId: str
    contact: dict
    created: str
    id: int
    isActive: bool
    modified: str
    parent: dict
    verificationPhrase: str
    version: int


class Template(TypedDict, total=False):
    accessMode: Any
    active: bool
    client: dict
    fieldTemplates: list
    id: int
    name: str
    options: dict
    partner: dict
    reference: str
    type: str
    version: int


class TemplateLoadMatch(TypedDict):
    id: str


class TemplateListMatch(TypedDict, total=False):
    client: str
    partner: str
    skip: int
    take: int


class TemplateCreateDataRequired(TypedDict):
    active: bool
    client_id: int
    client_name: str
    name: str
    partner_id: int
    partner_name: str
    reference: str


class TemplateCreateData(TemplateCreateDataRequired, total=False):
    access_mode: str
    field_template: list
    options_custom_style: str
    options_custom_style_file: str
    options_domain: list
    options_security_active_from: str
    options_security_active_to: str
    options_security_irreversible: bool
    type: str
    version: int
    accessMode: Any
    client: dict
    fieldTemplates: list
    id: int
    options: dict
    partner: dict


class TemplateRemoveMatch(TypedDict):
    id: str


class Transaction(TypedDict, total=False):
    bfid: str
    client: dict
    completeDate: str
    directPartner: dict
    errCode: str
    errMessage: str
    id: int
    ipAddress: str
    messageId: str
    partner: dict
    reference: str
    success: bool
    templateId: str


class TransactionLoadMatchRequired(TypedDict):
    id: str


class TransactionLoadMatch(TransactionLoadMatchRequired, total=False):
    transaction_type: str


class TransactionListMatch(TypedDict, total=False):
    client: str
    date_from: str
    date_to: str
    message_id: str
    paging_mode: str
    partner: str
    reference: str
    skip: int
    success: bool
    take: int
    transaction_type: str


class UpdateResultRequired(TypedDict):
    contact: dict
    email: str
    firstName: str
    lastName: str
    phone: str
    userName: str
    userRole: dict


class UpdateResult(UpdateResultRequired, total=False):
    billingId: str
    client: dict
    directPartner: dict
    id: int
    isActive: bool
    mid: str
    name: str
    parent: dict
    partner: dict
    reference: str
    sendWelcomeEmail: bool
    verificationPhrase: str
    version: int


class UpdateResultListMatch(TypedDict, total=False):
    client: str
    partner: str
    skip: int
    take: int


class UpdateResultCreateDataRequired(TypedDict):
    email: str
    first_name: str
    is_active: bool
    last_name: str
    phone: int
    send_welcome_email: bool
    user_role: dict
    username: str
    contact: dict
    firstName: str
    lastName: str
    userName: str
    userRole: dict


class UpdateResultCreateData(UpdateResultCreateDataRequired, total=False):
    client: dict
    partner: dict
    billingId: str
    directPartner: dict
    id: int
    isActive: bool
    mid: str
    name: str
    parent: dict
    reference: str
    sendWelcomeEmail: bool
    verificationPhrase: str
    version: int


class UpdateResultUpdateDataRequired(TypedDict):
    id: str


class UpdateResultUpdateData(UpdateResultUpdateDataRequired, total=False):
    access_mode: str
    active: bool
    client_id: int
    client_name: str
    field_template: list
    name: str
    options_custom_style: str
    options_custom_style_file: str
    options_domain: list
    options_security_active_from: str
    options_security_active_to: str
    options_security_irreversible: bool
    partner_id: int
    partner_name: str
    reference: str
    type: str
    version: int
    billing_id: str
    contact_id: int
    is_active: bool
    parent_id: int
    parent_name: str
    verification_phrase: str
    client: dict
    email: str
    first_name: str
    last_name: str
    partner: dict
    phone: int
    send_welcome_email: bool
    username: str
    direct_partner_id: int
    direct_partner_name: str
    mid: str
    billingId: str
    contact: dict
    directPartner: dict
    firstName: str
    isActive: bool
    lastName: str
    parent: dict
    sendWelcomeEmail: bool
    userName: str
    userRole: dict
    verificationPhrase: str


class User(TypedDict, total=False):
    client: dict
    created: str
    email: str
    firstName: str
    id: int
    isActive: bool
    lastName: str
    modified: str
    partner: dict
    phone: str
    userName: str
    userRole: dict
    version: int


class UserLoadMatch(TypedDict):
    id: str
