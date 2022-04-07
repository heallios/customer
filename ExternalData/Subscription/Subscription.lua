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

local _regularBtnPath = "body/GroupItem/1month"
local _normalBtnPath = "body/GroupItem/3month"
local _premiumBtnPath = "body/GroupItem/6month"
local _oldBtnPath = "body/timeBg/oldBtn"

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

function OnReady()
	FindUI()
	SetUpButton()
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

function Hide()
end
