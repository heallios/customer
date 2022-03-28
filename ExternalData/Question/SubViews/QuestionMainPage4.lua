function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Quest 4.prefab",
		Config = ""
    }
end

local _desImgPath = "DesGroup/desImg"
local _desTxtPath = "DesGroup/desTxt"

function OnReady()
	Question.SubViewReady(LuaGo)
end

function SetDesText(path)
	--local obj = LuaGo.Find(_desTxtPath)	
	--obj.SetText(path, obj)
end

function SetImgDes(path)
	--local obj = LuaGo.Find(_desImgPath)	
	--obj.SetSprite(path, obj)
end

local _desPath = "DesGroup"

function SetActiveUI(isActive)
	if isActive then
		Question.SetTitleQuestion("QUESTION")
	end
	local obj = LuaGo.Find(_desPath)
	obj.SetActive(isActive)
end

function Hide()
end
