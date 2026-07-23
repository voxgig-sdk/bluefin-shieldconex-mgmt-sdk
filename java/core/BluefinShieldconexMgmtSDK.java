package voxgig.bluefinshieldconexmgmtsdk.core;

import java.util.Map;

/**
 * BluefinShieldconexMgmt SDK client. All transport and pipeline behaviour lives in
 * the SdkClient base (core/SdkClient.java); this class binds the
 * API-specific entity accessors and the test-mode constructor.
 */
public class BluefinShieldconexMgmtSDK extends SdkClient {

  public BluefinShieldconexMgmtSDK() {
    this(null);
  }

  public BluefinShieldconexMgmtSDK(Map<String, Object> options) {
    super(options);
  }


  /**
   * Returns a client entity bound to this client.
   * Idiomatic usage: client.client(null).list(null, null) or
   * client.client(null).load(Map.of("id", ...), null).
   */
  public SdkEntity client(Map<String, Object> entopts) {
    return new voxgig.bluefinshieldconexmgmtsdk.entity.ClientEntity(this, entopts);
  }

  /**
   * Returns a clone entity bound to this client.
   * Idiomatic usage: client.clone(null).list(null, null) or
   * client.clone(null).load(Map.of("id", ...), null).
   */
  public SdkEntity clone(Map<String, Object> entopts) {
    return new voxgig.bluefinshieldconexmgmtsdk.entity.CloneEntity(this, entopts);
  }

  /**
   * Returns a partner entity bound to this client.
   * Idiomatic usage: client.partner(null).list(null, null) or
   * client.partner(null).load(Map.of("id", ...), null).
   */
  public SdkEntity partner(Map<String, Object> entopts) {
    return new voxgig.bluefinshieldconexmgmtsdk.entity.PartnerEntity(this, entopts);
  }

  /**
   * Returns a template entity bound to this client.
   * Idiomatic usage: client.template(null).list(null, null) or
   * client.template(null).load(Map.of("id", ...), null).
   */
  public SdkEntity template(Map<String, Object> entopts) {
    return new voxgig.bluefinshieldconexmgmtsdk.entity.TemplateEntity(this, entopts);
  }

  /**
   * Returns a transaction entity bound to this client.
   * Idiomatic usage: client.transaction(null).list(null, null) or
   * client.transaction(null).load(Map.of("id", ...), null).
   */
  public SdkEntity transaction(Map<String, Object> entopts) {
    return new voxgig.bluefinshieldconexmgmtsdk.entity.TransactionEntity(this, entopts);
  }

  /**
   * Returns a update_result entity bound to this client.
   * Idiomatic usage: client.updateResult(null).list(null, null) or
   * client.updateResult(null).load(Map.of("id", ...), null).
   */
  public SdkEntity updateResult(Map<String, Object> entopts) {
    return new voxgig.bluefinshieldconexmgmtsdk.entity.UpdateResultEntity(this, entopts);
  }

  /**
   * Returns a user entity bound to this client.
   * Idiomatic usage: client.user(null).list(null, null) or
   * client.user(null).load(Map.of("id", ...), null).
   */
  public SdkEntity user(Map<String, Object> entopts) {
    return new voxgig.bluefinshieldconexmgmtsdk.entity.UserEntity(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  public static BluefinShieldconexMgmtSDK testSDK() {
    return testSDK(null, null);
  }

  public static BluefinShieldconexMgmtSDK testSDK(
      Map<String, Object> testopts, Map<String, Object> sdkopts) {
    BluefinShieldconexMgmtSDK sdk = new BluefinShieldconexMgmtSDK(SdkClient.testOptions(testopts, sdkopts));
    sdk.mode = "test";
    return sdk;
  }
}
