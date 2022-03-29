

function GetConfig ()
	return {
        Bundle = "Assets/Scripts/Modules/IsLand/Component/Cell/CellItemPrefab.prefab",
		Config = "",
		AnchorPreset = "MiddleCenter",
		SizeDelta = "{x: 550, y: 550}"
    }
end

local pathPrefab = "Assets/Scripts/Modules/IsLand/Component/Cell/CellItemPrefab.prefab"
local _cellSubViews = "IsLand/SubViews/CellSubViews"
local _index = nil

function OnReady()
	_index = LuaGo.GetSiblingIndex() +1
	SetupButtonJoinIsland()
end

function SetupButtonJoinIsland()
	local btn = LuaGo.Find("ItemCell/btnJoinCell")
	IsLand.LuaCall_SetIndex(_index,LuaGo)
	btn.RegisterButtonPressedCallback(function ()
		IsLand.LuaCall_JoinCellView(_index)
    end)
end


