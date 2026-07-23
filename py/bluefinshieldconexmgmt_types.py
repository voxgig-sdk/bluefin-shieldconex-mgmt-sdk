# Typed models for the BluefinShieldconexMgmt SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
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
    billing_id: str
    contact: dict
    created: str
    direct_partner: dict
    id: int
    is_active: bool
    mid: str
    modified: str
    name: str
    partner: dict
    version: int


class ClientLoadMatch(TypedDict):
    id: str


class ClientListMatch(TypedDict, total=False):
    billing_id: str
    contact: dict
    created: str
    direct_partner: dict
    id: int
    is_active: bool
    mid: str
    modified: str
    name: str
    partner: dict
    version: int


class ClientCreateData(TypedDict, total=False):
    billing_id: str
    contact: dict
    created: str
    direct_partner: dict
    id: int
    is_active: bool
    mid: str
    modified: str
    name: str
    partner: dict
    version: int


class ClientRemoveMatch(TypedDict):
    id: str


class Clone(TypedDict, total=False):
    id: int
    name: str


class CloneCreateData(TypedDict):
    template_id: str


class Partner(TypedDict, total=False):
    billing_id: str
    contact: dict
    created: str
    id: int
    is_active: bool
    modified: str
    name: str
    parent: dict
    reference: str
    verification_phrase: str
    version: int


class PartnerLoadMatch(TypedDict):
    id: str


class PartnerListMatch(TypedDict, total=False):
    billing_id: str
    contact: dict
    created: str
    id: int
    is_active: bool
    modified: str
    name: str
    parent: dict
    reference: str
    verification_phrase: str
    version: int


class PartnerCreateData(TypedDict, total=False):
    billing_id: str
    contact: dict
    created: str
    id: int
    is_active: bool
    modified: str
    name: str
    parent: dict
    reference: str
    verification_phrase: str
    version: int


class Template(TypedDict, total=False):
    access_mode: Any
    active: bool
    client: dict
    field_template: list
    id: int
    name: str
    option: dict
    partner: dict
    reference: str
    type: str
    version: int


class TemplateLoadMatch(TypedDict):
    id: str


class TemplateListMatch(TypedDict, total=False):
    access_mode: Any
    active: bool
    client: dict
    field_template: list
    id: int
    name: str
    option: dict
    partner: dict
    reference: str
    type: str
    version: int


class TemplateCreateData(TypedDict, total=False):
    access_mode: Any
    active: bool
    client: dict
    field_template: list
    id: int
    name: str
    option: dict
    partner: dict
    reference: str
    type: str
    version: int


class TemplateRemoveMatch(TypedDict):
    id: str


class Transaction(TypedDict, total=False):
    bfid: str
    client: dict
    complete_date: str
    direct_partner: dict
    err_code: str
    err_message: str
    id: int
    ip_address: str
    message_id: str
    partner: dict
    reference: str
    success: bool
    template_id: str


class TransactionLoadMatch(TypedDict):
    id: str


class TransactionListMatch(TypedDict, total=False):
    bfid: str
    client: dict
    complete_date: str
    direct_partner: dict
    err_code: str
    err_message: str
    id: int
    ip_address: str
    message_id: str
    partner: dict
    reference: str
    success: bool
    template_id: str


class UpdateResultRequired(TypedDict):
    contact: dict
    email: str
    first_name: str
    last_name: str
    phone: str
    user_name: str
    user_role: dict


class UpdateResult(UpdateResultRequired, total=False):
    billing_id: str
    client: dict
    direct_partner: dict
    id: int
    is_active: bool
    mid: str
    name: str
    parent: dict
    partner: dict
    reference: str
    send_welcome_email: bool
    verification_phrase: str
    version: int


class UpdateResultListMatch(TypedDict, total=False):
    billing_id: str
    client: dict
    contact: dict
    direct_partner: dict
    email: str
    first_name: str
    id: int
    is_active: bool
    last_name: str
    mid: str
    name: str
    parent: dict
    partner: dict
    phone: str
    reference: str
    send_welcome_email: bool
    user_name: str
    user_role: dict
    verification_phrase: str
    version: int


class UpdateResultCreateDataRequired(TypedDict):
    contact: dict
    email: str
    first_name: str
    last_name: str
    phone: str
    user_name: str
    user_role: dict


class UpdateResultCreateData(UpdateResultCreateDataRequired, total=False):
    billing_id: str
    client: dict
    direct_partner: dict
    id: int
    is_active: bool
    mid: str
    name: str
    parent: dict
    partner: dict
    reference: str
    send_welcome_email: bool
    verification_phrase: str
    version: int


class UpdateResultUpdateData(TypedDict):
    id: str


class User(TypedDict, total=False):
    client: dict
    created: str
    email: str
    first_name: str
    id: int
    is_active: bool
    last_name: str
    modified: str
    partner: dict
    phone: str
    user_name: str
    user_role: dict
    version: int


class UserLoadMatch(TypedDict):
    id: str
