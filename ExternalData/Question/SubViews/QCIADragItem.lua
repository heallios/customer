function GetConfig ()
	return {
        Bundle = "Assets/Prefabs/ComicInteractive/QCIADrag.prefab",
		Config = ""
    }
end

local _imgPath = "QCIADrag"
local _img = nil

function OnReady()
    Question.SubViewReady(LuaGo)
    _img = LuaGo
end

function SetImage(imgName)
    _img.SetSprite(imgName)
end

function SetLocalPosition(x, y, z)
    _img.SetAnchoredPosition(x, y, z)
end

function SetLocalRotation(x, y, z, w)
    _img.SetLocalRotation(x, y, z, w)
end

function SetLocalScale(x, y, z)
    _img.SetLocalScale(x, y, z)
end

function SetRectSize(x, y)
    _img.SetRectSize(x, y)
end

function Hide()
end
