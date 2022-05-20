function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Skin/SubViews/Popup_Buy_Success_item.prefab",
		Config = ""
  }
end

local _butttonTapToContinuePath = "Popup_Congratulation_1/Content/TapToContinue"
local _textTapToContinuePath = "Popup_Congratulation_1/Content/TapToContinue/Text"
local _backgroundPath = "BG"
local _itemIconPath = "Popup_Congratulation_1/Content/GroupItem/Item/icon"

function OnReady()
	LuaGo.SetActive(false)
	SetupButtonTapToContinue()
	SetupButtonBackground()
end

function SetupButtonTapToContinue()
	local button = LuaGo.Find(_butttonTapToContinuePath)
	local text = LuaGo.Find(_textTapToContinuePath)
	text.SetText("Tap to continue")
	button.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
end

function SetItemSprite(sprite)
	local image = LuaGo.Find(_itemIconPath)
	image.SetSpriteForImage(sprite)
end

function SetupButtonBackground()
	local button = LuaGo.Find(_backgroundPath)
	button.RegisterButtonPressedCallback(function ()
		LuaGo.SetActive(false)
	end)
end

function Hide()
end
