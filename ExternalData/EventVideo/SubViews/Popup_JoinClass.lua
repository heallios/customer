function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/Popup_JoinClass.prefab",
		Config = ""
    }
end

local _closePath = "Popup/Button_Close"
local _buttonJoinPath = "Popup/Button_Join"

local _imageTicketPath = "Popup/Image_Ticket"

local _textJoinPath = "Popup/Button_Join/Text"
local _textTimePath = "Popup/Text_Time"

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

function SetTime(value)
	local time = LuaGo.Find(_textTimePath)
	time.SetText(value)
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
	button.RegisterButtonPressedCallback(function ()
		EventVideo.LuaCall_JoinClass()
		LuaGo.SetActive(false)
	end)
end

function SetupTicketImage(index)
	local image = LuaGo.Find(_imageTicketPath)
	image.SetSprite(_banners[index])
end

function CheckTicketAvailable(isAvailable)
	local button = LuaGo.Find(_buttonJoinPath)
	local text = LuaGo.Find(_textJoinPath)
	EventVideo.LuaCall_ResetButton(button)
	if isAvailable then
		button.SetSprite(_spriteButtonEnable)
		text.SetTextHexColor(_enableColor)
		SetupJoinButton()
	else
		button.SetSprite(_spriteButtonDisable)
		text.SetTextHexColor(_disableColor)
	end
end

function Hide()
end
