
function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Quizziz/QuizzizView.prefab",
		Anchor = "Front",
		Config = ""
    }
end

local _playerNamePath = "head/PlayerAvatar/nameBg/nameTxt"
local _botNamePath = "head/BotAvatar/nameBg/nameTxt"

local _loadingPanelPath ="PopupGroup/LoadingPanel"

local _container = "QuestionContainer"

local _quizzizPagePath = "Quizziz/QuizzizPage"

local _nextPanel = "PopupGroup/NextPanel"

local _countDownPanel = "PopupGroup/CountDownPanel"
local _countDownObject = "PopupGroup/CountDownPanel/panel"

local _endPanelPath = "PopupGroup/EndPanel"
local _endPlayerName ="PopupGroup/EndPanel/head/PlayerAvatar/name"
local _endBotName = "PopupGroup/EndPanel/head/BotAvatar/name"
local _endTitlePath = "PopupGroup/EndPanel/head/Type"
local _endPointpath = "PopupGroup/EndPanel/head/Score"

local _quitBtnPath = "PopupGroup/EndPanel/head/BackBtn"

local _playerHpPath = "head/BattleBg/PlayerRobo/healthBar/hpTxt"
local _botHpPath = "head/BattleBg/BotRobo/healthBar/hpTxt"

function OnReady()
	SetupButtonQuit(_quitBtnPath)

	QuizitPvp.LuaCall_CreatePages()
end

function SetupButtonQuit(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		QuizitPvp.LuaCall_GoBack()
    end)
end

function LoadQuizzizPage()
	local content = LuaGo.Find(_container);
	CreateSubView(_quizzizPagePath, content.Transform)
end

function SetActiveLoadingPanel(isActive)
	local obj = LuaGo.Find(_loadingPanelPath)
	obj.SetActive(isActive)
end

function SetActiveEndPanel(title, point)
	local co = coroutine.create(function ()
		Wait(3)

		local endTitleTxt = LuaGo.Find(_endTitlePath)
		endTitleTxt.SetText(title)

		local endPointTxt = LuaGo.Find(_endPointpath)
		endPointTxt.SetText(point)

		local endPanel = LuaGo.Find(_endPanelPath)
		endPanel.SetActive(true)
    end)
	coroutine.resume(co)

end

function SetActiveCountDown(isActive)
	local obj = LuaGo.Find(_countDownPanel)
	obj.SetActive(isActive)

	if (isActive) then
		local obj2 = LuaGo.Find(_countDownObject)
		obj2.AnimationPlay("123GO")
	end
end

function SetPlayerName(name)
	local obj = LuaGo.Find(_playerNamePath)
	obj.SetText(name)

	local obj2 = LuaGo.Find(_endPlayerName)
	obj2.SetText(name)
end

function SetBotName(name)
	local obj = LuaGo.Find(_botNamePath)
	obj.SetText(name)

	local obj2 = LuaGo.Find(_endBotName)
	obj2.SetText(name)
end

function SetActiveNextPanel(isActive)
	local obj = LuaGo.Find(_nextPanel)
	obj.SetActive(isActive)
end

function UpdateHp()
	local playerHpTxt = LuaGo.Find(_playerHpPath)
	playerHpTxt.SetText(QuizitPvp.Model.PlayerHp)

	local botHpTxt = LuaGo.Find(_botHpPath)
	botHpTxt.SetText(QuizitPvp.Model.BotHp)
end

function Hide()
end
