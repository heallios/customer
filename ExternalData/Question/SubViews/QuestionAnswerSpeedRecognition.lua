function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/SpeedRecognitionAnswer.prefab",
		Config = ""
    }
end

local _desImgPath = "DesGroup/imgDes/Avata"
local _desTxtPath = "DesGroup/des"
local _desGroupPath = "DesGroup"
local _btnAnswer ={
	"DesGroup/AnswerGroup/Answer_1",
	"DesGroup/AnswerGroup/Answer_2"
}
local _textButtonAnswer ={
	"DesGroup/AnswerGroup/Answer_1/Text",
	"DesGroup/AnswerGroup/Answer_2/Text"
}
local _text = nil;

function OnReady()
	Log("SpeedRecognition => OnReady")
	Question.SubViewReady(LuaGo)
end

function SetDesText(path)
	--local obj = LuaGo.Find(_desTxtPath)	
	--obj.SetText(path, obj)
	Log("SetDesText: " .. path)
	_text = path;
end

function SetImgDes(path)
	--local obj = LuaGo.Find(_desImgPath)	
	--obj.SetSprite(path, obj)
	Log("set img des: " .. path)
end

function SetActiveUI(isActive)
	Log("SpeedRecognition => SetActiveUI")
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)

	if isActive then
		local objImage = LuaGo.Find(_desImgPath)
		objImage.DoFadeImage(1.0, 0.75, objImage)
		local objText = LuaGo.Find(_desTxtPath)
		objText.SetTextDoTweenAnimation(_text,1.0,objText)
		local co = coroutine.create(function () 
			Wait(1)
			for i = 1 , #_btnAnswer do 

				Wait(0.25)

				local objImage = LuaGo.Find(_btnAnswer[i])
				objImage.DoFadeImage(1.0, 0.75, objImage)
				local objText = LuaGo.Find(_textButtonAnswer[i])
				objText.DoFadeText(1.0, 0.75, objText)
				
			end
		end)
		coroutine.resume(co)

	end
end

function Hide()
end
