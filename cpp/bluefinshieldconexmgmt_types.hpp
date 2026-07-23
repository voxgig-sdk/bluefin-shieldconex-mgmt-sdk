// Typed reference models for the BluefinShieldconexMgmt SDK (C++).
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
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
  std::string billing_id;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
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
  std::string billing_id;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  std::string mid;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> partner;  // optional
  int64_t version;  // optional
};

struct ClientCreateData {
  std::string billing_id;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  std::string mid;  // optional
  std::string modified;  // optional
  std::string name;  // optional
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
};

struct Partner {
  std::string billing_id;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string reference;  // optional
  std::string verification_phrase;  // optional
  int64_t version;  // optional
};

struct PartnerLoadMatch {
  std::string id;
};

struct PartnerListMatch {
  std::string billing_id;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string reference;  // optional
  std::string verification_phrase;  // optional
  int64_t version;  // optional
};

struct PartnerCreateData {
  std::string billing_id;  // optional
  std::map<std::string, Value> contact;  // optional
  std::string created;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  std::string modified;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::string reference;  // optional
  std::string verification_phrase;  // optional
  int64_t version;  // optional
};

struct Template {
  Value access_mode;  // optional
  bool active;  // optional
  std::map<std::string, Value> client;  // optional
  std::vector<Value> field_template;  // optional
  int64_t id;  // optional
  std::string name;  // optional
  std::map<std::string, Value> option;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  std::string type;  // optional
  int64_t version;  // optional
};

struct TemplateLoadMatch {
  std::string id;
};

struct TemplateListMatch {
  Value access_mode;  // optional
  bool active;  // optional
  std::map<std::string, Value> client;  // optional
  std::vector<Value> field_template;  // optional
  int64_t id;  // optional
  std::string name;  // optional
  std::map<std::string, Value> option;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  std::string type;  // optional
  int64_t version;  // optional
};

struct TemplateCreateData {
  Value access_mode;  // optional
  bool active;  // optional
  std::map<std::string, Value> client;  // optional
  std::vector<Value> field_template;  // optional
  int64_t id;  // optional
  std::string name;  // optional
  std::map<std::string, Value> option;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  std::string type;  // optional
  int64_t version;  // optional
};

struct TemplateRemoveMatch {
  std::string id;
};

struct Transaction {
  std::string bfid;  // optional
  std::map<std::string, Value> client;  // optional
  std::string complete_date;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  std::string err_code;  // optional
  std::string err_message;  // optional
  int64_t id;  // optional
  std::string ip_address;  // optional
  std::string message_id;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  bool success;  // optional
  std::string template_id;  // optional
};

struct TransactionLoadMatch {
  std::string id;
};

struct TransactionListMatch {
  std::string bfid;  // optional
  std::map<std::string, Value> client;  // optional
  std::string complete_date;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  std::string err_code;  // optional
  std::string err_message;  // optional
  int64_t id;  // optional
  std::string ip_address;  // optional
  std::string message_id;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string reference;  // optional
  bool success;  // optional
  std::string template_id;  // optional
};

struct UpdateResult {
  std::string billing_id;  // optional
  std::map<std::string, Value> client;  // optional
  std::map<std::string, Value> contact;
  std::map<std::string, Value> direct_partner;  // optional
  std::string email;
  std::string first_name;
  int64_t id;  // optional
  bool is_active;  // optional
  std::string last_name;
  std::string mid;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;
  std::string reference;  // optional
  bool send_welcome_email;  // optional
  std::string user_name;
  std::map<std::string, Value> user_role;
  std::string verification_phrase;  // optional
  int64_t version;  // optional
};

struct UpdateResultListMatch {
  std::string billing_id;  // optional
  std::map<std::string, Value> client;  // optional
  std::map<std::string, Value> contact;  // optional
  std::map<std::string, Value> direct_partner;  // optional
  std::string email;  // optional
  std::string first_name;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  std::string last_name;  // optional
  std::string mid;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string reference;  // optional
  bool send_welcome_email;  // optional
  std::string user_name;  // optional
  std::map<std::string, Value> user_role;  // optional
  std::string verification_phrase;  // optional
  int64_t version;  // optional
};

struct UpdateResultCreateData {
  std::string billing_id;  // optional
  std::map<std::string, Value> client;  // optional
  std::map<std::string, Value> contact;
  std::map<std::string, Value> direct_partner;  // optional
  std::string email;
  std::string first_name;
  int64_t id;  // optional
  bool is_active;  // optional
  std::string last_name;
  std::string mid;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;
  std::string reference;  // optional
  bool send_welcome_email;  // optional
  std::string user_name;
  std::map<std::string, Value> user_role;
  std::string verification_phrase;  // optional
  int64_t version;  // optional
};

struct UpdateResultUpdateData {
  std::string id;
};

struct User {
  std::map<std::string, Value> client;  // optional
  std::string created;  // optional
  std::string email;  // optional
  std::string first_name;  // optional
  int64_t id;  // optional
  bool is_active;  // optional
  std::string last_name;  // optional
  std::string modified;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string user_name;  // optional
  std::map<std::string, Value> user_role;  // optional
  int64_t version;  // optional
};

struct UserLoadMatch {
  std::string id;
};

} // namespace types
} // namespace sdk

#endif // SDK_BLUEFINSHIELDCONEXMGMT_TYPES_HPP
