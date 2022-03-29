function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/TrueFalseGroup.prefab",
		Config = ""
    }
end

local _desGroupPath = "DesGroup"

local _buttonPaths = {
	"DesGroup/groupBtn/answerBtnTrue",
	"DesGroup/groupBtn/answerBtnFalse"
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

function SetupBtnOnclick(btnId, isCorrect)
		if isCorrect then
			_correctBtnId = btnId;
		end

		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.RegisterButtonPressedCallback(function ()
			ChooseAnswer(isCorrect)
		end)	
end

function ChooseAnswer(isCorrect)
	ClearAllButtonClick()
	Question.LuaCall_IsCorrectAnswer(isCorrect)
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)
end

function Hide()
end
