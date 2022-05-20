
function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/UserProfile/AvatarItem.prefab",
		Config = "",
		Anchor = "Root",
		AnchorPreset = "MiddleCenter",
		SizeDelta = "{x: 208, y: 203}"
    }
end


function OnReady()
	GetTransForm()
	ChooseAvatar()
end

function GetTransForm()
	AvatarItem.LuaCall_SetTransform(LuaGo)
	
end

function Refresh()
	local objAvatar  = LuaGo.Find("Image")
	local objFrame = LuaGo
	objAvatar.SetSpriteForImage(AvatarItem.Model.Entity.sprite,objAvatar)
	if(AvatarItem.Model.Entity.isUse)
	then
		objFrame.SetSprite("frames_select")
	else
		objFrame.SetSprite("frames_not_selected")
	end
	
	

end
function ChooseAvatar()
	LuaGo.RegisterButtonPressedCallback(function ()
		AvatarItem.LuaCall_ChooseAvatar(LuaGo.name)
	end)
end
function Hide()
end
