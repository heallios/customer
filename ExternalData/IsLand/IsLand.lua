function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/IsLand/IsLand.prefab",
		Config = "",
		Anchor = "Back",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _IsLandItem = "IsLand/SubViews/IsLandSubViews"
local _GroupCellItem = "Island/SubViews/GroupCell"
local _btnJoinIsLand = "Bg/body/btnJoinIsLand"
local _btnBack = "back"

local _numCheat = "cheat/InputField/Text"
local _btnCheat = "cheat/Button"


function OnReady()
	SetupButtonBack(_btnBack)
	SetupButtonCheat(_btnCheat,_numCheat);
end

local _index = nil


function SetupButtonCheat(btnPath,valuePath)
	local btnCheat = LuaGo.Find(btnPath)
	local numCheat = LuaGo.Find(valuePath)
	btnCheat.RegisterButtonPressedCallback(function ()
		IsLand.LuaCall_CheatCell(numCheat.GetText())
    end)

end


function SetupButtonBack(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		IsLand.LuaCall_BackToMap()
    end)
end

function CreateSubViewCell(sum)
	_scrollContent = LuaGo.Find("Bg/body/Scroll/Content")
	for i = 1, sum do
		CreateSubView(_IsLandItem, _scrollContent.Transform)
    end
end

function CreateSubViewGroupCell()
	_scrollContent = LuaGo.Find("Bg/body/Scroll/Content")
	CreateSubView(_GroupCellItem, _scrollContent.Transform)
end

function CreateSubViewAllGroupCell(sum)
	_scrollContent = LuaGo.Find("Bg/body/Scroll/Content")
	_scrollContent.CleanChild()

	for i = 1, sum do
		CreateSubView(_GroupCellItem, _scrollContent.Transform)
	end
end

function SetTotalStarPoint(point)
	local txt = LuaGo.Find("StarPoint/txt")
	txt.SetText(point)
end

function MoveToCell(child)
	local scroll = LuaGo.Find("Bg/body/Scroll")
	local content = LuaGo.Find("Bg/body/Scroll/Content")
	child.SnapTo(scroll, content, child)
end

function Hide()
end
