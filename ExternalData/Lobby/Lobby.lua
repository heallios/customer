

function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Lobby/Lobby.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _buttonsIsLandPath = "Bg/footer/groupBtnLeft/islandBtn"
local _buttonGenderPath = "Bg/body/groupBtnLeft/genderBtn"
local _buttonIslandPath = "Bg/footer/groupBtn/islandBtn"
local _buttonPVPPath = "Bg/footer/groupBtn/pvpBtn"

local _buttonSkinPath = "Bg/body/groupBtnRight/skinBtn"
local _buttonMailPath = "Bg/body/groupBtnRight/mailBtn"
local _buttonEventVideoPath = "Bg/body/groupBtnRight/videoBtn"

local _noticeMailPath = "Bg/body/groupBtnRight/mailBtn/iconRed"
local _buttonSubscription = "Bg/body/groupBtnRight/subscriptionBtn"

function OnReady()
	SetupButtonSkin(_buttonSkinPath)
	SetupButtonEventVideo(_buttonEventVideoPath)
	SetupButtonMail(_buttonMailPath)

	SetupButtonSubscription(_buttonSubscription)
end

function SetupButton(animName, btnPath, index)
	local btn = LuaGo.Find(btnPath)		
	btn.RegisterButtonPressedCallback(function ()
		_animator.AnimationSetTrigger(animName)
		Lobby.Scroller.AddLobbyBody(_playerMainBodyPath, _playerHeadPartPath, _playerBackPartPath, _playerHandLPartPath, _playerHandRPartPath)
    end)
end

function SetupButtonGender(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Lobby.ChangeGender()
    end)
end

function SetupButtonSkin(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Lobby.LuaCall_LoadInventory()
	end)
end

function SetupButtonSubscription(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Lobby.LuaCall_LoadSub()
	end)
end

function SetupButtonMail(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Lobby.LuaCall_LoadMailBox()
	end)
end

function SetupButtonEventVideo(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		Lobby.LuaCall_LoadVideo()
	end)
end

function NoticeMail(isActive)
	local icon = LuaGo.Find(_noticeMailPath)
	icon.SetActive(isActive)
end

function Hide()
end
