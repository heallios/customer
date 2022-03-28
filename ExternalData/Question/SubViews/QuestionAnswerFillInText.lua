function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/Answers/FillInTextBoxGroup.prefab",
		Config = ""
    }
end

local _desGroupPath = "DesGroup"
local _inputFieldPath ="DesGroup/InputField"
local _keyBoardPath = "DesGroup/keyBoard"
local _checkBtnPath = "DesGroup/CheckBtn"
local _checkTxtPath = "DesGroup/CheckBtn/CheckTxt"

function OnReady()
	Question.SubViewReady(LuaGo)
end

function AddText(text)
	local obj = LuaGo.Find(_inputFieldPath)
	obj.AddText(text)
end

function ClearText()
	local obj = LuaGo.Find(_inputFieldPath)
	obj.ClearText()
end

function SetActiveUI(isActive)
	local obj = LuaGo.Find(_desGroupPath)
	obj.SetActive(isActive)

	if isActive then
		Question.LuaCall_SetActiveABGroup(false)
		local co = coroutine.create(function ()
			end)
		coroutine.resume(co)
	end
end

function Hide()
end
