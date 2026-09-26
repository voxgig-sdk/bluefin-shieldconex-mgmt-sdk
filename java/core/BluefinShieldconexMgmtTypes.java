package voxgig.bluefinshieldconexmgmtsdk.core;

// Typed reference models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
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

  public record ClientListMatch(String partner, Long skip, Long take) {}

  public record ClientCreateData(String billing_id, String contact_email, String contact_first_name, Boolean contact_is_active, String contact_last_name, String contact_phone, Boolean contact_send_welcome_email, String contact_user_name, String contact_user_role, Long direct_partner_id, String direct_partner_name, Boolean is_active, String mid, String name, String billingId, Map<String, Object> contact, String created, Map<String, Object> directPartner, Long id, Boolean isActive, String modified, Map<String, Object> partner, Long version) {}

  public record ClientRemoveMatch(String id) {}

  public record Clone(Long id, String name) {}

  public record CloneCreateData(String template_id, Long id, String name) {}

  public record Partner(String billingId, Map<String, Object> contact, String created, Long id, Boolean isActive, String modified, String name, Map<String, Object> parent, String reference, String verificationPhrase, Long version) {}

  public record PartnerLoadMatch(String id) {}

  public record PartnerListMatch(String partner, Long skip, Long take) {}

  public record PartnerCreateData(String billing_id, String contact_email, String contact_first_name, Boolean contact_is_active, String contact_last_name, String contact_phone, Boolean contact_send_welcome_email, String contact_user_name, String contact_user_role, Boolean is_active, String name, Long parent_id, String parent_name, String reference, String verification_phrase, String billingId, Map<String, Object> contact, String created, Long id, Boolean isActive, String modified, Map<String, Object> parent, String verificationPhrase, Long version) {}

  public record Template(Object accessMode, Boolean active, Map<String, Object> client, List<Object> fieldTemplates, Long id, String name, Map<String, Object> options, Map<String, Object> partner, String reference, String type, Long version) {}

  public record TemplateLoadMatch(String id) {}

  public record TemplateListMatch(String client, String partner, Long skip, Long take) {}

  public record TemplateCreateData(String access_mode, Boolean active, Long client_id, String client_name, List<Object> field_template, String name, String options_custom_style, String options_custom_style_file, List<Object> options_domain, String options_security_active_from, String options_security_active_to, Boolean options_security_irreversible, Long partner_id, String partner_name, String reference, String type, Long version, Object accessMode, Map<String, Object> client, List<Object> fieldTemplates, Long id, Map<String, Object> options, Map<String, Object> partner) {}

  public record TemplateRemoveMatch(String id) {}

  public record Transaction(String bfid, Map<String, Object> client, String completeDate, Map<String, Object> directPartner, String errCode, String errMessage, Long id, String ipAddress, String messageId, Map<String, Object> partner, String reference, Boolean success, String templateId) {}

  public record TransactionLoadMatch(String id, String transaction_type) {}

  public record TransactionListMatch(String client, String date_from, String date_to, String message_id, String paging_mode, String partner, String reference, Long skip, Boolean success, Long take, String transaction_type) {}

  public record UpdateResult(String billingId, Map<String, Object> client, Map<String, Object> contact, Map<String, Object> directPartner, String email, String firstName, Long id, Boolean isActive, String lastName, String mid, String name, Map<String, Object> parent, Map<String, Object> partner, String phone, String reference, Boolean sendWelcomeEmail, String userName, Map<String, Object> userRole, String verificationPhrase, Long version) {}

  public record UpdateResultListMatch(String client, String partner, Long skip, Long take) {}

  public record UpdateResultCreateData(Map<String, Object> client, String email, String first_name, Boolean is_active, String last_name, Map<String, Object> partner, Long phone, Boolean send_welcome_email, Map<String, Object> user_role, String username, String billingId, Map<String, Object> contact, Map<String, Object> directPartner, String firstName, Long id, Boolean isActive, String lastName, String mid, String name, Map<String, Object> parent, String reference, Boolean sendWelcomeEmail, String userName, Map<String, Object> userRole, String verificationPhrase, Long version) {}

  public record UpdateResultUpdateData(String id, String access_mode, Boolean active, Long client_id, String client_name, List<Object> field_template, String name, String options_custom_style, String options_custom_style_file, List<Object> options_domain, String options_security_active_from, String options_security_active_to, Boolean options_security_irreversible, Long partner_id, String partner_name, String reference, String type, Long version, String billing_id, Long contact_id, Boolean is_active, Long parent_id, String parent_name, String verification_phrase, Map<String, Object> client, String email, String first_name, String last_name, Map<String, Object> partner, Long phone, Boolean send_welcome_email, String username, Long direct_partner_id, String direct_partner_name, String mid, String billingId, Map<String, Object> contact, Map<String, Object> directPartner, String firstName, Boolean isActive, String lastName, Map<String, Object> parent, Boolean sendWelcomeEmail, String userName, Map<String, Object> userRole, String verificationPhrase) {}

  public record User(Map<String, Object> client, String created, String email, String firstName, Long id, Boolean isActive, String lastName, String modified, Map<String, Object> partner, String phone, String userName, Map<String, Object> userRole, Long version) {}

  public record UserLoadMatch(String id) {}

}
