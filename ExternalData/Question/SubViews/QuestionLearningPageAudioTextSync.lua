function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/LearningPage/LearningQuestAudioTextSync.prefab",
		Config = ""
    }
end

local _desImgPath = "DesGroup/desImg"
local _desImgBg = "DesGroup/desImgBg"
local _desTxtPath = "DesGroup/desTxt"
local _desGroupPath = "DesGroup"

function OnReady()
	Question.SubViewReady(LuaGo)
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
		local objImage = LuaGo.Find(_desImgPath)
		objImage.DoFadeImage(1.0, 0.75, objImage)
		objImage.DOGlitchEffect(2, objImage)
		local desImgBg = LuaGo.Find(_desImgBg)
		desImgBg.DoFadeImage(1.0, 0.75, desImgBg)
	end
end

function Hide()
end
