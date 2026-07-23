package voxgig.bluefinshieldconexmgmtsdk.core

import java.util.{Map => JMap}

// BluefinShieldconexMgmt SDK client. All transport and pipeline behaviour lives in the
// SdkClient base (core/SdkClient.scala); this class binds the API-specific
// entity accessors and the test-mode constructor.
class BluefinShieldconexMgmtSDK(options: JMap[String, Object]) extends SdkClient(options) {

  def this() = this(null)


  /**
   * Returns a client entity bound to this client.
   * Idiomatic usage: client.client(null).list(null, null) or
   * client.client(null).load(java.util.Map.of("id", ...), null).
   */
  def client(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinshieldconexmgmtsdk.entity.ClientEntity(this, entopts)

  /**
   * Returns a clone entity bound to this client.
   * Idiomatic usage: client.clone(null).list(null, null) or
   * client.clone(null).load(java.util.Map.of("id", ...), null).
   */
  def clone(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinshieldconexmgmtsdk.entity.CloneEntity(this, entopts)

  /**
   * Returns a partner entity bound to this client.
   * Idiomatic usage: client.partner(null).list(null, null) or
   * client.partner(null).load(java.util.Map.of("id", ...), null).
   */
  def partner(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinshieldconexmgmtsdk.entity.PartnerEntity(this, entopts)

  /**
   * Returns a template entity bound to this client.
   * Idiomatic usage: client.template(null).list(null, null) or
   * client.template(null).load(java.util.Map.of("id", ...), null).
   */
  def template(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinshieldconexmgmtsdk.entity.TemplateEntity(this, entopts)

  /**
   * Returns a transaction entity bound to this client.
   * Idiomatic usage: client.transaction(null).list(null, null) or
   * client.transaction(null).load(java.util.Map.of("id", ...), null).
   */
  def transaction(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinshieldconexmgmtsdk.entity.TransactionEntity(this, entopts)

  /**
   * Returns a update_result entity bound to this client.
   * Idiomatic usage: client.updateResult(null).list(null, null) or
   * client.updateResult(null).load(java.util.Map.of("id", ...), null).
   */
  def updateResult(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinshieldconexmgmtsdk.entity.UpdateResultEntity(this, entopts)

  /**
   * Returns a user entity bound to this client.
   * Idiomatic usage: client.user(null).list(null, null) or
   * client.user(null).load(java.util.Map.of("id", ...), null).
   */
  def user(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinshieldconexmgmtsdk.entity.UserEntity(this, entopts)


}

object BluefinShieldconexMgmtSDK {

  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  def testSDK(): BluefinShieldconexMgmtSDK = testSDK(null, null)

  def testSDK(testopts: JMap[String, Object], sdkopts: JMap[String, Object]): BluefinShieldconexMgmtSDK = {
    val sdk = new BluefinShieldconexMgmtSDK(SdkClient.testOptions(testopts, sdkopts))
    sdk.mode = "test"
    sdk
  }
}
