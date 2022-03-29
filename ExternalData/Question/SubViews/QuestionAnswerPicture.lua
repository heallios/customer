function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/PictureGroup.prefab",
		Config = ""
    }
end

local _desGroupPath = "DesGroup"

local _buttonPaths = {
	"DesGroup/groupBtn/answerBtnA",
	"DesGroup/groupBtn/answerBtnB"
}

local _buttonTextPaths = {
	"DesGroup/groupBtn/answerBtnA/Text",
	"DesGroup/groupBtn/answerBtnB/Text"
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

function SetupBtnOnclick(btnId, isCorrect, correctColor, wrongColor, imgPath)
		if isCorrect then
			_correctBtnId = btnId;
		end

		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.RegisterButtonPressedCallback(function ()
			ChooseAnswer(isCorrect, correctColor, wrongColor, imgPath)
		end)	
end



function ChooseAnswer(isCorrect, correctColor, wrongColor, imgPath)
	if isCorrect then
		CorrectAnswer(correctColor)
	else
		WrongAnswer(wrongColor)
		CorrectAnswer(correctColor)
	end
	ClearAllButtonClick()
	Question.LuaCall_IsCorrectAnswerPicture(isCorrect, imgPath)
end

function CorrectAnswer(color)
		local obj = LuaGo.Find(_buttonPaths[_correctBtnId])
		obj.SetOutLineColor(color)
end

function WrongAnswer(color)
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetOutLineColor(color)
	end
end

function ResetButtonsColor(color)
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetOutLineColor(color)
	end
end
       
function SetupTextForPictureQuestion(btnId, value)
	local obj = LuaGo.Find(_buttonTextPaths[btnId])
	obj.SetText(value)
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)
end

function Hide()
end
