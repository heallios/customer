function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/MultipleChoiceGroup.prefab",
		Config = ""
    }
end

local _desGroupPath = "DesGroup"

local _buttonPaths = {
	"DesGroup/groupBtnUp/answerBtnA",
	"DesGroup/groupBtnUp/answerBtnB",
	"DesGroup/groupBtnDow/answerBtnC",
	"DesGroup/groupBtnDow/answerBtnD"
}

local _buttonTextPaths = {
	"DesGroup/groupBtnUp/answerBtnA/Text",
	"DesGroup/groupBtnUp/answerBtnB/Text",
	"DesGroup/groupBtnDow/answerBtnC/Text",
	"DesGroup/groupBtnDow/answerBtnD/Text"
}

local _correctBtnPath ="mqc_green_correct"
local _wrongBtnPath ="mqc_red_wrong"
local _normalBtnPath ="mqc_answer_dark_blue"

local _correctTextColor = nil
local _wrongTextColor = nil
local _normalTextColor = nil

function OnReady()
	Question.SubViewReady(LuaGo)
end

function ClearAllButtonClick()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.UnregisterButtonPressedCallback()
	end
end

function ClearButtonClick(btn)
	btn.UnregisterButtonPressedCallback()
end

local _correctBtnId

local _indexAb = 0

function SetupBtnOnclick(btnId, isCorrect, idPopup, idAb)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.RegisterButtonPressedCallback(function ()
			ChooseAnswer(isCorrect, btnId, idPopup, idAb)
			ClearButtonClick(obj)
		end)	
end

local _maximumPoint = 1
local _pointWrong = 0.25
local _currentPoint = 0
local isFinished = false

function SetUpPoint(max, wrong)
	_maximumPoint = max
	_pointWrong = wrong
	_currentPoint = 0
end

function ChooseAnswer(isCorrect, btnId, idPopup, idAb)
	if isCorrect then
		Question.LuaCall_UpdateWrongQuestion(_currentPoint/_maximumPoint)
		Question.LuaCall_ChangeCorrectAb()
		CorrectAnswerMultipleChoiceWithId(btnId)
		ClearAllButtonClick()
		
		Question.LuaCall_FinishQuestionAction();
		Question.LuaCall_ShowButtonNext()		
	else
		_currentPoint = _currentPoint + _pointWrong
		Question.LuaCall_ChangeWrongAb()
		WrongAnswerMultipleChoiceWithId(btnId)
	end

	Question.LuaCall_AudioCorrectAnswer(isCorrect)

	if idPopup != "" then
		Question.LuaCall_ShowPopup(idPopup)
	end

	if idAb != "" then
		Question.LuaCall_SetTextABWithId(idAb, _indexAb)
	else
		Question.LuaCall_SetTextAB("_No data to output\n_................\n_................\n_................\n")
	end
end

function CorrectAnswerMultipleChoice()
		CorrectAnswerMultipleChoiceWithId(_correctBtnPath)
end

function CorrectAnswerMultipleChoiceWithId(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_correctBtnPath)
		local obj2 = LuaGo.Find(_buttonTextPaths[btnId])
		obj2.SetTextColor(_correctTextColor)
end

function WrongAnswerMultipleChoiceWithId(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_wrongBtnPath)
		local obj2 = LuaGo.Find(_buttonTextPaths[btnId])
		obj2.SetTextColor(_wrongTextColor)
end

function WrongAnswerMultipleChoice()
	for i = 1, #_buttonPaths do
		WrongAnswerMultipleChoiceWithId(i)
	end
end

function ResetButtonsColor()
	isFinished = false
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_normalBtnPath)
		obj.SetAlpha(0, obj);
		local obj2 = LuaGo.Find(_buttonTextPaths[i])
		obj2.SetTextColor(_normalTextColor)
		obj2.SetAlpha(0, obj2);	
	end
end
       
function SetupTextForMultipleChoiceButton(btnId, value)
	local obj = LuaGo.Find(_buttonTextPaths[btnId])
	obj.SetText(value)
end



function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)

	if isActive then
		_isWrong = false;
		Question.LuaCall_SetActiveABGroup(true)
		Question.LuaCall_LoopRandomText()
		if isFinished == false then
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
			isFinished = true
		end
	end
end

function SetColorText(correct, wrong, normal)
	_correctTextColor = correct
	_wrongTextColor = wrong
	_normalTextColor = normal
	ResetButtonsColor()
end

function Hide()
end
