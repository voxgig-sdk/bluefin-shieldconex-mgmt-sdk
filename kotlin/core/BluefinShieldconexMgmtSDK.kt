package voxgig.bluefinshieldconexmgmtsdk.core

/**
 * BluefinShieldconexMgmt SDK client. All transport and pipeline behaviour lives in the
 * SdkClient base (core/SdkClient.kt); this class binds the API-specific
 * entity accessors and the test-mode constructor.
 */
class BluefinShieldconexMgmtSDK(options: MutableMap<String, Any?>?) : SdkClient(options) {

  constructor() : this(null)


  /**
   * Returns a client entity bound to this client.
   * Idiomatic usage: client.client(null).list(null, null) or
   * client.client(null).load(mutableMapOf("id" to ...), null).
   */
  fun client(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinshieldconexmgmtsdk.entity.ClientEntity(this, entopts)
  }

  /**
   * Returns a clone entity bound to this client.
   * Idiomatic usage: client.clone(null).list(null, null) or
   * client.clone(null).load(mutableMapOf("id" to ...), null).
   */
  fun clone(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinshieldconexmgmtsdk.entity.CloneEntity(this, entopts)
  }

  /**
   * Returns a partner entity bound to this client.
   * Idiomatic usage: client.partner(null).list(null, null) or
   * client.partner(null).load(mutableMapOf("id" to ...), null).
   */
  fun partner(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinshieldconexmgmtsdk.entity.PartnerEntity(this, entopts)
  }

  /**
   * Returns a template entity bound to this client.
   * Idiomatic usage: client.template(null).list(null, null) or
   * client.template(null).load(mutableMapOf("id" to ...), null).
   */
  fun template(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinshieldconexmgmtsdk.entity.TemplateEntity(this, entopts)
  }

  /**
   * Returns a transaction entity bound to this client.
   * Idiomatic usage: client.transaction(null).list(null, null) or
   * client.transaction(null).load(mutableMapOf("id" to ...), null).
   */
  fun transaction(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinshieldconexmgmtsdk.entity.TransactionEntity(this, entopts)
  }

  /**
   * Returns a update_result entity bound to this client.
   * Idiomatic usage: client.updateResult(null).list(null, null) or
   * client.updateResult(null).load(mutableMapOf("id" to ...), null).
   */
  fun updateResult(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinshieldconexmgmtsdk.entity.UpdateResultEntity(this, entopts)
  }

  /**
   * Returns a user entity bound to this client.
   * Idiomatic usage: client.user(null).list(null, null) or
   * client.user(null).load(mutableMapOf("id" to ...), null).
   */
  fun user(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinshieldconexmgmtsdk.entity.UserEntity(this, entopts)
  }


  companion object {
    // testSDK builds a client in test mode: the test feature is activated,
    // installing the in-memory mock transport (no network activity).
    fun testSDK(): BluefinShieldconexMgmtSDK = testSDK(null, null)

    fun testSDK(
      testopts: MutableMap<String, Any?>?,
      sdkopts: MutableMap<String, Any?>?,
    ): BluefinShieldconexMgmtSDK {
      val sdk = BluefinShieldconexMgmtSDK(testOptions(testopts, sdkopts))
      sdk.mode = "test"
      return sdk
    }
  }
}
