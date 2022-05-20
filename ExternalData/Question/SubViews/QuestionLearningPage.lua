function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/InfoQuest.prefab",
		Config = ""
    }
end

local _desImgPath = "DesGroup/desImg"
local _desTxtPath = "DesGroup/desTxt"
local _desImgBg = "DesGroup/desImgBg"
local _desGroupPath = "DesGroup"

local _text = nil;

function OnReady()
	Question.SubViewReady(LuaGo)
end

function SetDesText(path)
	_text = path;
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
		local objText = LuaGo.Find(_desTxtPath)
		objText.SetTextDoTweenAnimation(_text,3.0,objText)
	end
end

function Hide()
end
