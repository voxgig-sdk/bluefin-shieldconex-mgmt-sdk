// Typed reference models for the BluefinShieldconexMgmt SDK (C++).
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params. The C++ SDK runtime is Value-based, so these structs are
// DOCUMENTATION / convenience types only — the SDK neither includes nor
// requires this header. Array fields surface as std::vector<Value>, object
// fields as std::map<std::string, Value>, and any/null fields as sdk::Value.
// Optional (req:false) members are flagged with a trailing "// optional"
// comment. Do not edit by hand.

#ifndef SDK_BLUEFINSHIELDCONEXMGMT_TYPES_HPP
#define SDK_BLUEFINSHIELDCONEXMGMT_TYPES_HPP

#include <cstdint>
#include <map>
#include <string>
#include <vector>

#include "core/types.hpp"

namespace sdk {
namespace types {

struct Client {
  std::string billingId;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> directPartner;  // optional
  int64_t id;  // optional
  bool isActive;  // optional
  std::string mid;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> partner;  // optional
  int64_t version;  // optional
};

struct ClientLoadMatch {
  std::string id;
};

struct ClientListMatch {
  std::string partner;
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct ClientCreateData {
  std::string billing_id;  // optional
  std::string contact_email;
  std::string contact_first_name;
  bool contact_is_active;
  std::string contact_last_name;
  std::string contact_phone;
  bool contact_send_welcome_email;
  std::string contact_user_name;
  std::string contact_user_role;
  int64_t direct_partner_id;
  std::string direct_partner_name;
  bool is_active;
  std::string mid;  // optional
  std::string name;
  std::string billingId;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> directPartner;  // optional
  int64_t id;  // optional
  bool isActive;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  int64_t version;  // optional
};

struct ClientRemoveMatch {
  std::string id;
};

struct Clone {
  int64_t id;  // optional
  std::string name;  // optional
};

struct CloneCreateData {
  std::string template_id;
  int64_t id;  // optional
  std::string name;  // optional
};

struct Partner {
  std::string billingId;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  int64_t id;  // optional
  bool isActive;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string reference;  // optional
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct PartnerLoadMatch {
  std::string id;
};

struct PartnerListMatch {
  std::string partner;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct PartnerCreateData {
  std::string billing_id;
  std::string contact_email;
  std::string contact_first_name;
  bool contact_is_active;
  std::string contact_last_name;
  std::string contact_phone;
  bool contact_send_welcome_email;
  std::string contact_user_name;
  std::string contact_user_role;
  bool is_active;
  std::string name;
  int64_t parent_id;  // optional
  std::string parent_name;  // optional
  std::string reference;
  std::string verification_phrase;  // optional
  std::string billingId;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  int64_t id;  // optional
  bool isActive;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct Template {
  Value accessMode;  // optional
  bool active;  // optional
  std::map<std::string, Value> client;  // optional
  std::vector<Value> fieldTemplates;  // optional
  int64_t id;  // optional
  std::string name;  // optional
  std::map<std::string, Value> options;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  std::string type;  // optional
  int64_t version;  // optional
};

struct TemplateLoadMatch {
  std::string id;
};

struct TemplateListMatch {
  std::string client;  // optional
  std::string partner;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct TemplateCreateData {
  std::string access_mode;  // optional
  bool active;
  int64_t client_id;
  std::string client_name;
  std::vector<Value> field_template;  // optional
  std::string name;
  std::string options_custom_style;  // optional
  std::string options_custom_style_file;  // optional
  std::vector<Value> options_domain;  // optional
  std::string options_security_active_from;  // optional
  std::string options_security_active_to;  // optional
  bool options_security_irreversible;  // optional
  int64_t partner_id;
  std::string partner_name;
  std::string reference;
  std::string type;  // optional
  int64_t version;  // optional
  Value accessMode;  // optional
  std::map<std::string, Value> client;  // optional
  std::vector<Value> fieldTemplates;  // optional
  int64_t id;  // optional
  std::map<std::string, Value> options;  // optional
  std::map<std::string, Value> partner;  // optional
};

struct TemplateRemoveMatch {
  std::string id;
};

struct Transaction {
  std::string bfid;  // optional
  std::map<std::string, Value> client;  // optional
  std::string completeDate;  // optional
  std::map<std::string, Value> directPartner;  // optional
  std::string errCode;  // optional
  std::string errMessage;  // optional
  int64_t id;  // optional
  std::string ipAddress;  // optional
  std::string messageId;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  bool success;  // optional
  std::string templateId;  // optional
};

struct TransactionLoadMatch {
  std::string id;
  std::string transaction_type;  // optional
};

struct TransactionListMatch {
  std::string client;  // optional
  std::string date_from;  // optional
  std::string date_to;  // optional
  std::string message_id;  // optional
  std::string paging_mode;  // optional
  std::string partner;  // optional
  std::string reference;  // optional
  int64_t skip;  // optional
  bool success;  // optional
  int64_t take;  // optional
  std::string transaction_type;  // optional
};

struct UpdateResult {
  std::string billingId;  // optional
  std::map<std::string, Value> client;  // optional
  std::map<std::string, Value> contact;
  std::map<std::string, Value> directPartner;  // optional
  std::string email;
  std::string firstName;
  int64_t id;  // optional
  bool isActive;  // optional
  std::string lastName;
  std::string mid;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;
  std::string reference;  // optional
  bool sendWelcomeEmail;  // optional
  std::string userName;
  std::map<std::string, Value> userRole;
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct UpdateResultListMatch {
  std::string client;  // optional
  std::string partner;  // optional
  int64_t skip;  // optional
  int64_t take;  // optional
};

struct UpdateResultCreateData {
  std::map<std::string, Value> client;  // optional
  std::string email;
  std::string first_name;
  bool is_active;
  std::string last_name;
  std::map<std::string, Value> partner;  // optional
  int64_t phone;
  bool send_welcome_email;
  std::map<std::string, Value> user_role;
  std::string username;
  std::string billingId;  // optional
  std::map<std::string, Value> contact;
  std::map<std::string, Value> directPartner;  // optional
  std::string firstName;
  int64_t id;  // optional
  bool isActive;  // optional
  std::string lastName;
  std::string mid;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string reference;  // optional
  bool sendWelcomeEmail;  // optional
  std::string userName;
  std::map<std::string, Value> userRole;
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct UpdateResultUpdateData {
  std::string id;
  std::string access_mode;  // optional
  bool active;  // optional
  int64_t client_id;  // optional
  std::string client_name;  // optional
  std::vector<Value> field_template;  // optional
  std::string name;  // optional
  std::string options_custom_style;  // optional
  std::string options_custom_style_file;  // optional
  std::vector<Value> options_domain;  // optional
  std::string options_security_active_from;  // optional
  std::string options_security_active_to;  // optional
  bool options_security_irreversible;  // optional
  int64_t partner_id;  // optional
  std::string partner_name;  // optional
  std::string reference;  // optional
  std::string type;  // optional
  int64_t version;  // optional
  std::string billing_id;  // optional
  int64_t contact_id;  // optional
  bool is_active;  // optional
  int64_t parent_id;  // optional
  std::string parent_name;  // optional
  std::string verification_phrase;  // optional
  std::map<std::string, Value> client;  // optional
  std::string email;  // optional
  std::string first_name;  // optional
  std::string last_name;  // optional
  std::map<std::string, Value> partner;  // optional
  int64_t phone;  // optional
  bool send_welcome_email;  // optional
  std::string username;  // optional
  int64_t direct_partner_id;  // optional
  std::string direct_partner_name;  // optional
  std::string mid;  // optional
  std::string billingId;  // optional
  std::map<std::string, Value> contact;  // optional
  std::map<std::string, Value> directPartner;  // optional
  std::string firstName;  // optional
  bool isActive;  // optional
  std::string lastName;  // optional
  std::map<std::string, Value> parent;  // optional
  bool sendWelcomeEmail;  // optional
  std::string userName;  // optional
  std::map<std::string, Value> userRole;  // optional
  std::string verificationPhrase;  // optional
};

struct User {
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::string email;  // optional
  std::string firstName;  // optional
  int64_t id;  // optional
  bool isActive;  // optional
  std::string lastName;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string userName;  // optional
  std::map<std::string, Value> userRole;  // optional
  int64_t version;  // optional
};

struct UserLoadMatch {
  std::string id;
};

} // namespace types
} // namespace sdk

#endif // SDK_BLUEFINSHIELDCONEXMGMT_TYPES_HPP
