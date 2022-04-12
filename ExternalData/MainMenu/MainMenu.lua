


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/MainMenu/MainMenu.prefab",
		Config = "",
		Anchor = "Root",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end


local _buttonIslandPath = "MainMenu/Bg/footer/groupBtn/islandBtn"
local _buttonPVPPath = "MainMenu/Bg/footer/groupBtn/pvpBtn"
local _buttonFriendPath = "MainMenu/Bg/footer/groupBtn/friendBtn"
local _buttonVoucherPath = "MainMenu/Bg/footer/groupBtn/voucherBtn"
local _buttonShopPath = "MainMenu/Bg/footer/groupBtn/shopBtn"

local _bottomButtonPaths = {
	"MainMenu/Bg/footer/groupBtn/islandBtn",
	"MainMenu/Bg/footer/groupBtn/pvpBtn",
	"MainMenu/Bg/footer/groupBtn/friendBtn",
	"MainMenu/Bg/footer/groupBtn/voucherBtn",
	"MainMenu/Bg/footer/groupBtn/shopBtn"
}

local _txtCoinPath ="MainMenu/Bg/header/currencyGroup/gold/goldTxt"
local _txtGemPath ="MainMenu/Bg/header/currencyGroup/gem/gemTxt"
local _txtNamePath ="MainMenu/Bg/header/playerNameGroup/playerNameTxt"
local _txtLevelPath = "MainMenu/Bg/header/avatarFrame/ImgLevel/txtLevel"
local _txtStarPath = "MainMenu/Bg/header/currencyGroup/Energy/EnergyTxt"
local _pathHeader ="MainMenu/Bg/header"
local _pathFooter = "MainMenu/Bg/footer"

local _pathMainMenu ="MainMenu"
local _pathAvatarbtn = "MainMenu/Bg/header/avatarFrame/mask/avatarImg"
local _pathPopupSetting = "PopupSetting"
local _pathBtnSetting = "MainMenu/Bg/header/settingBtn"
local _pathCloseSetting ="PopupSetting/Bg/Header/btnClose"
local _pathOutScreenSetting = "PopupSetting/btnCloseOutScreen"
local _toggleGroup = "PopupSetting/Bg/Body/txtGraphic/ToggleGroup"
local _pathTogleHigh ="PopupSetting/Bg/Body/txtGraphic/ToggleGroup/High"
local _pathTogleMedium ="PopupSetting/Bg/Body/txtGraphic/ToggleGroup/Medium"
local _pathTogleLow ="PopupSetting/Bg/Body/txtGraphic/ToggleGroup/Low"
local _pathTextHigh ="PopupSetting/Bg/Body/txtGraphic/ToggleGroup/High/Label"
local _pathTextMedium ="PopupSetting/Bg/Body/txtGraphic/ToggleGroup/Medium/Label"
local _pathTextLow ="PopupSetting/Bg/Body/txtGraphic/ToggleGroup/Low/Label"
local _subscriptionBtn ="PopupSetting/Bg/Body/imgSubcrition/btnSub"

local _scrollContent = nil
local _animator = nil

local _unSelectColor = nil
local _selectColor = nil

local _subviewContainerPath = "MainMenu/Bg/SubViews"
local _elderDialogView = "MainMenu/SubViews/ElderDialog"

local _popupSubPath = "PopupSubscription"
local _popupSubDesPath = "PopupSubscription/Bg/desTxt"
local _yesSubBtnPath = "PopupSubscription/Bg/GroupBtn/YesBtn"
local _noSubBtnPath = "PopupSubscription/Bg/GroupBtn/NoBtn"

function OnReady()

	SetupButtonIsland(_buttonIslandPath)
	SetupButtonPVP(_buttonPVPPath)
	SetupButtonFriend(_buttonFriendPath)
	SetupButtonShop(_buttonShopPath)
	SetupButtonVoucher(_buttonVoucherPath)

	local objHeader = LuaGo.Find(_pathHeader)
	objHeader.SetActive(true)
	SetActivePopupSetting(false)
	SettupButtonSetting()
	SettupCloseButtonSetting(_pathCloseSetting)
	SettupCloseButtonSetting(_pathOutScreenSetting)
	SetupToggleHigh()
	SetupToggMedium()
	SetupToggLow()
	SetupToggleGroup()
	SetPopupSubBtn()
	SetupBtnSubscription(_subscriptionBtn)
end

function SetActivePopupSetting(isActive)
	local objSetting = LuaGo.Find(_pathPopupSetting)
	objSetting.SetActive(isActive)
end
function SettupButtonSetting()
	local btnSetting = LuaGo.Find(_pathBtnSetting)
	btnSetting.RegisterButtonPressedCallback(function ()
		SetActivePopupSetting(true)
		
	end)
	
end
function SettupCloseButtonSetting(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		SetActivePopupSetting(false)
	end)
	
end

function SetupToggleGroup()
	local toggleGroupObj = LuaGo.Find(_toggleGroup)
	MainMenu.LuaCall_SetupToggleGroup(toggleGroupObj)
end
function SetupToggleHigh()
	local objToggle = LuaGo.Find(_pathTogleHigh)
	local _pathTextHigh = LuaGo.Find(_pathTextHigh)
	objToggle.OnEventToggleChange(function (boolValue) 
		if(boolValue)
			then
				_pathTextHigh.SetTextHexColor("#00adff",_pathTextHigh)
				MainMenu.LuaCall_SetGraphicLevel(2)
			else
				_pathTextHigh.SetTextHexColor("#09679e",_pathTextHigh)	
		end
	end)
end
function SetupToggMedium()
	local objToggle = LuaGo.Find(_pathTogleMedium)
	local _pathTextMedium = LuaGo.Find(_pathTextMedium)
	objToggle.OnEventToggleChange(function (boolValue) 
		
		if(boolValue)
			then
				_pathTextMedium.SetTextHexColor("#00adff",_pathTextMedium)
				MainMenu.LuaCall_SetGraphicLevel(1)
			else
				_pathTextMedium.SetTextHexColor("#09679e",_pathTextMedium)
		end
	end)
end

function SetupToggLow()
	local objToggle = LuaGo.Find(_pathTogleLow)
	local _pathTextLow = LuaGo.Find(_pathTextLow)
	objToggle.OnEventToggleChange(function (boolValue) 
		
		if(boolValue)
			then
				_pathTextLow.SetTextHexColor("#00adff",_pathTextLow)
				MainMenu.LuaCall_SetGraphicLevel(0)
			else
				_pathTextLow.SetTextHexColor("#09679e",_pathTextLow)
		end
	end)
end

function SetupButton(animName, btnPath, index)
	local btn = LuaGo.Find(btnPath)		
	btn.RegisterButtonPressedCallback(function ()
		_animator.AnimationSetTrigger(animName)
		Lobby.Scroller.AddLobbyBody(_playerMainBodyPath, _playerHeadPartPath, _playerBackPartPath, _playerHandLPartPath, _playerHandRPartPath)
    end)
end



function SetupButtonIsland(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadMapIsLand()
		SetSelectColorButton(btnPath)
    end)
end

function SetupButtonPVP(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_JoinPVP()
		SetSelectColorButton(btnPath)
    end)
end
function SetupButtonFriend(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadFriend()
		SetSelectColorButton(btnPath)
    end)
end
function SetupButtonVoucher(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadVoucher()
		SetSelectColorButton(btnPath)
    end)
end

function SetupButtonShop(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadShop()
		SetSelectColorButton(btnPath)
    end)
end

function SetCurency(coin,gem,name, star, level)

	local objCoin = LuaGo.Find(_txtCoinPath)
	objCoin.SetText(coin,objCoin)

	local objGem = LuaGo.Find(_txtGemPath)
	objGem.SetText(gem,objGem)

	local objName = LuaGo.Find(_txtNamePath)
	objName.SetText(name,objName)

	local objStar = LuaGo.Find(_txtStarPath)
	objStar.SetText(star,objStar)

	local objLevel = LuaGo.Find(_txtLevelPath)
	objLevel.SetText(level,objLevel)

end
function SetUiShop(isActive)
	local objHeader = LuaGo.Find(_pathHeader)
	objHeader.SetActive(isActive);
	
end
function SetUIMenu(isActive)
	local objBot = LuaGo.Find(_pathFooter)
	objBot.SetActive(isActive);
end

function SetColorButton(select, unselect)
	_unSelectColor = unselect
	_selectColor = select
end

function SetupAvatarButton()
	local button = LuaGo.Find(_pathAvatarbtn)
	button.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadUserProfile()
	end)
end

function SetUnSelectColorForButtons()
	for i = 1, #_bottomButtonPaths do

		local button = LuaGo.Find(_bottomButtonPaths[i])
		button.SetSprite("button_not_selected",button)

		local Txt = LuaGo.Find(string.format("%s%s",_bottomButtonPaths[i] ,"/footIcon/Txt"))
		Txt.SetTextColor(_unSelectColor)

		local icon = LuaGo.Find(string.format("%s%s",_bottomButtonPaths[i] ,"/Icon"))
		icon.SetSprite(string.gsub(string.format("%s%s",_bottomButtonPaths[i] ,"/_1"),"/",""), icon)
	end
end

function SetSelectColorButton(buttonPath)
		SetUnSelectColorForButtons()

		local button = LuaGo.Find(buttonPath)
		button.SetSprite("button_choose",button)

		local Txt = LuaGo.Find(string.format("%s%s",buttonPath ,"/footIcon/Txt"))
		Txt.SetTextColor(_selectColor)

		local icon = LuaGo.Find(string.format("%s%s",buttonPath ,"/Icon"))
		Log(string.gsub(string.format("%s%s",buttonPath ,"/_2"),"/",""))
		icon.SetSprite(string.gsub(string.format("%s%s",buttonPath ,"/_2"),"/",""), icon)
end

function CreateSubViewElderDialogue()
    local content = LuaGo.Find(_subviewContainerPath)
    CreateSubView(_elderDialogView, content.Transform)
end

function SetActivePopupSub(isActive)
	local popup = LuaGo.Find(_popupSubPath)
	popup.SetActive(isActive)
end

function ShowSubscriptionpopup(des)
	local desTxt = LuaGo.Find(_popupSubDesPath)
	desTxt.SetText(des)
	SetActivePopupSub(true)
end

function SetPopupSubBtn()
	local yesBtn = LuaGo.Find(_yesSubBtnPath)
	yesBtn.RegisterButtonPressedCallback(function ()
		SetActivePopupSub(false)
		MainMenu.LuaCall_LoadSub()
	end)

	local noBtn = LuaGo.Find(_noSubBtnPath)
	noBtn.RegisterButtonPressedCallback(function ()
		SetActivePopupSub(false)
	end)
end

function SetAvatar(strAvatar)
	local objAvatar = LuaGo.Find(_pathAvatarbtn)
	objAvatar.SetSprite(strAvatar)
end

function SetupBtnSubscription(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_LoadSub()
	end)
end
function Hide()
end
