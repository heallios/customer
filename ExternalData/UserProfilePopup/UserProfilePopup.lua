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
local _addFriendPath = "Profile/Panel/AddFriend"
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

function OnReady()
	SetupCopyButton()
	SetupBackgroundButton()
	SetupCloseButton()
	SetupButtonEditAvatar()
	local objTransform = LuaGo.Find(panelAvatar)
	UserProfilePopup.LuaCall_GetTransform(objTransform)
	SetupButtonClosePopupEditAvatar(btnCloseOutScreenPopup)
	SetupButtonClosePopupEditAvatar(btnClosePopup)
	SetObj()
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

function SetupProfile(name, level, highScores, id, activeAddFriendButton)
	SetTextObject(_userNamePath, name)
	SetTextObject(_userLevelPath, level)
	SetTextObject(_userIDPath, id)
	SetHighScoreName()
	SetActiveFriendButton(activeAddFriendButton)
	SetHighScoreValue(highScores)
end

function SetHighScoreValue(highScores)
	SetTextArray(_userHighScoreValuePaths, highScores)
end

function SetActiveFriendButton(active)
	local button = LuaGo.Find(_addFriendPath)
	button.SetActive(active)
	if active == true then
		button.RegisterButtonPressedCallback(function ()
			UserProfilePopup.LuaCall_AddFriend()
		end)
	end
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
	avt1.SetSprite(strAvatar)
	avt2.SetSprite(strAvatar)
	txtName.SetText(strName)
end

function Hide()
end
