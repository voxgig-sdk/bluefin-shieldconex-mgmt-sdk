// Typed models for the BluefinShieldconexMgmt SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Client is the typed data model for the client entity.
type Client struct {
	BillingId *string `json:"billing_id,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	DirectPartner *map[string]any `json:"direct_partner,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
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
	BillingId *string `json:"billing_id,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	DirectPartner *map[string]any `json:"direct_partner,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	Mid *string `json:"mid,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Version *int `json:"version,omitempty"`
}

// ClientCreateData is the typed request payload for Client.CreateTyped.
type ClientCreateData struct {
	BillingId *string `json:"billing_id,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	DirectPartner *map[string]any `json:"direct_partner,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	Mid *string `json:"mid,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
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
}

// Partner is the typed data model for the partner entity.
type Partner struct {
	BillingId *string `json:"billing_id,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	Reference *string `json:"reference,omitempty"`
	VerificationPhrase *string `json:"verification_phrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// PartnerLoadMatch is the typed request payload for Partner.LoadTyped.
type PartnerLoadMatch struct {
	Id string `json:"id"`
}

// PartnerListMatch is the typed request payload for Partner.ListTyped.
type PartnerListMatch struct {
	BillingId *string `json:"billing_id,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	Reference *string `json:"reference,omitempty"`
	VerificationPhrase *string `json:"verification_phrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// PartnerCreateData is the typed request payload for Partner.CreateTyped.
type PartnerCreateData struct {
	BillingId *string `json:"billing_id,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	Created *string `json:"created,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	Reference *string `json:"reference,omitempty"`
	VerificationPhrase *string `json:"verification_phrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// Template is the typed data model for the template entity.
type Template struct {
	AccessMode *any `json:"access_mode,omitempty"`
	Active *bool `json:"active,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	FieldTemplate *[]any `json:"field_template,omitempty"`
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	Option *map[string]any `json:"option,omitempty"`
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
	AccessMode *any `json:"access_mode,omitempty"`
	Active *bool `json:"active,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	FieldTemplate *[]any `json:"field_template,omitempty"`
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	Option *map[string]any `json:"option,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *int `json:"version,omitempty"`
}

// TemplateCreateData is the typed request payload for Template.CreateTyped.
type TemplateCreateData struct {
	AccessMode *any `json:"access_mode,omitempty"`
	Active *bool `json:"active,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	FieldTemplate *[]any `json:"field_template,omitempty"`
	Id *int `json:"id,omitempty"`
	Name *string `json:"name,omitempty"`
	Option *map[string]any `json:"option,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	Type *string `json:"type,omitempty"`
	Version *int `json:"version,omitempty"`
}

// TemplateRemoveMatch is the typed request payload for Template.RemoveTyped.
type TemplateRemoveMatch struct {
	Id string `json:"id"`
}

// Transaction is the typed data model for the transaction entity.
type Transaction struct {
	Bfid *string `json:"bfid,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	CompleteDate *string `json:"complete_date,omitempty"`
	DirectPartner *map[string]any `json:"direct_partner,omitempty"`
	ErrCode *string `json:"err_code,omitempty"`
	ErrMessage *string `json:"err_message,omitempty"`
	Id *int `json:"id,omitempty"`
	IpAddress *string `json:"ip_address,omitempty"`
	MessageId *string `json:"message_id,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	Success *bool `json:"success,omitempty"`
	TemplateId *string `json:"template_id,omitempty"`
}

// TransactionLoadMatch is the typed request payload for Transaction.LoadTyped.
type TransactionLoadMatch struct {
	Id string `json:"id"`
}

// TransactionListMatch is the typed request payload for Transaction.ListTyped.
type TransactionListMatch struct {
	Bfid *string `json:"bfid,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	CompleteDate *string `json:"complete_date,omitempty"`
	DirectPartner *map[string]any `json:"direct_partner,omitempty"`
	ErrCode *string `json:"err_code,omitempty"`
	ErrMessage *string `json:"err_message,omitempty"`
	Id *int `json:"id,omitempty"`
	IpAddress *string `json:"ip_address,omitempty"`
	MessageId *string `json:"message_id,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Reference *string `json:"reference,omitempty"`
	Success *bool `json:"success,omitempty"`
	TemplateId *string `json:"template_id,omitempty"`
}

// UpdateResult is the typed data model for the update_result entity.
type UpdateResult struct {
	BillingId *string `json:"billing_id,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Contact map[string]any `json:"contact"`
	DirectPartner *map[string]any `json:"direct_partner,omitempty"`
	Email string `json:"email"`
	FirstName string `json:"first_name"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	LastName string `json:"last_name"`
	Mid *string `json:"mid,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone string `json:"phone"`
	Reference *string `json:"reference,omitempty"`
	SendWelcomeEmail *bool `json:"send_welcome_email,omitempty"`
	UserName string `json:"user_name"`
	UserRole map[string]any `json:"user_role"`
	VerificationPhrase *string `json:"verification_phrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UpdateResultListMatch is the typed request payload for UpdateResult.ListTyped.
type UpdateResultListMatch struct {
	BillingId *string `json:"billing_id,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Contact *map[string]any `json:"contact,omitempty"`
	DirectPartner *map[string]any `json:"direct_partner,omitempty"`
	Email *string `json:"email,omitempty"`
	FirstName *string `json:"first_name,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	LastName *string `json:"last_name,omitempty"`
	Mid *string `json:"mid,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone *string `json:"phone,omitempty"`
	Reference *string `json:"reference,omitempty"`
	SendWelcomeEmail *bool `json:"send_welcome_email,omitempty"`
	UserName *string `json:"user_name,omitempty"`
	UserRole *map[string]any `json:"user_role,omitempty"`
	VerificationPhrase *string `json:"verification_phrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UpdateResultCreateData is the typed request payload for UpdateResult.CreateTyped.
type UpdateResultCreateData struct {
	BillingId *string `json:"billing_id,omitempty"`
	Client *map[string]any `json:"client,omitempty"`
	Contact map[string]any `json:"contact"`
	DirectPartner *map[string]any `json:"direct_partner,omitempty"`
	Email string `json:"email"`
	FirstName string `json:"first_name"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	LastName string `json:"last_name"`
	Mid *string `json:"mid,omitempty"`
	Name *string `json:"name,omitempty"`
	Parent *map[string]any `json:"parent,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone string `json:"phone"`
	Reference *string `json:"reference,omitempty"`
	SendWelcomeEmail *bool `json:"send_welcome_email,omitempty"`
	UserName string `json:"user_name"`
	UserRole map[string]any `json:"user_role"`
	VerificationPhrase *string `json:"verification_phrase,omitempty"`
	Version *int `json:"version,omitempty"`
}

// UpdateResultUpdateData is the typed request payload for UpdateResult.UpdateTyped.
type UpdateResultUpdateData struct {
	Id string `json:"id"`
}

// User is the typed data model for the user entity.
type User struct {
	Client *map[string]any `json:"client,omitempty"`
	Created *string `json:"created,omitempty"`
	Email *string `json:"email,omitempty"`
	FirstName *string `json:"first_name,omitempty"`
	Id *int `json:"id,omitempty"`
	IsActive *bool `json:"is_active,omitempty"`
	LastName *string `json:"last_name,omitempty"`
	Modified *string `json:"modified,omitempty"`
	Partner *map[string]any `json:"partner,omitempty"`
	Phone *string `json:"phone,omitempty"`
	UserName *string `json:"user_name,omitempty"`
	UserRole *map[string]any `json:"user_role,omitempty"`
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

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
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

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
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
