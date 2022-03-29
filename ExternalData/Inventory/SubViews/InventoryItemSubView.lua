function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Inventory/ItemView.prefab",
		Config = ""
  }
end

local _buttonBuy = "Content/btn_buy";

function OnReady()
end

function SetupBuyButton(id)
	local button = LuaGo.Find(_buttonBuy)
	button.RegisterButtonPressedCallback(function ()
		Inventory.LuaCall_InventoryItemView_OnBuy(id)
    end)
end

function SetupReviewButton(id)
	local button = LuaGo
	button.RegisterButtonPressedCallback(function ()
		Inventory.LuaCall_InventoryItemView_OnReview(id)
    end)
end

function UnlockBuyButton(isUnlock)
	UnlockButton(_buttonBuy, isUnlock)
end

function UnlockButton(buttonPath, isUnlock)
	local button = LuaGo.Find(buttonPath)
	if isUnlock == false then
		button.SetActive(true)
	else
		button.SetActive(false)
	end
end

function Hide()
end
