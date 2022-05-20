function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Island/Planets/HorizontalLocator.prefab",
		Config = ""
    }
end

----Indicator--
local _indicatorContainer = "Content"
local _luaIndicatorPath = "MapIsLand/SubViews/Indicator"
--------

function OnReady()
end

function GetIndicators()
    local _container = LuaGo.Find(_indicatorContainer)
end
function CreateIndicators(amount)
    local container = LuaGo.Find(_indicatorContainer)
    for i = 1, amount do
        CreateIndicator(container)
    end
end
function CreateIndicator(container)
    MapIsLand.LuaCall_CreateIndicator(_luaIndicatorPath, container)
end

function Hide()
end

