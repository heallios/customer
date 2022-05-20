function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/VRVideo/VRVideo.prefab",
		Config = "",
		Anchor = "Front",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

--LuaSubviews--
local _classSubview = "VRVideo/SubViews/ClassView"
local _concertSubview = "VRVideo/SubViews/ConcertView"
local _popupClassSubview = "VRVideo/SubViews/Popup_JoinClass"
local _popupConcertSubview = "VRVideo/SubViews/Popup_JoinConcert"
local _tabContainer = "SubViews/Tab_Group"
local _popupContainer = "SubViews/Popup_Group"
--------

local _toggleClassTabPath = "Tabs/Toggle_Class"
local _toggleClassTextPath = "Tabs/Toggle_Class/Text"
local _toggleConcertTabPath = "Tabs/Toggle_Concert"
local _toggleConcertTextPath = "Tabs/Toggle_Concert/Text"


local _buttonBack = "TopBar/group_btn_Cancel/btn_Cancel"
local _textEnergy = "TopBar/txt_Energy/txt_Value"
local _textGem = "TopBar/txt_Gem/txt_Value"
local _textCoin = "TopBar/txt_Coin/txt_Value"

local _toggleDisableColor = "#BBBBBB"
local _toggleEnableColor = "#FFFFFF"

local _videoPlayerPath = "Preview"
local _buttonVideoBackgroundPath = "Preview/btn_Background"
local _videoBackButtonPath = "Preview/Portrait/Border/btn_Cancel"
local _videoPortraitPath = "Preview/Portrait"

local _buttonShowLandscape = "Preview/Portrait/Border/btn_Landscape"
local _buttonPlayPortraitVideoPath = "Preview/Portrait/Border/Background/btn_Play"

local _imagePlayPortraitVideoPath = "Preview/Portrait/Border/Background"

local _videoLandscapePath = "Preview/Landscape"
local _imageVideoLandscapePath = "Preview/Landscape/Video"

local _buttonLandscapeClosePath = "Preview/Landscape/Border/btn_Cancel"
local _buttonPortraitPath = "Preview/Landscape/Border/btn_Portrait"
local _buttonPlayLandscapeVideoPath = "Preview/Landscape/Border/Background/btn_Play"

local _imagePlayLandscapeBackgroundPath = "Preview/Landscape/Border/Background"

function OnReady()
	Initialize()
	local videoPlayer = LuaGo.Find(_videoPlayerPath)
	videoPlayer.SetActive(false)
end

function Initialize()
	SetupClassTab()
	SetupConcertTab()
	SetupToggleClassTab()
	SetupToggleConcertTab()
	SetupPopupClass()
	SetupPopupConcert()
	SetupBackButton()
	SetupPreviewButton()
	SetupShowLandscapeButton()
	SetupShowPortraitButton()
	SetLandscapeActive(false)
	SetupPlayButtons()
end

function SetupClassTab()
	local container = LuaGo.Find(_tabContainer)
	CreateSubView(_classSubview, container.Transform)
end

function SetupConcertTab()
	local container = LuaGo.Find(_tabContainer)
	CreateSubView(_concertSubview, container.Transform)
end

function SetupPopupClass()
	local container = LuaGo.Find(_popupContainer)
	CreateSubView(_popupClassSubview, container.Transform)
end

function SetupPopupConcert()
	local container = LuaGo.Find(_popupContainer)
	CreateSubView(_popupConcertSubview, container.Transform)
end

function SetupBackButton()
	local button = LuaGo.Find(_buttonBack)
	button.RegisterButtonPressedCallback(function ()
		VRVideo.LuaCall_BackButton()
	end)
end

function SetupPreviewButton()
	local button = LuaGo.Find(_buttonVideoBackgroundPath)
	local preview = LuaGo.Find(_videoPlayerPath)
	local portrait = LuaGo.Find(_videoPortraitPath)
	local landscape = LuaGo.Find(_videoLandscapePath)
	button.RegisterButtonPressedCallback(function ()
		preview.SetActive(false)
		VRVideo.LuaCall_ContinueMusicOnClose()
	end)
	local backButton = LuaGo.Find(_videoBackButtonPath)
	backButton.RegisterButtonPressedCallback(function ()
		preview.SetActive(false)
		VRVideo.LuaCall_ContinueMusicOnClose()
	end)
	local buttonCloseLandscape = LuaGo.Find(_buttonLandscapeClosePath)
	buttonCloseLandscape.RegisterButtonPressedCallback(function ()
		VRVideo.LuaCall_SetPortraitVideo(portrait, landscape)
		preview.SetActive(false)
		VRVideo.LuaCall_ContinueMusicOnClose()
	end)
end

function SetupPlayButtons()
	local playLandscapeVideoButton = LuaGo.Find(_buttonPlayLandscapeVideoPath)
	local playPortraitVideoButton = LuaGo.Find(_buttonPlayPortraitVideoPath)
	local playLandscapeBackground = LuaGo.Find(_imagePlayLandscapeBackgroundPath)
	local playPortraitBackground = LuaGo.Find(_imagePlayPortraitVideoPath)
	playLandscapeVideoButton.RegisterButtonPressedCallback(function ()
		playLandscapeBackground.SetActive(false)
		playPortraitBackground.SetActive(false)
		VRVideo.LuaCall_PlayVideo()
	end)
	playPortraitVideoButton.RegisterButtonPressedCallback(function ()
		playLandscapeBackground.SetActive(false)
		playPortraitBackground.SetActive(false)
		VRVideo.LuaCall_PlayVideo()
	end)
end

function CloseVideoOnCompleteVideo(time)
	local video = LuaGo.Find(_videoPlayerPath)
	local closeOnComplete = coroutine.create(function ()
		Wait(time)
		video.SetActive(false)
		VRVideo.LuaCall_ContinueMusicOnClose()
	end)
	coroutine.resume(closeOnComplete)
end

function CreateTicket(luaPath, container)
	CreateSubView(luaPath, container.Transform)
end

function SetupToggleClassTab()
	local toggleClass = LuaGo.Find(_toggleClassTabPath)
	local toggleConcert = LuaGo.Find(_toggleConcertTabPath)
	local toggleClassText = LuaGo.Find(_toggleClassTextPath)
	local toggleConcertText = LuaGo.Find(_toggleConcertTextPath)
	toggleClass.OnEventToggleChange(function(isActive)
		if isActive == true then
			VRVideo.LuaCall_OnEnableClassTab()
			toggleClassText.SetTextHexColor(_toggleEnableColor)
			toggleConcertText.SetTextHexColor(_toggleDisableColor)
		else
			toggleConcert.SetToggleEventIsOnOff(true)
		end
	end)
end

function SetupToggleConcertTab()
	local toggleClass = LuaGo.Find(_toggleClassTabPath)
	local toggleConcert = LuaGo.Find(_toggleConcertTabPath)
	local toggleClassText = LuaGo.Find(_toggleClassTextPath)
	local toggleConcertText = LuaGo.Find(_toggleConcertTextPath)
	toggleConcert.OnEventToggleChange(function(isActive)
		if isActive == true then
			VRVideo.LuaCall_OnEnableConcertTab()
			toggleClassText.SetTextHexColor(_toggleDisableColor)
			toggleConcertText.SetTextHexColor(_toggleEnableColor)
		else
			toggleClass.SetToggleEventIsOnOff(true)
		end
	end)
end

function SetCurrency(coin, gem, energy)
	SetCoin(coin)
	SetGem(gem)
	SetEnergy(energy)
end

function SetText(path, value)
	local text = LuaGo.Find(path)
	text.SetText(value)
end

function SetCoin(value)
	SetText(_textCoin, value)
end

function SetEnergy(value)
	SetText(_textEnergy, value)
end

function SetGem(value)
	SetText(_textGem, value)
end

function PlayClassVideo()
	local videoPlayer = LuaGo.Find(_videoPlayerPath)
	local playLandscapeBackground = LuaGo.Find(_imagePlayLandscapeBackgroundPath)
	local playPortraitBackground = LuaGo.Find(_imagePlayPortraitVideoPath)
	VRVideo.LuaCall_PlayClassVideo(videoPlayer)
	playLandscapeBackground.SetActive(true)
	playPortraitBackground.SetActive(true)
end

function PlayConcertVideo()
	local videoPlayer = LuaGo.Find(_videoPlayerPath)
	local playLandscapeBackground = LuaGo.Find(_imagePlayLandscapeBackgroundPath)
	local playPortraitBackground = LuaGo.Find(_imagePlayPortraitVideoPath)
	VRVideo.LuaCall_PlayConcertVideo(videoPlayer)
	playLandscapeBackground.SetActive(true)
	playPortraitBackground.SetActive(true)
end

function SetupShowLandscapeButton()
	local button = LuaGo.Find(_buttonShowLandscape)
	button.RegisterButtonPressedCallback(function ()
		SetLandscapeActive(true)
		SetPortraitActive(false)
	end)
end

function SetupShowPortraitButton()
	local button = LuaGo.Find(_buttonPortraitPath)
	button.RegisterButtonPressedCallback(function ()
		SetPortraitActive(true)
		SetLandscapeActive(false)
	end)
end

function SetLandscapeActive(isActive)
	local landscape = LuaGo.Find(_videoLandscapePath)
	local video = LuaGo.Find(_imageVideoLandscapePath)
	VRVideo.LuaCall_ScreenLandscapeOrentation(video)
	landscape.SetActive(isActive)
end
function SetPortraitActive(isActive)
	local portrait = LuaGo.Find(_videoPortraitPath)
	portrait.SetActive(isActive)
end

function Hide()
end
