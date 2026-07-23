// BluefinShieldconexMgmt SDK client. All transport and pipeline behaviour lives in the
// SdkClient base (core/types.hpp); this class binds the API-specific entity
// accessors and the test-mode constructor.

#ifndef SDK_CORE_CLIENT_HPP
#define SDK_CORE_CLIENT_HPP

#include <memory>

#include "../core/types.hpp"
#include "../entity/entities.hpp"

namespace sdk {

class BluefinShieldconexMgmtSDK : public SdkClient {
public:
  explicit BluefinShieldconexMgmtSDK(Value options = Value::undef()) : SdkClient(options) {}


  // Client entity bound to this client.
  std::shared_ptr<ClientEntity> client(Value entopts = Value::undef()) {
    return std::make_shared<ClientEntity>(this, entopts);
  }

  // Clone entity bound to this client.
  std::shared_ptr<CloneEntity> clone(Value entopts = Value::undef()) {
    return std::make_shared<CloneEntity>(this, entopts);
  }

  // Partner entity bound to this client.
  std::shared_ptr<PartnerEntity> partner(Value entopts = Value::undef()) {
    return std::make_shared<PartnerEntity>(this, entopts);
  }

  // Template entity bound to this client.
  std::shared_ptr<TemplateEntity> template_(Value entopts = Value::undef()) {
    return std::make_shared<TemplateEntity>(this, entopts);
  }

  // Transaction entity bound to this client.
  std::shared_ptr<TransactionEntity> transaction(Value entopts = Value::undef()) {
    return std::make_shared<TransactionEntity>(this, entopts);
  }

  // UpdateResult entity bound to this client.
  std::shared_ptr<UpdateResultEntity> update_result(Value entopts = Value::undef()) {
    return std::make_shared<UpdateResultEntity>(this, entopts);
  }

  // User entity bound to this client.
  std::shared_ptr<UserEntity> user(Value entopts = Value::undef()) {
    return std::make_shared<UserEntity>(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  static std::shared_ptr<BluefinShieldconexMgmtSDK> testSDK() {
    return testSDK(Value::undef(), Value::undef());
  }

  static std::shared_ptr<BluefinShieldconexMgmtSDK> testSDK(Value testopts, Value sdkopts) {
    auto sdk = std::make_shared<BluefinShieldconexMgmtSDK>(SdkClient::testOptions(testopts, sdkopts));
    sdk->mode = "test";
    return sdk;
  }

  // Convenience no-arg constructor.
  static std::shared_ptr<BluefinShieldconexMgmtSDK> create() {
    return std::make_shared<BluefinShieldconexMgmtSDK>(Value::undef());
  }
};

using BluefinShieldconexMgmtSDKPtr = std::shared_ptr<BluefinShieldconexMgmtSDK>;

} // namespace sdk

#endif // SDK_CORE_CLIENT_HPP
