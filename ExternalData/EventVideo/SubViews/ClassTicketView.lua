function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/ClassTicket.prefab",
		Config = ""
    }
end

local _buttonPath = "Button"

local _imageHeadPath = "Button/Image_Head"
local _imageTailPath = "Button/Image_Tail"
local _imageDisablePath = "Button/Image_Disable"
local _imagePriceBackgroundPath = "Button/Image_Tail/Image_PriceBg"

local _textTimePath = "Button/Image_Tail/Text_Time"
local _textAvailablePath = "Button/Image_Tail/Text_Available"
local _textPricePath = "Button/Image_Tail/Image_PriceBg/Text_Price"

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
	SetActiveDisableImage(false)
end

function SetupTicket(index, time)
	SetHeadImage(index)
	SetTime(time)
end

function SetHeadImage(index)
	local image = LuaGo.Find(_imageHeadPath)
	image.SetSprite(_banners[index])
end

function SetupButton()
	local button = LuaGo.Find(_buttonPath)
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_ShowClassPopup(LuaGo)
	end)
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

function SetActiveDisableImage(isActive)
	local image = LuaGo.Find(_imageDisablePath)
	image.SetActive(isActive)
end

function SetTime(value)
	local time = LuaGo.Find(_textTimePath)
	time.SetText(value)
end

function Hide()
end
