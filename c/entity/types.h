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
  char*billing_id;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  voxgig_value*direct_partner;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
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
  char*billing_id;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  voxgig_value*direct_partner;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  char*mid;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*partner;  // optional
  int64_t version;  // optional
} ClientListMatch;

// ClientCreateData is the typed request payload for Client.create.
typedef struct {
  char*billing_id;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  voxgig_value*direct_partner;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  char*mid;  // optional
  char*modified;  // optional
  char*name;  // optional
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
} CloneCreateData;

// Partner is the typed data model for the partner entity.
typedef struct {
  char*billing_id;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  char*reference;  // optional
  char*verification_phrase;  // optional
  int64_t version;  // optional
} Partner;

// PartnerLoadMatch is the typed request payload for Partner.load.
typedef struct {
  char*id;
} PartnerLoadMatch;

// PartnerListMatch is the typed request payload for Partner.list.
typedef struct {
  char*billing_id;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  char*reference;  // optional
  char*verification_phrase;  // optional
  int64_t version;  // optional
} PartnerListMatch;

// PartnerCreateData is the typed request payload for Partner.create.
typedef struct {
  char*billing_id;  // optional
  voxgig_value*contact;  // optional
  char*created;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  char*modified;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  char*reference;  // optional
  char*verification_phrase;  // optional
  int64_t version;  // optional
} PartnerCreateData;

// Template is the typed data model for the template entity.
typedef struct {
  voxgig_value*access_mode;  // optional
  bool active;  // optional
  voxgig_value*client;  // optional
  voxgig_value*field_template;  // optional
  int64_t id;  // optional
  char*name;  // optional
  voxgig_value*option;  // optional
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
  voxgig_value*access_mode;  // optional
  bool active;  // optional
  voxgig_value*client;  // optional
  voxgig_value*field_template;  // optional
  int64_t id;  // optional
  char*name;  // optional
  voxgig_value*option;  // optional
  voxgig_value*partner;  // optional
  char*reference;  // optional
  char*type;  // optional
  int64_t version;  // optional
} TemplateListMatch;

// TemplateCreateData is the typed request payload for Template.create.
typedef struct {
  voxgig_value*access_mode;  // optional
  bool active;  // optional
  voxgig_value*client;  // optional
  voxgig_value*field_template;  // optional
  int64_t id;  // optional
  char*name;  // optional
  voxgig_value*option;  // optional
  voxgig_value*partner;  // optional
  char*reference;  // optional
  char*type;  // optional
  int64_t version;  // optional
} TemplateCreateData;

// TemplateRemoveMatch is the typed request payload for Template.remove.
typedef struct {
  char*id;
} TemplateRemoveMatch;

// Transaction is the typed data model for the transaction entity.
typedef struct {
  char*bfid;  // optional
  voxgig_value*client;  // optional
  char*complete_date;  // optional
  voxgig_value*direct_partner;  // optional
  char*err_code;  // optional
  char*err_message;  // optional
  int64_t id;  // optional
  char*ip_address;  // optional
  char*message_id;  // optional
  voxgig_value*partner;  // optional
  char*reference;  // optional
  bool success;  // optional
  char*template_id;  // optional
} Transaction;

// TransactionLoadMatch is the typed request payload for Transaction.load.
typedef struct {
  char*id;
} TransactionLoadMatch;

// TransactionListMatch is the typed request payload for Transaction.list.
typedef struct {
  char*bfid;  // optional
  voxgig_value*client;  // optional
  char*complete_date;  // optional
  voxgig_value*direct_partner;  // optional
  char*err_code;  // optional
  char*err_message;  // optional
  int64_t id;  // optional
  char*ip_address;  // optional
  char*message_id;  // optional
  voxgig_value*partner;  // optional
  char*reference;  // optional
  bool success;  // optional
  char*template_id;  // optional
} TransactionListMatch;

// UpdateResult is the typed data model for the update_result entity.
typedef struct {
  char*billing_id;  // optional
  voxgig_value*client;  // optional
  voxgig_value*contact;
  voxgig_value*direct_partner;  // optional
  char*email;
  char*first_name;
  int64_t id;  // optional
  bool is_active;  // optional
  char*last_name;
  char*mid;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  voxgig_value*partner;  // optional
  char*phone;
  char*reference;  // optional
  bool send_welcome_email;  // optional
  char*user_name;
  voxgig_value*user_role;
  char*verification_phrase;  // optional
  int64_t version;  // optional
} UpdateResult;

// UpdateResultListMatch is the typed request payload for UpdateResult.list.
typedef struct {
  char*billing_id;  // optional
  voxgig_value*client;  // optional
  voxgig_value*contact;  // optional
  voxgig_value*direct_partner;  // optional
  char*email;  // optional
  char*first_name;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  char*last_name;  // optional
  char*mid;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  voxgig_value*partner;  // optional
  char*phone;  // optional
  char*reference;  // optional
  bool send_welcome_email;  // optional
  char*user_name;  // optional
  voxgig_value*user_role;  // optional
  char*verification_phrase;  // optional
  int64_t version;  // optional
} UpdateResultListMatch;

// UpdateResultCreateData is the typed request payload for UpdateResult.create.
typedef struct {
  char*billing_id;  // optional
  voxgig_value*client;  // optional
  voxgig_value*contact;
  voxgig_value*direct_partner;  // optional
  char*email;
  char*first_name;
  int64_t id;  // optional
  bool is_active;  // optional
  char*last_name;
  char*mid;  // optional
  char*name;  // optional
  voxgig_value*parent;  // optional
  voxgig_value*partner;  // optional
  char*phone;
  char*reference;  // optional
  bool send_welcome_email;  // optional
  char*user_name;
  voxgig_value*user_role;
  char*verification_phrase;  // optional
  int64_t version;  // optional
} UpdateResultCreateData;

// UpdateResultUpdateData is the typed request payload for UpdateResult.update.
typedef struct {
  char*id;
} UpdateResultUpdateData;

// User is the typed data model for the user entity.
typedef struct {
  voxgig_value*client;  // optional
  char*created;  // optional
  char*email;  // optional
  char*first_name;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  char*last_name;  // optional
  char*modified;  // optional
  voxgig_value*partner;  // optional
  char*phone;  // optional
  char*user_name;  // optional
  voxgig_value*user_role;  // optional
  int64_t version;  // optional
} User;

// UserLoadMatch is the typed request payload for User.load.
typedef struct {
  char*id;
} UserLoadMatch;

#endif // BLUEFINSHIELDCONEXMGMT_ENTITY_TYPES_H
