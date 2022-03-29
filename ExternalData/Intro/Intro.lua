function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Intro/Intro.prefab",
		Config = ""
    }
end
local _pathImageLogo ="Image"
function FadeInImageLogo()
  local objImage = LuaGo.Find(_pathImageLogo)
  objImage.DoFadeImage(1,5)
end

function OnReady()
	FadeInImageLogo()
end

function Hide()
end
