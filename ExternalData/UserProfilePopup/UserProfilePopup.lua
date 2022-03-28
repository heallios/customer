function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/UserProfile/UserProfile.prefab",
		Config = "",
		Anchor = "Root",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _popupTitlePath = "Panel/Title"
local _userAvatarPath = "Panel/Avatar/Image"
local _userNamePath = "Panel/Name"
local _userLevelPath = "Panel/Level/Text"
local _userIDPath = "Panel/ID"
local _copyButtonPath = "Panel/Copy"
local _addFriendPath = "Panel/AddFriend"
local _userHighScoreNamePaths = {
	"Panel/HighScore/Score_1/Text",
	"Panel/HighScore/Score_2/Text",
	"Panel/HighScore/Score_3/Text"
}
local _userHighScoreValuePaths = {
	"Panel/HighScore/Score_1/Text/Number",
	"Panel/HighScore/Score_2/Text/Number",
	"Panel/HighScore/Score_3/Text/Number"
}
local _closePath = "Panel/Close"

local _subViewContainer = "SubViews"

function OnReady()
	
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
	SetupCloseButton()
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

function SetupCloseButton()
	local button = LuaGo.Find(_closePath)
	button.RegisterButtonPressedCallback(function ()
		UserProfilePopup.LuaCall_Out()
	end)
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

function Hide()
end
