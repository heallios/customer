function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/MultipleChoicePictureGroup.prefab",
		Config = ""
    }
end

local _desGroupPath = "DesGroup"

local _buttonPaths = {
	"DesGroup/ButtonCotainer/groupBtnUp/answerBtnA",
	"DesGroup/ButtonCotainer/groupBtnUp/answerBtnB",
	"DesGroup/ButtonCotainer/groupBtnDow/answerBtnC",
	"DesGroup/ButtonCotainer/groupBtnDow/answerBtnD"
}

local _buttonImagePaths = {
	"DesGroup/ButtonCotainer/groupBtnUp/answerBtnA/Img",
	"DesGroup/ButtonCotainer/groupBtnUp/answerBtnB/Img",
	"DesGroup/ButtonCotainer/groupBtnDow/answerBtnC/Img",
	"DesGroup/ButtonCotainer/groupBtnDow/answerBtnD/Img"
}

local _textPath = "DesGroup/BG_Question/Text"

local _textArray = {}
local _correctArray ={}
local _buttonImageArray ={}
local _currentCorrectIndex = 1

local _correctBtnPath ="BG_Picture_Correct"
local _wrongBtnPath ="BG_Picture_Wrong"
local _normalBtnPath ="BG_Picture"

local _indexCorrect = 0
local _indexWrong = 1

function OnReady()
	Question.SubViewReady(LuaGo)
end

function ChooseAnswer(btnId, imageName, idAb)
	Log(idAb)
	if imageName == _correctArray[_currentCorrectIndex] then		
		if(idAb != "") then
			Question.LuaCall_SetTextABWithId(idAb, _indexCorrect)
		else
			Question.LuaCall_SetTextAB("No data to output\nAnswer [CORRECT]")
		end
		Question.LuaCall_AudioCorrectAnswer(true)
		CorrectAnswerMultipleChoiceWithId(btnId)
	else
		if(idAb != "") then
			Question.LuaCall_SetTextABWithId(idAb, _indexWrong)
		else
			Question.LuaCall_SetTextAB("No data to output\nAnswer [WRONG]")
		end
		Question.LuaCall_AudioCorrectAnswer(false)
		WrongAnswerMultipleChoiceWithId(btnId)
	end
	
	MoveToNextQuestion()
end

function CorrectAnswerMultipleChoiceWithId(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_correctBtnPath)
end

function WrongAnswerMultipleChoiceWithId(btnId)
		local obj = LuaGo.Find(_buttonPaths[btnId])
		obj.SetSprite(_wrongBtnPath)
end

function SetTextQuestion(text)
	local obj = LuaGo.Find(_textPath)
	obj.SetText("")
	obj.SetTextDoTweenAnimation(text,1.0,obj)
end

function MoveToNextQuestion()
	Question.SetActiveNextPanel(true)
	local co2 = coroutine.create(function ()
		Wait(1)

		GetCorrectButton()

		ResetButtonsColor()

		if _currentCorrectIndex > #_textArray then
			Question.LuaCall_NextQuestion()
		else
			SetTextQuestion(_textArray[_currentCorrectIndex])
		end

		Wait(1)

		Question.SetActiveNextPanel(false)
    end)

	coroutine.resume(co2)
end

function SetupBtn(btnId, imageName, idAb)
	_buttonImageArray[btnId] = imageName

	local image = LuaGo.Find(_buttonImagePaths[btnId])
	image.SetSprite(imageName)

	local btn = LuaGo.Find(_buttonPaths[btnId])
	btn.UnregisterButtonPressedCallback()
	btn.RegisterButtonPressedCallback(function ()
		ChooseAnswer(btnId, imageName, idAb)
	end)
end

function SetUpDataTextShow(id, value)
	_textArray[id] = value
end

function SetUpCorrectAnswer(id, value)
	_correctArray[id] = value
end

function SetActiveUI(isActive, isFinishQuestion)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)

	if isActive then
		Question.LuaCall_SetActiveABGroup(true)
		Question.LuaCall_LoopRandomText()

		if(isFinishQuestion == false) then
			ResetData()

			local co = coroutine.create(function ()
				SetTextQuestion(_textArray[_currentCorrectIndex])
				Wait(1)
				for i = 1 , #_buttonPaths do 

					Wait(0.25)

					local objImage = LuaGo.Find(_buttonPaths[i])
					objImage.DoFadeImage(1.0, 0.75, objImage)
					objImage.SetButtonEnabled(true)
					local objImage2 = LuaGo.Find(_buttonImagePaths[i])
					objImage2.DoFadeImage(1.0, 0.75, objImage2)
				
				end
    		end)
			coroutine.resume(co)
		end
	end
end

function ResetData()
	_currentCorrectIndex = 1
	Log(_currentCorrectIndex)
	ResetButtons()
end

function ResetButtons()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetActive(true)
		obj.SetButtonEnabled(false)
		obj.SetSprite(_normalBtnPath)
		obj.SetAlpha(0, obj);
		local obj2 = LuaGo.Find(_buttonImagePaths[i])
		obj2.SetAlpha(0, obj2);
	end
end

function ResetButtonsColor()
	for i = 1, #_buttonPaths do
		local obj = LuaGo.Find(_buttonPaths[i])
		obj.SetSprite(_normalBtnPath)
	end
end

function GetCorrectButton()
	for i = 1, #_buttonImageArray do
		if _buttonImageArray[i] == _correctArray[_currentCorrectIndex] then
			local obj = LuaGo.Find(_buttonPaths[i])
			obj.SetActive(false)
		end
	end

	_currentCorrectIndex = _currentCorrectIndex + 1
end

function Hide()
end
