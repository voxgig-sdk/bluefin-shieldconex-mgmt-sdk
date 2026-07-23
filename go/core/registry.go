package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewClientEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewCloneEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewPartnerEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewTemplateEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewTransactionEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewUpdateResultEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

var NewUserEntityFunc func(client *BluefinShieldconexMgmtSDK, entopts map[string]any) BluefinShieldconexMgmtEntity

