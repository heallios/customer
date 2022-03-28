function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/LearningPage/LearningQuestSpeedRecognition.prefab",
		Config = ""
    }
end
local _desImgBG = "DesGroup/desImgBg"
local _desImgPath = "DesGroup/desImgBg/desImg"
local _desTxtPath = "DesGroup/desTxt"
local _desGroupPath = "DesGroup"
local _text = nil
function OnReady()
	Question.SubViewReady(LuaGo)
end

function SetDesText(path)
	-- local obj = LuaGo.Find(_desTxtPath)	
	-- obj.SetText(path, obj)
	_text = path
end

function SetImgDes(path)
	local obj = LuaGo.Find(_desImgPath)	
	obj.SetSprite(path, obj)
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)
	if isActive then
		Question.LuaCall_SetActiveABGroup(true)
		Question.SetTitleQuestion("LEARN PAGE")
		local objBg = LuaGo.Find(_desImgBG)
		objBg.DoFadeImage(1.0,0.75,objBg)
		local objImage = LuaGo.Find(_desImgPath)
		objImage.DoFadeImage(1.0, 0.75, objImage)
		
		
		local objText = LuaGo.Find(_desTxtPath)
		objText.SetTextDoTweenAnimation(_text,3.0,objText)

	end
end

function Hide()
end
