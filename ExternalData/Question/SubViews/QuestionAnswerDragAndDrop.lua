function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/DragAndDrop/DragAndDropAnswer.prefab",
		Config = ""
    }
end

local _desGroupPath = "DesGroup"

local _slotTextGroup ={
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot/Text",
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot (1)/Text",
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot (2)/Text",
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot (3)/Text",
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot (4)/Text"
}

local _slotGroup ={
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot",
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot(1)",
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot(2)",
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot(3)",
	"DesGroup/PanelBlankGroup/SlotContainer/PanelSlot(4)"
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
	if isCorrect then
		ResetButtonsColor()
		CorrectAnswerMultipleChoice()
	else
		WrongAnswerMultipleChoice()
		CorrectAnswerMultipleChoice()
	end
	ClearAllButtonClick()
	Question.LuaCall_IsCorrectAnswer(isCorrect)
end

local _correctBtnPath ="mqc_green_correct"
local _wrongBtnPath ="mqc_red_wrong"
local _normalBtnPath ="mqc_answer_dark_blue"

function SetTextForSlot(text, index)
	local obj = LuaGo.Find(_slotTextGroup[index])
	obj.SetText(text)
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)
	if isActive then
		Question.LuaCall_SetActiveABGroup(false)
	end
end

function Hide()
end
