function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/ConcertTicket.prefab",
		Config = ""
    }
end

local _buttonPath = "Button"
local _textTimePath = "Button/Image_Tail/Text_Time"
local _textAvailablePath = "Button/Image_Tail/Text_Available"
local _textCoinPath = "Button/Image_Tail/Image_PriceBg/Image_Coin/Text_Price"
local _textGemPath = "Button/Image_Tail/Image_PriceBg/Image_Gem/Text_Price"

local _imageHeadPath = "Button/Image_Head"
local _imageTailPath = "Button/Image_Tail"
local _imageDisable = "Button/Image_Disable"
local _imagePriceBgPath = "Button/Image_Tail/Image_PriceBg"
local _imageCoinPath = "Button/Image_Tail/Image_PriceBg/Image_Coin"
local _imageGamePath = "Button/Image_Tail/Image_PriceBg/Image_Gem"

local _banners = {
	"banner_class_1",
	"banner_class_2",
	"banner_class_3",
	"banner_class_4",
	"banner_concert_1",
	"banner_concert_2"
}
--Hex Color--
local _availableColor = "#00ff36"
local _unavailableColor = "#acacac"
----

function OnReady()
	Initialize()
end

function Initialize()
	SetupButton()
end

function SetupTicket(index, coin, gem, time)
	SetHeadImage(index)
	SetCoinPrice(coin)
	SetGemPrice(gem)
	SetTime(time)
end

function SetHeadImage(index)
	local image = LuaGo.Find(_imageHeadPath)
	image.SetSprite(_banners[index])
end

function SetGemPrice(value)
	local gem = LuaGo.Find(_textGemPath)
	gem.SetText(value)
end

function SetCoinPrice(value)
	local coin = LuaGo.Find(_textCoinPath)
	coin.SetText(value)
end

function SetTime(value)
	local time = LuaGo.Find(_textTimePath)
	time.SetText(value)
end

function SetTextOnAvailable(isAvailable)
	if isAvailable then
		SetAvailableText("OPEN", _availableColor)
		SetActiveDisableImage(false)
	else
		SetAvailableText("CLOSE", _unavailableColor)
		SetActiveDisableImage(true)
	end
end

function SetAvailableText(text, color)
	local textObject = LuaGo.Find(_textAvailablePath)
	textObject.SetTextHexColor(color)
	textObject.SetText(text)
end

function SetupButton()
	local button = LuaGo.Find(_buttonPath)
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_ShowConcertPopup(LuaGo)
	end)
end

function SetupBuyableTicket()
	SetActiveDisableImage(false)
end

function SetupUnbuyableTicket()
	SetActiveDisableImage(true)
end

function SetActiveDisableImage(isActive)
	local disable = LuaGo.Find(_imageDisable)
	disable.SetActive(isActive)
end

function Hide()
end
