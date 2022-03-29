function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/QuestSpeedRecognition.prefab",
		Config = ""
    }
end

function OnReady()
	Question.SubViewReady(LuaGo)

end

function SetupButonGoAnswer(btnPath)

end

function SetupButonGoComic(btnPath)
	
end

function HideAnswer()

end

function ShowAnswer()
	
end

function HideComic()
	
end

function ShowComic()
	
end

function SetActiveUI(isActive)
	if isActive then
		Question.SetTitleQuestion("QUESTION")
	end
end

function SetDesText(path)
	Log("set text: " .. path)
end

function SetImgDes(path)
	
end

