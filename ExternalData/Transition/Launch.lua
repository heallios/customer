
local _percentText = nil;
local _pieAnim = nil;

function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Transition/TransitionView.prefab",
		Config = {}
    }
end

function OnReady()
	_percentText = LuaGo.Find("LoadingView/LoadingTxt")
	--_pieAnim = LuaGo.Find("TransitionView/LoadingView/PieAnimator")

	--_pieAnim.AnimationSetTrigger("ShowRoundObject");
end

function UpdateProgress(percent, message)
	--Log(percent)
	--Log("message: " .. message)
	--Log("LuaGo: " .. LuaGo.Name)

	_percentText.SetText(percent .. "%");

	--Log("text: " .. text.name);
	--Log("GameObjectTest: " .. GameObject._find("UICamera1"))
	--LuaGo.SetActive(false)
	--Log("ChildCount: " .. LuaGo.ChildCount)
	--LuaGameObject:TestLua()
end

function Hide()
	LuaGo.DoFade(0, 1, true)
end

function Show()
	LuaGo.DoFade(1, 1, true)
end