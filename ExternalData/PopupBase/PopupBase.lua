function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/PopupBase/PopupBase.prefab",
		Config = "",
		Anchor = "Front",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end
local _btnClose = "Panel/Bg/header/btnClose"
local _buyVoucher = "Panel/Bg/footer/objButtonBuy/btnBuy"
local _btnCloseOutScreen = "Panel/btnCloseOutScreen"

local pathImg ="Panel/Bg/body/imgBg/imgVoucher"
local pathName ="Panel/Bg/body/objDesVoucher/imgTitleVoucher/txtTitleVoucher"
local pathDes="Panel/Bg/body/objDesVoucher/imgDesVoucher/txtDes"
local pathGold="Panel/Bg/body/objPrice/objCoin/txtCoin"
local pathGem ="Panel/Bg/body/objPrice/objGem/txtGem"
local pathTotalItem ="Panel/Bg/body/imgVoucher/imgAmountVoucher/txtAmountVoucher"
local pathTitlePopup ="Panel/Bg/header/objTitle/imgTitle/txtTitlePopup"
local pathObjCoin = "Panel/Bg/body/objPrice/objCoin"
local pathObjGem = "Panel/Bg/body/objPrice/objGem"
local pathTxtButtonConfirm ="Panel/Bg/footer/objButtonBuy/btnBuy/txtBuy"
local pathBgPopup ="Panel/Bg"
local pathCongratulation ="Panel/Congratulation"
local pathQRCode ="Panel/QRCode"
local pathBtnTapToContinue = "Panel/Congratulation/btnTapToContinue"
local pathObjToggleCheckTerm = "Panel/Bg/body/objCheckTerm"
local pathObjPrice = "Panel/Bg/body/objPrice"
local pathToggle ="Panel/Bg/body/objCheckTerm/toggleCheckTerm"
local pathBtnDownLoadQR = "Panel/QRCode/body/objDesQRCode/imgDesQRCode/btnDownLoadQR"
local txtTitleVoucherQRCode = "Panel/QRCode/body/txtTitleVoucher"
local txtDesCongratulation = "Panel/Congratulation/Title/txtDes"
local pathImgIconCongratulation = "Panel/Congratulation/ImageEffect/Image"



function OnReady()
	--_scrollContent = LuaGo.Find("Bg/body")
	--SetupButtonShowPopupBuyVoucher(_buyVoucherPopup)
	SetupButtonClose(_btnClose)
	SetupButtonClose(_btnCloseOutScreen)
	SetupButtonBuyVoucher(_buyVoucher)
	SetupToggle()


end

function SetupToggle()
	local objToggle = LuaGo.Find(pathToggle)
	objToggle.OnEventToggleChange(function (boolValue) 
		local objButtonUse = LuaGo.Find(_buyVoucher)
		objButtonUse.SetButtonEnabled(boolValue)
	end
	)
end

function SetupButtonClose(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		PopupBase.LuaCall_ClosePopup()
    end)

local btnTap = LuaGo.Find(pathBtnTapToContinue)
	btnTap.RegisterButtonPressedCallback(function ()
		PopupBase.LuaCall_ClosePopup()
    end)
end



function SetupButtonBuyVoucher(btnPath)

local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		PopupBase.LuaCall_BuyVoucher()
    end)
end

function SetActiveQRCode(name, titleDes, image)

	local objBg = LuaGo.Find(pathBgPopup)
	objBg.SetActive(false)

	local objQRCode = LuaGo.Find(pathQRCode)
	objQRCode.SetActive(true);

	local objTextTitle = LuaGo.Find(txtDesCongratulation)
	objTextTitle.SetText(titleDes);

	local objImg = LuaGo.Find(pathImgIconCongratulation)
	objImg.SetSprite(image)

	local txtTitle = LuaGo.Find(txtTitleVoucherQRCode)
	txtTitle.SetText(name,txtTitle)

	local btnDown = LuaGo.Find(pathBtnDownLoadQR)
	btnDown.RegisterButtonPressedCallback(function ()
		PopupBase.LuaCall_DownLoadQRCode()
    end)
end


function SetActiveCongratulation()

local objBg = LuaGo.Find(pathBgPopup)
	objBg.SetActive(false)

local objQRCode = LuaGo.Find(pathQRCode)
	objQRCode.SetActive(false);


local objCongratulation = LuaGo.Find(pathCongratulation)
	objCongratulation.SetActive(true)
end

function SetDataPopupConfirmBuyVoucher(Img, nameItem, des, gold, gem, strTotal,title,confirm,isCanBuy)

local objPrice = LuaGo.Find(pathObjPrice)
	objPrice.SetActive(true)

local objTerm = LuaGo.Find(pathObjToggleCheckTerm)
	objTerm.SetActive(false)

local objButtonBuy = LuaGo.Find(_buyVoucher)
	objButtonBuy.SetButtonEnabled(isCanBuy)

local objTitle = LuaGo.Find(pathTitlePopup)
	objTitle.SetText(title,objTitle)

local objConfirm = LuaGo.Find(pathTxtButtonConfirm)
	objConfirm.SetText(confirm,objConfirm)

local objCoin = LuaGo.Find(pathObjCoin)
	objCoin.SetActive(true)

local objGem = LuaGo.Find(pathObjGem)
	objGem.SetActive(true)

local objImgItem = LuaGo.Find(pathImg)
	objImgItem.SetSprite(Img)

local objName = LuaGo.Find(pathName)
	objName.SetText(nameItem,objName)

local objDes = LuaGo.Find(pathDes)
	objDes.SetText(des,objDes)


local txtGold = LuaGo.Find(pathGold)
	txtGold.SetText(gold,txtGold)

local txtGem = LuaGo.Find(pathGem)
	txtGem.SetText(gem,txtGem)

--local objTotalItem = LuaGo.Find(pathTotalItem)
--	objTotalItem.SetText(strTotal,objTotalItem)

end

function SetDataPopupConfirmUseVoucher(Img, nameItem, des, strTotal,title,confirm,isCanUse)

local objPrice = LuaGo.Find(pathObjPrice)
	objPrice.SetActive(false)

local objTerm = LuaGo.Find(pathObjToggleCheckTerm)
	objTerm.SetActive(true)

local objButtonUse = LuaGo.Find(_buyVoucher)
	objButtonUse.SetButtonEnabled(false)

local objTitle = LuaGo.Find(pathTitlePopup)
	objTitle.SetText(title,objTitle)

local objConfirm = LuaGo.Find(pathTxtButtonConfirm)
	objConfirm.SetText(confirm,objConfirm)

local objCoin = LuaGo.Find(pathObjCoin)
	objCoin.SetActive(false)

local objGem = LuaGo.Find(pathObjGem)
	objGem.SetActive(false)

local objImgItem = LuaGo.Find(pathImg)
	objImgItem.SetSprite(Img)

local objName = LuaGo.Find(pathName)
	objName.SetText(nameItem,objName)

local objDes = LuaGo.Find(pathDes)
	objDes.SetText(des,objDes)

--local objTotalItem = LuaGo.Find(pathTotalItem)
--	objTotalItem.SetText(strTotal,objTotalItem)

end
function Hide()
end
