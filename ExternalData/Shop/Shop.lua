function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Shop/Shop.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end
local _btnBackLobby = "Bg/header/imgButton/btnBack"
local _buyVoucherPopup ="Bg/body/btnBuy"
local _shopTier = "Shop/SubViews/ShopTierSubViews"
local _voucherItem = "Shop/SubViews/ShopItemSubViews"
local _txtCoinPath = "Bg/header/objCoin/txtCoin"
local _txtGemPath = "Bg/header/objGem/txtGem"
local _txtObjEnergyPath = "Bg/header/objEnergy/txtEnergy"
local _txtTextRenew = "Bg/body/objTop/objTime/txtTitleCountDown/imgTimeCoutDown/txtTimeCountDown"
local _pathCanvasPopup = "Bg/ShopItemPopupSubView"
local _pathPopupBuy = "Bg/ShopItemPopupSubView/PopupBuy"
local _pathPopupCongarution = "Bg/ShopItemPopupSubView/PopupCongratulation"
local _pathBtnClosePopup = "Bg/ShopItemPopupSubView/PopupBuy/Bg/header/Image/btnClose"
local _pathBtnCloseOutScreen ="Bg/ShopItemPopupSubView/PopupBuy/btnCloseOutScreen"
local _pathBtnBuy = "Bg/ShopItemPopupSubView/PopupBuy/Bg/footer/objButtonBuy/btnBuy"
local _pathTextBtnBuy = "Bg/ShopItemPopupSubView/PopupBuy/Bg/footer/objButtonBuy/btnBuy/txtBuy"
local _pathImg = "Bg/ShopItemPopupSubView/PopupBuy/Bg/body/imgBg/imgVoucher"
local _pathName = "Bg/ShopItemPopupSubView/PopupBuy/Bg/body/objDesVoucher/imgTitleVoucher/txtTitleVoucher"
local _pathDes = "Bg/ShopItemPopupSubView/PopupBuy/Bg/body/objDesVoucher/imgDesVoucher/txtDes" 
local _pathGold= "Bg/ShopItemPopupSubView/PopupBuy/Bg/body/objPrice/objCoin/txtCoin" 
local _pathGem= "Bg/ShopItemPopupSubView/PopupBuy/Bg/body/objPrice/objGem/txtGem"
local _pathBtnTapToContinue = "Bg/ShopItemPopupSubView/PopupCongratulation/Congratulation/btnTapToContinue"
 


function OnReady()
	local objTextRenew = LuaGo.Find(_txtTextRenew)
	Shop.LuaCall_GetObjRenew(objTextRenew)
	SetupButtonBackLobby(_btnBackLobby)
	SetupBtnClosePopupConfirmBuyVoucher(_pathBtnClosePopup)
	SetupBtnClosePopupConfirmBuyVoucher(_pathBtnCloseOutScreen)
	SetupBtnClosePopupConfirmBuyVoucher(_pathPopupCongarution)
	SetupBtnBuyVoucher()
	SetupBtnTapToContinue()
	ActiveShopItemPopupSubView(false)
	local objPannel = LuaGo.Find("Bg/body/Scroll/pannel")
	Shop.LuaCall_GetTransform(objPannel)
	

end
function ActiveShopItemPopupSubView(isActive)
	local objPopup = LuaGo.Find(_pathCanvasPopup);
	objPopup.SetActive(isActive)
end

function SetupButtonBackLobby(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Shop.LuaCall_BackLobby()
    end)
end
function SetupBtnClosePopupConfirmBuyVoucher(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		ActivePopupBuyVoucher(false);
		ActiveShopItemPopupSubView(false)
    end)
end
function SetupBtnBuyVoucher()
	local btn = LuaGo.Find(_pathBtnBuy)
	btn.RegisterButtonPressedCallback(function ()
		Shop.LuaCall_BuyShopItem()
    end)
end
function SetupBtnTapToContinue()
	local btn = LuaGo.Find(_pathBtnTapToContinue)
	btn.RegisterButtonPressedCallback(function ()
		ClosePopupCongratulation()
    end)
end


function Refresh()
	local objCoin = LuaGo.Find(_txtCoinPath)
	objCoin.SetText(Shop.Model.Gold,objCoin)

	local objGem = LuaGo.Find(_txtGemPath)
	objGem.SetText(Shop.Model.Gem,objGem)

	local objEnergy = LuaGo.Find(_txtObjEnergyPath)
	objEnergy.SetText(Shop.Model.Energy,objEnergy)
	
end
function ActivePopupBuyVoucher(isActive)
	local objBuy = LuaGo.Find(_pathPopupBuy)
		objBuy.SetActive(isActive)
end
function ActivePopupCongratulation(isActive)
	local objCongration = LuaGo.Find(_pathPopupCongarution)
		objCongration.SetActive(isActive)
end
function SetDataPopupConfirmBuyVoucher(sprite, nameItem, des, gold, gem,isCanBuy)

	local objButtonBuy = LuaGo.Find(_pathBtnBuy)
		objButtonBuy.SetButtonEnabled(isCanBuy)
	local objTextBuy = LuaGo.Find(_pathTextBtnBuy)
		if(isCanBuy)
			then
				objTextBuy.SetTextOpacity(1)
			else
				objTextBuy.SetTextOpacity(0.5)
		end

	local objImgItem = LuaGo.Find(_pathImg)
		objImgItem.SetSpriteForImage(sprite)

	local objName = LuaGo.Find(_pathName)
		objName.SetText(nameItem,objName)

	local objDes = LuaGo.Find(_pathDes)
		objDes.SetText(des,objDes)


	local txtGold = LuaGo.Find(_pathGold)
		txtGold.SetText(gold,txtGold)

	local txtGem = LuaGo.Find(_pathGem)
		txtGem.SetText(gem,txtGem)

	ActivePopupBuyVoucher(true)
	ActivePopupCongratulation(false)
	ActiveShopItemPopupSubView(true)
end
function SetActiveCongration()
	ActivePopupBuyVoucher(false)
	ActivePopupCongratulation(true)
end
function ClosePopupCongratulation()
	ActivePopupBuyVoucher(false)
	ActivePopupCongratulation(false)
	ActiveShopItemPopupSubView(false)
end


function Hide()
end
