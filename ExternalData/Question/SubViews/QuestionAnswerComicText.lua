function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/ComicText.prefab",
		Config = ""
    }
end

local _desImgInputField = "DesGroup/Input"

local _txtInputField = "DesGroup/Input/TextArea/InputField"
local _desTitleImage = "DesGroup/ImageDes"
local _desTxtPath = "DesGroup/ImageDes/des"
local _desGroupPath = "DesGroup"
local _text = nil;
local _btnNextAnswerPath = "DesGroup/GameObject/correct/correct/btn_Next"
local _desPathAnswerText ={
	"DesGroup/GroupAnswer/txtGroup1/answer_1/text",
	"DesGroup/GroupAnswer/txtGroup1/answer_2/text",
	"DesGroup/GroupAnswer/txtGroup2/answer_3/text",
	"DesGroup/GroupAnswer/txtGroup2/answer_4/text"
}
local _desPathAnswer = {
	"DesGroup/GroupAnswer/txtGroup1/answer_1",
	"DesGroup/GroupAnswer/txtGroup1/answer_2",
	"DesGroup/GroupAnswer/txtGroup2/answer_3",
	"DesGroup/GroupAnswer/txtGroup2/answer_4"
}

local _groupTextPaths = {
	"",
	"",
	"",
	""
}

local _txtAnswer = {}

function OnReady()
	Question.SubViewReady(LuaGo)
end

function SetDesText(path)
	--local obj = LuaGo.Find(_desTxtPath)	
	--obj.SetText(path, obj)
	_text = path;
	
end

function SetImgDes(path)
	--local obj = LuaGo.Find(_desImgPath)	
	--obj.SetSprite(path, obj)
end

function  SetAnswerData(index, text)
	_txtAnswer[index+1] = text;
end

function SetInputFieldLimit(charLimit)
	Question.LuaCall_SetSignalForKeyboardInputField(LuaGo.Find(_desImgInputField), charLimit)
end

function SetActiveUI(isActive, isActived)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)

	if isActive then
		Question.LuaCall_SetActiveABGroup(false)
		if not isActived then
			ActiveUIWithEffect()
		else
			ActiveUINoneEffect()
		end
	else

	end
	
end

function ActiveUIWithEffect ()
	local co = coroutine.create(function ()

				Wait(0.75)
				local objTitleDes = LuaGo.Find(_desTitleImage)
				objTitleDes.DoFadeImage(1.0,0.75,objTitleDes)
				Wait(0.75)
				local objText = LuaGo.Find(_desTxtPath)
				objText.SetText("")
				objText.SetTextDoTweenAnimation(_text,2.25,objText)

				Wait(1.25)
				for i = 1 , #_desPathAnswer do 
					Wait(0.5)
					local objImg = LuaGo.Find(_desPathAnswer[i])
					objImg.DoFadeImage(0.4, 0.75, objImg)
					local objText = LuaGo.Find(_desPathAnswerText[i])
					local textAnswer = _txtAnswer[i]
					objText.SetTextDoTweenAnimation(textAnswer,0.25,objText)
					objText.DoFadeText(1, 0.25, objText)
				end
				Wait(0.25)
				local objImgInput = LuaGo.Find(_desImgInputField)
				objImgInput.DoFadeImage(1.0,0.76,objImgInput)
				local objTextInput = LuaGo.Find(_txtInputField)
				objTextInput.SetTextDoTweenAnimation("Text will appear here", 0.5,objTextInput)
				objTextInput.SetTextOpacity(0.2)
				Wait(0.25)
			end)
	coroutine.resume(co)
end

function ActiveUINoneEffect()
	local objText = LuaGo.Find(_desTxtPath)
	objText.SetText(_text)

	for i = 1 , #_desPathAnswer do 
		local objText = LuaGo.Find(_desPathAnswerText[i])
		local textAnswer = _txtAnswer[i]
		objText.SetText(textAnswer)
	end

	local objTextInput = LuaGo.Find(_txtInputField)

	if objTextInput.GetText() == "" then
		objTextInput.SetText("Text will appear here")
	end
end

function DisActiveUI()

end

local _colorWhiteHex = "#"
local _colorGreenHex = "#"
local _colorRedHex = "#"
local _indexHint = 1
local _timeHint = 4
local _timeBeforeHint = 20
local _currentCorrectText = nil

function ResetTextAnswerColor()
	for i =1, #_groupTextPaths do
		local textAnswer = LuaGo.Find(_groupTextPaths[i])
		textAnswer.SetTextHexColor(_colorWhiteHex)
	end
end

--function UpdateHintIndex()
	--_indexHint ++
--end

--function SetHintIndex(index)
	--_indexHint = index
--end

--function ResetData()
	--_indexHint = 1
	--ResetTextAnswerColor()
--end

--function WaitHint()
	--if _indexHint <= #_groupTextPaths then
		--ResetTextAnswerColor()
		
	--end
	--coroutine.yield(WaitHint)
--end

--function UpdateAnswerCorrectFx()
	--if _indexHint == 0 then
		--_indexHint = 1
	--end

	--_currentCorrectText = Luago.Find()
--end

function Hide()
end
