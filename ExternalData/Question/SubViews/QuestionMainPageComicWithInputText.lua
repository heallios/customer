function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/QuestComicWithTextInput.prefab",
		Config = ""
    }
end

local _btnGoAnswePath = "DesGroup/BotGroup/goAnswer"
local _btnGoComicPath = "DesGroup/BotGroup/goComic/btnComic"
local _btnGoNextAnswePath = "DesGroup/BotGroup/NextAnswer"

local _AnswerGroupdPath = "DesGroup/AnswerGroup"
local _ScrollGroupdPath = "DesGroup/Scroll"


local answer
local scroll
local btnBack
function OnReady()

	answer = LuaGo.Find(_AnswerGroupdPath)	
	scroll = LuaGo.Find(_ScrollGroupdPath)
	btnBack = LuaGo.Find(_btnGoComicPath)

	Question.SubViewReady(LuaGo)

	SetupButonGoAnswer(_btnGoAnswePath)
	SetupButonGoComic(_btnGoComicPath)
end

function SetupButonGoAnswer(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		ShowAnswer()
		HideComic()
		btnBack.SetActive(true)
    end)
end

function SetupButonGoComic(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		HideAnswer()
		ShowComic()
		btnBack.SetActive(false)
    end)
end

function HideAnswer()
	answer.SetActive(false)
end

function ShowAnswer()
	answer.SetActive(true)
end

function HideComic()
	scroll.SetActive(false)
end

function ShowComic()
	scroll.SetActive(true)
end

function SetActiveUI(isActive)
	if isActive then
		Question.SetTitleQuestion("QUESTION")
	end
end

function SetDesText(path)
	
end

function SetImgDes(path)
	
end

