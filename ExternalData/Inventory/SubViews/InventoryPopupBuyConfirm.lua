function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Inventory/Popup_Confirm_Buy_item.prefab",
		Config = ""
  }
end

local _butttonBuyConfirmPath = "Popup_Confirm_Buy/Buy_Info/Buy"
local _buttonClosePopupPath = "Popup_Confirm_Buy/Close"
local _popupBuyConfirmBackgroundPath = "BG"
--Assign Lua
function OnReady()
end

function SetupButtonBuyConfirm()
	local button = LuaGo.Find(_butttonBuyConfirmPath)
	button.RegisterButtonPressedCallback(function ()
		Inventory.LuaCall_OnBuyConfirm()
	end)
end

function SetupButtonCloseConfirmPopup()
	local button = LuaGo.Find(_buttonClosePopupPath)
	button.RegisterButtonPressedCallback(function ()
		Inventory.LuaCall_PopupBuyConfirm_SetActive(false)
	end)
end

function SetupButtonBackgroundConfirmPopup()
	local button = LuaGo.Find(_popupBuyConfirmBackgroundPath)
	button.RegisterButtonPressedCallback(function ()
		Inventory.LuaCall_PopupBuyConfirm_SetActive(false)
	end)
end

function Hide()
end
