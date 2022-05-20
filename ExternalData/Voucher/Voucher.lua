function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Voucher/Voucher.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end
local _btnBackLobby = "Bg/header/imgButton/btnBack"
local _txtCoinPath = "Bg/header/objCoin/txtCoin"
local _txtGemPath = "Bg/header/objGem/txtGem"
local _txtObjEnergyPath = "Bg/header/objEnergy/txtEnergy"

local _pathCanvasPopup = "Bg/WalletItemPopupSubView"
local _pathPopupUse = "Bg/WalletItemPopupSubView/PopupUse"
local _pathPopupQR = "Bg/WalletItemPopupSubView/PopupQRCode"
local _pathPopupCongarution = "Bg/WalletItemPopupSubView/PopupCongratulation"
local _pathBtnClosePopup = "Bg/WalletItemPopupSubView/PopupUse/Bg/header/Image/btnClose"
local _pathBtnCloseOutScreenUse ="Bg/WalletItemPopupSubView/PopupUse/btnCloseOutScreen"
local _pathBtnCloseOutScreenCongration ="Bg/WalletItemPopupSubView/PopupCongratulation/btnCloseOutScreen"
local _pathBtnUse = "Bg/WalletItemPopupSubView/PopupUse/Bg/footer/objButtonUse/btnUse"
local _pathTextBtnUse = "Bg/WalletItemPopupSubView/PopupUse/Bg/footer/objButtonUse/btnUse/txtUse"
local _pathBtnDownLoadQR = "Bg/WalletItemPopupSubView/PopupQRCode/Bg/footer/objButtonDownload/btnDownLoad"
local _pathBtnClosePopupDownloadQR = "Bg/WalletItemPopupSubView/PopupQRCode/Bg/header/btnClose"
local _pathImg = "Bg/WalletItemPopupSubView/PopupUse/Bg/body/imgBg/imgVoucher"
local _pathName = "Bg/WalletItemPopupSubView/PopupUse/Bg/body/objDesVoucher/imgTitleVoucher/txtTitleVoucher"
local _pathTitleDisCount = "Bg/WalletItemPopupSubView/PopupQRCode/Bg/body/txtTitle"
local _pathDes = "Bg/WalletItemPopupSubView/PopupUse/Bg/body/objDesVoucher/imgDesVoucher/txtDes" 
local _pathBtnTapToContinue = "Bg/WalletItemPopupSubView/PopupCongratulation/Congratulation/btnTapToContinue"
local _pathObjEmpty = "Bg/body/Scroll/imgEmpty"
local _pathToggle = "Bg/WalletItemPopupSubView/PopupUse/Bg/body/objCheckTerm/toggleCheckTerm" 
local _rawImageQRCode = "Bg/WalletItemPopupSubView/PopupQRCode/Bg/body/QRCode"
local _imgLogoVoucher ="Bg/WalletItemPopupSubView/PopupQRCode/Bg/body/QRCode/Image"

function OnReady()
	SetupButtonBackLobby(_btnBackLobby)
	SettupButtonClosePopup(_pathBtnClosePopup)
	SettupButtonClosePopup(_pathBtnCloseOutScreenUse)
	SettupButtonClosePopup(_pathBtnCloseOutScreenCongration)
	SettupButtonClosePopup(_pathBtnCloseOutScreenUse)
	SetupButtonDownLoadQRCode()
	--SetupButtonCloseDownloadPopupQRCode()
	SetupButtonUse()
	SetupToggle()
	SetupButtonTapToCointinue()
	local objPannel = LuaGo.Find("Bg/body/Scroll/pannel")
	Voucher.LuaCall_GetTransform(objPannel)
end


function Refresh()
	local objCoin = LuaGo.Find(_txtCoinPath)
		objCoin.SetText(Voucher.Model.Gold,objCoin)

	local objGem = LuaGo.Find(_txtGemPath)
		objGem.SetText(Voucher.Model.Gem,objGem)

	local objEnergy = LuaGo.Find(_txtObjEnergyPath)
		objEnergy.SetText(Voucher.Model.Energy,objEnergy)

	local objEmpty = LuaGo.Find(_pathObjEmpty)
		objEmpty.SetActive(Voucher.Model.IsActiveEmptyItem)
end

function SetupButtonBackLobby(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Voucher.LuaCall_BackLobby()
    end)
end
function SettupButtonClosePopup(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		CloseAllPopup()
	end)
end
function  SetupButtonUse()
	local btn = LuaGo.Find(_pathBtnUse)
	btn.SetButtonEnabled(false)
	btn.RegisterButtonPressedCallback(function ()
		Voucher.LuaCall_UseConfirm()
	end)
end
function SetupButtonCloseDownloadPopupQRCode()
	local btn = LuaGo.Find(_pathBtnClosePopupDownloadQR)
	btn.RegisterButtonPressedCallback(function ()
		SetActivePopupQRCode(false)
		SetActivePopupCongratulation(true)
    end)
end
function SetupButtonDownLoadQRCode()
	local btn = LuaGo.Find(_pathBtnDownLoadQR)
	btn.RegisterButtonPressedCallback(function ()
		Voucher.LuaCall_DownLoadQRCode()
    end)
end
function SetupButtonTapToCointinue()
	local btn = LuaGo.Find(_pathBtnTapToContinue)
	btn.RegisterButtonPressedCallback(function ()
		SetActivePopupCongratulation(false)
		SetActiveCanvasPopup(false)
    end)
end
function SetupToggle()
	local objToggle = LuaGo.Find(_pathToggle)
	objToggle.OnEventToggleChange(function (boolValue) 
		Voucher.LuaCall_PlaySoundFxToggle()
		local btn = LuaGo.Find(_pathBtnUse)
		btn.SetButtonEnabled(boolValue)
		local objTextUse = LuaGo.Find(_pathTextBtnUse)
		if(boolValue)
			then
				objTextUse.SetTextOpacity(1)
			else
				objTextUse.SetTextOpacity(0.5)
				
		end

	end)
end
function CloseAllPopup()
	SetActiveCanvasPopup(false)
	SetActivePopupUse(false)
	SetActivePopupQRCode(false)
	SetActivePopupCongratulation(false)
end
function SetActiveCanvasPopup(isActive)
	local objCanvas = LuaGo.Find(_pathCanvasPopup)
		objCanvas.SetActive(isActive)
end
function SetActivePopupUse(isActive)
	local objPopupUse = LuaGo.Find(_pathPopupUse)
		objPopupUse.SetActive(isActive)
	if(isActive == false)
	then
		local objToggle = LuaGo.Find(_pathToggle)
		objToggle.SetToggleEventIsOnOff(false)
	end
end
function SetActivePopupQRCode(isActive)
	local objPopupQR = LuaGo.Find(_pathPopupQR)
	objPopupQR.SetActive(isActive)
end
function SetActivePopupCongratulation(isActive)
	local objCongratulation = LuaGo.Find(_pathPopupCongarution)
		objCongratulation.SetActive(isActive)
end


	
function SetDataPopupConfirmUserVoucher(sprite, nameItem, des)
	SetActiveCanvasPopup(true)
	SetActivePopupUse(true)
	local objImgItem = LuaGo.Find(_pathImg)
		objImgItem.SetSpriteForImage(sprite)
	
	local objName = LuaGo.Find(_pathName)
		objName.SetText(nameItem,objName)
	
	local objDes = LuaGo.Find(_pathDes)
		objDes.SetText(des,objDes)

	local objTextUse = LuaGo.Find(_pathTextBtnUse)
		objTextUse.SetTextOpacity(0.5)
	
end
function SetActiveDownLoadQRCode(nameItem)
	SetActivePopupUse(false)
	SetActivePopupQRCode(true)
	local objTitleDiscount = LuaGo.Find(_pathTitleDisCount)
		objTitleDiscount.SetText(nameItem,objTitleDiscount)
end
function ShowPopupCongrationUseVoucher()
	SetActivePopupQRCode(false)
	SetActivePopupCongratulation(true)
	
end
function GenrareQRCode(texture2D,sprite)
	local rawImage = LuaGo.Find(_rawImageQRCode)	
	rawImage.SetTexture2D(texture2D)
	local imgLogo = LuaGo.Find(_imgLogoVoucher)
	imgLogo.SetSpriteForImage(sprite)
end
function Hide()
end
