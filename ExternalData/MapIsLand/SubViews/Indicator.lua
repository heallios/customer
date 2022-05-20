function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Island/Planets/Indicator.prefab",
		Config = ""
    }
end


local _imageIndicator = "Button"
local _textIndicator = "Text"

----Hex Color--
local _disableColor = "#"
local _enableColor = "#"
----

function OnReady()
end

function SetText(content)
    local text = LuaGo.Find(_textIndicator)
    text.SetText(content)
end
function SetImage(name)
    local image = LuaGo.Find(_imageIndicator)
    image.SetSprite(name)
end
function SetImageSize(x, y)
    local image = LuaGo.Find(_imageIndicator)
    image.SetRectSize(x, y)
end
function SetImageColor(color, alpha)
    local image = LuaGo.Find(_imageIndicator)
    image.SetImgHexColor(color)
    image.SetImageOpacity(alpha)
end

function SetTextSize(size)
    local text = LuaGo.Find(_textIndicator)
    text.SetTextSize(size)
end

function Hide()
end

