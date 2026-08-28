// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return
// `voxgig_value*`), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support. This header is standalone
// and is not #included by any generated .c.

#ifndef BLUEFINSHIELDCONEXMGMT_ENTITY_TYPES_H
#define BLUEFINSHIELDCONEXMGMT_ENTITY_TYPES_H

#include "sdk.h"

// Client is the typed data model for the client entity.
typedef struct {
  char*billingid;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  voxgig_value*directpartner;  // optional
  int64_t id;  // optional
  bool isactive;  // optional
  char*mid;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*partner;  // optional
  int64_t version;  // optional
} Client;

// ClientLoadMatch is the typed request payload for Client.load.
typedef struct {
  char*id;
} ClientLoadMatch;

// ClientListMatch is the typed request payload for Client.list.
typedef struct {
  char*partner;
  int64_t skip;  // optional
  int64_t take;  // optional
} ClientListMatch;

// ClientCreateData is the typed request payload for Client.create.
typedef struct {
  char*billing_id;  // optional
  char*contact_email;
  char*contact_first_name;
  bool contact_is_active;
  char*contact_last_name;
  char*contact_phone;
  bool contact_send_welcome_email;
  char*contact_user_name;
  char*contact_user_role;
  int64_t direct_partner_id;
  char*direct_partner_name;
  bool is_active;
  char*mid;  // optional
  char*name;
  char*billingid;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  voxgig_value*directpartner;  // optional
  int64_t id;  // optional
  bool isactive;  // optional
  char*modified;  // optional
  voxgig_value*partner;  // optional
  int64_t version;  // optional
} ClientCreateData;

// ClientRemoveMatch is the typed request payload for Client.remove.
typedef struct {
  char*id;
} ClientRemoveMatch;

// Clone is the typed data model for the clone entity.
typedef struct {
  int64_t id;  // optional
  char*name;  // optional
} Clone;

// CloneCreateData is the typed request payload for Clone.create.
typedef struct {
  char*template_id;
  int64_t id;  // optional
  char*name;  // optional
} CloneCreateData;

// Partner is the typed data model for the partner entity.
typedef struct {
  char*billingid;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  int64_t id;  // optional
  bool isactive;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  char*reference;  // optional
  char*verificationphrase;  // optional
  int64_t version;  // optional
} Partner;

// PartnerLoadMatch is the typed request payload for Partner.load.
typedef struct {
  char*id;
} PartnerLoadMatch;

// PartnerListMatch is the typed request payload for Partner.list.
typedef struct {
  char*partner;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
} PartnerListMatch;

// PartnerCreateData is the typed request payload for Partner.create.
typedef struct {
  char*billing_id;
  char*contact_email;
  char*contact_first_name;
  bool contact_is_active;
  char*contact_last_name;
  char*contact_phone;
  bool contact_send_welcome_email;
  char*contact_user_name;
  char*contact_user_role;
  bool is_active;
  char*name;
  int64_t parent_id;  // optional
  char*parent_name;  // optional
  char*reference;
  char*verification_phrase;  // optional
  char*billingid;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  int64_t id;  // optional
  bool isactive;  // optional
  char*modified;  // optional
  voxgig_value*parent;  // optional
  char*verificationphrase;  // optional
  int64_t version;  // optional
} PartnerCreateData;

// Template is the typed data model for the template entity.
typedef struct {
  voxgig_value*accessmode;  // optional
  bool active;  // optional
  voxgig_value*client;  // optional
  voxgig_value*fieldtemplates;  // optional
  int64_t id;  // optional
  char*name;  // optional
  voxgig_value*options;  // optional
  voxgig_value*partner;  // optional
  char*reference;  // optional
  char*type;  // optional
  int64_t version;  // optional
} Template;

// TemplateLoadMatch is the typed request payload for Template.load.
typedef struct {
  char*id;
} TemplateLoadMatch;

// TemplateListMatch is the typed request payload for Template.list.
typedef struct {
  char*client;  // optional
  char*partner;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
} TemplateListMatch;

// TemplateCreateData is the typed request payload for Template.create.
typedef struct {
  char*access_mode;  // optional
  bool active;
  int64_t client_id;
  char*client_name;
  voxgig_value*field_template;  // optional
  char*name;
  char*options_custom_style;  // optional
  char*options_custom_style_file;  // optional
  voxgig_value*options_domain;  // optional
  char*options_security_active_from;  // optional
  char*options_security_active_to;  // optional
  bool options_security_irreversible;  // optional
  int64_t partner_id;
  char*partner_name;
  char*reference;
  char*type;  // optional
  int64_t version;  // optional
  voxgig_value*accessmode;  // optional
  voxgig_value*client;  // optional
  voxgig_value*fieldtemplates;  // optional
  int64_t id;  // optional
  voxgig_value*options;  // optional
  voxgig_value*partner;  // optional
} TemplateCreateData;

// TemplateRemoveMatch is the typed request payload for Template.remove.
typedef struct {
  char*id;
} TemplateRemoveMatch;

// Transaction is the typed data model for the transaction entity.
typedef struct {
  char*bfid;  // optional
  voxgig_value*client;  // optional
  char*completedate;  // optional
  voxgig_value*directpartner;  // optional
  char*errcode;  // optional
  char*errmessage;  // optional
  int64_t id;  // optional
  char*ipaddress;  // optional
  char*messageid;  // optional
  voxgig_value*partner;  // optional
  char*reference;  // optional
  bool success;  // optional
  char*templateid;  // optional
} Transaction;

// TransactionLoadMatch is the typed request payload for Transaction.load.
typedef struct {
  char*id;
  char*transaction_type;  // optional
} TransactionLoadMatch;

// TransactionListMatch is the typed request payload for Transaction.list.
typedef struct {
  char*client;  // optional
  char*date_from;  // optional
  char*date_to;  // optional
  char*message_id;  // optional
  char*paging_mode;  // optional
  char*partner;  // optional
  char*reference;  // optional
  int64_t skip;  // optional
  bool success;  // optional
  int64_t take;  // optional
  char*transaction_type;  // optional
} TransactionListMatch;

// UpdateResult is the typed data model for the update_result entity.
typedef struct {
  char*billingid;  // optional
  voxgig_value*client;  // optional
  voxgig_value*contact;
  voxgig_value*directpartner;  // optional
  char*email;
  char*firstname;
  int64_t id;  // optional
  bool isactive;  // optional
  char*lastname;
  char*mid;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  voxgig_value*partner;  // optional
  char*phone;
  char*reference;  // optional
  bool sendwelcomeemail;  // optional
  char*username;
  voxgig_value*userrole;
  char*verificationphrase;  // optional
  int64_t version;  // optional
} UpdateResult;

// UpdateResultListMatch is the typed request payload for UpdateResult.list.
typedef struct {
  char*client;  // optional
  char*partner;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
} UpdateResultListMatch;

// UpdateResultCreateData is the typed request payload for UpdateResult.create.
typedef struct {
  voxgig_value*client;  // optional
  char*email;
  char*first_name;
  bool is_active;
  char*last_name;
  voxgig_value*partner;  // optional
  int64_t phone;
  bool send_welcome_email;
  voxgig_value*user_role;
  char*username;
  char*billingid;  // optional
  voxgig_value*contact;
  voxgig_value*directpartner;  // optional
  char*firstname;
  int64_t id;  // optional
  bool isactive;  // optional
  char*lastname;
  char*mid;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  char*reference;  // optional
  bool sendwelcomeemail;  // optional
  voxgig_value*userrole;
  char*verificationphrase;  // optional
  int64_t version;  // optional
} UpdateResultCreateData;

// UpdateResultUpdateData is the typed request payload for UpdateResult.update.
typedef struct {
  char*id;
  char*access_mode;  // optional
  bool active;  // optional
  int64_t client_id;  // optional
  char*client_name;  // optional
  voxgig_value*field_template;  // optional
  char*name;  // optional
  char*options_custom_style;  // optional
  char*options_custom_style_file;  // optional
  voxgig_value*options_domain;  // optional
  char*options_security_active_from;  // optional
  char*options_security_active_to;  // optional
  bool options_security_irreversible;  // optional
  int64_t partner_id;  // optional
  char*partner_name;  // optional
  char*reference;  // optional
  char*type;  // optional
  int64_t version;  // optional
  char*billing_id;  // optional
  int64_t contact_id;  // optional
  bool is_active;  // optional
  int64_t parent_id;  // optional
  char*parent_name;  // optional
  char*verification_phrase;  // optional
  voxgig_value*client;  // optional
  char*email;  // optional
  char*first_name;  // optional
  char*last_name;  // optional
  voxgig_value*partner;  // optional
  int64_t phone;  // optional
  bool send_welcome_email;  // optional
  char*username;  // optional
  int64_t direct_partner_id;  // optional
  char*direct_partner_name;  // optional
  char*mid;  // optional
  char*billingid;  // optional
  voxgig_value*contact;  // optional
  voxgig_value*directpartner;  // optional
  char*firstname;  // optional
  bool isactive;  // optional
  char*lastname;  // optional
  voxgig_value*parent;  // optional
  bool sendwelcomeemail;  // optional
  voxgig_value*userrole;  // optional
  char*verificationphrase;  // optional
} UpdateResultUpdateData;

// User is the typed data model for the user entity.
typedef struct {
  voxgig_value*client;  // optional
  char*created;  // optional
  char*email;  // optional
  char*firstname;  // optional
  int64_t id;  // optional
  bool isactive;  // optional
  char*lastname;  // optional
  char*modified;  // optional
  voxgig_value*partner;  // optional
  char*phone;  // optional
  char*username;  // optional
  voxgig_value*userrole;  // optional
  int64_t version;  // optional
} User;

// UserLoadMatch is the typed request payload for User.load.
typedef struct {
  char*id;
} UserLoadMatch;

#endif // BLUEFINSHIELDCONEXMGMT_ENTITY_TYPES_H
