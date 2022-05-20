function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Mail/Mail.prefab",
		Config = "",
		Anchor = "Root",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _subviewPath = "Mail/SubViews/MailItem"

local _btnBackPath = "TopBar/group_btn_Cancel/btn_Cancel"
local _goldTxtPath = "TopBar/txt_Coin/txt_Value"
local _gemTxtPath = "TopBar/txt_Gem/txt_Value"
local _energyTxtPath = "TopBar/txt_Energy/txt_Value"

local _btnClaimAllPath = "Foot/btnClaimAll"
local _btnDeleteAllPath = "Foot/btnDeleteAll"
local _numberMailPath = "NumberMailTxt"
local _scrollerContentPath = "body/Scroll/Content"

local _noMailPath = "NoMail"

local _deleteAllPopupPath = "PopupDeleteAll"
local _deleteAllBtnPath = "PopupDeleteAll/Panel/btnOK"
local _closeDeleteAllBtnPath = "PopupDeleteAll/Panel/closeBtn"
local _cancelDeleteAllBtnPath = "PopupDeleteAll/Panel/btnCancel"

local _claimAllPopupPath = "PopupClaimAll"
local _claimAllBtnPath = "PopupClaimAll/Panel/btnOK"
local _closeClaimAllBtnPath = "PopupClaimAll/Panel/closeBtn"
local _cancelClaimAllBtnPath = "PopupClaimAll/Panel/btnCancel"

local _mailPopupPath = "ReadMail"
local _mailIconPath = "ReadMail/head/iconBg/icon"
local _mailTitlePath = "ReadMail/head/titleTxt"
local _mailTimePath = "ReadMail/head/timeTxt"
local _mailMessagePath = "ReadMail/messageTxt"
local _mailClaimBtnPath = "ReadMail/Foot/btnClaim"
local _mailDeleteBtnPath = "ReadMail/Foot/btnDelete"

local _confirmDeletePopupPath =  "PopupDelete";
local _confirmDeleteBtnPath = "PopupDelete/Panel/btnOK"
local _confirmDeleteCloseBtnPath = "PopupDelete/Panel/closeBtn"
local _confirmDeleteCancelBtnPath = "PopupDelete/Panel/btnCancel"

local _mailGiftPath = {
	"ReadMail/GroupGift/Gift_1",
	"ReadMail/GroupGift/Gift_2",
	"ReadMail/GroupGift/Gift_3"
}
local _mailGiftIconPath = {
	"ReadMail/GroupGift/Gift_1/icon",
	"ReadMail/GroupGift/Gift_2/icon",
	"ReadMail/GroupGift/Gift_3/icon"
}
local _mailGiftTxtPath = {
	"ReadMail/GroupGift/Gift_1/value",
	"ReadMail/GroupGift/Gift_2/value",
	"ReadMail/GroupGift/Gift_3/value"
}

local _btnBack = nil
local _goldTxt = nil
local _gemTxt = nil
local _energyTxt = nil

local _btnClaimAll = nil
local _btnDeleteAll = nil
local _numberMail = nil
local _scrollerContent = nil

local _noMail = nil

local _deleteAllPopup = nil
local _deleteAllBtn = nil
local _closeDeleteAllBtn = nil
local _cancelDeleteAllBtn = nil

local _claimAllPopup = nil
local _claimAllBtn = nil
local _closeClaimAllBtn = nil
local _cancelClaimAllBtn = nil

local _mailPopup = nil
local _mailIcon = nil
local _mailTitle = nil
local _mailTime = nil
local _mailMessage = nil
local _mailClaimBtn = nil
local _mailDeleteBtn = nil
local _confirmDeletePopup =  nil
local _confirmDeleteBtn = nil
local _confirmDeleteCloseBtn = nil
local _confirmDeleteCancelBtn = nil

local _mailGift = {}
local _mailGiftIcon = {}
local _mailGiftTxt = {}


local IsMailOpen = false

function OnReady()
	FindUI()

	AddListenerBtn()
end

function FindUI()
	_btnBack = LuaGo.Find(_btnBackPath)
	_goldTxt = LuaGo.Find(_goldTxtPath)
	_gemTxt = LuaGo.Find(_gemTxtPath)
	_energyTxt = LuaGo.Find(_energyTxtPath)

	_btnClaimAll = LuaGo.Find(_btnClaimAllPath)
	_btnDeleteAll = LuaGo.Find(_btnDeleteAllPath)
	_numberMail = LuaGo.Find(_numberMailPath)
	_scrollerContent = LuaGo.Find(_scrollerContentPath)
	_noMail = LuaGo.Find(_noMailPath)

	_deleteAllPopup = LuaGo.Find(_deleteAllPopupPath)
	_deleteAllBtn = LuaGo.Find(_deleteAllBtnPath)
	_closeDeleteAllBtn = LuaGo.Find(_closeDeleteAllBtnPath)
	_cancelDeleteAllBtn = LuaGo.Find(_cancelDeleteAllBtnPath)

	_claimAllPopup = LuaGo.Find(_claimAllPopupPath)
	_claimAllBtn = LuaGo.Find(_claimAllBtnPath)
	_closeClaimAllBtn = LuaGo.Find(_closeClaimAllBtnPath)
	_cancelClaimAllBtn = LuaGo.Find(_cancelClaimAllBtnPath)

	_mailPopup = LuaGo.Find(_mailPopupPath)
	_mailIcon = LuaGo.Find(_mailIconPath)
	_mailTitle = LuaGo.Find(_mailTitlePath)
	_mailTime = LuaGo.Find(_mailTimePath)
	_mailMessage = LuaGo.Find(_mailMessagePath)
	_mailClaimBtn = LuaGo.Find(_mailClaimBtnPath)
	_mailDeleteBtn = LuaGo.Find(_mailDeleteBtnPath)
	_confirmDeletePopup =  LuaGo.Find(_confirmDeletePopupPath)
	_confirmDeleteBtn = LuaGo.Find(_confirmDeleteBtnPath)
	_confirmDeleteCloseBtn = LuaGo.Find(_confirmDeleteCloseBtnPath)
	_confirmDeleteCancelBtn = LuaGo.Find(_confirmDeleteCancelBtnPath)

	for i = 1, #_mailGiftPath do
		_mailGift[i] = LuaGo.Find(_mailGiftPath[i])
		_mailGiftIcon[i] = LuaGo.Find(_mailGiftIconPath[i])
		_mailGiftTxt[i] = LuaGo.Find(_mailGiftTxtPath[i])
	end
end

function AddListenerBtn()
	SetButtonOpenPopupClaimAll()

	SetButtonOpenPopupDeleteAll()

	SetButtonClosePopupClaimAll()

	SetButtonClosePopupDeleteAll()

	SetClaimAllButton()

	SetDeleteAllButton()

	SetClaimMailButton()

	SetDeleteMailButton()

	SetDeletePopupButton()

	SetButtonBack()
end

function SetButtonOpenPopupClaimAll()
	_btnClaimAll.UnregisterButtonPressedCallback()
	_btnClaimAll.RegisterButtonPressedCallback(function ()
		_claimAllPopup.SetActive(true)
    end)
end

function SetButtonOpenPopupDeleteAll()
	_btnDeleteAll.UnregisterButtonPressedCallback()
	_btnDeleteAll.RegisterButtonPressedCallback(function ()
		_deleteAllPopup.SetActive(true)
    end)
end

function SetButtonClosePopupClaimAll()
	_closeClaimAllBtn.UnregisterButtonPressedCallback()
	_closeClaimAllBtn.RegisterButtonPressedCallback(function ()
		_claimAllPopup.SetActive(false)
    end)

	_cancelClaimAllBtn.UnregisterButtonPressedCallback()
	_cancelClaimAllBtn.RegisterButtonPressedCallback(function ()
		_claimAllPopup.SetActive(false)
    end)
end

function SetButtonClosePopupDeleteAll()
	_closeDeleteAllBtn.UnregisterButtonPressedCallback()
	_closeDeleteAllBtn.RegisterButtonPressedCallback(function ()
		_deleteAllPopup.SetActive(false)
    end)

	_cancelDeleteAllBtn.UnregisterButtonPressedCallback()
	_cancelDeleteAllBtn.RegisterButtonPressedCallback(function ()
		_deleteAllPopup.SetActive(false)
    end)
end

function SetClaimAllButton()
	_claimAllBtn.UnregisterButtonPressedCallback()
	_claimAllBtn.RegisterButtonPressedCallback(function ()
		Mail.LuaCall_ClaimAll()
		_claimAllPopup.SetActive(false)
    end)
end

function SetDeleteAllButton()
	_deleteAllBtn.UnregisterButtonPressedCallback()
	_deleteAllBtn.RegisterButtonPressedCallback(function ()
		Mail.LuaCall_DeleteAll()
		_deleteAllPopup.SetActive(false)
    end)
end

function SetButtonBack()
	_btnBack.UnregisterButtonPressedCallback()
	_btnBack.RegisterButtonPressedCallback(function ()
		ButtonBackAction()
    end)
end

function ButtonBackAction()
	if IsMailOpen == false then
		Mail.LuaCall_BackToLobby()
	else
		_mailPopup.SetActive(false)
		IsMailOpen = false
	end
end

function SetClaimMailButton()
	_mailClaimBtn.UnregisterButtonPressedCallback()
	_mailClaimBtn.RegisterButtonPressedCallback(function ()
		Mail.LuaCall_ClaimGift(Mail.Model.Id)
		_mailPopup.SetActive(false)
		_confirmDeletePopup.SetActive(false)
		IsMailOpen = false
    end)
end

function SetDeleteMailButton()
	_confirmDeleteBtn.UnregisterButtonPressedCallback()
	_confirmDeleteBtn.RegisterButtonPressedCallback(function ()
		Mail.LuaCall_DeleteMail(Mail.Model.Id)
		_mailPopup.SetActive(false)
		_confirmDeletePopup.SetActive(false)
		IsMailOpen = false
    end)
end

function SetDeletePopupButton()
	_mailDeleteBtn.UnregisterButtonPressedCallback()
	_mailDeleteBtn.RegisterButtonPressedCallback(function ()
		_confirmDeletePopup.SetActive(true)
    end)

	_confirmDeleteCloseBtn.UnregisterButtonPressedCallback()
	_confirmDeleteCloseBtn.RegisterButtonPressedCallback(function ()
		_confirmDeletePopup.SetActive(false)
    end)

	_confirmDeleteCancelBtn.UnregisterButtonPressedCallback()
	_confirmDeleteCancelBtn.RegisterButtonPressedCallback(function ()
		_confirmDeletePopup.SetActive(false)
    end)
end

function Refresh()
	UpdateCurrency()

	SetNumberMail()

	SetActiveNoMail()
end

function UpdateCurrency()
	_goldTxt.SetText(tostring(Mail.Model.Gold))
	_gemTxt.SetText(tostring(Mail.Model.Gem))
	_energyTxt.SetText(tostring(Mail.Model.Energy))
end

function SetNumberMail()
	_numberMail.SetText(string.format("%s%s",tostring(Mail.Model.NumberMail) ,"/100"))
end

function SetActiveNoMail()
	if Mail.Model.NumberMail > 0 then
		_noMail.SetActive(false)
	else
		_noMail.SetActive(true)
	end
end

function CreateSubview()
	for i = 1, Mail.Model.NumberMail do
		CreateSubView(_subviewPath, _scrollerContent.Transform)
	end
end

function OpenMail(iconImg, message, time, title)
	IsMailOpen = true

	_mailIcon.SetSprite(iconImg)
	_mailTitle.SetText(title)
	_mailTime.SetText(time)
	_mailMessage.SetText(message)

	_mailPopup.SetActive(true)
end

function ShowGiftItem(iconImg, value, index)
	_mailGiftIcon[index].SetSprite(iconImg)
	_mailGiftTxt[index].SetText(value)
	_mailGift[index].SetActive(true)
end

function HideGiftItems()
	for i = 1, #_mailGift do
		_mailGift[i].SetActive(false)
	end
end

function ShowClaimButton()
	_mailDeleteBtn.SetActive(false)
	_mailClaimBtn.SetActive(true)
end

function HideClaimButton()
	_mailDeleteBtn.SetActive(true)
	_mailClaimBtn.SetActive(false)
end

function ShowPopupClaimAll()
	_claimAllPopup.SetActive(true)
end

function ShowPopupDeleteAll()
	_deleteAllPopup.SetActive(true)
end

function Hide()
end
