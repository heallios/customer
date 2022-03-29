function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/DragAndDrop/DragItem.prefab",
		Config = ""
    }
end

local _textPath = "txt"
local _imgPath = "bg"

function OnReady()
	Question.SubViewReady(LuaGo)
end

function SetText(text)
	local obj = LuaGo.Find(_textPath)
	obj.SetText(text)
end

function SetSprite(imgPath)
	local obj = LuaGo.Find(_imgPath)
	obj.SetSprite(imgPath)
end

local _spritePath = "mqc_answer_dark_blue"

RandomFunc = function(x)
    local r = math.random(1,#x)
    return x[r]
end

function RandomSprite()
	SetSprite(RandomFunc(_spritePath))
end

function SetSpriteWithIndex()
	SetSprite(_spritePath)
end

function Hide()
end
