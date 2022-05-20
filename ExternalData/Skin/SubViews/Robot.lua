function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Skin/SubViews/Robot.prefab",
		Config = ""
  }
end
local _buttonPreviewPath = "button_Preview"
local _contentPath = "button_Preview/Content"
local _buttonBuyPath = "button_Preview/Content/btn_buy"

local _textPricePath = "button_Preview/Content/btn_buy/text_price"

local _imageBackgroundPath = "button_Preview/mainGroup/image_background"
local _imageBorderPath = "button_Preview/mainGroup/image_border"
local _imageRobotPath = "button_Preview/mainGroup/image_background/image_robot"
local _imageButtonDisablePath = "button_Preview/Content/disable"
local _imageCoinPath = "button_Preview/Content/btn_buy/Icon/image_coin"
local _imageButtonBackgroundPath = "button_Preview/mainGroup/image_buttonBackground"

--HEX COLOR--
local _disableColor = "#6D6D6D"
local _enableColor = "#FFFFFF"
local _chooseColor = "#BFBFBF"
----

local _backgroundImageNames = {
	"card_yellow",
	"card_blue",
	"card_purple"
}
local _backgroundBorderImageNames = {
	"card_yellow_2",
	"card_blue_2",
	"card_purple_2"
}

local _buttonImageNames = {
	"button_rectangle_yellow",
	"button_rectangle_blue",
	"button_rectangle_purple"
}

function OnReady()
end

function SetupBuyButton(id)
	local button = LuaGo.Find(_buttonBuyPath)
	button.RegisterButtonPressedCallback(function ()
		Skin.LuaCall_ShowBuyConfirmPopup(id)
    end)
end

function SetupReviewButton(id)
	local button = LuaGo.Find(_buttonPreviewPath)
	button.RegisterButtonPressedCallback(function ()
		Skin.LuaCall_SetChooseRobot(id)
    end)
end
function SetButtonImage(imageName)
	local button = LuaGo.Find(_buttonBuyPath)
	button.SetSprite(imageName)
end
function SetRobotImage(sprite)
	local image = LuaGo.Find(_imageRobotPath)
	image.SetSpriteForImage(sprite)
end

function SetBackgroundImage(imageName, imageBorderName)
	local image = LuaGo.Find(_imageBackgroundPath)
	local border = LuaGo.Find(_imageBorderPath)
	image.SetSprite(imageName)
	border.SetSprite(imageBorderName)
end

function SetPrice(value)
	local price = LuaGo.Find(_textPricePath)
	price.SetText(value)
end
function HideBuyButton()
	local content = LuaGo.Find(_contentPath)
	content.SetActive(false)
end
function SetButtonActive(active, id)
	local button = LuaGo.Find(_buttonBuyPath)
	if active then
		SetButtonOpacity(1, _enableColor)
	else
		SetButtonOpacity(1, _disableColor)
	end
	SetupBuyButton(id)
end
function SetButtonOpacity(opacity, color)
	local button = LuaGo.Find(_buttonBuyPath)
	local text = LuaGo.Find(_textPricePath)
	local image = LuaGo.Find(_imageCoinPath)
	button.SetImgHexColor(color)
	text.SetTextHexColor(color)
	image.SetImgHexColor(color)
	button.SetImageOpacity(opacity)
	text.SetTextOpacity(opacity)
	image.SetImageOpacity(opacity)
end
function SetChooseBackground()
	SetBackgroundImage(_backgroundImageNames[1], _backgroundBorderImageNames[1])
	SetButtonImage(_buttonImageNames[1])
	SetButtonOpacity(0.8, _chooseColor )
end
function ActiveBuyBackground(active)
	local image = LuaGo.Find(_imageButtonBackgroundPath)
	image.SetActive(active)
end
function SetUnchooseBackground(index)
	SetBackgroundImage(_backgroundImageNames[index], _backgroundBorderImageNames[index])
	SetButtonImage(_buttonImageNames[index])
end

function Hide()
end
