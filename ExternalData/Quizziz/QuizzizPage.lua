function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Quizziz/QuizzizPage.prefab",
		Config = ""
    }
end

local _desTxtPath = "DesGroup/desTxt"

local _desPath = "DesGroup"

local _buttonPaths = {
	"DesGroup/AnswerGroup/DesGroup/answerBtnA",
	"DesGroup/AnswerGroup/DesGroup/answerBtnB",
	"DesGroup/AnswerGroup/DesGroup/answerBtnC",
	"DesGroup/AnswerGroup/DesGroup/answerBtnD"
}

local _buttonTextPaths = {
	"DesGroup/AnswerGroup/DesGroup/answerBtnA/Text",
	"DesGroup/AnswerGroup/DesGroup/answerBtnB/Text",
	"DesGroup/AnswerGroup/DesGroup/answerBtnC/Text",
	"DesGroup/AnswerGroup/DesGroup/answerBtnD/Text"
}

local _buttonPlayerChoosePaths = {
	"DesGroup/AnswerGroup/DesGroup/answerBtnA/red_icon",
	"DesGroup/AnswerGroup/DesGroup/answerBtnB/red_icon",
	"DesGroup/AnswerGroup/DesGroup/answerBtnC/red_icon",
	"DesGroup/AnswerGroup/DesGroup/answerBtnD/red_icon"
}

local _buttonBotChoosePaths = {
	"DesGroup/AnswerGroup/DesGroup/answerBtnA/blue_icon",
	"DesGroup/AnswerGroup/DesGroup/answerBtnB/blue_icon",
	"DesGroup/AnswerGroup/DesGroup/answerBtnC/blue_icon",
	"DesGroup/AnswerGroup/DesGroup/answerBtnD/blue_icon"
}

local _colorRed = "#ff6b80"
local _colorGreen = "#89ff33"
local _colorWhite = "#b4eeff"

function OnReady()
	QuizitPvp.SubViewReady(LuaGo)
end

function SetDesText(path)
	local obj = LuaGo.Find(_desTxtPath)
	obj.SetText(path)
end

function ClearAllButtonClick()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.UnregisterButtonPressedCallback()
	end
end

function ClearButtonClick(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.UnregisterButtonPressedCallback()
end

local _correctBtnId

function SetupBtnOnclick(btnId, isCorrect)
		if isCorrect then
			_correctBtnId = btnId;
		end

		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.RegisterButtonPressedCallback(function ()
			ChooseAnswer(isCorrect, btnId)
		end)	
end

function ChooseAnswer(isCorrect, btnId)
	if (isCorrect) then
		CorrectAnswerMultipleChoice()
		ClearAllButtonClick()
	else
		WrongAnswerMultipleChoice(btnId)
		ClearAllButtonClick()
	end

	local playerChoose = LuaGo.Find(_buttonPlayerChoosePaths[btnId])
	playerChoose.SetActive(true)

	QuizitPvp.LuaCall_PlayerBtnIdChoose(btnId)
end

function ShowWhenTimeOut()
	local co = coroutine.create(function ()
		WrongAnswerMultipleChoiceAll()
		CorrectAnswerMultipleChoice()
		ClearAllButtonClick()
		ShowChoosen()
		Wait(1)
		QuizitPvp.LuaCall_MoveToNextQuizit()
	end)
	coroutine.resume(co)
end

function ShowChoosen()
	--if QuizitPvp.Model.PlayerBtnId > 0 then

	--end

	local botChoose = LuaGo.Find(_buttonBotChoosePaths[QuizitPvp.Model.BotBtnId])
	botChoose.SetActive(true)
end

local _correctBtnPath ="button_green_pvp"
local _wrongBtnPath ="button_red_pvp"
local _normalBtnPath ="button_blue_pvp"

function CorrectAnswerMultipleChoice()
		local obj = LuaGo.Find(_buttonPaths[_correctBtnId])
		obj.SetSprite(_correctBtnPath)

		local objText = LuaGo.Find(_buttonTextPaths[_correctBtnId])
		objText.SetTextHexColor(_colorGreen)

		QuizitPvp.LuaCall_PlaySFXAnswerCorrect()
end

function WrongAnswerMultipleChoice(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_wrongBtnPath)

		local objText = LuaGo.Find(_buttonTextPaths[btnId])
		objText.SetTextHexColor(_colorRed)

		QuizitPvp.LuaCall_PlaySFXAnswerWrong()
end

function WrongAnswerMultipleChoiceAll()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_wrongBtnPath)

		local objText = LuaGo.Find(_buttonTextPaths[i])
		objText.SetTextHexColor(_colorRed)
	end
end

function ResetButtonsColor()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_normalBtnPath)
	end
end
       
function SetupTextForMultipleChoiceButton(btnId, value)
	local obj = LuaGo.Find(_buttonTextPaths[btnId])
	obj.SetText(value)
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desPath)
	obj.SetActive(isActive)
	if isActive then
		local co = coroutine.create(function ()
			Wait(3)
			for i = 1 , #_buttonPaths do 

				Wait(0.25)

				local objImage = LuaGo.Find(_buttonPaths[i])
				objImage.DoFadeImage(1.0, 0.75, objImage)
				objImage.SetButtonEnabled(true)
				local objText = LuaGo.Find(_buttonTextPaths[i])
				objText.DoFadeText(1.0, 0.75, objText)
				
			end
    	end)
		coroutine.resume(co)
	end

end

local _timeObjectPath = "DesGroup/clockIcon"

function SetActiveTime(isActive)
	local obj = LuaGo.Find(_timeObjectPath)
	obj.SetActive(isActive)
end

function Hide()
end
