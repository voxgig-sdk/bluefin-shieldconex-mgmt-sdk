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

  public record Client(String billing_id, Map<String, Object> contact, String created, Map<String, Object> direct_partner, Long id, Boolean is_active, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientLoadMatch(String id) {}

  public record ClientListMatch(String billing_id, Map<String, Object> contact, String created, Map<String, Object> direct_partner, Long id, Boolean is_active, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientCreateData(String billing_id, Map<String, Object> contact, String created, Map<String, Object> direct_partner, Long id, Boolean is_active, String mid, String modified, String name, Map<String, Object> partner, Long version) {}

  public record ClientRemoveMatch(String id) {}

  public record Clone(Long id, String name) {}

  public record CloneCreateData(String template_id) {}

  public record Partner(String billing_id, Map<String, Object> contact, String created, Long id, Boolean is_active, String modified, String name, Map<String, Object> parent, String reference, String verification_phrase, Long version) {}

  public record PartnerLoadMatch(String id) {}

  public record PartnerListMatch(String billing_id, Map<String, Object> contact, String created, Long id, Boolean is_active, String modified, String name, Map<String, Object> parent, String reference, String verification_phrase, Long version) {}

  public record PartnerCreateData(String billing_id, Map<String, Object> contact, String created, Long id, Boolean is_active, String modified, String name, Map<String, Object> parent, String reference, String verification_phrase, Long version) {}

  public record Template(Object access_mode, Boolean active, Map<String, Object> client, List<Object> field_template, Long id, String name, Map<String, Object> option, Map<String, Object> partner, String reference, String type, Long version) {}

  public record TemplateLoadMatch(String id) {}

  public record TemplateListMatch(Object access_mode, Boolean active, Map<String, Object> client, List<Object> field_template, Long id, String name, Map<String, Object> option, Map<String, Object> partner, String reference, String type, Long version) {}

  public record TemplateCreateData(Object access_mode, Boolean active, Map<String, Object> client, List<Object> field_template, Long id, String name, Map<String, Object> option, Map<String, Object> partner, String reference, String type, Long version) {}

  public record TemplateRemoveMatch(String id) {}

  public record Transaction(String bfid, Map<String, Object> client, String complete_date, Map<String, Object> direct_partner, String err_code, String err_message, Long id, String ip_address, String message_id, Map<String, Object> partner, String reference, Boolean success, String template_id) {}

  public record TransactionLoadMatch(String id) {}

  public record TransactionListMatch(String bfid, Map<String, Object> client, String complete_date, Map<String, Object> direct_partner, String err_code, String err_message, Long id, String ip_address, String message_id, Map<String, Object> partner, String reference, Boolean success, String template_id) {}

  public record UpdateResult(String billing_id, Map<String, Object> client, Map<String, Object> contact, Map<String, Object> direct_partner, String email, String first_name, Long id, Boolean is_active, String last_name, String mid, String name, Map<String, Object> parent, Map<String, Object> partner, String phone, String reference, Boolean send_welcome_email, String user_name, Map<String, Object> user_role, String verification_phrase, Long version) {}

  public record UpdateResultListMatch(String billing_id, Map<String, Object> client, Map<String, Object> contact, Map<String, Object> direct_partner, String email, String first_name, Long id, Boolean is_active, String last_name, String mid, String name, Map<String, Object> parent, Map<String, Object> partner, String phone, String reference, Boolean send_welcome_email, String user_name, Map<String, Object> user_role, String verification_phrase, Long version) {}

  public record UpdateResultCreateData(String billing_id, Map<String, Object> client, Map<String, Object> contact, Map<String, Object> direct_partner, String email, String first_name, Long id, Boolean is_active, String last_name, String mid, String name, Map<String, Object> parent, Map<String, Object> partner, String phone, String reference, Boolean send_welcome_email, String user_name, Map<String, Object> user_role, String verification_phrase, Long version) {}

  public record UpdateResultUpdateData(String id) {}

  public record User(Map<String, Object> client, String created, String email, String first_name, Long id, Boolean is_active, String last_name, String modified, Map<String, Object> partner, String phone, String user_name, Map<String, Object> user_role, Long version) {}

  public record UserLoadMatch(String id) {}

}
