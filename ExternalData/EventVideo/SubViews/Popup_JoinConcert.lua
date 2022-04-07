function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/Popup_JoinConcert.prefab",
		Config = ""
    }
end

local _closePath = "Popup/Button_Close"
local _buttonJoinPath = "Popup/Button_Join"

local _textJoinPath = "Popup/Button_Join/Text"
local _textCoinPath = "Popup/Image_Coin/Text_Price"
local _textGemPath = "Popup/Image_Gem/Text_Price"
local _textTimePath = "Popup/Text_Time"

local _imageCoinPath = "Popup/Image_Coin"
local _imageGemPath = "Popup/Image_Gem"
local _imageTicketPath = "Popup/Image_Ticket"

--Hex Colors--
local _enableColor = "#96EEFD"
local _disableColor = "#478BA9"
----
--Sprites--
local _spriteButtonEnable = "popup_button_choose"
local _spriteButtonDisable = "popup_button_not selected"
local _banners = {
	"popupClass_banner 1",
	"popupClass_banner 2",
	"popupClass_banner 3",
	"popupClass_banner 4",
	"popupConcert_banner 1",
	"popupConcert_banner 2"
}
--------

function OnReady()
	Initialize()
end

function Initialize()
	SetupClosePopup()
end

function SetupClosePopup()
	local button = LuaGo.Find(_closePath)
	button.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
	LuaGo.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
end

function SetupJoinButton()
	local button = LuaGo.Find(_buttonJoinPath)
	EventVideo.LuaCall_ResetButton(button)
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_JoinConcert()
		LuaGo.SetActive(false)
	end)
end

function SetupBuyButton(id)
	local button = LuaGo.Find(_buttonJoinPath)
	EventVideo.LuaCall_ResetButton(button)
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_BuyConcert(id)
	end)
end

function SetTicketImage(index)
	local image = LuaGo.Find(_imageTicketPath)
	image.SetSprite(_banners[index])
end

function SetCoinText(value)
	local coin = LuaGo.Find(_textCoinPath)
	coin.SetActive(true)
	coin.SetText(value)
end

function SetGemText(value)
	local gem = LuaGo.Find(_textGemPath)
	gem.SetActive(true)
	gem.SetText(value)
end

function SetTime(value)
	local time = LuaGo.Find(_textTimePath)
	time.SetActive(true)
	time.SetText(value)
end

function SetupBoughtPopup()
	local coin = LuaGo.Find(_imageCoinPath)
	local gem = LuaGo.Find(_imageGemPath)
	local text = LuaGo.Find(_textJoinPath)
	coin.SetActive(false)
	gem.SetActive(false)
	text.SetText("Join")
end

function SetupBuyPopup(id, isBuyable, coin, gem)
	local text = LuaGo.Find(_textJoinPath)
	local button = LuaGo.Find(_buttonJoinPath)
	SetCoinText(coin)
	SetGemText(gem)
	text.SetText("Buy")
	SetupPopup(isBuyable, button, text)
end

function SetupAvailablePopup(isAvailable)
	local button = LuaGo.Find(_buttonJoinPath)
	local text = LuaGo.Find(_textJoinPath)
	EventVideo.LuaCall_ResetButton(button)
	SetupBoughtPopup()
	SetupPopup(isAvailable, button, text)
	if isAvailable then
		SetupJoinButton()
	end
end

function SetupPopup(isAvailable, button, text)
	if isAvailable then
		button.SetSprite(_spriteButtonEnable)
		text.SetTextHexColor(_enableColor)
	else
		button.SetSprite(_spriteButtonDisable)
		text.SetTextHexColor(_disableColor)
	end
end

function ShowBuyPopup(isBuyable, id, coin, gem)
	SetupBuyPopup(id, isBuyable, coin, gem)
	if isBuyable then
		SetupBuyButton(id)
	end
end

function ShowBoughtPopup()
	SetupBoughtPopup()
	SetupJoinButton()
end

function Hide()
end
