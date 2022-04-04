


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Friend/Friend.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end
local _txtCoinPath = "Bg/header/objCoin/txtCoin"
local _txtGemPath = "Bg/header/objGem/txtGem"
local _txtObjEnergyPath = "Bg/header/objEnergy/txtEnergy"

local _pathFriendTab ="Bg/body/ToggleGroup/FriendToggle"
local _pathFriendInviteTab ="Bg/body/ToggleGroup/PendingInviteToggle"
local _pathAddFriendTab = "Bg/body/ToggleGroup/AddFriendToggle"
local _pathScrollFriendTab ="Bg/body/objScrollFriend"
local _pathScrollFriendInviteTab= "Bg/body/objScrollPendingInvite"
local _pathScrollAddFriend ="Bg/body/objScrollAddFriend"
local _pathScrollFriend = "Bg/body/objScrollFriend/ScrollFriend"
local _pathPannelFriend = "Bg/body/objScrollFriend/ScrollFriend/pannelFriend"
local _pathPannelInvite = "Bg/body/objScrollPendingInvite/ScrollPendingInvite/pannelPendingInvite"
local _pathPannelAdd = "Bg/body/objScrollAddFriend/ScrollAddFriend/pannelPendingInvite"
local _txtTextTabFriend = "Bg/body/ToggleGroup/FriendToggle/Label"
local _txtTextTabInvite ="Bg/body/ToggleGroup/PendingInviteToggle/Label"
local _txtTextTabAdd = "Bg/body/ToggleGroup/AddFriendToggle/Label"
local _txtInputField = "Bg/body/objScrollAddFriend/inputFindFriend"
local _btnFindFriendPath = "Bg/body/objScrollAddFriend/inputFindFriend/btnFindFriend"

local _txtNumberFriend = "Bg/body/objScrollFriend/txtNumberFriend"
local _txtNumberInvite = "Bg/body/objScrollPendingInvite/txtNumberFriendInvite"

local _txtDesPopup = "Bg/Popup/BgPopup/des_popup"
local _objPopup = "Bg/Popup"
local _btnCloseOutscreen = "Bg/Popup/btnCloseOutScreen"
local _btnClose = "Bg/Popup/BgPopup/btnClose"
local _btnCancle = "Bg/Popup/BgPopup/ObjButton/BtnCancle"
local _btnOk = "Bg/Popup/BgPopup/ObjButton/BtnOk"

local _imgEnmpty = "Bg/body/objScrollAddFriend/ScrollAddFriend/imgEnmpty"

local _btnBackLobbyPath = "Bg/header/imgButton/btnBack"

local _subviewContainer = "Bg/body/SubViews"
local _popupConfirmPath = "Friend/SubViews/AddFriendConfirm"

local _friendButtonExtendPath = "Item/ImageAvata/btnExtend"

local objFriend = nil;
local objInvite =nil
local objAdd = nil

function OnReady()
	SetupButtonBackLobby(_btnBackLobbyPath)
	SetupToggFriendTab()
	SetupToggInviteFriendTab()
	SetupToggAddFriendTab()
	SetupButtonFindFriend(_btnFindFriendPath)
	SetScrollPanel()
	SetupButtonClose(_btnCloseOutscreen)
	SetupButtonClose(_btnCancle)
	SetupButtonClose(_btnClose)
	SetupButtonConfirmDeleteRequestFriend(_btnOk)
	GetObj()
	SetupScroll()
end
function GetObj()
	objFriend = LuaGo.Find(_pathScrollFriendTab)
	objInvite = LuaGo.Find(_pathScrollFriendInviteTab)
	objAdd = LuaGo.Find(_pathScrollAddFriend)
end
function SetAllActive()
	objFriend.SetActive(true)
	objInvite.SetActive(true)
	objAdd.SetActive(true)
end
function SetupButtonBackLobby(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		SetAllActive()
		Friend.LuaCall_BackLobby()
    end)
end
function SetupButtonFindFriend(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		local objInputField = LuaGo.Find(_txtInputField)
		local textFind = objInputField.GetText()
		Friend.LuaCall_FindFriend(textFind)
    end)
end
function DisableInvitedAndAddFriendExtendButtons()
	local inviteContainer = LuaGo.Find(_pathPannelInvite)
	local addContainer = LuaGo.Find(_pathPannelAdd)
	Friend.LuaCall_GetInvitedFriends(inviteContainer)
	Friend.LuaCall_GetInvitedFriends(addContainer)
end
function DisableFriendExtendButton(invitedFriend)
	local extendButton = invitedFriend.Find(_friendButtonExtendPath)
	extendButton.UnregisterButtonPressedCallback()
	extendButton.SetActive(false)
end
function SetupToggFriendTab()
	local objToggle = LuaGo.Find(_pathFriendTab)
	local _pathScrollFriend = LuaGo.Find(_pathScrollFriendTab)
	local objText = LuaGo.Find(_txtTextTabFriend)
	objToggle.OnEventToggleChange(function (boolValue) 
		_pathScrollFriend.SetActive(boolValue)
		if(boolValue)
			then
				objText.SetTextHexColor("#FFFFFF")
				Friend.LuaCall_ToggleFriendActive()
			else
				objText.SetTextHexColor("#515d75")
		end
		
	end)
end
function SetupToggInviteFriendTab()
	local objToggle = LuaGo.Find(_pathFriendInviteTab)
	local _pathScrollInviteFriend = LuaGo.Find(_pathScrollFriendInviteTab)
	local objText = LuaGo.Find(_txtTextTabInvite)
	objToggle.OnEventToggleChange(function (boolValue) 
		_pathScrollInviteFriend.SetActive(boolValue)
		if(boolValue)
			then
				objText.SetTextHexColor("#FFFFFF")
			else
				objText.SetTextHexColor("#515d75")
		end
		
	end)
end
function SetupToggAddFriendTab()
	local objToggle = LuaGo.Find(_pathAddFriendTab)
	local _pathAddFriend = LuaGo.Find(_pathScrollAddFriend)
	local objText = LuaGo.Find(_txtTextTabAdd)
	objToggle.OnEventToggleChange(function (boolValue) 
		_pathAddFriend.SetActive(boolValue)
		if(boolValue)
			then
				objText.SetTextHexColor("#FFFFFF")
			else
				objText.SetTextHexColor("#515d75")
		end
		
	end)
end
function SetScrollPanel()
	local scrollFriend = LuaGo.Find(_pathPannelFriend)
	local scrollInvite = LuaGo.Find(_pathPannelInvite)
	local scrollAdd = LuaGo.Find(_pathPannelAdd)
	Friend.LuaCall_SetTransform(scrollFriend,scrollInvite,scrollAdd)
end
function SetupScroll()
	local scrollFriend = LuaGo.Find(_pathScrollFriend)
	Friend.LuaCall_SetupScrollRect(scrollFriend)
end
function Refresh()
	local objCoin = LuaGo.Find(_txtCoinPath)
	objCoin.SetText(Friend.Model.Gold,objCoin)

	local objGem = LuaGo.Find(_txtGemPath)
	objGem.SetText(Friend.Model.Gem,objGem)

	local objEnergy = LuaGo.Find(_txtObjEnergyPath)
	objEnergy.SetText(Friend.Model.Energy,objEnergy)
end
function SetInfoFriend(friend,invite)
	local objFriend = LuaGo.Find(_txtNumberFriend)
	objFriend.SetText(friend)
	local objInvite = LuaGo.Find(_txtNumberInvite)
	objInvite.SetText(invite)
end
function ShowPopupFriendFull(des)
	local objPopup = LuaGo.Find(_objPopup)
	objPopup.SetActive(true)

	local objDes = LuaGo.Find(_txtDesPopup)
	objDes.SetText(des)

	local btnCancle = LuaGo.Find(_btnCancle)
	btnCancle.SetActive(false)

	
end
function ShowPopupDeleteFriend(des)
	local objPopup = LuaGo.Find(_objPopup)
	objPopup.SetActive(true)

	local objDes = LuaGo.Find(_txtDesPopup)
	objDes.SetText(des)

	local btnCancle = LuaGo.Find(_btnCancle)
	btnCancle.SetActive(true)

end
function SetupButtonClose(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		local objPopup = LuaGo.Find(_objPopup)
		objPopup.SetActive(false)
    end)
end
function SetupButtonConfirmDeleteRequestFriend(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()

		Friend.LuaCall_ConfirmDeleteFriendRequest()
		local objPopup = LuaGo.Find(_objPopup)
		objPopup.SetActive(false)
    end)
end
function SetImageEmpty(isActive)
	local objActive = LuaGo.Find(_imgEnmpty)
	objActive.SetActive(isActive)
end

function CreateConfirmPopup()
	local content = LuaGo.Find(_subviewContainer)
	CreateSubView(_popupConfirmPath, content.Transform)
end

function Hide()
end
