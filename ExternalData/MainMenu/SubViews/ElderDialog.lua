function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/MainMenu/SubViews/ElderDialogue.prefab",
		Config = ""
    }
end

local _textDialogContentPath = "image_DialogContent/text_Content"

local _nextButtonPath = "button_NextContent"
local _skipButtonPath = "button_SkipContent"

local _sentences = {
	"Hi, I'm Elfo",
	"bla...bla...bla...",
	"blablabla...bla...bla..etc.."
}

function OnReady()
	SetTextDialogContent(1, 2)
end
function SetupNextButton()
	local button = LuaGo.Find(_nextButtonPath)
	button.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_SetupNextButton()
    end)
end

function SetupSkipButton()
	local button = LuaGo.Find(_skipButtonPath)
	button.RegisterButtonPressedCallback(function ()
		MainMenu.LuaCall_SetActiveElderDialogSubView(false)
		MainMenu.LuaCall_GoToCellView()
	end)
end

function SetTextDialogContent(sentenceIndex, time)
	local textObj = LuaGo.Find(_textDialogContentPath)
	if sentenceIndex <= #_sentences then
		textObj.SetText("")
		textObj.SetTextDoTweenAnimation(_sentences[sentenceIndex], time)
	else
		MainMenu.LuaCall_SetActiveElderDialogSubView(false)
		MainMenu.LuaCall_GoToCellView()
	end
end
function Hide()
end
