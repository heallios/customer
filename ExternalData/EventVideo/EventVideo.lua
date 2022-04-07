function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/EventVideo.prefab",
		Config = "",
		Anchor = "Front",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

--LuaSubviews--
local _classSubview = "EventVideo/SubViews/ClassView"
local _concertSubview = "EventVideo/SubViews/ConcertView"
local _popupClassSubview = "EventVideo/SubViews/Popup_JoinClass"
local _popupConcertSubview = "EventVideo/SubViews/Popup_JoinConcert"
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
local _videoBackButtonPath = "Preview/TopBar/group_btn_Cancel/btn_Cancel"

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
		EventVideo.LuaCall_BackButton()
	end)
end

function SetupPreviewButton()
	local button = LuaGo.Find(_videoPlayerPath)
	button.RegisterButtonPressedCallback(function ()
		button.SetActive(false)
		EventVideo.LuaCall_ContinueMusicOnClose()
	end)
	local backButton = LuaGo.Find(_videoBackButtonPath)
	backButton.RegisterButtonPressedCallback(function ()
		button.SetActive(false)
		EventVideo.LuaCall_ContinueMusicOnClose()
	end)
end

function CloseVideoOnCompleteVideo(time)
	local video = LuaGo.Find(_videoPlayerPath)
	local closeOnComplete = coroutine.create(function ()
		Wait(time)
		video.SetActive(false)
		EventVideo.LuaCall_ContinueMusicOnClose()
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
			EventVideo.LuaCall_OnEnableClassTab()
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
			EventVideo.LuaCall_OnEnableConcertTab()
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
	EventVideo.LuaCall_PlayClassVideo(videoPlayer)
end

function PlayConcertVideo()
	local videoPlayer = LuaGo.Find(_videoPlayerPath)
	EventVideo.LuaCall_PlayConcertVideo(videoPlayer)
end

function Hide()
end
