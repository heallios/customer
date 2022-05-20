function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/VRVideo/SubViews/Tab.prefab",
		Config = ""
    }
end

local _luaClassTicket = "VRVideo/SubViews/ConcertTicketView"

local _subviewConcertName = "LuaView_ConcertTab"

local _contentPath = "ScrollView/Viewport/Content"

function OnReady()
	Initialize()
end

function Initialize()
	VRVideo.LuaCall_SetupSubviewName(LuaGo, _subviewConcertName)
end

function CreateTicket()
	local container = LuaGo.Find(_contentPath)
	VRVideo.LuaCall_CreateTicket(_luaClassTicket, container)
end

function Hide()
end
