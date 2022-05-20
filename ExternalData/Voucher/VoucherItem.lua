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
		VoucherItem.LuaCall_BuyConfirm()
    end)
end

function Refresh()
    local objItem = LuaGo.Find("Item")
		objItem.SetSprite(VoucherItem.Model.ImagePathVoucher)
		
	local objImgItem = LuaGo.Find(pathImg)
		objImgItem.SetSpriteForImage(VoucherItem.Model.VoucherData.spriteItem)

	local objQuantity = LuaGo.Find(pathTotalItem)
		objQuantity.SetText(VoucherItem.Model.VoucherData.quantity,objQuantity)

    local objTime = LuaGo.Find(pathDayExp);
        objTime.SetText('EXP: ' ..VoucherItem.Model.VoucherData.exp,objTime)
    
	
end


function Hide()
end
