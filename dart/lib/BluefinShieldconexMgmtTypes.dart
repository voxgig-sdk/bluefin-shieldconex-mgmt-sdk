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
  String? billing_id;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
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
    this.billing_id,
    this.contact,
    this.created,
    this.direct_partner,
    this.id,
    this.is_active,
    this.mid,
    this.modified,
    this.name,
    this.partner,
    this.version,
  });

  factory Client.fromMap(Map<String, dynamic> m) => Client(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
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
  String? billing_id;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
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
    this.billing_id,
    this.contact,
    this.created,
    this.direct_partner,
    this.id,
    this.is_active,
    this.mid,
    this.modified,
    this.name,
    this.partner,
    this.version,
  });

  factory ClientListMatch.fromMap(Map<String, dynamic> m) => ClientListMatch(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
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
  String? billing_id;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
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
    this.billing_id,
    this.contact,
    this.created,
    this.direct_partner,
    this.id,
    this.is_active,
    this.mid,
    this.modified,
    this.name,
    this.partner,
    this.version,
  });

  factory ClientCreateData.fromMap(Map<String, dynamic> m) => ClientCreateData(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != created) {
      m['created'] = created;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
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

  CloneCreateData({
    this.template_id,
  });

  factory CloneCreateData.fromMap(Map<String, dynamic> m) => CloneCreateData(
        template_id: m['template_id'] is String ? m['template_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != template_id) {
      m['template_id'] = template_id;
    }
    return m;
  }
}

class Partner {
  /// STRING
  String? billing_id;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? reference;
  /// STRING
  String? verification_phrase;
  /// INTEGER
  int? version;

  Partner({
    this.billing_id,
    this.contact,
    this.created,
    this.id,
    this.is_active,
    this.modified,
    this.name,
    this.parent,
    this.reference,
    this.verification_phrase,
    this.version,
  });

  factory Partner.fromMap(Map<String, dynamic> m) => Partner(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
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
    if (null != is_active) {
      m['is_active'] = is_active;
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
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
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
  String? billing_id;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? reference;
  /// STRING
  String? verification_phrase;
  /// INTEGER
  int? version;

  PartnerListMatch({
    this.billing_id,
    this.contact,
    this.created,
    this.id,
    this.is_active,
    this.modified,
    this.name,
    this.parent,
    this.reference,
    this.verification_phrase,
    this.version,
  });

  factory PartnerListMatch.fromMap(Map<String, dynamic> m) => PartnerListMatch(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
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
    if (null != is_active) {
      m['is_active'] = is_active;
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
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class PartnerCreateData {
  /// STRING
  String? billing_id;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// STRING
  String? created;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING
  String? modified;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? reference;
  /// STRING
  String? verification_phrase;
  /// INTEGER
  int? version;

  PartnerCreateData({
    this.billing_id,
    this.contact,
    this.created,
    this.id,
    this.is_active,
    this.modified,
    this.name,
    this.parent,
    this.reference,
    this.verification_phrase,
    this.version,
  });

  factory PartnerCreateData.fromMap(Map<String, dynamic> m) => PartnerCreateData(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
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
    if (null != is_active) {
      m['is_active'] = is_active;
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
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class Template {
  /// ANY
  dynamic access_mode;
  /// BOOLEAN
  bool? active;
  /// OBJECT
  Map<String, dynamic>? client;
  /// ARRAY
  List<dynamic>? field_template;
  /// INTEGER
  int? id;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? option;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? type;
  /// INTEGER
  int? version;

  Template({
    this.access_mode,
    this.active,
    this.client,
    this.field_template,
    this.id,
    this.name,
    this.option,
    this.partner,
    this.reference,
    this.type,
    this.version,
  });

  factory Template.fromMap(Map<String, dynamic> m) => Template(
        access_mode: m['access_mode'],
        active: m['active'] is bool ? m['active'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        field_template: m['field_template'] is List<dynamic> ? m['field_template'] : null,
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        option: m['option'] is Map<String, dynamic> ? m['option'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        type: m['type'] is String ? m['type'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != access_mode) {
      m['access_mode'] = access_mode;
    }
    if (null != active) {
      m['active'] = active;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != field_template) {
      m['field_template'] = field_template;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != option) {
      m['option'] = option;
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
  dynamic access_mode;
  /// BOOLEAN
  bool? active;
  /// OBJECT
  Map<String, dynamic>? client;
  /// ARRAY
  List<dynamic>? field_template;
  /// INTEGER
  int? id;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? option;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? type;
  /// INTEGER
  int? version;

  TemplateListMatch({
    this.access_mode,
    this.active,
    this.client,
    this.field_template,
    this.id,
    this.name,
    this.option,
    this.partner,
    this.reference,
    this.type,
    this.version,
  });

  factory TemplateListMatch.fromMap(Map<String, dynamic> m) => TemplateListMatch(
        access_mode: m['access_mode'],
        active: m['active'] is bool ? m['active'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        field_template: m['field_template'] is List<dynamic> ? m['field_template'] : null,
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        option: m['option'] is Map<String, dynamic> ? m['option'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        type: m['type'] is String ? m['type'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != access_mode) {
      m['access_mode'] = access_mode;
    }
    if (null != active) {
      m['active'] = active;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != field_template) {
      m['field_template'] = field_template;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != option) {
      m['option'] = option;
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
  dynamic access_mode;
  /// BOOLEAN
  bool? active;
  /// OBJECT
  Map<String, dynamic>? client;
  /// ARRAY
  List<dynamic>? field_template;
  /// INTEGER
  int? id;
  /// STRING
  String? name;
  /// OBJECT
  Map<String, dynamic>? option;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// STRING
  String? type;
  /// INTEGER
  int? version;

  TemplateCreateData({
    this.access_mode,
    this.active,
    this.client,
    this.field_template,
    this.id,
    this.name,
    this.option,
    this.partner,
    this.reference,
    this.type,
    this.version,
  });

  factory TemplateCreateData.fromMap(Map<String, dynamic> m) => TemplateCreateData(
        access_mode: m['access_mode'],
        active: m['active'] is bool ? m['active'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        field_template: m['field_template'] is List<dynamic> ? m['field_template'] : null,
        id: m['id'] is int ? m['id'] : null,
        name: m['name'] is String ? m['name'] : null,
        option: m['option'] is Map<String, dynamic> ? m['option'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        type: m['type'] is String ? m['type'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != access_mode) {
      m['access_mode'] = access_mode;
    }
    if (null != active) {
      m['active'] = active;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != field_template) {
      m['field_template'] = field_template;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != option) {
      m['option'] = option;
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
  String? complete_date;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// STRING
  String? err_code;
  /// STRING
  String? err_message;
  /// INTEGER
  int? id;
  /// STRING
  String? ip_address;
  /// STRING
  String? message_id;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? template_id;

  Transaction({
    this.bfid,
    this.client,
    this.complete_date,
    this.direct_partner,
    this.err_code,
    this.err_message,
    this.id,
    this.ip_address,
    this.message_id,
    this.partner,
    this.reference,
    this.success,
    this.template_id,
  });

  factory Transaction.fromMap(Map<String, dynamic> m) => Transaction(
        bfid: m['bfid'] is String ? m['bfid'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        complete_date: m['complete_date'] is String ? m['complete_date'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        err_code: m['err_code'] is String ? m['err_code'] : null,
        err_message: m['err_message'] is String ? m['err_message'] : null,
        id: m['id'] is int ? m['id'] : null,
        ip_address: m['ip_address'] is String ? m['ip_address'] : null,
        message_id: m['message_id'] is String ? m['message_id'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        success: m['success'] is bool ? m['success'] : null,
        template_id: m['template_id'] is String ? m['template_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != bfid) {
      m['bfid'] = bfid;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != complete_date) {
      m['complete_date'] = complete_date;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != err_code) {
      m['err_code'] = err_code;
    }
    if (null != err_message) {
      m['err_message'] = err_message;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ip_address) {
      m['ip_address'] = ip_address;
    }
    if (null != message_id) {
      m['message_id'] = message_id;
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
    if (null != template_id) {
      m['template_id'] = template_id;
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
  String? complete_date;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// STRING
  String? err_code;
  /// STRING
  String? err_message;
  /// INTEGER
  int? id;
  /// STRING
  String? ip_address;
  /// STRING
  String? message_id;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? reference;
  /// BOOLEAN
  bool? success;
  /// STRING
  String? template_id;

  TransactionListMatch({
    this.bfid,
    this.client,
    this.complete_date,
    this.direct_partner,
    this.err_code,
    this.err_message,
    this.id,
    this.ip_address,
    this.message_id,
    this.partner,
    this.reference,
    this.success,
    this.template_id,
  });

  factory TransactionListMatch.fromMap(Map<String, dynamic> m) => TransactionListMatch(
        bfid: m['bfid'] is String ? m['bfid'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        complete_date: m['complete_date'] is String ? m['complete_date'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        err_code: m['err_code'] is String ? m['err_code'] : null,
        err_message: m['err_message'] is String ? m['err_message'] : null,
        id: m['id'] is int ? m['id'] : null,
        ip_address: m['ip_address'] is String ? m['ip_address'] : null,
        message_id: m['message_id'] is String ? m['message_id'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        success: m['success'] is bool ? m['success'] : null,
        template_id: m['template_id'] is String ? m['template_id'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != bfid) {
      m['bfid'] = bfid;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != complete_date) {
      m['complete_date'] = complete_date;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != err_code) {
      m['err_code'] = err_code;
    }
    if (null != err_message) {
      m['err_message'] = err_message;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != ip_address) {
      m['ip_address'] = ip_address;
    }
    if (null != message_id) {
      m['message_id'] = message_id;
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
    if (null != template_id) {
      m['template_id'] = template_id;
    }
    return m;
  }
}

class UpdateResult {
  /// STRING
  String? billing_id;
  /// OBJECT
  Map<String, dynamic>? client;
  /// OBJECT (required at the API)
  Map<String, dynamic>? contact;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// STRING (required at the API)
  String? email;
  /// STRING (required at the API)
  String? first_name;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING (required at the API)
  String? last_name;
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
  bool? send_welcome_email;
  /// STRING (required at the API)
  String? user_name;
  /// OBJECT (required at the API)
  Map<String, dynamic>? user_role;
  /// STRING
  String? verification_phrase;
  /// INTEGER
  int? version;

  UpdateResult({
    this.billing_id,
    this.client,
    this.contact,
    this.direct_partner,
    this.email,
    this.first_name,
    this.id,
    this.is_active,
    this.last_name,
    this.mid,
    this.name,
    this.parent,
    this.partner,
    this.phone,
    this.reference,
    this.send_welcome_email,
    this.user_name,
    this.user_role,
    this.verification_phrase,
    this.version,
  });

  factory UpdateResult.fromMap(Map<String, dynamic> m) => UpdateResult(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        send_welcome_email: m['send_welcome_email'] is bool ? m['send_welcome_email'] : null,
        user_name: m['user_name'] is String ? m['user_name'] : null,
        user_role: m['user_role'] is Map<String, dynamic> ? m['user_role'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
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
    if (null != send_welcome_email) {
      m['send_welcome_email'] = send_welcome_email;
    }
    if (null != user_name) {
      m['user_name'] = user_name;
    }
    if (null != user_role) {
      m['user_role'] = user_role;
    }
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UpdateResultListMatch {
  /// STRING
  String? billing_id;
  /// OBJECT
  Map<String, dynamic>? client;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// STRING
  String? email;
  /// STRING
  String? first_name;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING
  String? last_name;
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
  bool? send_welcome_email;
  /// STRING
  String? user_name;
  /// OBJECT
  Map<String, dynamic>? user_role;
  /// STRING
  String? verification_phrase;
  /// INTEGER
  int? version;

  UpdateResultListMatch({
    this.billing_id,
    this.client,
    this.contact,
    this.direct_partner,
    this.email,
    this.first_name,
    this.id,
    this.is_active,
    this.last_name,
    this.mid,
    this.name,
    this.parent,
    this.partner,
    this.phone,
    this.reference,
    this.send_welcome_email,
    this.user_name,
    this.user_role,
    this.verification_phrase,
    this.version,
  });

  factory UpdateResultListMatch.fromMap(Map<String, dynamic> m) => UpdateResultListMatch(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        send_welcome_email: m['send_welcome_email'] is bool ? m['send_welcome_email'] : null,
        user_name: m['user_name'] is String ? m['user_name'] : null,
        user_role: m['user_role'] is Map<String, dynamic> ? m['user_role'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
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
    if (null != send_welcome_email) {
      m['send_welcome_email'] = send_welcome_email;
    }
    if (null != user_name) {
      m['user_name'] = user_name;
    }
    if (null != user_role) {
      m['user_role'] = user_role;
    }
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
    }
    if (null != version) {
      m['version'] = version;
    }
    return m;
  }
}

class UpdateResultCreateData {
  /// STRING
  String? billing_id;
  /// OBJECT
  Map<String, dynamic>? client;
  /// OBJECT (required at the API)
  Map<String, dynamic>? contact;
  /// OBJECT
  Map<String, dynamic>? direct_partner;
  /// STRING (required at the API)
  String? email;
  /// STRING (required at the API)
  String? first_name;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING (required at the API)
  String? last_name;
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
  bool? send_welcome_email;
  /// STRING (required at the API)
  String? user_name;
  /// OBJECT (required at the API)
  Map<String, dynamic>? user_role;
  /// STRING
  String? verification_phrase;
  /// INTEGER
  int? version;

  UpdateResultCreateData({
    this.billing_id,
    this.client,
    this.contact,
    this.direct_partner,
    this.email,
    this.first_name,
    this.id,
    this.is_active,
    this.last_name,
    this.mid,
    this.name,
    this.parent,
    this.partner,
    this.phone,
    this.reference,
    this.send_welcome_email,
    this.user_name,
    this.user_role,
    this.verification_phrase,
    this.version,
  });

  factory UpdateResultCreateData.fromMap(Map<String, dynamic> m) => UpdateResultCreateData(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        direct_partner: m['direct_partner'] is Map<String, dynamic> ? m['direct_partner'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        send_welcome_email: m['send_welcome_email'] is bool ? m['send_welcome_email'] : null,
        user_name: m['user_name'] is String ? m['user_name'] : null,
        user_role: m['user_role'] is Map<String, dynamic> ? m['user_role'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != direct_partner) {
      m['direct_partner'] = direct_partner;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
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
    if (null != send_welcome_email) {
      m['send_welcome_email'] = send_welcome_email;
    }
    if (null != user_name) {
      m['user_name'] = user_name;
    }
    if (null != user_role) {
      m['user_role'] = user_role;
    }
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
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

  UpdateResultUpdateData({
    this.id,
  });

  factory UpdateResultUpdateData.fromMap(Map<String, dynamic> m) => UpdateResultUpdateData(
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

class User {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? created;
  /// STRING
  String? email;
  /// STRING
  String? first_name;
  /// INTEGER
  int? id;
  /// BOOLEAN
  bool? is_active;
  /// STRING
  String? last_name;
  /// STRING
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// STRING
  String? phone;
  /// STRING
  String? user_name;
  /// OBJECT
  Map<String, dynamic>? user_role;
  /// INTEGER
  int? version;

  User({
    this.client,
    this.created,
    this.email,
    this.first_name,
    this.id,
    this.is_active,
    this.last_name,
    this.modified,
    this.partner,
    this.phone,
    this.user_name,
    this.user_role,
    this.version,
  });

  factory User.fromMap(Map<String, dynamic> m) => User(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        created: m['created'] is String ? m['created'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        id: m['id'] is int ? m['id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is String ? m['phone'] : null,
        user_name: m['user_name'] is String ? m['user_name'] : null,
        user_role: m['user_role'] is Map<String, dynamic> ? m['user_role'] : null,
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
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != id) {
      m['id'] = id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
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
    if (null != user_name) {
      m['user_name'] = user_name;
    }
    if (null != user_role) {
      m['user_role'] = user_role;
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

