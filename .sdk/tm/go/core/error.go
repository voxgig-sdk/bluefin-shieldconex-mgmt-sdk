package core

type BluefinShieldconexMgmtError struct {
	IsBluefinShieldconexMgmtError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewBluefinShieldconexMgmtError(code string, msg string, ctx *Context) *BluefinShieldconexMgmtError {
	return &BluefinShieldconexMgmtError{
		IsBluefinShieldconexMgmtError: true,
		Sdk:              "BluefinShieldconexMgmt",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *BluefinShieldconexMgmtError) Error() string {
	return e.Msg
}
