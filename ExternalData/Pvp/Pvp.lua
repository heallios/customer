function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Pvp/Pvp.prefab",
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

local _nameModePath = "TopBar/NameModeBg/txt"
local _imgModePath = "body/imgMode"
local _desModePath = "body/desTxt"
local _btnNextPath = "body/btnNext"
local _btnBackPath = "body/btnBack"
local _btnPlayPath = "Foot/btnPlay"
local _btnRankPath ="Foot/btnRank"

local _popupNetPath = "PopupNet"
local _closePopupBtnPath = "PopupNet/Panel/closeBtn"
local _okBtnPath = "PopupNet/Panel/btnOK"

local _btnLobby = nil
local _coinTxt = nil
local _gemTxt = nil
local _energyTxt = nil

local _nameMode = nil
local _imgMode = nil
local _desMode = nil
local _btnNext = nil
local _btnBack = nil
local _btnPlay = nil
local _btnRank = nil

local _popupNet = nil
local _closePopupBtn = nil
local _okBtn = nil

local _modeNames = {
	"QUIT IT",
	"TRUE FALSE"
}

local _imgPaths = {
	"quizitIntro",
	"truefalseIntro"
}

local _modeDes = {
	"Quiz: Answer the question in a certain time, think carefully to answer the question.",
	"True False: Run to correct answer or you will fall into the void."
}

local _popupSubPath = "PopupSubscription"
local _popupSubDesPath = "PopupSubscription/Bg/desTxt"
local _yesSubBtnPath = "PopupSubscription/Bg/GroupBtn/YesBtn"
local _noSubBtnPath = "PopupSubscription/Bg/GroupBtn/NoBtn"

function OnReady()
	FindUI()
	SetUpButton()
	SetPopupSubBtn()
end

function FindUI()
	_btnLobby = LuaGo.Find(_btnLobbyPath)
	_coinTxt = LuaGo.Find(_coinTxtPath)
	_gemTxt = LuaGo.Find(_gemTxtPath)
	_energyTxt = LuaGo.Find(_energyTxtPath)

	_nameMode = LuaGo.Find(_nameModePath)
	_imgMode = LuaGo.Find(_imgModePath)
	_desMode = LuaGo.Find(_desModePath)
	_btnNext = LuaGo.Find(_btnNextPath)
	_btnBack = LuaGo.Find(_btnBackPath)
	_btnPlay = LuaGo.Find(_btnPlayPath)
	_btnRank = LuaGo.Find(_btnRankPath)

	_popupNet = LuaGo.Find(_popupNetPath)
	_closePopupBtn = LuaGo.Find(_closePopupBtnPath)
	_okBtn = LuaGo.Find(_okBtnPath)
end

function SetUpButton()
	_btnLobby.UnregisterButtonPressedCallback()
	_btnLobby.RegisterButtonPressedCallback(function ()
		Pvp.LuaCall_BackLobby()
    end)

	_btnNext.UnregisterButtonPressedCallback()
	_btnNext.RegisterButtonPressedCallback(function ()
		Pvp.LuaCall_NextGameMode()
    end)

	_btnBack.UnregisterButtonPressedCallback()
	_btnBack.RegisterButtonPressedCallback(function ()
		Pvp.LuaCall_BackGameMode()
    end)

	_btnPlay.UnregisterButtonPressedCallback()
	_btnPlay.RegisterButtonPressedCallback(function ()
		Pvp.LuaCall_PlayGameMode()
    end)

	_btnRank.UnregisterButtonPressedCallback()
	_btnRank.RegisterButtonPressedCallback(function ()
		Pvp.LuaCall_RankGameMode()
    end)

	_closePopupBtn.UnregisterButtonPressedCallback()
	_closePopupBtn.RegisterButtonPressedCallback(function ()
		_popupNet.SetActive(false)
    end)

	_okBtn.UnregisterButtonPressedCallback()
	_okBtn.RegisterButtonPressedCallback(function ()
		_popupNet.SetActive(false)
    end)
end

function Refresh()
	UpdateCurrency()

	UpdateView()

	UpdateSpriteBtnBackAndNext()
end

function UpdateCurrency()
	_coinTxt.SetText(tostring(Pvp.Model.Gold))
	_gemTxt.SetText(tostring(Pvp.Model.Gem))
	_energyTxt.SetText(tostring(Pvp.Model.Energy))
end

function UpdateView()
	_nameMode.SetText(_modeNames[Pvp.Model.Index + 1])
	_imgMode.SetSprite(_imgPaths[Pvp.Model.Index + 1])
	_desMode.SetText(_modeDes[Pvp.Model.Index + 1])
end

function ShowPopupNoInternet()
	_popupNet.SetActive(true)
end

function UpdateSpriteBtnBackAndNext()
	if Pvp.Model.Index + 2 > #_modeDes then
		_btnNext.SetSprite("nextNotAllow")
	else
		_btnNext.SetSprite("nextAllow")
	end

	if Pvp.Model.Index < 1 then
		_btnBack.SetSprite("backNotAllow")
	else
		_btnBack.SetSprite("backAllow")
	end

end

function SetActivePopupSub(isActive)
	local popup = LuaGo.Find(_popupSubPath)
	popup.SetActive(isActive)
end

function ShowSubscriptionpopup(des)
	local desTxt = LuaGo.Find(_popupSubDesPath)
	desTxt.SetText(des)
	SetActivePopupSub(true)
end

function SetPopupSubBtn()
	local yesBtn = LuaGo.Find(_yesSubBtnPath)
	yesBtn.RegisterButtonPressedCallback(function ()
		SetActivePopupSub(false)
		Pvp.LuaCall_LoadSub()
	end)

	local noBtn = LuaGo.Find(_noSubBtnPath)
	noBtn.RegisterButtonPressedCallback(function ()
		SetActivePopupSub(false)
	end)
end

function Hide()
end
