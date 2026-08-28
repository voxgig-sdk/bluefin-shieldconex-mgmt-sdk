package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewAuditFeatureFunc func() Feature

var NewClienttrackFeatureFunc func() Feature

var NewIdempotencyFeatureFunc func() Feature

var NewLogFeatureFunc func() Feature

var NewMetricsFeatureFunc func() Feature

var NewPagingFeatureFunc func() Feature

var NewRatelimitFeatureFunc func() Feature

var NewRetryFeatureFunc func() Feature

var NewTelemetryFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewTimeoutFeatureFunc func() Feature

var NewClientEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewCloneEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewPartnerEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewTemplateEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewTransactionEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewUpdateResultEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewUserEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

