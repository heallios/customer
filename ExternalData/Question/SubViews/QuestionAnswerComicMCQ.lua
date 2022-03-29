function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/ComicMCQ.prefab",
		Config = ""
    }
end

local _desGroupPath = "DesGroup"

local _desTxtPath = "DesGroup/Des/desTxt"
local _text =nil

local _buttonPaths = {
	"DesGroup/groupBtn/answerBtnA",
	"DesGroup/groupBtn/answerBtnB",
	"DesGroup/groupBtn/answerBtnC",
	"DesGroup/groupBtn/answerBtnD"
}
local _textButtonPaths = {
	"DesGroup/groupBtn/answerBtnA/Text",
	"DesGroup/groupBtn/answerBtnB/Text",
	"DesGroup/groupBtn/answerBtnC/Text",
	"DesGroup/groupBtn/answerBtnD/Text"
}

local _answerTextPaths = {
	"DesGroup/Des/GroupAnswerText/Answer_A",
	"DesGroup/Des/GroupAnswerText/Answer_B",
	"DesGroup/Des/GroupAnswerText/Answer_C",
	"DesGroup/Des/GroupAnswerText/Answer_D"
}

local _textAnswer = {
	"A. ",
	"B. ",
	"C. ",
	"D. "
}
local _addTextAnswer ={}


function OnReady()
	Question.SubViewReady(LuaGo)
end

function ClearAllButtonClick()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.UnregisterButtonPressedCallback()
	end
end

local _correctBtnId

function SetupBtnOnclick(btnId, isCorrect, idPopup)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.RegisterButtonPressedCallback(function ()
			--Question.LuaCall_PlayFXOnclickMCQAnswer(btnId)
			ChooseAnswer(isCorrect, btnId, idPopup)
		end)	
end

function SetDesText(text)
	_text = text;
end

local _wrongTextColor
local _correctTextColor
local _wrongButtonColor

function SetupColor(wrongTextColor, correctTextColor, wrongButtonColor)
	_wrongTextColor = wrongTextColor
	_correctTextColor = correctTextColor
	_wrongButtonColor = wrongButtonColor
end

function ChooseAnswer(isCorrect, btnId, idPopup)
	if isCorrect then
		CorrectAnswerMultipleChoiceWithId(btnId)
		ClearAllButtonClick()

		Question.LuaCall_ShowButtonNext()
	else

		WrongAnswerMultipleChoiceWithId(btnId)
	end

	Question.LuaCall_AudioCorrectAnswer(isCorrect)
	
	if idPopup != "" then
		Question.LuaCall_ShowPopup(idPopup)
	end
end

local _correctBtnPath ="mqc_green_correct"
local _wrongBtnPath ="mqc_red_wrong"
local _normalBtnPath ="mqc_answer_dark blue"

function CorrectAnswerMultipleChoice()
		local obj = LuaGo.Find(_buttonPaths[_correctBtnId])
		obj.SetSprite(_correctBtnPath)
end

function CorrectAnswerMultipleChoiceWithId(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_correctBtnPath)

		local obj2 = LuaGo.Find(_answerTextPaths[btnId])
		obj2.SetTextColor(_correctTextColor);
end

function WrongAnswerMultipleChoiceWithId(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_wrongBtnPath)

		local obj2 = LuaGo.Find(_answerTextPaths[btnId])
		obj2.SetTextColor(_wrongTextColor);
end

function WrongAnswerMultipleChoice()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_wrongBtnPath)
	end
end

function ResetButtonsColor(color)
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_normalBtnPath)
		obj.SetImgColor(color)
	end
end
       
function SetupTextAnswer(btnId, value)
	--local obj = LuaGo.Find(_answerTextPaths[btnId])
	--obj.SetText(string.format("%s %s",_textAnswer[btnId] ,value))
	_addTextAnswer[btnId] = string.format("%s %s",_textAnswer[btnId] ,value)
	
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)

	if isActive then
		Question.LuaCall_SetActiveABGroup(true)
		local co = coroutine.create(function ()

			local objText = LuaGo.Find(_desTxtPath)
			objText.SetTextDoTweenAnimation(_text,3.0,objText)
			Wait(3)
			for i = 1 , #_addTextAnswer do 
				Wait(0.25)
				local objText = LuaGo.Find(_answerTextPaths[i])
				local textAnswer = _addTextAnswer[i]
				objText.SetTextDoTweenAnimation(textAnswer,0.25,objText)
			end
			

			for i = 1 , #_buttonPaths do 

				Wait(0.25)

				local objImage = LuaGo.Find(_buttonPaths[i])
				objImage.DoFadeImage(1.0, 0.75, objImage)
				objImage.SetButtonEnabled(true)
				local objText = LuaGo.Find(_textButtonPaths[i])
				objText.DoFadeText(1.0, 0.75, objText)
				--Question.LuaCall_PlayFXOnclickMCQAnswer(-1)
				
			end
		end)
		coroutine.resume(co)
	end
end

function ResetAnswerColor(color)
	for i = 1, #_answerTextPaths do
		local obj = LuaGo.Find(_answerTextPaths[i])
		obj.SetTextColor(color)
	end
end

function Hide()
end

