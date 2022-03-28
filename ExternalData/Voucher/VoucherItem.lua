function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Voucher/VoucherItemPrefab.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "MiddleCenter",
		SizeDelta = "{x: 458, y: 616}"
    }
end

local pathImg ="Item/imgBGVoucher/imgVoucher"
local pathDayExp ="Item/objLock/imgText/txtTime"
local pathTotalItem ="Item/imgLeft/txtAmountLeft"
local pathBtnUse = "Item"

function OnReady()
	SetupButtonUsePopupVoucher();
    VoucherItem.LuaCall_SetTransform(LuaGo)

end

function SetupButtonUsePopupVoucher()	
	local ObjBtnUse = LuaGo.Find(pathBtnUse)
	ObjBtnUse.RegisterButtonPressedCallback(function ()
		VoucherItem.LuaCall_BuyConfirm(LuaGo.name)
    end)
end

function Refresh()
    local objItem = LuaGo.Find("Item")
		objItem.SetSprite(VoucherItem.Model.ImagePathVoucher)
		
	local objImgItem = LuaGo.Find(pathImg)
		objImgItem.SetSprite(VoucherItem.Model.ItemEntity.ImagePath)

	local objQuantity = LuaGo.Find(pathTotalItem)
		objQuantity.SetText(VoucherItem.Model.ItemEntity.Quantity,objQuantity)

    local objTime = LuaGo.Find(pathDayExp);
        objTime.SetText('EXP: ' ..VoucherItem.Model.ItemEntity.DateExp,objTime)
    
	
end


function Hide()
end
