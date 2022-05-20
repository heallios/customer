


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Login/Login.prefab",
		Config = ""
    }
end



local _buttonsLoginGuestPath = "Login/Bot/btnLoginGuest"
local _btnCreateNow = "Login/Body/ObjLogin/btnCreateNow"
local _btnForgotPass ="Login/Body/ObjLogin/btnForgotPassWord"

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

local _btnSendForgot ="ForgotPass/Body/ObjLogin/objSendMail/btnSendMail"
local _inputFieldEmailForgot="ForgotPass/Body/ObjLogin/objSendMail/inputFiledEmailForgot"
local _objPopupForgotPass ="ForgotPass"
local _txtTitleForgot = "ForgotPass/Body/ObjLogin/objSendOtp/txtTitle"
local _txtTileNote="ForgotPass/Body/ObjLogin/objSendOtp/txtTitle/txtTitle2"
local _btnResentMail= "ForgotPass/Body/ObjLogin/objSendOtp/btnResendCode"
local _objSendMail = "ForgotPass/Body/ObjLogin/objSendMail"
local _objSendOTP = "ForgotPass/Body/ObjLogin/objSendOtp"
local _btnCheckOtp="ForgotPass/Body/ObjLogin/objSendOtp/btnCheckOtp"
local _objNewPass= "ForgotPass/Body/ObjLogin/objNewPass"
local _inputCode = "ForgotPass/Body/ObjLogin/objSendOtp/inputFiledCode"
local _inputFieldNewPass ="ForgotPass/Body/ObjLogin/objNewPass/inputFileldPassWord"
local _inputFieldConfirmNewPass="ForgotPass/Body/ObjLogin/objNewPass/inputFileldRePassWord"
local _btnChangePass = "ForgotPass/Body/ObjLogin/objNewPass/btnChangePass"
local _btnBackForgot = "ForgotPass/btnBackForgot"
local _btnBackPopupForgot= "ForgotPass/btnBackPopupForgot"

local _inputCode1 = "ForgotPass/Body/ObjLogin/objSendOtp/grid/inputFiledCode1"
local _inputCode2 = "ForgotPass/Body/ObjLogin/objSendOtp/grid/inputFiledCode2"
local _inputCode3 = "ForgotPass/Body/ObjLogin/objSendOtp/grid/inputFiledCode3"
local _inputCode4 = "ForgotPass/Body/ObjLogin/objSendOtp/grid/inputFiledCode4"
local _inputCode5 = "ForgotPass/Body/ObjLogin/objSendOtp/grid/inputFiledCode5"
local _inputCode6 = "ForgotPass/Body/ObjLogin/objSendOtp/grid/inputFiledCode6"
local _inputCode7 = "ForgotPass/Body/ObjLogin/objSendOtp/grid/inputFiledCode7"

local arrInput = {
	_inputCode1,
	_inputCode2,
	_inputCode3,
	_inputCode4,
	_inputCode5,
	_inputCode6,
	_inputCode7
}


local _isShowPass = false

local _isActiveInfo = false

function OnReady()
	
	SetupButtonLoginGuest(_buttonsLoginGuestPath)
	SelectInputField(_inputFieldNamePath)
	SelectInputField(_inputFieldPassPath)
	SelectInputField(_inputFieldPasswordRegister)
	SelectInputField(_inputFieldRePasswordRegister)
	SelectInputField(_inputFieldEmailForgot)
	SelectInputField(_inputFieldNewPass)
	SelectInputField(_inputFieldConfirmNewPass)
	SelectInputField(_inputCode)

	SelectInputField(_inputFieldUserNameRegister)
	SelectInputField(_inputFieldEmailRegister)
	SetButtonShowPass(_buttonShowPassPath,_inputFieldPassPath)
	SetButtonShowPass(_buttonShowPassRegister,_inputFieldPasswordRegister)
	SetButtonShowPass(_buttonShowRePassRegister,_inputFieldRePasswordRegister)

	SetActiveInfoObject(_isActiveInfo)
	SetButtonInfo(_versionBtnLogin)
	--SetButtonInfo(_versionBtnCreate)
	SetUnActivePopup()
	SetActivePopup(false,"","")
	SetupButtonCreateNow(_btnCreateNow)
	SetupButtonRegister(_btnRegister)
	SetupButtonClosePopup(_btnClosePopupOutScreen)
	SetupButtonClosePopup(_btnClosePopup)
	SetupButtonClosePopup(_btnOkPopup)
	SetupButtonLogin(_inputBtnLogin)
	SetupButtonBackRegister(_buttonBack)
	SetupButtonResendMail()
	SetupButtonForgotPass()
	SetupButtonSendEmail()
	SetupButtonCheckOtp()
	SetupButtonChangePass()
	SetupButtonBackForgot()
	SetupButtonBackPopupScrenForgot()
	GetInputField()

end
function GetInputField()
	local arrObj = {}
	for i = 1,7  do
		local go = LuaGo.Find(arrInput[i])
		local input = go.GetInputFieldTMPro()
		arrObj[i] = input
	end
	Login.LuaCall_GetObjInputField(arrObj)
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
function SetupButtonForgotPass()
	local btn = LuaGo.Find(_btnForgotPass)
	local objSendMail = LuaGo.Find(_objSendMail)
	local objResendCode = LuaGo.Find(_objSendOTP)
	local objNewPass = LuaGo.Find(_objNewPass)
	btn.RegisterButtonPressedCallback(function ()
		local objForgot = LuaGo.Find(_objPopupForgotPass)
		objForgot.SetActive(true)
		objSendMail.SetActive(true)
		objResendCode.SetActive(false)
		objNewPass.SetActive(false)
		local btnBackPopupForgot = LuaGo.Find(_btnBackPopupForgot)
		btnBackPopupForgot.SetActive(false)
		Login.LuaCall_GetObjSendMail(objSendMail)

	end)
end
function SetupButtonSendEmail()
	local btn = LuaGo.Find(_btnSendForgot)
	
	btn.RegisterButtonPressedCallback(function ()
		local inputmailForgot = LuaGo.Find(_inputFieldEmailForgot)
		local mail = inputmailForgot.GetText()
		Login.LuaCall_SendMail(mail)
	end)
	
end
function SetupButtonResendMail()
	local btn = LuaGo.Find(_btnResentMail)
	btn.RegisterButtonPressedCallback(function ()
		Login.LuaCall_ResendMail()
	end)
end
function SetupButtonCheckOtp()
	local btn = LuaGo.Find(_btnCheckOtp)
	
	btn.RegisterButtonPressedCallback(function ()
		Login.LuaCall_CheckOTP()
	end)
end
function SetupButtonChangePass()
	local btn = LuaGo.Find(_btnChangePass)
	btn.RegisterButtonPressedCallback(function ()
		local inputpass = LuaGo.Find(_inputFieldNewPass)
		local inputConfirmPass = LuaGo.Find(_inputFieldConfirmNewPass)
		local textPass = inputpass.GetText()
		local textConfirmPass = inputConfirmPass.GetText()
		Login.LuaCall_ChangePass(textPass,textConfirmPass)
	end)
end
function SetupButtonBackForgot()
	local btn = LuaGo.Find(_btnBackForgot)
	btn.RegisterButtonPressedCallback(function ()
		local objPopupForgotPass = LuaGo.Find(_objPopupForgotPass)
		objPopupForgotPass.SetActive(false)
		Login.LuaCallBackfromForgot()
	end)
end
function SetupButtonBackPopupScrenForgot()
	local btn = LuaGo.Find(_btnBackPopupForgot)
	btn.RegisterButtonPressedCallback(function ()
		Login.LuaCall_BackPopupForgot()
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

function GetText1(btnPath)
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
function SetUnActivePopup()
	SetActiveObjCreate(false)
	local objFogot = LuaGo.Find(_objPopupForgotPass)
	objFogot.SetActive(false)

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
function SetupTitleForgotPass(title1,title2)
	local txtTitleForgot = LuaGo.Find(_txtTitleForgot)
	txtTitleForgot.SetText(title1)
	local txtTitleNote = LuaGo.Find(_txtTileNote)
	txtTitleNote.SetText(title2)
end
function ShowPanelOtp(email)
	local title1 = 'Enter your code'
	local title2 ='Enter your recovery code from '.. email
	SetupTitleForgotPass(title1,title2)
	local objotp  = LuaGo.Find(_objSendOTP);
	objotp.SetActive(true);
	local objSendMail = LuaGo.Find(_objSendMail)
	objSendMail.SetActive(false);
	local objChangePass = LuaGo.Find(_objNewPass)
	objChangePass.SetActive(false)
	
	Login.LuaCall_GetObjPanelOTP(objotp)
	local btnBackPopupForgot = LuaGo.Find(_btnBackPopupForgot)
	btnBackPopupForgot.SetActive(true)
end
function ShowPanelChangPass()
	local objotp  = LuaGo.Find(_objSendOTP);
	objotp.SetActive(false);
	local objSendMail = LuaGo.Find(_objSendMail)
	objSendMail.SetActive(false);
	local objChangePass = LuaGo.Find(_objNewPass)
	objChangePass.SetActive(true)
	Login.LuaCall_GetObjPanelNewPass(objChangePass)
	

end
function CloseAllPanel()
	CloseCreateNowPanel()
	local panelForgot = LuaGo.Find(_objPopupForgotPass)
	panelForgot.SetActive(false)
end
function SetActiveGameObject(obj,isActive)
	obj.SetActive(isActive)
	
end
function HidePopupForgotPass()
	local objForgot = LuaGo.Find(_objPopupForgotPass)
	objForgot.SetActive(false)
end
function Hide()
end
