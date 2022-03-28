


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Login/Login.prefab",
		Config = ""
    }
end



local _buttonsLoginGuestPath = "Login/Bot/btnLoginGuest"
local _btnCreateNow = "Login/Body/ObjLogin/btnCreateNow"

local _inputFieldNamePath = "Login/Body/ObjLogin/inputFileldUserName"
local _inputFieldPassPath = "Login/Body/ObjLogin/inputFileldPassWord"

local _inputBtnLogin ="Login/Body/ObjLogin/btnLogin"

local _txtVersion = "Login/Bot/txtInfoApp"
local _txtVersionBg = "Login/Bot/iconBg"
local _versionBtnLogin = "Login/Bot/iconBtn"

local _buttonShowPassPath = "Login/Body/ObjLogin/inputFileldPassWord/btnShowPass"

local _objCreate = "Create"
local _objLogin ="Login"
local _objPopup = "Popup"
local _versionBtnCreate = "Create/Bot/iconBtn"


local _btnRegister = "Create/Body/ObjCreate/btnCreateAccount"
local _inputFieldUserNameRegister = "Create/Body/ObjCreate/inputFileldUserName"
local _inputFieldEmailRegister = "Create/Body/ObjCreate/inputFileldEmail"
local _inputFieldPasswordRegister = "Create/Body/ObjCreate/inputFileldPassWord"
local _inputFieldRePasswordRegister = "Create/Body/ObjCreate/inputFileldRePassWord"
local _buttonShowPassRegister = "Create/Body/ObjCreate/inputFileldPassWord/btnShowPass"
local _buttonShowRePassRegister = "Create/Body/ObjCreate/inputFileldRePassWord/btnShowPass"
local _buttonBack = "Create/BtnBack"

local _btnClosePopupOutScreen ="Popup/btnCloseOutOfScreen"
local _btnClosePopup ="Popup/BgPopup/btnClose"
local _btnOkPopup = "Popup/BgPopup/BtnOk"
local _titlePopup = "Popup/BgPopup/title"
local _txtDesPopup = "Popup/BgPopup/des_Login"



local _isShowPass = false

local _isActiveInfo = false

function OnReady()
	
	SetupButtonLoginGuest(_buttonsLoginGuestPath)
	SelectInputField(_inputFieldNamePath)
	SelectInputField(_inputFieldPassPath)
	SelectInputField(_inputFieldPasswordRegister)
	SelectInputField(_inputFieldRePasswordRegister)
	SetButtonShowPass(_buttonShowPassPath,_inputFieldPassPath)
	SetButtonShowPass(_buttonShowPassRegister,_inputFieldPasswordRegister)
	SetButtonShowPass(_buttonShowRePassRegister,_inputFieldRePasswordRegister)

	SetActiveInfoObject(_isActiveInfo)
	SetButtonInfo(_versionBtnLogin)
	--SetButtonInfo(_versionBtnCreate)
	SetActiveObjCreate(false)
	SetActivePopup(false,"","")
	SetupButtonCreateNow(_btnCreateNow)
	SetupButtonRegister(_btnRegister)
	SetupButtonClosePopup(_btnClosePopupOutScreen)
	SetupButtonClosePopup(_btnClosePopup)
	SetupButtonClosePopup(_btnOkPopup)
	SetupButtonLogin(_inputBtnLogin)
	SetupButtonBackRegister(_buttonBack)

end

function SetupButtonBackRegister(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		SetActiveObjCreate(false)
		SetActivePopup(false,"","")
	end)
end

function SetupButtonLoginGuest(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Login.LuaCall_CreateGuestPlayer()
		--SetText(_inputFieldNamePath)

    end)
end
function SetupButtonLogin(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		CallLogin() 
	end)
	
end

function SelectInputField(inputField)
	Log(inputField)
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

function GetText(btnPath)
	local textObj = LuaGo.Find(btnPath)
	local text = textObj.GetText()
	Login.LuaCall_LoginGuest_OnClicked(text)
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
function SetupButtonCreateNow(btnpath)
	local btn = LuaGo.Find(btnpath)
	btn.RegisterButtonPressedCallback(function ()
		Login.LuaCall_CreateNow()
		
	end)
	
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

function SetActiveInfo()
	if _isActiveInfo then
		_isActiveInfo = false		
	else
		_isActiveInfo = true
	end

	SetActiveInfoObject(_isActiveInfo)
end
  
function SetAppVersion(version)
	local objVersion = LuaGo.Find(_txtVersion)
	objVersion.SetText(version,objVersion)
end

function SetActiveInfoObject(isActive)
	local obj1 = LuaGo.Find(_txtVersion)
	local obj2 = LuaGo.Find(_txtVersionBg)

	obj1.SetActive(isActive)
	obj2.SetActive(isActive)
end

function SetButtonInfo(btnpath)
	local btn = LuaGo.Find(btnpath)
	btn.RegisterButtonPressedCallback(function ()
		SetActiveInfo()	
    end)
end
function SetActiveObjCreate(isActive)
	local objCreate = LuaGo.Find(_objCreate)
	objCreate.SetActive(isActive)
	
end
function ShowCreateNowPanel()
	SetActiveObjCreate(true)
	
end
function CloseCreateNowPanel()
	SetActiveObjCreate(false)
	
	

end
function SetupButtonClosePopup(btnpath)
	local btn = LuaGo.Find(btnpath)
	btn.RegisterButtonPressedCallback(function ()
		Login.LuaCall_ClosePopup()
		
	end)
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
function CallLogin()
	local inputTextMailObj = LuaGo.Find(_inputFieldNamePath)
	local textMail = inputTextMailObj.GetText()

	local inputPassObj = LuaGo.Find(_inputFieldPassPath)
	local textpass = inputPassObj.GetText()
	Login.LuaCall_Login(textMail,textpass)
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
	Login.LuaCall_Register(textUserName,textInputMailRegister,textInputPassword,textInputRePassword)
end
function Hide()
end
