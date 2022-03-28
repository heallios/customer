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

function SetupBtnOnclick(btnId, isCorrect, word, mean)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.RegisterButtonPressedCallback(function ()
			ChooseAnswer(isCorrect, btnId, word, mean)
		end)	
end



function ChooseAnswer(isCorrect, btnId, word, mean)
	if isCorrect then
		CorrectAnswerMultipleChoiceWithId(btnId)
		ClearAllButtonClick()
		Question.LuaCall_EndQuestionPanelData(isCorrect, word, mean)
	else
		WrongAnswerMultipleChoiceWithId(btnId)
		Question.LuaCall_SetActiveWrongPanel2(word, mean)
	end


end

local _correctBtnPath ="mqc_green_correct"
local _wrongBtnPath ="mqc_red_wrong"
local _normalBtnPath ="mqc_answer_dark_blue"

function CorrectAnswerMultipleChoice()
		local obj = LuaGo.Find(_buttonPaths[_correctBtnId])
		obj.SetSprite(_correctBtnPath)
end

function CorrectAnswerMultipleChoiceWithId(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_correctBtnPath)
end

function WrongAnswerMultipleChoiceWithId(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_wrongBtnPath)
end

function WrongAnswerMultipleChoice()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_wrongBtnPath)
	end
end

function ResetButtonsColor()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_normalBtnPath)
		obj.SetAlpha(0, obj);
		local obj2 = LuaGo.Find(_buttonTextPaths[i])
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

function Hide()
end
