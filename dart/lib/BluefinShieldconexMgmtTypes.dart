// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON).
// Do not edit by hand.
//
// The operation pipeline passes plain maps; these classes are the typed,
// convertible view: `BluefinShieldconexMgmt.fromMap(ent.data())` / `model.toMap()`.

class Client {
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? mid;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// INTEGER
  int? version;

  Client({
    this.billingId,
    this.contact,
    this.created,
    this.directPartner,
    this.id,
    this.isActive,
    this.mid,
    this.modified,
    this.name,
    this.partner,
    this.version,
  });

  factory Client.fromMap(Map<String, dynamic> m) => Client(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class ClientLoadMatch {
  /// STRING (required at the API)
  String? id;

  ClientLoadMatch({
    this.id,
  });

  factory ClientLoadMatch.fromMap(Map<String, dynamic> m) => ClientLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class ClientListMatch {
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? mid;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// INTEGER
  int? version;

  ClientListMatch({
    this.billingId,
    this.contact,
    this.created,
    this.directPartner,
    this.id,
    this.isActive,
    this.mid,
    this.modified,
    this.name,
    this.partner,
    this.version,
  });

  factory ClientListMatch.fromMap(Map<String, dynamic> m) => ClientListMatch(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class ClientCreateData {
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? mid;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// INTEGER
  int? version;

  ClientCreateData({
    this.billingId,
    this.contact,
    this.created,
    this.directPartner,
    this.id,
    this.isActive,
    this.mid,
    this.modified,
    this.name,
    this.partner,
    this.version,
  });

  factory ClientCreateData.fromMap(Map<String, dynamic> m) => ClientCreateData(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class ClientRemoveMatch {
  /// STRING (required at the API)
  String? id;

  ClientRemoveMatch({
    this.id,
  });

  factory ClientRemoveMatch.fromMap(Map<String, dynamic> m) => ClientRemoveMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class Clone {
  /// INTEGER
  int? id;
  /// STRING
  String? name;

  Clone({
    this.id,
    this.name,
  });

  factory Clone.fromMap(Map<String, dynamic> m) => Clone(
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    return m;
  }
}

class CloneCreateData {
  /// STRING (required at the API)
  String? template_id;
  /// INTEGER
  int? id;
  /// STRING
  String? name;

  CloneCreateData({
    this.template_id,
    this.id,
    this.name,
  });

  factory CloneCreateData.fromMap(Map<String, dynamic> m) => CloneCreateData(
        template_id: m['template_id'] is String ? m['template_id'] : null,
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != template_id) {
      m['template_id'] = template_id;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    return m;
  }
}

class Partner {
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? reference;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  Partner({
    this.billingId,
    this.contact,
    this.created,
    this.id,
    this.isActive,
    this.modified,
    this.name,
    this.parent,
    this.reference,
    this.verificationPhrase,
    this.version,
  });

  factory Partner.fromMap(Map<String, dynamic> m) => Partner(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class PartnerLoadMatch {
  /// STRING (required at the API)
  String? id;

  PartnerLoadMatch({
    this.id,
  });

  factory PartnerLoadMatch.fromMap(Map<String, dynamic> m) => PartnerLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class PartnerListMatch {
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? reference;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  PartnerListMatch({
    this.billingId,
    this.contact,
    this.created,
    this.id,
    this.isActive,
    this.modified,
    this.name,
    this.parent,
    this.reference,
    this.verificationPhrase,
    this.version,
  });

  factory PartnerListMatch.fromMap(Map<String, dynamic> m) => PartnerListMatch(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class PartnerCreateData {
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? reference;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  PartnerCreateData({
    this.billingId,
    this.contact,
    this.created,
    this.id,
    this.isActive,
    this.modified,
    this.name,
    this.parent,
    this.reference,
    this.verificationPhrase,
    this.version,
  });

  factory PartnerCreateData.fromMap(Map<String, dynamic> m) => PartnerCreateData(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class Template {
  /// ANY
  dynamic accessMode;
  /// BOOLEAN
  bool? active;
  /// OBJECT
  Map<String, dynamic>? client;
  /// ARRAY
  List<dynamic>? fieldTemplates;
  /// INTEGER
  int? id;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? options;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? type;
  /// INTEGER
  int? version;

  Template({
    this.accessMode,
    this.active,
    this.client,
    this.fieldTemplates,
    this.id,
    this.name,
    this.options,
    this.partner,
    this.reference,
    this.type,
    this.version,
  });

  factory Template.fromMap(Map<String, dynamic> m) => Template(
        accessMode: m['accessMode'],
        active: m['active'] is bool ? m['active'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        fieldTemplates: m['fieldTemplates'] is List<dynamic> ? m['fieldTemplates'] : null,
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        options: m['options'] is Map<String, dynamic> ? m['options'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        type: m['type'] is String ? m['type'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != accessMode) {
      m['accessMode'] = accessMode;
    }
    if (null != active) {
      m['active'] = active;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != fieldTemplates) {
      m['fieldTemplates'] = fieldTemplates;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != options) {
      m['options'] = options;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != type) {
      m['type'] = type;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class TemplateLoadMatch {
  /// STRING (required at the API)
  String? id;

  TemplateLoadMatch({
    this.id,
  });

  factory TemplateLoadMatch.fromMap(Map<String, dynamic> m) => TemplateLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class TemplateListMatch {
  /// ANY
  dynamic accessMode;
  /// BOOLEAN
  bool? active;
  /// OBJECT
  Map<String, dynamic>? client;
  /// ARRAY
  List<dynamic>? fieldTemplates;
  /// INTEGER
  int? id;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? options;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? type;
  /// INTEGER
  int? version;

  TemplateListMatch({
    this.accessMode,
    this.active,
    this.client,
    this.fieldTemplates,
    this.id,
    this.name,
    this.options,
    this.partner,
    this.reference,
    this.type,
    this.version,
  });

  factory TemplateListMatch.fromMap(Map<String, dynamic> m) => TemplateListMatch(
        accessMode: m['accessMode'],
        active: m['active'] is bool ? m['active'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        fieldTemplates: m['fieldTemplates'] is List<dynamic> ? m['fieldTemplates'] : null,
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        options: m['options'] is Map<String, dynamic> ? m['options'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        type: m['type'] is String ? m['type'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != accessMode) {
      m['accessMode'] = accessMode;
    }
    if (null != active) {
      m['active'] = active;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != fieldTemplates) {
      m['fieldTemplates'] = fieldTemplates;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != options) {
      m['options'] = options;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != type) {
      m['type'] = type;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class TemplateCreateData {
  /// ANY
  dynamic accessMode;
  /// BOOLEAN
  bool? active;
  /// OBJECT
  Map<String, dynamic>? client;
  /// ARRAY
  List<dynamic>? fieldTemplates;
  /// INTEGER
  int? id;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? options;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? type;
  /// INTEGER
  int? version;

  TemplateCreateData({
    this.accessMode,
    this.active,
    this.client,
    this.fieldTemplates,
    this.id,
    this.name,
    this.options,
    this.partner,
    this.reference,
    this.type,
    this.version,
  });

  factory TemplateCreateData.fromMap(Map<String, dynamic> m) => TemplateCreateData(
        accessMode: m['accessMode'],
        active: m['active'] is bool ? m['active'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        fieldTemplates: m['fieldTemplates'] is List<dynamic> ? m['fieldTemplates'] : null,
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        options: m['options'] is Map<String, dynamic> ? m['options'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        type: m['type'] is String ? m['type'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != accessMode) {
      m['accessMode'] = accessMode;
    }
    if (null != active) {
      m['active'] = active;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != fieldTemplates) {
      m['fieldTemplates'] = fieldTemplates;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != options) {
      m['options'] = options;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != type) {
      m['type'] = type;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class TemplateRemoveMatch {
  /// STRING (required at the API)
  String? id;

  TemplateRemoveMatch({
    this.id,
  });

  factory TemplateRemoveMatch.fromMap(Map<String, dynamic> m) => TemplateRemoveMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class Transaction {
  /// STRING
  String? bfid;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? completeDate;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// STRING
  String? errCode;
  /// STRING
  String? errMessage;
  /// INTEGER
  int? id;
  /// STRING
  String? ipAddress;
  /// STRING
  String? messageId;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? templateId;

  Transaction({
    this.bfid,
    this.client,
    this.completeDate,
    this.directPartner,
    this.errCode,
    this.errMessage,
    this.id,
    this.ipAddress,
    this.messageId,
    this.partner,
    this.reference,
    this.success,
    this.templateId,
  });

  factory Transaction.fromMap(Map<String, dynamic> m) => Transaction(
        bfid: m['bfid'] is String ? m['bfid'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        completeDate: m['completeDate'] is String ? m['completeDate'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        errCode: m['errCode'] is String ? m['errCode'] : null,
        errMessage: m['errMessage'] is String ? m['errMessage'] : null,
        id: m['id'] is int ? m['id'] : null,
        ipAddress: m['ipAddress'] is String ? m['ipAddress'] : null,
        messageId: m['messageId'] is String ? m['messageId'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        success: m['success'] is bool ? m['success'] : null,
        templateId: m['templateId'] is String ? m['templateId'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != bfid) {
      m['bfid'] = bfid;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != completeDate) {
      m['completeDate'] = completeDate;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != errCode) {
      m['errCode'] = errCode;
    }
    if (null != errMessage) {
      m['errMessage'] = errMessage;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ipAddress) {
      m['ipAddress'] = ipAddress;
    }
    if (null != messageId) {
      m['messageId'] = messageId;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != success) {
      m['success'] = success;
    }
    if (null != templateId) {
      m['templateId'] = templateId;
    }
    return m;
  }
}

class TransactionLoadMatch {
  /// STRING (required at the API)
  String? id;

  TransactionLoadMatch({
    this.id,
  });

  factory TransactionLoadMatch.fromMap(Map<String, dynamic> m) => TransactionLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

class TransactionListMatch {
  /// STRING
  String? bfid;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? completeDate;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// STRING
  String? errCode;
  /// STRING
  String? errMessage;
  /// INTEGER
  int? id;
  /// STRING
  String? ipAddress;
  /// STRING
  String? messageId;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? templateId;

  TransactionListMatch({
    this.bfid,
    this.client,
    this.completeDate,
    this.directPartner,
    this.errCode,
    this.errMessage,
    this.id,
    this.ipAddress,
    this.messageId,
    this.partner,
    this.reference,
    this.success,
    this.templateId,
  });

  factory TransactionListMatch.fromMap(Map<String, dynamic> m) => TransactionListMatch(
        bfid: m['bfid'] is String ? m['bfid'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        completeDate: m['completeDate'] is String ? m['completeDate'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        errCode: m['errCode'] is String ? m['errCode'] : null,
        errMessage: m['errMessage'] is String ? m['errMessage'] : null,
        id: m['id'] is int ? m['id'] : null,
        ipAddress: m['ipAddress'] is String ? m['ipAddress'] : null,
        messageId: m['messageId'] is String ? m['messageId'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        success: m['success'] is bool ? m['success'] : null,
        templateId: m['templateId'] is String ? m['templateId'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != bfid) {
      m['bfid'] = bfid;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != completeDate) {
      m['completeDate'] = completeDate;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != errCode) {
      m['errCode'] = errCode;
    }
    if (null != errMessage) {
      m['errMessage'] = errMessage;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ipAddress) {
      m['ipAddress'] = ipAddress;
    }
    if (null != messageId) {
      m['messageId'] = messageId;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != success) {
      m['success'] = success;
    }
    if (null != templateId) {
      m['templateId'] = templateId;
    }
    return m;
  }
}

class UpdateResult {
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? client;
  /// OBJECT (required at the API)
  Map<String, dynamic>? contact;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// STRING (required at the API)
  String? email;
  /// STRING (required at the API)
  String? firstName;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING (required at the API)
  String? lastName;
  /// STRING
  String? mid;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING (required at the API)
  String? phone;
  /// STRING
  String? reference;
  /// BOOLEAN
  bool? sendWelcomeEmail;
  /// STRING (required at the API)
  String? userName;
  /// OBJECT (required at the API)
  Map<String, dynamic>? userRole;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  UpdateResult({
    this.billingId,
    this.client,
    this.contact,
    this.directPartner,
    this.email,
    this.firstName,
    this.id,
    this.isActive,
    this.lastName,
    this.mid,
    this.name,
    this.parent,
    this.partner,
    this.phone,
    this.reference,
    this.sendWelcomeEmail,
    this.userName,
    this.userRole,
    this.verificationPhrase,
    this.version,
  });

  factory UpdateResult.fromMap(Map<String, dynamic> m) => UpdateResult(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        sendWelcomeEmail: m['sendWelcomeEmail'] is bool ? m['sendWelcomeEmail'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != sendWelcomeEmail) {
      m['sendWelcomeEmail'] = sendWelcomeEmail;
    }
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UpdateResultListMatch {
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? client;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// STRING
  String? email;
  /// STRING
  String? firstName;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? lastName;
  /// STRING
  String? mid;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? reference;
  /// BOOLEAN
  bool? sendWelcomeEmail;
  /// STRING
  String? userName;
  /// OBJECT
  Map<String, dynamic>? userRole;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  UpdateResultListMatch({
    this.billingId,
    this.client,
    this.contact,
    this.directPartner,
    this.email,
    this.firstName,
    this.id,
    this.isActive,
    this.lastName,
    this.mid,
    this.name,
    this.parent,
    this.partner,
    this.phone,
    this.reference,
    this.sendWelcomeEmail,
    this.userName,
    this.userRole,
    this.verificationPhrase,
    this.version,
  });

  factory UpdateResultListMatch.fromMap(Map<String, dynamic> m) => UpdateResultListMatch(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        sendWelcomeEmail: m['sendWelcomeEmail'] is bool ? m['sendWelcomeEmail'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != sendWelcomeEmail) {
      m['sendWelcomeEmail'] = sendWelcomeEmail;
    }
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UpdateResultCreateData {
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? client;
  /// OBJECT (required at the API)
  Map<String, dynamic>? contact;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// STRING (required at the API)
  String? email;
  /// STRING (required at the API)
  String? firstName;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING (required at the API)
  String? lastName;
  /// STRING
  String? mid;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING (required at the API)
  String? phone;
  /// STRING
  String? reference;
  /// BOOLEAN
  bool? sendWelcomeEmail;
  /// STRING (required at the API)
  String? userName;
  /// OBJECT (required at the API)
  Map<String, dynamic>? userRole;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  UpdateResultCreateData({
    this.billingId,
    this.client,
    this.contact,
    this.directPartner,
    this.email,
    this.firstName,
    this.id,
    this.isActive,
    this.lastName,
    this.mid,
    this.name,
    this.parent,
    this.partner,
    this.phone,
    this.reference,
    this.sendWelcomeEmail,
    this.userName,
    this.userRole,
    this.verificationPhrase,
    this.version,
  });

  factory UpdateResultCreateData.fromMap(Map<String, dynamic> m) => UpdateResultCreateData(
        billingId: m['billingId'] is String ? m['billingId'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        sendWelcomeEmail: m['sendWelcomeEmail'] is bool ? m['sendWelcomeEmail'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != sendWelcomeEmail) {
      m['sendWelcomeEmail'] = sendWelcomeEmail;
    }
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UpdateResultUpdateData {
  /// STRING (required at the API)
  String? id;
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? client;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// STRING
  String? email;
  /// STRING
  String? firstName;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? lastName;
  /// STRING
  String? mid;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? reference;
  /// BOOLEAN
  bool? sendWelcomeEmail;
  /// STRING
  String? userName;
  /// OBJECT
  Map<String, dynamic>? userRole;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  UpdateResultUpdateData({
    this.id,
    this.billingId,
    this.client,
    this.contact,
    this.directPartner,
    this.email,
    this.firstName,
    this.isActive,
    this.lastName,
    this.mid,
    this.name,
    this.parent,
    this.partner,
    this.phone,
    this.reference,
    this.sendWelcomeEmail,
    this.userName,
    this.userRole,
    this.verificationPhrase,
    this.version,
  });

  factory UpdateResultUpdateData.fromMap(Map<String, dynamic> m) => UpdateResultUpdateData(
        id: m['id'] is String ? m['id'] : null,
        billingId: m['billingId'] is String ? m['billingId'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        sendWelcomeEmail: m['sendWelcomeEmail'] is bool ? m['sendWelcomeEmail'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent) {
      m['parent'] = parent;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != sendWelcomeEmail) {
      m['sendWelcomeEmail'] = sendWelcomeEmail;
    }
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
    }
    if (null != verificationPhrase) {
      m['verificationPhrase'] = verificationPhrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class User {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// STRING
  String? email;
  /// STRING
  String? firstName;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? lastName;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? userName;
  /// OBJECT
  Map<String, dynamic>? userRole;
  /// INTEGER
  int? version;

  User({
    this.client,
    this.created,
    this.email,
    this.firstName,
    this.id,
    this.isActive,
    this.lastName,
    this.modified,
    this.partner,
    this.phone,
    this.userName,
    this.userRole,
    this.version,
  });

  factory User.fromMap(Map<String, dynamic> m) => User(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        email: m['email'] is String ? m['email'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != firstName) {
      m['firstName'] = firstName;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != isActive) {
      m['isActive'] = isActive;
    }
    if (null != lastName) {
      m['lastName'] = lastName;
    }
    if (null != modified) {
      m['modified'] = modified;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != userName) {
      m['userName'] = userName;
    }
    if (null != userRole) {
      m['userRole'] = userRole;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UserLoadMatch {
  /// STRING (required at the API)
  String? id;

  UserLoadMatch({
    this.id,
  });

  factory UserLoadMatch.fromMap(Map<String, dynamic> m) => UserLoadMatch(
        id: m['id'] is String ? m['id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    return m;
  }
}

