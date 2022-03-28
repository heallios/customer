function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/Quizit/QuizitPage.prefab",
		Config = ""
    }
end

local _desTxtPath = "DesGroup/BG_Des/desTxt"

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

function OnReady()
	Question.SubViewReady(LuaGo)
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

local _turn = 3

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
	Question.LuaCall_AudioCorrectAnswer(isCorrect)
	if (isCorrect) then
		Question.LuaCall_PlaySFXAnswerCorrect()
		CorrectAnswerMultipleChoice()
		ClearAllButtonClick()
		Question.LuaCall_SetEndQuizit()
		Question.LuaCall_IsCorrecQuizittAnswer(_turn)
	else
		Question.LuaCall_PlaySFXAnswerWrong()
		_turn = _turn - 1
		if(_turn == 0) then
			WrongAnswerMultipleChoiceAll()
			CorrectAnswerMultipleChoice()
			ClearAllButtonClick()
			Question.LuaCall_SetEndQuizit()
			Question.LuaCall_IsCorrecQuizittAnswer(0)
		else
			WrongAnswerMultipleChoice(btnId)
			ClearButtonClick(btnId)
		end
	end

	Question.LuaCall_ColorCurrentScore(_turn)
end

function ShowWhenTimeOut()
	
	WrongAnswerMultipleChoiceAll()
	CorrectAnswerMultipleChoice()
	ClearAllButtonClick()
	Question.LuaCall_IsCorrecQuizittAnswer(0)
	Question.LuaCall_ColorCurrentScore(0)
end

local _correctBtnPath ="mqc_green_correct"
local _wrongBtnPath ="mqc_red_wrong"
local _normalBtnPath ="mqc_answer_dark_blue"

function CorrectAnswerMultipleChoice()
		local obj = LuaGo.Find(_buttonPaths[_correctBtnId])
		obj.SetSprite(_correctBtnPath)
end

function WrongAnswerMultipleChoice(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_wrongBtnPath)
end

function WrongAnswerMultipleChoiceAll()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_wrongBtnPath)
		Question.LuaCall_PlaySFXAnswerWrong()
	end
end

function ResetButtonsColor()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_normalBtnPath)
		obj.SetAlpha(0, obj);
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

function ResetData()
	_turn = 3
end

local _timeObjectPath = "DesGroup/clockIcon"

function SetActiveTime(isActive)
	if isActive then
		Question.LuaCall_SetActiveABGroup(false)
		Question.SetTitleQuestion("QUIZ IT")
	end
	local obj = LuaGo.Find(_timeObjectPath)
	obj.SetActive(isActive)
end

function Hide()
end
