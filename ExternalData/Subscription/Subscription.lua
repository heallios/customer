function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Subscription/Subscription.prefab",
		Config = "",
		Anchor = "Front",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _btnLobbyPath = "TopBar/group_btn_Cancel/btn_Cancel"
local _coinTxtPath = "TopBar/txt_Coin/txt_Value"
local _gemTxtPath ="TopBar/txt_Gem/txt_Value"
local _energyTxtPath ="TopBar/txt_Energy/txt_Value"

local _regularBtnPath = "body/GroupItem/regular"
local _normalBtnPath = "body/GroupItem/normal"
local _premiumBtnPath = "body/GroupItem/premium"
local _oldBtnPath = "body/timeBg/oldBtn"

local _regularTxtPath = "body/GroupItem/regular/Price"
local _normalTxtPath = "body/GroupItem/normal/Price"
local _premiumTxtPath = "body/GroupItem/premium/Price"

local _btnLobby = nil
local _coinTxt = nil
local _gemTxt = nil
local _energyTxt = nil

local _regularBtn = nil
local _normalBtn = nil
local _premiumBtn = nil
local _oldBtn = nil

local _regularIndex = 1
local _normalIndex = 2
local _premiumIndex = 3

local _isShowPass = false

local _objPopup = "Popup"
local _btnClosePopupOutScreen ="Popup/btnCloseOutOfScreen"
local _btnClosePopup ="Popup/BgPopup/btnClose"
local _btnOkPopup = "Popup/BgPopup/BtnOk"
local _titlePopup = "Popup/BgPopup/title"
local _txtDesPopup = "Popup/BgPopup/des_Login"

local _objCreate = "Create"
local _btnRegister = "Create/Body/ObjCreate/btnCreateAccount"
local _inputFieldUserNameRegister = "Create/Body/ObjCreate/inputFileldUserName"
local _inputFieldEmailRegister = "Create/Body/ObjCreate/inputFileldEmail"
local _inputFieldPasswordRegister = "Create/Body/ObjCreate/inputFileldPassWord"
local _inputFieldRePasswordRegister = "Create/Body/ObjCreate/inputFileldRePassWord"
local _buttonShowPassRegister = "Create/Body/ObjCreate/inputFileldPassWord/btnShowPass"
local _buttonShowRePassRegister = "Create/Body/ObjCreate/inputFileldRePassWord/btnShowPass"
local _buttonBack = "Create/BtnBack"

local _popupCreate = "body/PopupCreate"
local _closePopupCreate1 = "body/PopupCreate"
local _closePopupCreate2 = "body/PopupCreate/BgPopup/btnClose"
local _btnCreate = "body/PopupCreate/BgPopup/BtnOk"

function OnReady()
	FindUI()
	SetUpButton()

	SetButtonClosePopupCreate(_closePopupCreate1)
	SetButtonClosePopupCreate(_closePopupCreate2)
	SetButtonClosePopupCreate(_btnCreate)
	SetButtonOpenCreatePanel(_btnCreate)

	SetButtonCloseCreatePanel(_buttonBack)

	SelectInputField(_inputFieldUserNameRegister)
	SelectInputField(_inputFieldEmailRegister)
	SetButtonShowPass(_buttonShowPassRegister,_inputFieldPasswordRegister)
	SetButtonShowPass(_buttonShowRePassRegister,_inputFieldRePasswordRegister)

	SetupButtonRegister(_btnRegister)

	SetupButtonClosePopupWrong(_btnClosePopupOutScreen)
	SetupButtonClosePopupWrong(_btnClosePopup)
	SetupButtonClosePopupWrong(_btnOkPopup)
end

function FindUI()
	_btnLobby = LuaGo.Find(_btnLobbyPath)
	_coinTxt = LuaGo.Find(_coinTxtPath)
	_gemTxt = LuaGo.Find(_gemTxtPath)
	_energyTxt = LuaGo.Find(_energyTxtPath)

	_regularBtn = LuaGo.Find(_regularBtnPath)
	_normalBtn = LuaGo.Find(_normalBtnPath)
	_premiumBtn = LuaGo.Find(_premiumBtnPath)
	_oldBtn = LuaGo.Find(_oldBtnPath)
end

function SetUpButton()
	_btnLobby.UnregisterButtonPressedCallback()
	_btnLobby.RegisterButtonPressedCallback(function ()
		Subscription.LuaCall_BackLobby()
    end)

	_regularBtn.UnregisterButtonPressedCallback()
	_regularBtn.RegisterButtonPressedCallback(function ()
		Subscription.LuaCall_BuySubscription(_regularIndex)
    end)

	_normalBtn.UnregisterButtonPressedCallback()
	_normalBtn.RegisterButtonPressedCallback(function ()
		Subscription.LuaCall_BuySubscription(_normalIndex)
    end)

	_premiumBtn.UnregisterButtonPressedCallback()
	_premiumBtn.RegisterButtonPressedCallback(function ()
		Subscription.LuaCall_BuySubscription(_premiumIndex)
    end)

	_oldBtn.UnregisterButtonPressedCallback()
	_oldBtn.RegisterButtonPressedCallback(function ()
		Subscription.LuaCall_BuySubscriptionOld()
    end)
end

function Refresh()
	UpdateCurrency()
end

function UpdateCurrency()
	_coinTxt.SetText(tostring(Subscription.Model.Gold))
	_gemTxt.SetText(tostring(Subscription.Model.Gem))
	_energyTxt.SetText(tostring(Subscription.Model.Energy))
end

function SetPrice(regular, normal, premium)
	local regularTxt = LuaGo.Find(_regularTxtPath)
	regularTxt.SetText(regular)
	local normalTxt = LuaGo.Find(_normalTxtPath)
	normalTxt.SetText(normal)
	local premiumTxt = LuaGo.Find(_premiumTxtPath)
	premiumTxt.SetText(premium)
end

function SetActivePopup(isActive,titlePopup,desPopup)
	local objPop = LuaGo.Find(_objPopup)
	objPop.SetActive(isActive)
	if(isActive) then
		local title = LuaGo.Find(_titlePopup)
		title.SetText(titlePopup)
		local des = LuaGo.Find(_txtDesPopup)
		des.SetText(desPopup)
	end	
end

function SetupButtonClosePopup(btnpath)
	local btn = LuaGo.Find(btnpath)
	btn.RegisterButtonPressedCallback(function ()
		Subscription.LuaCall_ClosePopup()		
	end)
end

function CallRegisterAccount()
	local inputUserName = LuaGo.Find(_inputFieldUserNameRegister)
	local textUserName = inputUserName.GetText()

	local inputEmailRegister = LuaGo.Find(_inputFieldEmailRegister)
	local textInputMailRegister = inputEmailRegister.GetText()
	
	local inputPassword = LuaGo.Find(_inputFieldPasswordRegister)
	local textInputPassword = inputPassword.GetText()

	local inputRePassword = LuaGo.Find(_inputFieldRePasswordRegister)
	local textInputRePassword = inputRePassword.GetText()
	Subscription.LuaCall_Register(textUserName,textInputMailRegister,textInputPassword,textInputRePassword)
end

function SetupButtonRegister(btnpath)
	local btn = LuaGo.Find(btnpath)
	btn.RegisterButtonPressedCallback(function ()
		CallRegisterAccount()
	end)
end

function SetSpriteButtonShowPass(btnPath)
	local btn = LuaGo.Find(btnPath)
	if _isShowPass then
		btn.SetSprite("icon_eye_",btn)
		_isShowPass = false
	else		
		btn.SetSprite("icon_eye_1",btn)
		_isShowPass = true
	end
end

function ShowPassClick(pathInputField)
	local obj = LuaGo.Find(pathInputField)
	obj.SwitchInputFieldPassType(obj)
end

function SetButtonShowPass(btnPath,pathInputField )
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		ShowPassClick(pathInputField)
		btn.SetSprite("",icon_eye_1)
		SetSpriteButtonShowPass(btnPath)
    end)
end

function SelectInputField(inputField)
	local obj = LuaGo.Find(inputField)
	obj.RegisterEventTriggerPointerClickCallback(function ()
		SetInputFieldImage("enter text_choose", inputField)
    end)

	obj.RegisterInputFieldEndEditCallback(function ()
		SetInputFieldImage("enter text", inputField)
    end)
end

function SetInputFieldImage(image, inputField)
	local obj = LuaGo.Find(inputField)
	obj.SetSprite(image,obj)
end

function SetActiveObjCreate(isActive)
	local objCreate = LuaGo.Find(_objCreate)
	objCreate.SetActive(isActive)	
end

function ActivePopupCreate(isActive)
	local popup = LuaGo.Find(_popupCreate)
	popup.SetActive(isActive)
end

function SetupButtonClosePopupWrong(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		SetActivePopup(false, "", "")	
    end)
end

function SetButtonClosePopupCreate(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		ActivePopupCreate(false)	
    end)
end

function SetButtonCloseCreatePanel(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		SetActiveObjCreate(false)	
    end)
end

function SetButtonOpenCreatePanel(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		SetActiveObjCreate(true)	
    end)
end

function Hide()
end
