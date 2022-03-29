function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Quest 3.prefab",
		Config = ""
    }
end

local _desImgPath = "DesGroup/desImg"
local _desTxtPath = "DesGroup/desTxt"

function OnReady()
	Question.SubViewReady(LuaGo)
end

function SetDesText(path)
	local obj = LuaGo.Find(_desTxtPath)	
	obj.SetText(path, obj)
end

function SetImgDes(path)
	local obj = LuaGo.Find(_desImgPath)	
	obj.SetSprite(path, obj)
end

local _desPath = "DesGroup"

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desPath)
	obj.SetActive(isActive)

	if isActive then
		local objImage = LuaGo.Find(_desImgPath)
		objImage.DoFadeImage(1.0, 0.75, objImage)
		
		--local objText = LuaGo.Find(_desTxtPath)
		--objText.SetTextDoTweenAnimation(_text,3.0,objText)
	end
end

function Hide()
end
