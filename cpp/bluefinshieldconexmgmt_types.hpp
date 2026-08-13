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

struct ClientCreateData {
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

struct PartnerCreateData {
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

struct TemplateCreateData {
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
};

struct TransactionListMatch {
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
  std::string billingId;  // optional
  std::map<std::string, Value> client;  // optional
  std::map<std::string, Value> contact;  // optional
  std::map<std::string, Value> directPartner;  // optional
  std::string email;  // optional
  std::string firstName;  // optional
  int64_t id;  // optional
  bool isActive;  // optional
  std::string lastName;  // optional
  std::string mid;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string reference;  // optional
  bool sendWelcomeEmail;  // optional
  std::string userName;  // optional
  std::map<std::string, Value> userRole;  // optional
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
};

struct UpdateResultCreateData {
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

struct UpdateResultUpdateData {
  std::string id;
  std::string billingId;  // optional
  std::map<std::string, Value> client;  // optional
  std::map<std::string, Value> contact;  // optional
  std::map<std::string, Value> directPartner;  // optional
  std::string email;  // optional
  std::string firstName;  // optional
  bool isActive;  // optional
  std::string lastName;  // optional
  std::string mid;  // optional
  std::string name;  // optional
  std::map<std::string, Value> parent;  // optional
  std::map<std::string, Value> partner;  // optional
  std::string phone;  // optional
  std::string reference;  // optional
  bool sendWelcomeEmail;  // optional
  std::string userName;  // optional
  std::map<std::string, Value> userRole;  // optional
  std::string verificationPhrase;  // optional
  int64_t version;  // optional
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
