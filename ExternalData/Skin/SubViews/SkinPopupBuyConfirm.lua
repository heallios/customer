function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Skin/SubViews/Popup_Confirm_Buy_item.prefab",
		Config = ""
  }
end

local _butttonBuyConfirmPath = "Popup_Confirm_Buy/Buy_Info/button_buy"
local _buttonClosePopupPath = "Popup_Confirm_Buy/Close"

local _textCoinPath = "Popup_Confirm_Buy/Buy_Info/value"
local _textBuyPath = "Popup_Confirm_Buy/Buy_Info/button_buy/text_buy"

local _imageRobotPath = "Popup_Confirm_Buy/bgPopup1/icon"

local _popupBuyConfirmBackgroundPath = "BG"

function OnReady()
	LuaGo.SetActive(false)
	SetupCloseButtons()
end
function Initialize(id, value, sprite, isBuyable)
	SetupButtonConfirm(id, isBuyable)
	SetCoin(value)
	SetRobotImage(sprite)
end
function SetupButtonConfirm(id, isBuyable)
	local button = LuaGo.Find(_butttonBuyConfirmPath)
	button.UnregisterButtonPressedCallback()
	opacity = 1
	if isBuyable == false then
		opacity = 0.5
	end
	SetButtonDisable(button, isBuyable, opacity)
	button.RegisterButtonPressedCallback(function ()
		Skin.LuaCall_OnBuyConfirm(id)
	end)
end
function SetButtonDisable(button, isBuyable, opacity)
	button.SetButtonEnabled(isBuyable)
	local text = LuaGo.Find(_textBuyPath)
	text.SetTextOpacity(opacity)
end
function SetCoin(value)
	local coin = LuaGo.Find(_textCoinPath)
	coin.SetText(value)
end
function SetRobotImage(sprite)
	local image = LuaGo.Find(_imageRobotPath)
	image.SetSpriteForImage(sprite)
end

function SetupCloseButtons()
	local button = LuaGo.Find(_buttonClosePopupPath)
	local backgroundButton = LuaGo.Find(_popupBuyConfirmBackgroundPath)
	button.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
	backgroundButton.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
end

function Hide()
end
