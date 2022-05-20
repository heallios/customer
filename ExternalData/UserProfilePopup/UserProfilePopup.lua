function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/UserProfile/UserProfile.prefab",
		Config = "",
		Anchor = "Root",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end
local _btnCloseOutScreen ="Profile/btnCloseOutScreen"
local _popupTitlePath = "Profile/Panel/Title"
local _userAvatarPath = "Profile/Panel/Avatar/Image"
local _userNamePath = "Profile/Panel/Name"
local _userLevelPath = "Profile/Panel/Level/Text"
local _userIDPath = "Profile/Panel/ID"
local _copyButtonPath = "Profile/Panel/Copy"
local _btnEditAvatar ="Profile/Panel/Avatar/btnEdit"
local _userHighScoreNamePaths = {
	"Profile/Panel/HighScore/Score_1/Text",
	"Profile/Panel/HighScore/Score_2/Text",
	"Profile/Panel/HighScore/Score_3/Text"
}
local _userHighScoreValuePaths = {
	"Profile/Panel/HighScore/Score_1/Text/Number",
	"Profile/Panel/HighScore/Score_2/Text/Number",
	"Profile/Panel/HighScore/Score_3/Text/Number"
}
local _closePath = "Profile/Panel/Close"

local _subViewContainer = "SubViews"
local _objPopup = "PopupAvatar"
local _objPanel = "Profile"

local panelAvatar = "PopupAvatar/Popup/ScrollAvatar/pannelAvatar"
local btnCloseOutScreenPopup = "PopupAvatar/btnCloseOutScreen"
local imgAvatarPopup = "PopupAvatar/Popup/Avatar/Image"
local txtNameAvatar ="PopupAvatar/Popup/txtNameAvatar"
local btnClosePopup = "PopupAvatar/Popup/btnClose"

local _btnExtend = "Profile/Panel/btnExtend"
local objExtendFriend = "Profile/Panel/FriendGroup"
local _btnAddFriend = "Profile/Panel/FriendGroup/btnAddFriend"
local _objReceiveInvite ="Profile/Panel/FriendGroup/objReceive"
local _btnAcceptInvite="Profile/Panel/FriendGroup/objReceive/btnAccept"
local _btnDeclineInvite="Profile/Panel/FriendGroup/objReceive/btnDeclineInvite"
local _btnUnFriend ="Profile/Panel/FriendGroup/btnUnfriend"
local _btnCancelRequest ="Profile/Panel/FriendGroup/btnCancelRequest"


function OnReady()
	SetupCopyButton()
	SetupBackgroundButton()
	SetupCloseButton()
	SetupButtonEditAvatar()
	SetupButtonExtendFriend()
	SetupButtonUnfriend()
	SetupButtonAcceptInvite()
	SetupButtonDeclineInvite()
	SetupButtonCancleRequest()
	SetupButtonAddFriend()
	local objTransform = LuaGo.Find(panelAvatar)
	UserProfilePopup.LuaCall_GetTransform(objTransform)
	SetupButtonClosePopupEditAvatar(btnCloseOutScreenPopup)
	SetupButtonClosePopupEditAvatar(btnClosePopup)
	SetObj()
end
function SetupButtonUnfriend()
	local unfriend = LuaGo.Find(_btnUnFriend)
	unfriend.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_UnFriend()
	end)
end
function SetupButtonAcceptInvite()
	local acceptInvite = LuaGo.Find(_btnAcceptInvite)
	acceptInvite.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_AcceptInviteFriend()
	end)
end
function SetupButtonDeclineInvite()
	local DeclineInvite = LuaGo.Find(_btnDeclineInvite)
	DeclineInvite.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_DeclineInviteFriend()
	end)
end
function SetupButtonCancleRequest()
	local cancelRequest = LuaGo.Find(_btnCancelRequest)
	cancelRequest.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_CancelRequestFriend()
	end)
end
function SetupButtonAddFriend()
	local addFriend = LuaGo.Find(_btnAddFriend)
	addFriend.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_AddFriend()
	end)
end
function SetObj()
	local objPanel = LuaGo.Find(_objPanel)
	objPanel.SetActive(true)
	local objPopup = LuaGo.Find(_objPopup)
	objPopup.SetActive(false)
end

function SetHighScoreName()
	local names = {
		"Energy",
		"Planet",
		"Cell"
	}
	SetTextArray(_userHighScoreNamePaths, names)
end

function SetupProfile(spriteAvatar,name, level, highScores, id)
	local avt1 = LuaGo.Find(_userAvatarPath)
	avt1.SetSpriteForImage(spriteAvatar)
	SetTextObject(_userNamePath, name)
	SetTextObject(_userLevelPath, level)
	SetTextObject(_userIDPath, id)
	SetHighScoreName()
	SetHighScoreValue(highScores)
end

function SetHighScoreValue(highScores)
	SetTextArray(_userHighScoreValuePaths, highScores)
end

function SetupButtonExtendFriend()
	local button = LuaGo.Find(_btnExtend)
	button.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_OnExtendEnable()
	end)
end

function SetupCopyButton()
	local button = LuaGo.Find(_copyButtonPath)
	button.RegisterButtonPressedCallback(function ()
			UserProfilePopup.LuaCall_CopyID("User ID copied to clipboard")
		end)
end

function SetupCloseButton()
	local button = LuaGo.Find(_closePath)
	button.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_Out()
	end)
end

function SetupBackgroundButton()
	local btn = LuaGo.Find(_btnCloseOutScreen)
	btn.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_Out()
	end)
end
function SetupButtonClosePopupEditAvatar(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_ClosePopupAvatar()
	end)
	
end
function SetupButtonEditAvatar()
	local btn = LuaGo.Find(_btnEditAvatar)
	btn.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_EditAvatar()
		local objPanel = LuaGo.Find(_objPanel)
		objPanel.SetActive(false)
		local objPopup = LuaGo.Find(_objPopup)
		objPopup.SetActive(true)
	end)
	
end
function ClosePanelEditAvatar()
	local objPanel = LuaGo.Find(_objPanel)
	objPanel.SetActive(true)
	local objPopup = LuaGo.Find(_objPopup)
	objPopup.SetActive(false)
end
function SetTextObject(path, text)
	local textObject = LuaGo.Find(path)
	textObject.SetText(text)
end

function SetTextArray(textPaths, arrayText)
	if #textPaths != #arrayText then
		return
	end
	for i = 1, #textPaths, 1
	do
		SetTextObject(textPaths[i], arrayText[i])
	end
end
function SetAvatar(strAvatar,strName)
	local avt1 = LuaGo.Find(_userAvatarPath)
	local avt2 = LuaGo.Find(imgAvatarPopup)
	local txtName = LuaGo.Find(txtNameAvatar)
	avt1.SetSpriteForImage(strAvatar)
	avt2.SetSpriteForImage(strAvatar)
	txtName.SetText(strName)
end
function Refresh()
	local btnEditAvatar = LuaGo.Find(_btnEditAvatar)
	btnEditAvatar.SetActive(UserProfilePopup.Model.IsMe)
	local btnExtend = LuaGo.Find(_btnExtend)
	--if(UserProfilePopup.Model.IsShowBtnExtend) then
		btnExtend.SetActive(UserProfilePopup.Model.IsShowBtnExtend)
	--else
	--	btnExtend.SetActive(true)
	--end

	
end
function SetGroupFriend()
	local objExtendFriend = LuaGo.Find(objExtendFriend)
	objExtendFriend.SetActive(UserProfilePopup.Model.IsShowExtend)
end


function SetDataInViewFriend()
    local btnUnFriend = LuaGo.Find(_btnUnFriend)
	local objDecline = LuaGo.Find(_objReceiveInvite)
	local btnCancelRequest = LuaGo.Find(_btnCancelRequest)
	local btnAdd = LuaGo.Find(_btnAddFriend)

	btnUnFriend.SetActive(true)
	objDecline.SetActive(false)
	btnCancelRequest.SetActive(false)
	btnAdd.SetActive(false)
end
function SetDataInViewInvited()
    local btnUnFriend = LuaGo.Find(_btnUnFriend)
	local objDecline = LuaGo.Find(_objReceiveInvite)
	local btnCancelRequest = LuaGo.Find(_btnCancelRequest)
	local btnAdd = LuaGo.Find(_btnAddFriend)

	btnUnFriend.SetActive(false)
	objDecline.SetActive(false)
	btnCancelRequest.SetActive(true)
	btnAdd.SetActive(false)
end

function SetDataInViewAddFriend()
	local btnUnFriend = LuaGo.Find(_btnUnFriend)
	local objDecline = LuaGo.Find(_objReceiveInvite)
	local btnCancelRequest = LuaGo.Find(_btnCancelRequest)
	local btnAdd = LuaGo.Find(_btnAddFriend)

	btnUnFriend.SetActive(false)
	objDecline.SetActive(false)
	btnCancelRequest.SetActive(false)
	btnAdd.SetActive(true)
end
function SetDataInViewReceiveFriend()
	local btnUnFriend = LuaGo.Find(_btnUnFriend)
	local objDecline = LuaGo.Find(_objReceiveInvite)
	local btnCancelRequest = LuaGo.Find(_btnCancelRequest)
	local btnAdd = LuaGo.Find(_btnAddFriend)

	btnUnFriend.SetActive(false)
	objDecline.SetActive(true)
	btnCancelRequest.SetActive(false)
	btnAdd.SetActive(false)
end


function Hide()
end
