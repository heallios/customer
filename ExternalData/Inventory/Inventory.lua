function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Inventory/Inventory.prefab",
		Config = ""
    }
end


local _txtCoinPath = "Scene_Skin/TopBar/txt_Coin/txt_Value"
local _txtGemPath = "Scene_Skin/TopBar/txt_Gem/txt_Value"
local _txtEnergyPath = "Scene_Skin/TopBar/txt_Energy/txt_Value"

local _btnCheat = "Scene_Skin/TopBar/CheckButton"

local _buttonBackPath = "Scene_Skin/TopBar/group_btn_Cancel/btn_Cancel"
local _buttonGenderPath = "Scene_Skin/CenterBar/Center_Left_Bar/gender"
local _buttonBagPath = "Scene_Skin/CenterBar/Center_Left_Bar/bag"
local _txtBagPath = "Scene_Skin/CenterBar/Center_Left_Bar/bag/ellipse/txtVolBag"
local _goBagPath = "Scene_Skin/CenterBar/Center_Left_Bar/bag/ellipse"

local _tabBarPath = "Scene_Skin/Inventory/Tab_Bar"

local _buttonHatPath = "Scene_Skin/Inventory/Tab_Bar/TabItem_hat"
local _buttonOutFitPath = "Scene_Skin/Inventory/Tab_Bar/TabItem_outfit"
local _buttonWeaponPath = "Scene_Skin/Inventory/Tab_Bar/TabItem_weapon"
local _buttonSkinColorPath = "Scene_Skin/Inventory/Tab_Bar/TabItem_skincolor"
local _buttonFacePath = "Scene_Skin/Inventory/Tab_Bar/TabItem_face"

local _buttonNormalSkinPath = "Scene_Skin/Inventory/Tab_Bar/TabItem_normalSkin"
local _buttonLimitSkinPath = "Scene_Skin/Inventory/Tab_Bar/TabItem_limitSkin"

local _keyNameHat = "Hat"
local _keyNameOutFit = "OutFit"
local _keyNameWeapon = "Weapon"
local _keyNameSkinColor = "SkinColor"
local _keyNameFace = "Face"
local _keyNameOutFitFull = "OutfitFull"
local _keyNameNormalOutFitFull = "NormalOutfitFull"
local _keyNameLimitOutFitFull = "LimitOutfitFull"

local _itemSubView = "Inventory/SubViews/InventoryItemSubView"
local _listItemPath = "Scene_Skin/Inventory/ListItem/Content"

local _popupParentPath = "Popup"
local _popupBuySubview = "Inventory/SubViews/InventoryPopupBuyConfirm"
local _popupCongratSubview = "Inventory/SubViews/InventoryPopupBuySuccess"
local _buyLoadingSuccessPath = "Popup/Loading"

function OnReady()

	--ShowInventoryStyle_1()
	--ShowInventoryStyle_2()

    --ShowInventoryStyle_3()
    
	SetupButtonBack	(_buttonBackPath)

	SetupButtonGender (_buttonGenderPath)

	SetupButtonBag(_buttonBagPath)
	
	SetupButtonCheat(_btnCheat);
end

function ShowInventoryStyle_1()
	SetupButtonTab	(_buttonHatPath			,_keyNameHat)
	SetupButtonTab	(_buttonOutFitPath		,_keyNameOutFit)
	SetupButtonTab	(_buttonWeaponPath		,_keyNameWeapon)
	SetupButtonTab	(_buttonSkinColorPath	,_keyNameSkinColor)
	SetupButtonTab	(_buttonFacePath		,_keyNameFace)
	Inventory.LuaCall_FindTabItem(_keyNameHat)
end

function ShowInventoryStyle_2()
	local tabbar = LuaGo.Find(_tabBarPath)	
	tabbar.SetActive(false)
	Inventory.LuaCall_FindItem(_keyNameOutFitFull)
end

function ShowInventoryStyle_3()
	SetupButtonTab	(_buttonLimitSkinPath			,_keyNameLimitOutFitFull)
	Inventory.LuaCall_FindTabItem(_keyNameLimitOutFitFull)
	SetupButtonTab	(_buttonNormalSkinPath			,_keyNameNormalOutFitFull)
	Inventory.LuaCall_FindTabItem(_keyNameNormalOutFitFull)
end

function SetupButtonCheat(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Inventory.LuaCall_Cheat()
    end)
end

function SetupButtonGender(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Inventory.LuaCall_ChangeBody(btn)
    end)
end

function SetupButtonBag(btnPath)
	
	local btn = LuaGo.Find(btnPath)	

	btn.RegisterButtonPressedCallback(function ()
		Inventory.LuaCall_ShowBag()
    end)
end

function SetTextBag(vol)
	local txt = LuaGo.Find(_txtBagPath)	
	local go = LuaGo.Find(_goBagPath)	 
	if vol == 0 then 
		txt.SetActive(false)
		go.SetActive(false)
	else
		go.SetActive(true)
		txt.SetActive(true)
		txt.SetText(vol)
	end
end

function StartLoading()
	local loading = LuaGo.Find(_buyLoadingSuccessPath)
	loading.SetActive(true)
	Inventory.LuaCall_StarLoading(loading, 2.0)
end

function SetupButtonBack(btnPath)
	local btn = LuaGo.Find(btnPath)
	
	btn.RegisterButtonPressedCallback(function ()
		
		Inventory.LuaCall_LoadLobby()
    end)
end

function SetTextGem(gemValue)
	local obj = LuaGo.Find(_txtGemPath)
	obj.SetText(gemValue)
end

function SetTextCoin(goldValue)
	local obj = LuaGo.Find(_txtCoinPath)
	obj.SetText(goldValue)
end

function SetTextEnergy(energyValue)
	local obj = LuaGo.Find(_txtEnergyPath)
	obj.SetText(energyValue)
end
function UpdateCurrency(gemValue,goldValue,energyValue)
	local objGem = LuaGo.Find(_txtGemPath)
	objGem.SetText(gemValue)
	local objCoin = LuaGo.Find(_txtCoinPath)
	objCoin.SetText(goldValue)
	local objEnergy = LuaGo.Find(_txtEnergyPath)
	objEnergy.SetText(energyValue)

end

function CreateSubItem(id)
	_goListItem = LuaGo.Find(_listItemPath)
	CreateSubViewParam(_itemSubView, _goListItem.Transform,id)
end

function CreatePopupSubviewConfirm()
	popupParent = LuaGo.Find(_popupParentPath)
	CreateSubView(_popupBuySubview, popupParent.Transform)
end

function CreatePopupSubviewCongrat()
	popupParent = LuaGo.Find(_popupParentPath)
	CreateSubView(_popupCongratSubview, popupParent.Transform)
end

function CleanItemChild()
	_goListItem = LuaGo.Find(_listItemPath)
	_goListItem.CleanChild();
end

function SetupButtonTab(btnPath,keyName)
	btn = LuaGo.Find(btnPath)
    Inventory.LuaCall_SettupButtonTab(keyName,btn)
    -- btn.SetActive(true)
	btn.RegisterButtonPressedCallback(function ()
		CleanItemChild()
		Inventory.LuaCall_FindTabItem(keyName)
    end)
end

function CreateListItem()

end

function Hide()

end

function Show()

end
