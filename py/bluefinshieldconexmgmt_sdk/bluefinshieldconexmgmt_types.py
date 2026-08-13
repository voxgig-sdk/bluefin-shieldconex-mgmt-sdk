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


class ClientListMatch(TypedDict, total=False):
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


class ClientCreateData(TypedDict, total=False):
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


class PartnerCreateData(TypedDict, total=False):
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


class TemplateCreateData(TypedDict, total=False):
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


class TransactionLoadMatch(TypedDict):
    id: str


class TransactionListMatch(TypedDict, total=False):
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
    billingId: str
    client: dict
    contact: dict
    directPartner: dict
    email: str
    firstName: str
    id: int
    isActive: bool
    lastName: str
    mid: str
    name: str
    parent: dict
    partner: dict
    phone: str
    reference: str
    sendWelcomeEmail: bool
    userName: str
    userRole: dict
    verificationPhrase: str
    version: int


class UpdateResultCreateDataRequired(TypedDict):
    contact: dict
    email: str
    firstName: str
    lastName: str
    phone: str
    userName: str
    userRole: dict


class UpdateResultCreateData(UpdateResultCreateDataRequired, total=False):
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


class UpdateResultUpdateDataRequired(TypedDict):
    id: str


class UpdateResultUpdateData(UpdateResultUpdateDataRequired, total=False):
    billingId: str
    client: dict
    contact: dict
    directPartner: dict
    email: str
    firstName: str
    isActive: bool
    lastName: str
    mid: str
    name: str
    parent: dict
    partner: dict
    phone: str
    reference: str
    sendWelcomeEmail: bool
    userName: str
    userRole: dict
    verificationPhrase: str
    version: int


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
