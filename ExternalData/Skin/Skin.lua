function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Skin/Skin.prefab",
		Config = "",
		Anchor = "Front",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _textCoinPath = "Scene_Skin/TopBar/txt_Coin/txt_Value"
local _textGemPath = "Scene_Skin/TopBar/txt_Gem/txt_Value"
local _textEnergyPath = "Scene_Skin/TopBar/txt_Energy/txt_Value"

local _imageCoinIconPath = "Scene_Skin/TopBar/txt_Coin/Icon"

local _buttonBackPath = "Scene_Skin/TopBar/group_btn_Cancel/btn_Cancel"

local _popupContainer = "Popups"
local _robotContainer = "Scene_Skin/Inventory/ListItem/Content"
----luaView----
local _popupBuySubview = "Skin/SubViews/SkinPopupBuyConfirm"
local _popupCongratSubview = "Skin/SubViews/SkinPopupBuySuccess"
local _robotSubview = "Skin/SubViews/Robot"
--------
local _buyLoadingSuccessPath = "Popup/Loading"

local _countTime = 0.5

function OnReady()
	SetupBackButton()
end

function CreateLuaView(lua, containerPath)
	local container = LuaGo.Find(containerPath)
	CreateSubView(lua, container.Transform)
end

function CreateRobot()
	CreateLuaView(_robotSubview, _robotContainer)
end

function CreatePopupBuyConfirm()
	CreateLuaView(_popupBuySubview, _popupContainer)
end

function CreatePopupBuySuccess()
	CreateLuaView(_popupCongratSubview, _popupContainer)
end
function MinusValueAnimation(startValue, endValue, gameObject)
	gameObject.SetTextDoCounter(startValue, endValue, _countTime)
end
function AddValueAnimation(startValue, endValue, gameObject)
	Skin.LuaCall_GetCurrencyPosition(gameObject)
	gameObject.SetTextDoCounter(startValue, endValue, _countTime)
end
function SetCoin(value)
	local coin = LuaGo.Find(_textCoinPath)
	Skin.LuaCall_SetTextAnimation(value, coin)
end

function SetGem(value)
	local gem = LuaGo.Find(_textGemPath)
	Skin.LuaCall_SetTextAnimation(value, gem)
end

function SetEnergy(value)
	local energy = LuaGo.Find(_textEnergyPath)
	Skin.LuaCall_SetTextAnimation(value, energy)
end

function SetCurrencies(coinValue, gemValue, energyValue)
	local coin = LuaGo.Find(_textCoinPath)
	local gem = LuaGo.Find(_textGemPath)
	local energy = LuaGo.Find(_textEnergyPath)
	coin.SetText(coinValue)
	gem.SetText(gemValue)
	energy.SetText(energyValue)
end
function SetupBackButton()
	local button = LuaGo.Find(_buttonBackPath)
	button.RegisterButtonPressedCallback(function ()
		Skin.LuaCall_BackToLobby()
	end)
end

function Hide()

end
