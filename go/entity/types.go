// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/bluefin-shieldconex-mgmt-sdk/go/core"
)

// Client is the typed data model for the client entity.
type Client struct {
	BillingId *string `json:"billingId,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Mid *string `json:"mid,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Version *int `json:"version,omitempty"`
}

// ClientLoadMatch is the typed request payload for Client.LoadTyped.
type ClientLoadMatch struct {
	Id string `json:"id"`
}

// ClientListMatch is the typed request payload for Client.ListTyped.
type ClientListMatch struct {
	Partner string `json:"partner"`
	Skip *int `json:"skip,omitempty"`
	Take *int `json:"take,omitempty"`
}

// ClientCreateData is the typed request payload for Client.CreateTyped.
type ClientCreateData struct {
	BillingId *string `json:"billing_id,omitempty"`
	ContactEmail string `json:"contact_email"`
	ContactFirstName string `json:"contact_first_name"`
	ContactIsActive bool `json:"contact_is_active"`
	ContactLastName string `json:"contact_last_name"`
	ContactPhone string `json:"contact_phone"`
	ContactSendWelcomeEmail bool `json:"contact_send_welcome_email"`
	ContactUserName string `json:"contact_user_name"`
	ContactUserRole string `json:"contact_user_role"`
	DirectPartnerId int `json:"direct_partner_id"`
	DirectPartnerName string `json:"direct_partner_name"`
	IsActive bool `json:"is_active"`
	Mid *string `json:"mid,omitempty"`
	Name string `json:"name"`
	BillingId2 *string `json:"billingId,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive2 *bool `json:"isActive,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Version *int `json:"version,omitempty"`
}

// ClientRemoveMatch is the typed request payload for Client.RemoveTyped.
type ClientRemoveMatch struct {
	Id string `json:"id"`
}

// Clone is the typed data model for the clone entity.
type Clone struct {
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
}

// CloneCreateData is the typed request payload for Clone.CreateTyped.
type CloneCreateData struct {
	TemplateId string `json:"template_id"`
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
}

// Partner is the typed data model for the partner entity.
type Partner struct {
	BillingId *string `json:"billingId,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	Reference *string `json:"reference,omitempty"`
	VerificationPhrase *string `json:"verificationPhrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// PartnerLoadMatch is the typed request payload for Partner.LoadTyped.
type PartnerLoadMatch struct {
	Id string `json:"id"`
}

// PartnerListMatch is the typed request payload for Partner.ListTyped.
type PartnerListMatch struct {
	Partner *string `json:"partner,omitempty"`
	Skip *int `json:"skip,omitempty"`
	Take *int `json:"take,omitempty"`
}

// PartnerCreateData is the typed request payload for Partner.CreateTyped.
type PartnerCreateData struct {
	BillingId string `json:"billing_id"`
	ContactEmail string `json:"contact_email"`
	ContactFirstName string `json:"contact_first_name"`
	ContactIsActive bool `json:"contact_is_active"`
	ContactLastName string `json:"contact_last_name"`
	ContactPhone string `json:"contact_phone"`
	ContactSendWelcomeEmail bool `json:"contact_send_welcome_email"`
	ContactUserName string `json:"contact_user_name"`
	ContactUserRole string `json:"contact_user_role"`
	IsActive bool `json:"is_active"`
	Name string `json:"name"`
	ParentId *int `json:"parent_id,omitempty"`
	ParentName *string `json:"parent_name,omitempty"`
	Reference string `json:"reference"`
	VerificationPhrase *string `json:"verification_phrase,omitempty"`
	BillingId2 *string `json:"billingId,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive2 *bool `json:"isActive,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	VerificationPhrase2 *string `json:"verificationPhrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// Template is the typed data model for the template entity.
type Template struct {
	AccessMode *any `json:"accessMode,omitempty"`
	Active *bool `json:"active,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	FieldTemplates *[]any `json:"fieldTemplates,omitempty"`
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	Options *map[string]any `json:"options,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *int `json:"version,omitempty"`
}

// TemplateLoadMatch is the typed request payload for Template.LoadTyped.
type TemplateLoadMatch struct {
	Id string `json:"id"`
}

// TemplateListMatch is the typed request payload for Template.ListTyped.
type TemplateListMatch struct {
	Client *string `json:"client,omitempty"`
	Partner *string `json:"partner,omitempty"`
	Skip *int `json:"skip,omitempty"`
	Take *int `json:"take,omitempty"`
}

// TemplateCreateData is the typed request payload for Template.CreateTyped.
type TemplateCreateData struct {
	AccessMode *string `json:"access_mode,omitempty"`
	Active bool `json:"active"`
	ClientId int `json:"client_id"`
	ClientName string `json:"client_name"`
	FieldTemplate *[]any `json:"field_template,omitempty"`
	Name string `json:"name"`
	OptionsCustomStyle *string `json:"options_custom_style,omitempty"`
	OptionsCustomStyleFile *string `json:"options_custom_style_file,omitempty"`
	OptionsDomain *[]any `json:"options_domain,omitempty"`
	OptionsSecurityActiveFrom *string `json:"options_security_active_from,omitempty"`
	OptionsSecurityActiveTo *string `json:"options_security_active_to,omitempty"`
	OptionsSecurityIrreversible *bool `json:"options_security_irreversible,omitempty"`
	PartnerId int `json:"partner_id"`
	PartnerName string `json:"partner_name"`
	Reference string `json:"reference"`
	Type *string `json:"type,omitempty"`
	Version *int `json:"version,omitempty"`
	AccessMode2 *any `json:"accessMode,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	FieldTemplates *[]any `json:"fieldTemplates,omitempty"`
	Id *int `json:"id,omitempty"`
	Options *map[string]any `json:"options,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
}

// TemplateRemoveMatch is the typed request payload for Template.RemoveTyped.
type TemplateRemoveMatch struct {
	Id string `json:"id"`
}

// Transaction is the typed data model for the transaction entity.
type Transaction struct {
	Bfid *string `json:"bfid,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	CompleteDate *string `json:"completeDate,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	ErrCode *string `json:"errCode,omitempty"`
	ErrMessage *string `json:"errMessage,omitempty"`
	Id *int `json:"id,omitempty"`
	IpAddress *string `json:"ipAddress,omitempty"`
	MessageId *string `json:"messageId,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	Success *bool `json:"success,omitempty"`
	TemplateId *string `json:"templateId,omitempty"`
}

// TransactionLoadMatch is the typed request payload for Transaction.LoadTyped.
type TransactionLoadMatch struct {
	Id string `json:"id"`
	TransactionType *string `json:"transaction_type,omitempty"`
}

// TransactionListMatch is the typed request payload for Transaction.ListTyped.
type TransactionListMatch struct {
	Client *string `json:"client,omitempty"`
	DateFrom *string `json:"date_from,omitempty"`
	DateTo *string `json:"date_to,omitempty"`
	MessageId *string `json:"message_id,omitempty"`
	PagingMode *string `json:"paging_mode,omitempty"`
	Partner *string `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	Skip *int `json:"skip,omitempty"`
	Success *bool `json:"success,omitempty"`
	Take *int `json:"take,omitempty"`
	TransactionType *string `json:"transaction_type,omitempty"`
}

// UpdateResult is the typed data model for the update_result entity.
type UpdateResult struct {
	BillingId *string `json:"billingId,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Contact map[string]any `json:"contact"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	Email string `json:"email"`
	FirstName string `json:"firstName"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	LastName string `json:"lastName"`
	Mid *string `json:"mid,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone string `json:"phone"`
	Reference *string `json:"reference,omitempty"`
	SendWelcomeEmail *bool `json:"sendWelcomeEmail,omitempty"`
	UserName string `json:"userName"`
	UserRole map[string]any `json:"userRole"`
	VerificationPhrase *string `json:"verificationPhrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UpdateResultListMatch is the typed request payload for UpdateResult.ListTyped.
type UpdateResultListMatch struct {
	Client *string `json:"client,omitempty"`
	Partner *string `json:"partner,omitempty"`
	Skip *int `json:"skip,omitempty"`
	Take *int `json:"take,omitempty"`
}

// UpdateResultCreateData is the typed request payload for UpdateResult.CreateTyped.
type UpdateResultCreateData struct {
	Client *map[string]any `json:"client,omitempty"`
	Email string `json:"email"`
	FirstName string `json:"first_name"`
	IsActive bool `json:"is_active"`
	LastName string `json:"last_name"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone int `json:"phone"`
	SendWelcomeEmail bool `json:"send_welcome_email"`
	UserRole map[string]any `json:"user_role"`
	Username string `json:"username"`
	BillingId *string `json:"billingId,omitempty"`
	Contact map[string]any `json:"contact"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	FirstName2 string `json:"firstName"`
	Id *int `json:"id,omitempty"`
	IsActive2 *bool `json:"isActive,omitempty"`
	LastName2 string `json:"lastName"`
	Mid *string `json:"mid,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	Reference *string `json:"reference,omitempty"`
	SendWelcomeEmail2 *bool `json:"sendWelcomeEmail,omitempty"`
	UserName string `json:"userName"`
	UserRole2 map[string]any `json:"userRole"`
	VerificationPhrase *string `json:"verificationPhrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UpdateResultUpdateData is the typed request payload for UpdateResult.UpdateTyped.
type UpdateResultUpdateData struct {
	Id string `json:"id"`
	AccessMode *string `json:"access_mode,omitempty"`
	Active *bool `json:"active,omitempty"`
	ClientId *int `json:"client_id,omitempty"`
	ClientName *string `json:"client_name,omitempty"`
	FieldTemplate *[]any `json:"field_template,omitempty"`
	Name *string `json:"name,omitempty"`
	OptionsCustomStyle *string `json:"options_custom_style,omitempty"`
	OptionsCustomStyleFile *string `json:"options_custom_style_file,omitempty"`
	OptionsDomain *[]any `json:"options_domain,omitempty"`
	OptionsSecurityActiveFrom *string `json:"options_security_active_from,omitempty"`
	OptionsSecurityActiveTo *string `json:"options_security_active_to,omitempty"`
	OptionsSecurityIrreversible *bool `json:"options_security_irreversible,omitempty"`
	PartnerId *int `json:"partner_id,omitempty"`
	PartnerName *string `json:"partner_name,omitempty"`
	Reference *string `json:"reference,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *int `json:"version,omitempty"`
	BillingId *string `json:"billing_id,omitempty"`
	ContactId *int `json:"contact_id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	ParentId *int `json:"parent_id,omitempty"`
	ParentName *string `json:"parent_name,omitempty"`
	VerificationPhrase *string `json:"verification_phrase,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Email *string `json:"email,omitempty"`
	FirstName *string `json:"first_name,omitempty"`
	LastName *string `json:"last_name,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone *int `json:"phone,omitempty"`
	SendWelcomeEmail *bool `json:"send_welcome_email,omitempty"`
	Username *string `json:"username,omitempty"`
	DirectPartnerId *int `json:"direct_partner_id,omitempty"`
	DirectPartnerName *string `json:"direct_partner_name,omitempty"`
	Mid *string `json:"mid,omitempty"`
	BillingId2 *string `json:"billingId,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	DirectPartner *map[string]any `json:"directPartner,omitempty"`
	FirstName2 *string `json:"firstName,omitempty"`
	IsActive2 *bool `json:"isActive,omitempty"`
	LastName2 *string `json:"lastName,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	SendWelcomeEmail2 *bool `json:"sendWelcomeEmail,omitempty"`
	UserName *string `json:"userName,omitempty"`
	UserRole *map[string]any `json:"userRole,omitempty"`
	VerificationPhrase2 *string `json:"verificationPhrase,omitempty"`
}

// User is the typed data model for the user entity.
type User struct {
	Client *map[string]any `json:"client,omitempty"`
	Created *string `json:"created,omitempty"`
	Email *string `json:"email,omitempty"`
	FirstName *string `json:"firstName,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"isActive,omitempty"`
	LastName *string `json:"lastName,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone *string `json:"phone,omitempty"`
	UserName *string `json:"userName,omitempty"`
	UserRole *map[string]any `json:"userRole,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UserLoadMatch is the typed request payload for User.LoadTyped.
type UserLoadMatch struct {
	Id string `json:"id"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
