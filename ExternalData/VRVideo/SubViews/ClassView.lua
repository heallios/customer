function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/VRVideo/SubViews/Tab.prefab",
		Config = ""
    }
end

local _luaClassTicket = "VRVideo/SubViews/ClassTicketView"

local _subviewClassName = "LuaView_ClassTab"

local _contentPath = "ScrollView/Viewport/Content"

function OnReady()
	Initialize()
end

function Initialize()
	VRVideo.LuaCall_SetupSubviewName(LuaGo, _subviewClassName)
end

function CreateTicket()
	local container = LuaGo.Find(_contentPath)
	VRVideo.LuaCall_CreateTicket(_luaClassTicket, container)
end

function Hide()
end
