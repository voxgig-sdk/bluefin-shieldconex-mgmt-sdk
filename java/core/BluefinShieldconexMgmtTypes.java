package voxgig.bluefinshieldconexmgmtsdk.core;

// Typed reference models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Map<String, Object> / Object) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a boxed (nullable)
// type, so an optional (req:false) key needs no distinct rendering.

import java.util.List;
import java.util.Map;

public final class BluefinShieldconexMgmtTypes {

  private BluefinShieldconexMgmtTypes() {}

  public record Client(String billingId, Map<String, Object> contact, String created, Map<String, Object> directPartner, Long id, Boolean isActive, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientLoadMatch(String id) {}

  public record ClientListMatch(String billingId, Map<String, Object> contact, String created, Map<String, Object> directPartner, Long id, Boolean isActive, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientCreateData(String billingId, Map<String, Object> contact, String created, Map<String, Object> directPartner, Long id, Boolean isActive, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientRemoveMatch(String id) {}

  public record Clone(Long id, String name) {}

  public record CloneCreateData(String template_id, Long id, String name) {}

  public record Partner(String billingId, Map<String, Object> contact, String created, Long id, Boolean isActive, String modified, String name, Map<String, Object> parent, String reference, String verificationPhrase, Long version) {}

  public record PartnerLoadMatch(String id) {}

  public record PartnerListMatch(String billingId, Map<String, Object> contact, String created, Long id, Boolean isActive, String modified, String name, Map<String, Object> parent, String reference, String verificationPhrase, Long version) {}

  public record PartnerCreateData(String billingId, Map<String, Object> contact, String created, Long id, Boolean isActive, String modified, String name, Map<String, Object> parent, String reference, String verificationPhrase, Long version) {}

  public record Template(Object accessMode, Boolean active, Map<String, Object> client, List<Object> fieldTemplates, Long id, String name, Map<String, Object> options, Map<String, Object> partner, String reference, String type, Long version) {}

  public record TemplateLoadMatch(String id) {}

  public record TemplateListMatch(Object accessMode, Boolean active, Map<String, Object> client, List<Object> fieldTemplates, Long id, String name, Map<String, Object> options, Map<String, Object> partner, String reference, String type, Long version) {}

  public record TemplateCreateData(Object accessMode, Boolean active, Map<String, Object> client, List<Object> fieldTemplates, Long id, String name, Map<String, Object> options, Map<String, Object> partner, String reference, String type, Long version) {}

  public record TemplateRemoveMatch(String id) {}

  public record Transaction(String bfid, Map<String, Object> client, String completeDate, Map<String, Object> directPartner, String errCode, String errMessage, Long id, String ipAddress, String messageId, Map<String, Object> partner, String reference, Boolean success, String templateId) {}

  public record TransactionLoadMatch(String id) {}

  public record TransactionListMatch(String bfid, Map<String, Object> client, String completeDate, Map<String, Object> directPartner, String errCode, String errMessage, Long id, String ipAddress, String messageId, Map<String, Object> partner, String reference, Boolean success, String templateId) {}

  public record UpdateResult(String billingId, Map<String, Object> client, Map<String, Object> contact, Map<String, Object> directPartner, String email, String firstName, Long id, Boolean isActive, String lastName, String mid, String name, Map<String, Object> parent, Map<String, Object> partner, String phone, String reference, Boolean sendWelcomeEmail, String userName, Map<String, Object> userRole, String verificationPhrase, Long version) {}

  public record UpdateResultListMatch(String billingId, Map<String, Object> client, Map<String, Object> contact, Map<String, Object> directPartner, String email, String firstName, Long id, Boolean isActive, String lastName, String mid, String name, Map<String, Object> parent, Map<String, Object> partner, String phone, String reference, Boolean sendWelcomeEmail, String userName, Map<String, Object> userRole, String verificationPhrase, Long version) {}

  public record UpdateResultCreateData(String billingId, Map<String, Object> client, Map<String, Object> contact, Map<String, Object> directPartner, String email, String firstName, Long id, Boolean isActive, String lastName, String mid, String name, Map<String, Object> parent, Map<String, Object> partner, String phone, String reference, Boolean sendWelcomeEmail, String userName, Map<String, Object> userRole, String verificationPhrase, Long version) {}

  public record UpdateResultUpdateData(String id, String billingId, Map<String, Object> client, Map<String, Object> contact, Map<String, Object> directPartner, String email, String firstName, Boolean isActive, String lastName, String mid, String name, Map<String, Object> parent, Map<String, Object> partner, String phone, String reference, Boolean sendWelcomeEmail, String userName, Map<String, Object> userRole, String verificationPhrase, Long version) {}

  public record User(Map<String, Object> client, String created, String email, String firstName, Long id, Boolean isActive, String lastName, String modified, Map<String, Object> partner, String phone, String userName, Map<String, Object> userRole, Long version) {}

  public record UserLoadMatch(String id) {}

}
