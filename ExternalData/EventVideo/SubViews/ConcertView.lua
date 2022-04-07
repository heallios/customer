function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/EventVideo/SubViews/Tab.prefab",
		Config = ""
    }
end

local _luaClassTicket = "EventVideo/SubViews/ConcertTicketView"

local _subviewConcertName = "LuaView_ConcertTab"

local _contentPath = "ScrollView/Viewport/Content"

function OnReady()
	Initialize()
end

function Initialize()
	EventVideo.LuaCall_SetupSubviewName(LuaGo, _subviewConcertName)
end

function CreateTicket()
	local container = LuaGo.Find(_contentPath)
	EventVideo.LuaCall_CreateTicket(_luaClassTicket, container)
end

function Hide()
end
