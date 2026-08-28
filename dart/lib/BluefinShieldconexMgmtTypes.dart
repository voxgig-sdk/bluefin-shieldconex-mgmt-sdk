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
  /// STRING (required at the API)
  String? partner;
  /// INTEGER
  int? skip;
  /// INTEGER
  int? take;

  ClientListMatch({
    this.partner,
    this.skip,
    this.take,
  });

  factory ClientListMatch.fromMap(Map<String, dynamic> m) => ClientListMatch(
        partner: m['partner'] is String ? m['partner'] : null,
        skip: m['skip'] is int ? m['skip'] : null,
        take: m['take'] is int ? m['take'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != skip) {
      m['skip'] = skip;
    }
    if (null != take) {
      m['take'] = take;
    }
    return m;
  }
}

class ClientCreateData {
  /// STRING
  String? billing_id;
  /// STRING (required at the API)
  String? contact_email;
  /// STRING (required at the API)
  String? contact_first_name;
  /// BOOLEAN (required at the API)
  bool? contact_is_active;
  /// STRING (required at the API)
  String? contact_last_name;
  /// STRING (required at the API)
  String? contact_phone;
  /// BOOLEAN (required at the API)
  bool? contact_send_welcome_email;
  /// STRING (required at the API)
  String? contact_user_name;
  /// STRING (required at the API)
  String? contact_user_role;
  /// INTEGER (required at the API)
  int? direct_partner_id;
  /// STRING (required at the API)
  String? direct_partner_name;
  /// BOOLEAN (required at the API)
  bool? is_active;
  /// STRING
  String? mid;
  /// STRING (required at the API)
  String? name;
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
  String? modified;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// INTEGER
  int? version;

  ClientCreateData({
    this.billing_id,
    this.contact_email,
    this.contact_first_name,
    this.contact_is_active,
    this.contact_last_name,
    this.contact_phone,
    this.contact_send_welcome_email,
    this.contact_user_name,
    this.contact_user_role,
    this.direct_partner_id,
    this.direct_partner_name,
    this.is_active,
    this.mid,
    this.name,
    this.billingId,
    this.contact,
    this.created,
    this.directPartner,
    this.id,
    this.isActive,
    this.modified,
    this.partner,
    this.version,
  });

  factory ClientCreateData.fromMap(Map<String, dynamic> m) => ClientCreateData(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        contact_email: m['contact_email'] is String ? m['contact_email'] : null,
        contact_first_name: m['contact_first_name'] is String ? m['contact_first_name'] : null,
        contact_is_active: m['contact_is_active'] is bool ? m['contact_is_active'] : null,
        contact_last_name: m['contact_last_name'] is String ? m['contact_last_name'] : null,
        contact_phone: m['contact_phone'] is String ? m['contact_phone'] : null,
        contact_send_welcome_email: m['contact_send_welcome_email'] is bool ? m['contact_send_welcome_email'] : null,
        contact_user_name: m['contact_user_name'] is String ? m['contact_user_name'] : null,
        contact_user_role: m['contact_user_role'] is String ? m['contact_user_role'] : null,
        direct_partner_id: m['direct_partner_id'] is int ? m['direct_partner_id'] : null,
        direct_partner_name: m['direct_partner_name'] is String ? m['direct_partner_name'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        name: m['name'] is String ? m['name'] : null,
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != contact_email) {
      m['contact_email'] = contact_email;
    }
    if (null != contact_first_name) {
      m['contact_first_name'] = contact_first_name;
    }
    if (null != contact_is_active) {
      m['contact_is_active'] = contact_is_active;
    }
    if (null != contact_last_name) {
      m['contact_last_name'] = contact_last_name;
    }
    if (null != contact_phone) {
      m['contact_phone'] = contact_phone;
    }
    if (null != contact_send_welcome_email) {
      m['contact_send_welcome_email'] = contact_send_welcome_email;
    }
    if (null != contact_user_name) {
      m['contact_user_name'] = contact_user_name;
    }
    if (null != contact_user_role) {
      m['contact_user_role'] = contact_user_role;
    }
    if (null != direct_partner_id) {
      m['direct_partner_id'] = direct_partner_id;
    }
    if (null != direct_partner_name) {
      m['direct_partner_name'] = direct_partner_name;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != name) {
      m['name'] = name;
    }
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
    if (null != modified) {
      m['modified'] = modified;
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
  String? partner;
  /// INTEGER
  int? skip;
  /// INTEGER
  int? take;

  PartnerListMatch({
    this.partner,
    this.skip,
    this.take,
  });

  factory PartnerListMatch.fromMap(Map<String, dynamic> m) => PartnerListMatch(
        partner: m['partner'] is String ? m['partner'] : null,
        skip: m['skip'] is int ? m['skip'] : null,
        take: m['take'] is int ? m['take'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != skip) {
      m['skip'] = skip;
    }
    if (null != take) {
      m['take'] = take;
    }
    return m;
  }
}

class PartnerCreateData {
  /// STRING (required at the API)
  String? billing_id;
  /// STRING (required at the API)
  String? contact_email;
  /// STRING (required at the API)
  String? contact_first_name;
  /// BOOLEAN (required at the API)
  bool? contact_is_active;
  /// STRING (required at the API)
  String? contact_last_name;
  /// STRING (required at the API)
  String? contact_phone;
  /// BOOLEAN (required at the API)
  bool? contact_send_welcome_email;
  /// STRING (required at the API)
  String? contact_user_name;
  /// STRING (required at the API)
  String? contact_user_role;
  /// BOOLEAN (required at the API)
  bool? is_active;
  /// STRING (required at the API)
  String? name;
  /// INTEGER
  int? parent_id;
  /// STRING
  String? parent_name;
  /// STRING (required at the API)
  String? reference;
  /// STRING
  String? verification_phrase;
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
  /// OBJECT
  Map<String, dynamic>? parent;
  /// STRING
  String? verificationPhrase;
  /// INTEGER
  int? version;

  PartnerCreateData({
    this.billing_id,
    this.contact_email,
    this.contact_first_name,
    this.contact_is_active,
    this.contact_last_name,
    this.contact_phone,
    this.contact_send_welcome_email,
    this.contact_user_name,
    this.contact_user_role,
    this.is_active,
    this.name,
    this.parent_id,
    this.parent_name,
    this.reference,
    this.verification_phrase,
    this.billingId,
    this.contact,
    this.created,
    this.id,
    this.isActive,
    this.modified,
    this.parent,
    this.verificationPhrase,
    this.version,
  });

  factory PartnerCreateData.fromMap(Map<String, dynamic> m) => PartnerCreateData(
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        contact_email: m['contact_email'] is String ? m['contact_email'] : null,
        contact_first_name: m['contact_first_name'] is String ? m['contact_first_name'] : null,
        contact_is_active: m['contact_is_active'] is bool ? m['contact_is_active'] : null,
        contact_last_name: m['contact_last_name'] is String ? m['contact_last_name'] : null,
        contact_phone: m['contact_phone'] is String ? m['contact_phone'] : null,
        contact_send_welcome_email: m['contact_send_welcome_email'] is bool ? m['contact_send_welcome_email'] : null,
        contact_user_name: m['contact_user_name'] is String ? m['contact_user_name'] : null,
        contact_user_role: m['contact_user_role'] is String ? m['contact_user_role'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent_id: m['parent_id'] is int ? m['parent_id'] : null,
        parent_name: m['parent_name'] is String ? m['parent_name'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        created: m['created'] is String ? m['created'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        modified: m['modified'] is String ? m['modified'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != contact_email) {
      m['contact_email'] = contact_email;
    }
    if (null != contact_first_name) {
      m['contact_first_name'] = contact_first_name;
    }
    if (null != contact_is_active) {
      m['contact_is_active'] = contact_is_active;
    }
    if (null != contact_last_name) {
      m['contact_last_name'] = contact_last_name;
    }
    if (null != contact_phone) {
      m['contact_phone'] = contact_phone;
    }
    if (null != contact_send_welcome_email) {
      m['contact_send_welcome_email'] = contact_send_welcome_email;
    }
    if (null != contact_user_name) {
      m['contact_user_name'] = contact_user_name;
    }
    if (null != contact_user_role) {
      m['contact_user_role'] = contact_user_role;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != parent_id) {
      m['parent_id'] = parent_id;
    }
    if (null != parent_name) {
      m['parent_name'] = parent_name;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
    }
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
    if (null != parent) {
      m['parent'] = parent;
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
  /// STRING
  String? client;
  /// STRING
  String? partner;
  /// INTEGER
  int? skip;
  /// INTEGER
  int? take;

  TemplateListMatch({
    this.client,
    this.partner,
    this.skip,
    this.take,
  });

  factory TemplateListMatch.fromMap(Map<String, dynamic> m) => TemplateListMatch(
        client: m['client'] is String ? m['client'] : null,
        partner: m['partner'] is String ? m['partner'] : null,
        skip: m['skip'] is int ? m['skip'] : null,
        take: m['take'] is int ? m['take'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != skip) {
      m['skip'] = skip;
    }
    if (null != take) {
      m['take'] = take;
    }
    return m;
  }
}

class TemplateCreateData {
  /// STRING
  String? access_mode;
  /// BOOLEAN (required at the API)
  bool? active;
  /// INTEGER (required at the API)
  int? client_id;
  /// STRING (required at the API)
  String? client_name;
  /// ARRAY
  List<dynamic>? field_template;
  /// STRING (required at the API)
  String? name;
  /// STRING
  String? options_custom_style;
  /// STRING
  String? options_custom_style_file;
  /// ARRAY
  List<dynamic>? options_domain;
  /// STRING
  String? options_security_active_from;
  /// STRING
  String? options_security_active_to;
  /// BOOLEAN
  bool? options_security_irreversible;
  /// INTEGER (required at the API)
  int? partner_id;
  /// STRING (required at the API)
  String? partner_name;
  /// STRING (required at the API)
  String? reference;
  /// STRING
  String? type;
  /// INTEGER
  int? version;
  /// ANY
  dynamic accessMode;
  /// OBJECT
  Map<String, dynamic>? client;
  /// ARRAY
  List<dynamic>? fieldTemplates;
  /// INTEGER
  int? id;
  /// OBJECT
  Map<String, dynamic>? options;
  /// OBJECT
  Map<String, dynamic>? partner;

  TemplateCreateData({
    this.access_mode,
    this.active,
    this.client_id,
    this.client_name,
    this.field_template,
    this.name,
    this.options_custom_style,
    this.options_custom_style_file,
    this.options_domain,
    this.options_security_active_from,
    this.options_security_active_to,
    this.options_security_irreversible,
    this.partner_id,
    this.partner_name,
    this.reference,
    this.type,
    this.version,
    this.accessMode,
    this.client,
    this.fieldTemplates,
    this.id,
    this.options,
    this.partner,
  });

  factory TemplateCreateData.fromMap(Map<String, dynamic> m) => TemplateCreateData(
        access_mode: m['access_mode'] is String ? m['access_mode'] : null,
        active: m['active'] is bool ? m['active'] : null,
        client_id: m['client_id'] is int ? m['client_id'] : null,
        client_name: m['client_name'] is String ? m['client_name'] : null,
        field_template: m['field_template'] is List<dynamic> ? m['field_template'] : null,
        name: m['name'] is String ? m['name'] : null,
        options_custom_style: m['options_custom_style'] is String ? m['options_custom_style'] : null,
        options_custom_style_file: m['options_custom_style_file'] is String ? m['options_custom_style_file'] : null,
        options_domain: m['options_domain'] is List<dynamic> ? m['options_domain'] : null,
        options_security_active_from: m['options_security_active_from'] is String ? m['options_security_active_from'] : null,
        options_security_active_to: m['options_security_active_to'] is String ? m['options_security_active_to'] : null,
        options_security_irreversible: m['options_security_irreversible'] is bool ? m['options_security_irreversible'] : null,
        partner_id: m['partner_id'] is int ? m['partner_id'] : null,
        partner_name: m['partner_name'] is String ? m['partner_name'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        type: m['type'] is String ? m['type'] : null,
        version: m['version'] is int ? m['version'] : null,
        accessMode: m['accessMode'],
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        fieldTemplates: m['fieldTemplates'] is List<dynamic> ? m['fieldTemplates'] : null,
        id: m['id'] is int ? m['id'] : null,
        options: m['options'] is Map<String, dynamic> ? m['options'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != access_mode) {
      m['access_mode'] = access_mode;
    }
    if (null != active) {
      m['active'] = active;
    }
    if (null != client_id) {
      m['client_id'] = client_id;
    }
    if (null != client_name) {
      m['client_name'] = client_name;
    }
    if (null != field_template) {
      m['field_template'] = field_template;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != options_custom_style) {
      m['options_custom_style'] = options_custom_style;
    }
    if (null != options_custom_style_file) {
      m['options_custom_style_file'] = options_custom_style_file;
    }
    if (null != options_domain) {
      m['options_domain'] = options_domain;
    }
    if (null != options_security_active_from) {
      m['options_security_active_from'] = options_security_active_from;
    }
    if (null != options_security_active_to) {
      m['options_security_active_to'] = options_security_active_to;
    }
    if (null != options_security_irreversible) {
      m['options_security_irreversible'] = options_security_irreversible;
    }
    if (null != partner_id) {
      m['partner_id'] = partner_id;
    }
    if (null != partner_name) {
      m['partner_name'] = partner_name;
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
    if (null != accessMode) {
      m['accessMode'] = accessMode;
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
    if (null != options) {
      m['options'] = options;
    }
    if (null != partner) {
      m['partner'] = partner;
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
  /// STRING
  String? transaction_type;

  TransactionLoadMatch({
    this.id,
    this.transaction_type,
  });

  factory TransactionLoadMatch.fromMap(Map<String, dynamic> m) => TransactionLoadMatch(
        id: m['id'] is String ? m['id'] : null,
        transaction_type: m['transaction_type'] is String ? m['transaction_type'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != transaction_type) {
      m['transaction_type'] = transaction_type;
    }
    return m;
  }
}

class TransactionListMatch {
  /// STRING
  String? client;
  /// STRING
  String? date_from;
  /// STRING
  String? date_to;
  /// STRING
  String? message_id;
  /// STRING
  String? paging_mode;
  /// STRING
  String? partner;
  /// STRING
  String? reference;
  /// INTEGER
  int? skip;
  /// BOOLEAN
  bool? success;
  /// INTEGER
  int? take;
  /// STRING
  String? transaction_type;

  TransactionListMatch({
    this.client,
    this.date_from,
    this.date_to,
    this.message_id,
    this.paging_mode,
    this.partner,
    this.reference,
    this.skip,
    this.success,
    this.take,
    this.transaction_type,
  });

  factory TransactionListMatch.fromMap(Map<String, dynamic> m) => TransactionListMatch(
        client: m['client'] is String ? m['client'] : null,
        date_from: m['date_from'] is String ? m['date_from'] : null,
        date_to: m['date_to'] is String ? m['date_to'] : null,
        message_id: m['message_id'] is String ? m['message_id'] : null,
        paging_mode: m['paging_mode'] is String ? m['paging_mode'] : null,
        partner: m['partner'] is String ? m['partner'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        skip: m['skip'] is int ? m['skip'] : null,
        success: m['success'] is bool ? m['success'] : null,
        take: m['take'] is int ? m['take'] : null,
        transaction_type: m['transaction_type'] is String ? m['transaction_type'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != date_from) {
      m['date_from'] = date_from;
    }
    if (null != date_to) {
      m['date_to'] = date_to;
    }
    if (null != message_id) {
      m['message_id'] = message_id;
    }
    if (null != paging_mode) {
      m['paging_mode'] = paging_mode;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != reference) {
      m['reference'] = reference;
    }
    if (null != skip) {
      m['skip'] = skip;
    }
    if (null != success) {
      m['success'] = success;
    }
    if (null != take) {
      m['take'] = take;
    }
    if (null != transaction_type) {
      m['transaction_type'] = transaction_type;
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
  String? client;
  /// STRING
  String? partner;
  /// INTEGER
  int? skip;
  /// INTEGER
  int? take;

  UpdateResultListMatch({
    this.client,
    this.partner,
    this.skip,
    this.take,
  });

  factory UpdateResultListMatch.fromMap(Map<String, dynamic> m) => UpdateResultListMatch(
        client: m['client'] is String ? m['client'] : null,
        partner: m['partner'] is String ? m['partner'] : null,
        skip: m['skip'] is int ? m['skip'] : null,
        take: m['take'] is int ? m['take'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != skip) {
      m['skip'] = skip;
    }
    if (null != take) {
      m['take'] = take;
    }
    return m;
  }
}

class UpdateResultCreateData {
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING (required at the API)
  String? email;
  /// STRING (required at the API)
  String? first_name;
  /// BOOLEAN (required at the API)
  bool? is_active;
  /// STRING (required at the API)
  String? last_name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// INTEGER (required at the API)
  int? phone;
  /// BOOLEAN (required at the API)
  bool? send_welcome_email;
  /// OBJECT (required at the API)
  Map<String, dynamic>? user_role;
  /// STRING (required at the API)
  String? username;
  /// STRING
  String? billingId;
  /// OBJECT (required at the API)
  Map<String, dynamic>? contact;
  /// OBJECT
  Map<String, dynamic>? directPartner;
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
    this.client,
    this.email,
    this.first_name,
    this.is_active,
    this.last_name,
    this.partner,
    this.phone,
    this.send_welcome_email,
    this.user_role,
    this.username,
    this.billingId,
    this.contact,
    this.directPartner,
    this.firstName,
    this.id,
    this.isActive,
    this.lastName,
    this.mid,
    this.name,
    this.parent,
    this.reference,
    this.sendWelcomeEmail,
    this.userName,
    this.userRole,
    this.verificationPhrase,
    this.version,
  });

  factory UpdateResultCreateData.fromMap(Map<String, dynamic> m) => UpdateResultCreateData(
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is int ? m['phone'] : null,
        send_welcome_email: m['send_welcome_email'] is bool ? m['send_welcome_email'] : null,
        user_role: m['user_role'] is Map<String, dynamic> ? m['user_role'] : null,
        username: m['username'] is String ? m['username'] : null,
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        id: m['id'] is int ? m['id'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        name: m['name'] is String ? m['name'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        sendWelcomeEmail: m['sendWelcomeEmail'] is bool ? m['sendWelcomeEmail'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
        version: m['version'] is int ? m['version'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != client) {
      m['client'] = client;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != send_welcome_email) {
      m['send_welcome_email'] = send_welcome_email;
    }
    if (null != user_role) {
      m['user_role'] = user_role;
    }
    if (null != username) {
      m['username'] = username;
    }
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
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
  String? access_mode;
  /// BOOLEAN
  bool? active;
  /// INTEGER
  int? client_id;
  /// STRING
  String? client_name;
  /// ARRAY
  List<dynamic>? field_template;
  /// STRING
  String? name;
  /// STRING
  String? options_custom_style;
  /// STRING
  String? options_custom_style_file;
  /// ARRAY
  List<dynamic>? options_domain;
  /// STRING
  String? options_security_active_from;
  /// STRING
  String? options_security_active_to;
  /// BOOLEAN
  bool? options_security_irreversible;
  /// INTEGER
  int? partner_id;
  /// STRING
  String? partner_name;
  /// STRING
  String? reference;
  /// STRING
  String? type;
  /// INTEGER
  int? version;
  /// STRING
  String? billing_id;
  /// INTEGER
  int? contact_id;
  /// BOOLEAN
  bool? is_active;
  /// INTEGER
  int? parent_id;
  /// STRING
  String? parent_name;
  /// STRING
  String? verification_phrase;
  /// OBJECT
  Map<String, dynamic>? client;
  /// STRING
  String? email;
  /// STRING
  String? first_name;
  /// STRING
  String? last_name;
  /// OBJECT
  Map<String, dynamic>? partner;
  /// INTEGER
  int? phone;
  /// BOOLEAN
  bool? send_welcome_email;
  /// STRING
  String? username;
  /// INTEGER
  int? direct_partner_id;
  /// STRING
  String? direct_partner_name;
  /// STRING
  String? mid;
  /// STRING
  String? billingId;
  /// OBJECT
  Map<String, dynamic>? contact;
  /// OBJECT
  Map<String, dynamic>? directPartner;
  /// STRING
  String? firstName;
  /// BOOLEAN
  bool? isActive;
  /// STRING
  String? lastName;
  /// OBJECT
  Map<String, dynamic>? parent;
  /// BOOLEAN
  bool? sendWelcomeEmail;
  /// STRING
  String? userName;
  /// OBJECT
  Map<String, dynamic>? userRole;
  /// STRING
  String? verificationPhrase;

  UpdateResultUpdateData({
    this.id,
    this.access_mode,
    this.active,
    this.client_id,
    this.client_name,
    this.field_template,
    this.name,
    this.options_custom_style,
    this.options_custom_style_file,
    this.options_domain,
    this.options_security_active_from,
    this.options_security_active_to,
    this.options_security_irreversible,
    this.partner_id,
    this.partner_name,
    this.reference,
    this.type,
    this.version,
    this.billing_id,
    this.contact_id,
    this.is_active,
    this.parent_id,
    this.parent_name,
    this.verification_phrase,
    this.client,
    this.email,
    this.first_name,
    this.last_name,
    this.partner,
    this.phone,
    this.send_welcome_email,
    this.username,
    this.direct_partner_id,
    this.direct_partner_name,
    this.mid,
    this.billingId,
    this.contact,
    this.directPartner,
    this.firstName,
    this.isActive,
    this.lastName,
    this.parent,
    this.sendWelcomeEmail,
    this.userName,
    this.userRole,
    this.verificationPhrase,
  });

  factory UpdateResultUpdateData.fromMap(Map<String, dynamic> m) => UpdateResultUpdateData(
        id: m['id'] is String ? m['id'] : null,
        access_mode: m['access_mode'] is String ? m['access_mode'] : null,
        active: m['active'] is bool ? m['active'] : null,
        client_id: m['client_id'] is int ? m['client_id'] : null,
        client_name: m['client_name'] is String ? m['client_name'] : null,
        field_template: m['field_template'] is List<dynamic> ? m['field_template'] : null,
        name: m['name'] is String ? m['name'] : null,
        options_custom_style: m['options_custom_style'] is String ? m['options_custom_style'] : null,
        options_custom_style_file: m['options_custom_style_file'] is String ? m['options_custom_style_file'] : null,
        options_domain: m['options_domain'] is List<dynamic> ? m['options_domain'] : null,
        options_security_active_from: m['options_security_active_from'] is String ? m['options_security_active_from'] : null,
        options_security_active_to: m['options_security_active_to'] is String ? m['options_security_active_to'] : null,
        options_security_irreversible: m['options_security_irreversible'] is bool ? m['options_security_irreversible'] : null,
        partner_id: m['partner_id'] is int ? m['partner_id'] : null,
        partner_name: m['partner_name'] is String ? m['partner_name'] : null,
        reference: m['reference'] is String ? m['reference'] : null,
        type: m['type'] is String ? m['type'] : null,
        version: m['version'] is int ? m['version'] : null,
        billing_id: m['billing_id'] is String ? m['billing_id'] : null,
        contact_id: m['contact_id'] is int ? m['contact_id'] : null,
        is_active: m['is_active'] is bool ? m['is_active'] : null,
        parent_id: m['parent_id'] is int ? m['parent_id'] : null,
        parent_name: m['parent_name'] is String ? m['parent_name'] : null,
        verification_phrase: m['verification_phrase'] is String ? m['verification_phrase'] : null,
        client: m['client'] is Map<String, dynamic> ? m['client'] : null,
        email: m['email'] is String ? m['email'] : null,
        first_name: m['first_name'] is String ? m['first_name'] : null,
        last_name: m['last_name'] is String ? m['last_name'] : null,
        partner: m['partner'] is Map<String, dynamic> ? m['partner'] : null,
        phone: m['phone'] is int ? m['phone'] : null,
        send_welcome_email: m['send_welcome_email'] is bool ? m['send_welcome_email'] : null,
        username: m['username'] is String ? m['username'] : null,
        direct_partner_id: m['direct_partner_id'] is int ? m['direct_partner_id'] : null,
        direct_partner_name: m['direct_partner_name'] is String ? m['direct_partner_name'] : null,
        mid: m['mid'] is String ? m['mid'] : null,
        billingId: m['billingId'] is String ? m['billingId'] : null,
        contact: m['contact'] is Map<String, dynamic> ? m['contact'] : null,
        directPartner: m['directPartner'] is Map<String, dynamic> ? m['directPartner'] : null,
        firstName: m['firstName'] is String ? m['firstName'] : null,
        isActive: m['isActive'] is bool ? m['isActive'] : null,
        lastName: m['lastName'] is String ? m['lastName'] : null,
        parent: m['parent'] is Map<String, dynamic> ? m['parent'] : null,
        sendWelcomeEmail: m['sendWelcomeEmail'] is bool ? m['sendWelcomeEmail'] : null,
        userName: m['userName'] is String ? m['userName'] : null,
        userRole: m['userRole'] is Map<String, dynamic> ? m['userRole'] : null,
        verificationPhrase: m['verificationPhrase'] is String ? m['verificationPhrase'] : null,
      );

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{};
    if (null != id) {
      m['id'] = id;
    }
    if (null != access_mode) {
      m['access_mode'] = access_mode;
    }
    if (null != active) {
      m['active'] = active;
    }
    if (null != client_id) {
      m['client_id'] = client_id;
    }
    if (null != client_name) {
      m['client_name'] = client_name;
    }
    if (null != field_template) {
      m['field_template'] = field_template;
    }
    if (null != name) {
      m['name'] = name;
    }
    if (null != options_custom_style) {
      m['options_custom_style'] = options_custom_style;
    }
    if (null != options_custom_style_file) {
      m['options_custom_style_file'] = options_custom_style_file;
    }
    if (null != options_domain) {
      m['options_domain'] = options_domain;
    }
    if (null != options_security_active_from) {
      m['options_security_active_from'] = options_security_active_from;
    }
    if (null != options_security_active_to) {
      m['options_security_active_to'] = options_security_active_to;
    }
    if (null != options_security_irreversible) {
      m['options_security_irreversible'] = options_security_irreversible;
    }
    if (null != partner_id) {
      m['partner_id'] = partner_id;
    }
    if (null != partner_name) {
      m['partner_name'] = partner_name;
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
    if (null != billing_id) {
      m['billing_id'] = billing_id;
    }
    if (null != contact_id) {
      m['contact_id'] = contact_id;
    }
    if (null != is_active) {
      m['is_active'] = is_active;
    }
    if (null != parent_id) {
      m['parent_id'] = parent_id;
    }
    if (null != parent_name) {
      m['parent_name'] = parent_name;
    }
    if (null != verification_phrase) {
      m['verification_phrase'] = verification_phrase;
    }
    if (null != client) {
      m['client'] = client;
    }
    if (null != email) {
      m['email'] = email;
    }
    if (null != first_name) {
      m['first_name'] = first_name;
    }
    if (null != last_name) {
      m['last_name'] = last_name;
    }
    if (null != partner) {
      m['partner'] = partner;
    }
    if (null != phone) {
      m['phone'] = phone;
    }
    if (null != send_welcome_email) {
      m['send_welcome_email'] = send_welcome_email;
    }
    if (null != username) {
      m['username'] = username;
    }
    if (null != direct_partner_id) {
      m['direct_partner_id'] = direct_partner_id;
    }
    if (null != direct_partner_name) {
      m['direct_partner_name'] = direct_partner_name;
    }
    if (null != mid) {
      m['mid'] = mid;
    }
    if (null != billingId) {
      m['billingId'] = billingId;
    }
    if (null != contact) {
      m['contact'] = contact;
    }
    if (null != directPartner) {
      m['directPartner'] = directPartner;
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
    if (null != parent) {
      m['parent'] = parent;
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

