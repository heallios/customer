function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Friend/SubViews/AddFriendConfirm.prefab",
		Config = ""
    }
end

local _closeButtonPath = "Panel/Close"
local _okButtonPath = "Panel/Accept"
local _cancelButtonPath = "Panel/Cancel"

function OnReady()
	SetupPopupConfirm()
	LuaGo.SetActive(false)
end

function SetupPopupConfirm()
	SetupCloseButton()
	SetupCancelButton()
	SetupPopupConfirmOkButton()
end

function SetActivePopupConfirm(active)
	local popup = LuaGo
	popup.SetActive(active)
end

function SetupCloseButton()
	local button = LuaGo.Find(_closeButtonPath)
	local popup = LuaGo
	button.RegisterButtonPressedCallback(function ()
		popup.SetActive(false)
	end)
end

function SetupCancelButton()
	local button = LuaGo.Find(_cancelButtonPath)
	button.RegisterButtonPressedCallback(function ()
		SetActivePopupConfirm(false)
	end)
end

function SetupPopupConfirmOkButton()
	local button = LuaGo.Find(_okButtonPath)
	button.RegisterButtonPressedCallback(function ()
		Friend.LuaCall_Unfriend()
		SetActivePopupConfirm(false)
	end)
end

function Hide()
end
