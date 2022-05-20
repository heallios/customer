
function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Question/QuestionView.prefab",
		Config = ""
    }
end

local _footGroupPath = "foot/GroupBtn"
local _nextBtnPath3 = "foot/GroupBtn/nextBtn"
local _backBtnPath3 = "foot/GroupBtn/backBtn"

local _abGroupPath ="ABGroup"
local _nextBtnPath = "ABGroup/ABPanelUp/nextBtn"
local _nextBtnPath2 = "ABGroup/ABPanelDown/nextBtn"
local _backBtnPath = "ABGroup/ABPanelUp/backBtn"
local _backBtnPath2 = "ABGroup/ABPanelDown/backBtn"
local _panelABUpPath = "ABGroup/ABPanelUp"
local _panelABDownPath = "ABGroup/ABPanelDown"
local _txtABPath = "ABGroup/ABPanelUp/DataTxt"
local _btnOpenAbPath = "ABGroup/ABPanelDown/abOpenBtn"
local _btnCloseAbPath = "ABGroup/ABPanelUp/abCloseBtn"

local _abPanel = "ABGroup/ABPanelUp/Bg"

local _panelCorrectPath = "PopupGroup/CorrectPanel"

local _panelCorrectWordPath = "PopupGroup/CorrectPanel/OptionPopup/wordTxt"
local _panelCorrectMeanPath = "PopupGroup/CorrectPanel/OptionPopup/meanTxt"

local _panelWrongPath = "PopupGroup/WrongPanel"

local _panelWrongWordPath = "PopupGroup/WrongPanel/OptionPopup/wordTxt"
local _panelWrongMeanPath = "PopupGroup/WrongPanel/OptionPopup/meanTxt"

local _panelWrongPath2 = "PopupGroup/WrongPanel2"

local _panelWrongWordPath2 = "PopupGroup/WrongPanel2/OptionPopup/wordTxt"
local _panelWrongMeanPath2 = "PopupGroup/WrongPanel2/OptionPopup/meanTxt"

local _btnAudioPath ="soundBtn"
local _btnInfoPath ="head/InfoBtn"
local _btnNextTransitionPath ="PopupGroup/TransitionScreenPanel/btnNextTransition"
local _btnNextEndScreenPath ="PopupGroup/EndScreenPanel/btnNextEndScreen"
local _btnTryAgainEndScreenPath = "PopupGroup/EndScreenPanel/btnTryAgainEndScreen"
local _btnExitEndScreenPath = "PopupGroup/EndScreenPanel/btnExitEndScreen"

local _optionalPanelPath = "PopupGroup/OptionPanel"
local _optionCellPath = "PopupGroup/OptionPanel/OptionPopup/Info/Cell"
local _optionQuestionPath = "PopupGroup/OptionPanel/OptionPopup/Info/Answer"

local _loadingPanelPath ="PopupGroup/LoadingPanel"
local _transitionPanelPath ="PopupGroup/TransitionScreenPanel"
local _endScreenPanelPath ="PopupGroup/EndScreenPanel"
local _txtTopicNameTransitionPath = "PopupGroup/TransitionScreenPanel/imgBg/txtKeyTransition"
local _txtTopicDesTransitionPath = "PopupGroup/TransitionScreenPanel/imgBg/txtDesTransition"
local _txtTopicNameEndScreenPath = "PopupGroup/EndScreenPanel/IGKeyTransition/txtKeyTransition"

local _openOptionPath = "head/closeBtn"
local _closeOptionPath = "PopupGroup/OptionPanel/OptionPopup/closeOptionBtn"
local _resetBtnPath = "PopupGroup/OptionPanel/OptionPopup/resetBtn"
local _quitBtnPath = "PopupGroup/OptionPanel/OptionPopup/quitBtn"

local _correctPanelPath = "foot/CorrectPanel"
local _wrongPanelPath = "foot/WrongPanel"

local _questionContainer = "QuestionContainer"


local _qciaTypes = {
	"Question/SubViews/QCIASlotItem",
	"Question/SubViews/QCIADragItem"
}

local _mainPagePath = {
	"Question/SubViews/QuestionMainPage",
	"Question/SubViews/QuestionMainPage2",
	"Question/SubViews/QuestionMainPage3",
	"Question/SubViews/QuestionMainPage4",
	"Question/SubViews/QuestionMainPageComicWithInputText",
	"Question/SubViews/QuestionMainPage5"
}

local _learningPagePath = {
	"Question/SubViews/QuestionLearningPage",
	"Question/SubViews/QuestionLearningPageAudio",
	"Question/SubViews/QuestionLearningPageComic",
	"Question/SubViews/QuestionLearningPageAudioTextSync",
	"Question/SubViews/QuestionLearningPageSpeedRecognition",
	"",
	"Question/SubViews/QuestionLearningPageImage"
}

local _dragItemPath = "Question/SubViews/DragItem"

local _questions = {
	"Question/SubViews/QuestionAnswerMultipleChoice",
	"Question/SubViews/QuestionAnswerTrueFalse",	
	"Question/SubViews/QuestionAnswerPicture",
	"Question/SubViews/QuestionAnswerFillInText",
	"Question/SubViews/QuestionAnswerDragAndDrop",
	"Question/SubViews/QuestionAnswerComicMCQ",
	"Question/SubViews/QuestionAnswerComicText",
	"Question/SubViews/QuestionAnswerSpeedRecognition",
	"Question/SubViews/QuestionAnswerComicInteractive",
	"Question/SubViews/QuizitPage",
	"Question/SubViews/QuestionAnswerMultipleChoicePicture"
}

local _popupBalloonPath = "PopupGroup/ResetInputFieldPanel"
local _popupBalloonObjPath = "PopupGroup/ResetInputFieldPanel/ResetPopup"

local _imgPointPath ={
	"PopupGroup/EndScreenPanel/imgBg/bg_bar/fillbar/point1",
	"PopupGroup/EndScreenPanel/imgBg/bg_bar/fillbar/point2",
	"PopupGroup/EndScreenPanel/imgBg/bg_bar/fillbar/point3"
}
local _imgEnergyPath={
		"PopupGroup/EndScreenPanel/imgBg/imgBg2/energy1",
		"PopupGroup/EndScreenPanel/imgBg/imgBg2/energy2",
		"PopupGroup/EndScreenPanel/imgBg/imgBg2/energy3"

}
local _txtTexScore ="PopupGroup/EndScreenPanel/imgBg/bg_bar/fillbar/txtScore"
local _txtImgFillScore = "PopupGroup/EndScreenPanel/imgBg/bg_bar/fillbar"
local _txtGemFinal = "PopupGroup/EndScreenPanel/objCurrency/Gem/txtGem"
local _txtGoldFinal = "PopupGroup/EndScreenPanel/objCurrency/Gold/txtGold"
local _txtEndCurrency ="PopupGroup/EndScreenPanel/objCurrency"
local _txtEndOld = "PopupGroup/EndScreenPanel/OldTxt"

local _commingSoonBtnPath = "PopupGroup/CommingSoonPanel"

local _commingSoonCloseBtnPath = "PopupGroup/CommingSoonPanel/CommingSoonPopup/quitBtn"

local _pauseBtnPath = "head/QuizitHead/PauseBtnBG/pauseBtn"
local _closeBtnPath = "PopupGroup/PausePanel/Popup/closeBtn"
local _resetQuizitPath = "PopupGroup/PausePanel/Popup/resetBtn"
local _quitQuizitPath = "PopupGroup/PausePanel/Popup/quitBtn"

local _pausePanelPath = "PopupGroup/PausePanel"

local _endQuizitLearnMoreBtnPath = "PopupGroup/EndPanelQuizit/ButtonGroup/LearnMoreBtn"
local _tryAgainQuizitLearnMoreBtnPath = "PopupGroup/EndPanelQuizit/ButtonGroup/TryAgainBtn"
local _endQuizitQuitBtnPath = "PopupGroup/EndPanelQuizit/ButtonGroup/QuitBtn"

local _popupPath = "PopupGroup/PopupPanel"
local _popupTitlePath = "PopupGroup/PopupPanel/OptionPopup/titleTxt"
local _popupMessagePath = "PopupGroup/PopupPanel/OptionPopup/messageTxt"
local _popupImgPath = "PopupGroup/PopupPanel/OptionPopup/img"
local _popupAudioBtnPath = "PopupGroup/PopupPanel/OptionPopup/smallBtnAudio"
local _popupBigAuidoBtnPath = "PopupGroup/PopupPanel/OptionPopup/bigBtnAudio"

local _popup = nil
local _popupTitle = nil
local _popupMessage = nil
local _popupImg = nil
local _popupAudioBtn = nil
local _popupBigAudioBtn = nil

local _resetPopupAnim = "ResetPopup"
local _pauseIcon = "Btn_pause"
local _playIcon = "Btn_Play"

local _titleQuestionPath = "head/headBg/title"

local _circlePath = "head/circleBg"
local _infoPath = "head/infoBg"
local _islandTxtPath = "head/infoBg/islandTxt"
local _cellIdTxtPath = "head/infoBg/cellTxt"
local _numberQuizitPath = "head/QuizitHead/headBar/BGQuizitNumber/txtNumberQuizit"
local numQuizit = 0

local abBlue = "AnalaticBox"
local abGreen = "AnalaticBox_Green"
local abRed = "AnalaticBox_Red"

local tutorialImgMCQ = {
	"tutor_MCQ"
}

local tutorialDesMCQ = {
	"You need to choose the correct data to decrypt this cell\nCorrect data will turn green, wrong data will turn red."
}

local tutorialImgMCQv2 = {
	"tutor_MCQv2"
}

local tutorialDesMCQv2 = {
	"Guardian, you need to pick the correct picture with the promt above to decrypt this cell"
}

local tutorialImgTextInput = {
	"tutor_textInput"
}

local tutorialDesTextInput = {
	"Guardian, you need to input the correct data by choose the character in the keyboard below.\nIf the all data is correct, this cell will be decrypt."
}

local tutorialImgComicMCQ = {
	"tutor_comicMCQ_1",
	"tutor_comicMCQ_2"
}

local tutorialDesComicMCQ = {
	"Guardian, you need to read all the page of comic first",
	"After that, choose the correct data to decrypt this cell"
}

local tutorialImgComicTextInput = {
	"tutor_comicText_1",
	"tutor_comicText_2"
}

local tutorialDesComicTextInput = {
	"Guardian, you need to read all the page of comic first",
	"After that, input the correct data with those promt above."
}

local tutorialImgComicInteractive = {
	"tutor_comicInteractive"
}

local tutorialDesComicInteractive = {
	"Guardian, decrypt the comic by do exacly what it tell you to do."
}


local tutorialImgDragAndDrop = {
	"tutor_DragAndDrop"
}

local tutorialDesDragAndDrop = {
	"Guardian, you need drag the data at the bottom of the screen into the place holder when hearing the audio tape.\nWhen everythings is correct. You can finally decrypt this cell"
}

local _tutorialPageIndex = 1
local _tutorialImgArray = nil
local _tutorialDesArray = nil

local _popupTutorialPath = "PopupGroup/PopupTutorial"
local _imgTutorialPath = "PopupGroup/PopupTutorial/imgTutorial"
local _desTutorialPath = "PopupGroup/PopupTutorial/desTutorial"

local _nextTutorialPath = "PopupGroup/PopupTutorial/nextBtn"
local _backTutorialPath = "PopupGroup/PopupTutorial/backBtn"

local _groupCirclePath = "PopupGroup/PopupTutorial/groupCircle"
local _circleTutorial1Path = "PopupGroup/PopupTutorial/groupCircle/circle_1"
local _circleTutorial2Path = "PopupGroup/PopupTutorial/groupCircle/circle_2"

local _circleColor1 ="#FFFFFF"
local _circleColor2 ="#676666"

--MultpleChoice = 1,
--FillInTextBox = 4,
--DragAndDrop = 5,
--ComicWithMCQ = 6,
--ComicWithTextInput = 7,
--ComicInteractive = 9,
--MultpleChoicePicture = 11

local _groupTutorialImgArray = {
	tutorialImgMCQ,
	tutorialImgMCQ,
	tutorialImgMCQ,
	tutorialImgTextInput,
	tutorialImgDragAndDrop,
	tutorialImgComicMCQ,
	tutorialImgComicTextInput,
	tutorialImgComicTextInput,
	tutorialImgComicInteractive,
	tutorialImgComicInteractive,
	tutorialImgMCQv2
}

local _groupTutorialDesArray = {
	tutorialDesMCQ,
	tutorialDesMCQ,
	tutorialDesMCQ,
	tutorialDesTextInput,
	tutorialDesDragAndDrop,
	tutorialDesComicMCQ,
	tutorialDesComicTextInput,
	tutorialDesComicTextInput,
	tutorialDesComicInteractive,
	tutorialDesComicInteractive,
	tutorialDesMCQv2
}

local _endGemObjPath = "PopupGroup/EndScreenPanel/objCurrency/Gem"
local _endGoldObjPath = "PopupGroup/EndScreenPanel/objCurrency/Gold"

function OnReady()
	FindUI()

	ClosePopup()

	SetupBtnPlayAudio()

	SetupButtonNext(_nextBtnPath)
	SetupButtonNext(_nextBtnPath2)
	SetupButtonNext(_nextBtnPath3)
	SetupButtonNext(_panelCorrectPath)
	SetupButtonNext(_panelWrongPath)
	SetupButtonNext(_correctPanelPath)
	SetupButtonNext(_wrongPanelPath)


	SetupButtonOpenAb()
	SetupButtonCloseAb()

	SetupButtonBack(_backBtnPath)
	SetupButtonBack(_backBtnPath2)
	SetupButtonBack(_backBtnPath3)

	SetupOptionBtn(_openOptionPath, true)
	SetupOptionBtn(_closeOptionPath, false)
	SetupOptionBtn(_optionalPanelPath, false)

	SetupButtonReset(_btnTryAgainEndScreenPath)
	SetupButtonReset(_tryAgainQuizitLearnMoreBtnPath)
	SetupButtonReset(_resetBtnPath)
	SetupButtonReset(_resetQuizitPath)

	SetupButtonQuit(_quitBtnPath)
	SetupButtonQuit(_quitQuizitPath)
	SetupButtonQuit(_commingSoonCloseBtnPath);
	SetupButtonQuit(_endQuizitQuitBtnPath);

	SetupButtonNextTransition(_btnNextTransitionPath)
	SetupButtonNextEndScreen(_btnNextEndScreenPath)
	SetupButtonExitEndScreen(_btnExitEndScreenPath)

	SetupButtonNextEndScreen(_endQuizitLearnMoreBtnPath)

	SetupBtnInfo()

	SetupPauseBtn(_pauseBtnPath, true)
	SetupPauseBtn(_pausePanelPath, false)
	SetupPauseBtn(_closeBtnPath, false)

	Question.LuaCall_CreatePages()

	SetActiveFalseWrongPanel2()

	SetBtnNextTutorial(_nextTutorialPath)
	SetBtnBackTutorial(_backTutorialPath)
end


function SetDataHead()
	local islandTxt = LuaGo.Find(_islandTxtPath)
	islandTxt.SetText("Module ".. Question.Model.IslandId)

	local cellTxt = LuaGo.Find(_cellIdTxtPath)
	cellTxt.SetText("Objective ".. Question.Model.CellId)
end

function LoadQCIAItem(type)
	local content = LuaGo.Find(_questionContainer);
	CreateSubView(_qciaTypes[type], content.Transform)
end

function FindUI()
	_popup = LuaGo.Find(_popupPath)
	_popupTitle = LuaGo.Find(_popupTitlePath)
	_popupMessage = LuaGo.Find(_popupMessagePath)
	_popupImg = LuaGo.Find(_popupImgPath)
	_popupAudioBtn = LuaGo.Find(_popupAudioBtnPath)
	_popupBigAudioBtn = LuaGo.Find(_popupBigAuidoBtnPath)
end

function SetActiveABPanel(isActive)
	local panel1 = LuaGo.Find(_panelABUpPath)
	local panel2 = LuaGo.Find(_panelABDownPath)
	panel1.SetActive(isActive)
	panel2.SetActive(not isActive)
end

function SetActiveABGroup(isActive)
	local abGroup = LuaGo.Find(_abGroupPath)
	abGroup.SetActive(isActive)
	local footGroup = LuaGo.Find(_footGroupPath)
	footGroup.SetActive(not isActive)
end

function SetTextAB(text)
	local txt = LuaGo.Find(_txtABPath)
	txt.SetTextHexColor("#FFFFFF")
	txt.SetTextAB(text)
end

function LoopRandomText()
	local txt = LuaGo.Find(_txtABPath)
	txt.SetTextHexColor("#004F90")
	txt.LoopRandomText()
end

function SetupButtonOpenAb()
	local btn = LuaGo.Find(_btnOpenAbPath)	
	btn.RegisterButtonPressedCallback(function ()
		SetActiveABPanel(true)
    end)
end

function SetupButtonCloseAb()
	local btn = LuaGo.Find(_btnCloseAbPath)	
	btn.RegisterButtonPressedCallback(function ()
		SetActiveABPanel(false)
    end)
end

function SetupButtonNext(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_NextBtnOnClick()
    end)
end

function SetupButtonBack(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_BackBtnOnClick()
    end)
end

function SetupOptionBtn(btnPath, isActive)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		SetActiveOptionPanel(isActive)
    end)
end

function SetupButtonReset(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		numQuizit = 0
		Question.LuaCall_ResetQuestionOnClick()
		SetActiveOptionPanel(false)
		SetActivePausePanel(false)
		SetActiveEndQuizitPanel(false)
		SetActiveEndScreenPanel(false)
		LoopRandomText()
		local btnNextEnd = LuaGo.Find(_btnNextEndScreenPath)
		btnNextEnd.SetOpacityObject(0)

		local btnQuitEnd = Luago.Find(_btnExitEndScreenPath)
		btnQuitEnd.SetOpacityObject(0)
	
		local btnTryAgainEnd = LuaGo.Find(_btnTryAgainEndScreenPath)
		btnTryAgainEnd.SetOpacityObject(0)
    end)
end

function SetupButtonQuit(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_StopPlayOnclick()
    end)
end
function SetupButtonNextTransition(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_NextTransition();
    end)
end
function SetupButtonNextEndScreen(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_NextEndScreen();
    end)
end

function SetupButtonTryAgain(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_TryAgain();
    end)
end
function SetupButtonExitEndScreen(btnPath)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_ExitEndScreen();
    end)
end

function LoadQuestionMainPage(type)
	local content = LuaGo.Find(_questionContainer);
	CreateSubView(_mainPagePath[type], content.Transform)
end

function LoadQuestionLearningPage(type)
	local content = LuaGo.Find(_questionContainer);
	CreateSubView(_learningPagePath[type], content.Transform)
end

function LoadAnswerObject(type)
	local content = LuaGo.Find(_questionContainer);
	if(_questions[type] != null) then
		CreateSubView(_questions[type], content.Transform)
	end
end

function SetActiveOptionPanel(isActive)
	if isActive then
		Question.LuaCall_PauseSound(Question.Model.CurrentAudioPath)
		Question.LuaCall_PauseTextSyncAudioSource()
	else
		Question.LuaCall_ResumeSound(Question.Model.CurrentAudioPath)
		Question.LuaCall_ResumeTextSyncAudioSource()
	end
	local cellTxt = LuaGo.Find(_optionCellPath)
	cellTxt.SetText("Cell: " .. Question.Model.CellId)

	local answerTxt = LuaGo.Find(_optionQuestionPath)
	answerTxt.SetText(Question.Model.QuestionIndex .. "/" .. Question.Model.NumberQuestion)

	local obj = LuaGo.Find(_optionalPanelPath)
	obj.SetActive(isActive)
end

function SetActiveCorrectAndWrongObject(isActive, isActive2)
	local obj = LuaGo.Find(_correctPanelPath)
	obj.SetActive(isActive)
	local obj2 = LuaGo.Find(_wrongPanelPath)
	obj2.SetActive(isActive2)
end

function SetActiveAudioBtn(isActive)
	local obj = LuaGo.Find(_btnAudioPath)
	obj.SetActive(isActive)
end

function SetActiveLoadingPanel(isActive)
	local obj = LuaGo.Find(_loadingPanelPath)
	obj.SetActive(isActive)
end


function SetActiveBtnNext(isActive)	
	local obj = LuaGo.Find(_nextBtnPath)
	obj.SetActive(isActive)
	local obj2 = LuaGo.Find(_nextBtnPath2)
	obj2.SetActive(isActive)
	local obj3 = LuaGo.Find(_nextBtnPath3)
	obj3.SetActive(isActive)
end

function SetActiveBtnBack(isActive)
	local obj = LuaGo.Find(_backBtnPath)
	obj.SetActive(isActive)
	local obj2 = LuaGo.Find(_backBtnPath2)
	obj2.SetActive(isActive)
	local obj3 = LuaGo.Find(_backBtnPath3)
	obj3.SetActive(isActive)
end


function SetupBtnPlayAudio()
	local obj = LuaGo.Find(_btnAudioPath)
	obj.RegisterButtonPressedCallback(function ()
		Question.LuaCall_PlayAudio()
    end)

	_popupAudioBtn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_PlayAudio()
    end)

	_popupBigAudioBtn.RegisterButtonPressedCallback(function ()
		Question.LuaCall_PlayAudio()
    end)
end

function SetupBtnInfo()
	local obj = LuaGo.Find(_btnInfoPath)
	obj.RegisterButtonPressedCallback(function ()
		SetActivePopupTutorial(true)
    end)
end

function SetActivePopupBalloon(isActive)
	local panel = LuaGo.Find(_popupBalloonPath)
	panel.SetActive(isActive)
	if isActive == true then
		local obj = LuaGo.Find(_popupBalloonObjPath)
		obj.AnimationPlay("PopupBalloon")
	end
end

function ActivePopupBallon()
	local PopupBalloonCo = coroutine.create(function ()
		SetActivePopupBalloon(true)
		Wait(1.25)
		SetActivePopupBalloon(false)
	end)

	coroutine.resume(PopupBalloonCo)
end

function PlayAnimPopup(popup, anim, time)
	local PopupCo = coroutine.create(function ()
		popup.SetActive(true)
		popup.AnimationPlay(anim)
		Wait(time)
		popup.SetActive(false)
	end)

	coroutine.resume(PopupCo)
end

function ShowPopup()
	ActivePopupTitle()

	ActivePopupMessage()

	ActivePopupImage()

	ActivePopupAudioBtn()

	ActivePopup()
end

function ClosePopup()
	_popup.RegisterButtonPressedCallback(function ()
		Question.LuaCall_StopAudio()
		_popup.SetActive(false)
    end)
end

function ActivePopupTitle()
	if Question.Model.PopupTitle == "" or Question.Model.PopupTitle == nil then
		_popupTitle.SetActive(false)
	else
		_popupTitle.SetActive(true)
		_popupTitle.SetText(Question.Model.PopupTitle)
	end
end

function ActivePopupMessage()
	if Question.Model.PopupMessage == "" or Question.Model.PopupMessage == nil then
		_popupMessage.SetActive(false)
	else
		_popupMessage.SetActive(true)
		_popupMessage.SetText(Question.Model.PopupMessage)
	end
end

function ActivePopupAudioBtn()
	if Question.Model.PopupAudioName == "" or Question.Model.PopupAudioName == nil then
		_popupAudioBtn.SetActive(false)
	else
		_popupAudioBtn.SetActive(true)
	end

	if (Question.Model.PopupImageName == "" or Question.Model.PopupImageName == nil) and (Question.Model.PopupAudioName != "" and Question.Model.PopupAudioName != nil) then
		_popupBigAudioBtn.SetActive(true)
	else
		_popupBigAudioBtn.SetActive(false)
	end
end

function ActivePopupImage()
	if Question.Model.PopupImageName == "" or Question.Model.PopupImageName == nil then
		_popupImg.SetActive(false)
	else
		_popupImg.SetActive(true)
		_popupImg.SetSprite(Question.Model.PopupImageName)
	end
end

function ActivePopup()
	_popup.SetActive(true)

	if Question.Model.PopupAnimName != "" and Question.Model.PopupAnimName != nil then
		PlayAnimPopup(_popup, Question.Model.PopupAnimName, Question.Model.PopupAnimTime)
	else
		_popup.AnimationPlay(_resetPopupAnim)
	end
end

function SetActiveTransitionPanel(isActive)
	local obj = LuaGo.Find(_transitionPanelPath)
	obj.SetActive(isActive)
end
function SetActiveEndScreenPanel(isActive)
	local obj = LuaGo.Find(_endScreenPanelPath)
	obj.SetActive(isActive)
end

function SetDataTransitionScreen(title,des)
	local co = coroutine.create(function ()
		local objDes = LuaGo.Find(_txtTopicDesTransitionPath)
		objDes.SetTextDoTweenAnimation(des,2,objDes)
		
		Wait(2)
			
		local obj = LuaGo.Find(_txtTopicNameTransitionPath)
		obj.SetTextDoTweenAnimation(title,2,obj)
    end)
	coroutine.resume(co)
	
	
end

function SetDataEndScreen(keyTopic, score, fillAmount, numPoint, imgPathPoint,opacity,gold, gem)

	local textScore = LuaGo.Find(_txtTexScore);
	textScore.SetTextDoCounterWithMoreText(0 , score, "%", 3)

	local imgFill = LuaGo.Find(_txtImgFillScore)
	imgFill.DoFill(fillAmount,3)

	Question.LuaCall_PlaySoundWithDuration("Question/sfx_endscreen_circle", 3)
	
	local gemObj = LuaGo.Find(_endGemObjPath)
	gemObj.SetImageOpacity(0)
	local objGem = LuaGo.Find(_txtGemFinal)
	objGem.SetText(gem)
	objGem.SetTextOpacity(0)

	local goldObj = LuaGo.Find(_endGoldObjPath)
	goldObj.SetImageOpacity(0)
	local objGold = LuaGo.Find(_txtGoldFinal)
	objGold.SetText(gold)
	objGold.SetTextOpacity(0)

	local obj = LuaGo.Find(_txtTopicNameEndScreenPath)
	obj.SetText(keyTopic);

	local co = coroutine.create(function ()
		for i = 1 , numPoint do 
			Wait(0.4)
			local objImgPoint = LuaGo.Find(_imgPointPath[i])
			objImgPoint.SetSprite(imgPathPoint)

			local objEnergyPath = LuaGo.Find(_imgEnergyPath[i])
			objEnergyPath.SetImageOpacity(opacity)
		end
		Wait(1)
		Question.LuaCall_PlaySound("Question/sfx_endscreen_curency")
		gemObj.SetActive(true)
		gemObj.DoFadeImage(1, 0.25)
		objGem.DoFadeText(1, 0.25)

		Wait(0.35)
		Question.LuaCall_PlaySound("Question/sfx_endscreen_curency")
		goldObj.SetActive(true)
		goldObj.DoFadeImage(1, 0.25)
		objGold.DoFadeText(1, 0.25)

		Wait(1)

		local btnNextEnd = LuaGo.Find(_btnNextEndScreenPath)
		btnNextEnd.DoFadeObject(1, 0.25)

		local btnTryAgainEnd = LuaGo.Find(_btnTryAgainEndScreenPath)
		btnTryAgainEnd.DoFadeObject(1, 0.25)

		Wait(0.375)

		local btnQuitEnd = LuaGo.Find(_btnExitEndScreenPath)
		btnQuitEnd.DoFadeObject(1, 0.25)
    end)
	coroutine.resume(co)

	local co2 = coroutine.create(function ()
		for i = 1 , numPoint do 
			Wait(0.4)
			Question.LuaCall_PlaySound("Question/sfx_endscreen_energy")
			local objEnergyPath = LuaGo.Find(_imgEnergyPath[i])

			objEnergyPath.DoScaleAnim(1.25, 1.25, 1.25, 0.125)
			Wait(0.125)
			objEnergyPath.DoScaleAnim(1, 1, 1, 0.125)
		end
    end)
	coroutine.resume(co2)
end

local _endMessageTxtPath = "PopupGroup/EndScreenPanel/OldTxt"
local _failMessage = "You have fail this cell, please try again."
local _claimedMessage = "You already claimed your gift last time."

function SetDataEndScreenOld(keyTopic, score, fillAmount, numPoint, imgPathPoint,opacity)
	local textScore = LuaGo.Find(_txtTexScore);
	textScore.SetTextDoCounterWithMoreText(0 , score, "%", 3)

	local imgFill = LuaGo.Find(_txtImgFillScore)
	imgFill.DoFill(fillAmount, 3)

	local currencyGroup = LuaGo.Find(_txtEndCurrency)
	currencyGroup.SetActive(false)

	local oldTxt = LuaGo.Find(_txtEndOld)
	oldTxt.SetText("")

	local obj = LuaGo.Find(_txtTopicNameEndScreenPath)
	obj.SetText(keyTopic);

	local co = coroutine.create(function ()
		for i = 1 , numPoint do 
			Wait(0.4)
			local objImgPoint = LuaGo.Find(_imgPointPath[i])
			objImgPoint.SetSprite(imgPathPoint)

			local objEnergyPath = LuaGo.Find(_imgEnergyPath[i])
			objEnergyPath.SetImageOpacity(opacity)
		end
		Wait(1)

		if numPoint == 0 then
			oldTxt.SetTextDoTweenAnimation(_failMessage, 1)
		else
			oldTxt.SetTextDoTweenAnimation(_claimedMessage, 1)
		end

		Wait(1)

		local btnNextEnd = LuaGo.Find(_btnNextEndScreenPath)
		btnNextEnd.DoFadeObject(1, 0.25)

		local btnTryAgainEnd = LuaGo.Find(_btnTryAgainEndScreenPath)
		btnTryAgainEnd.DoFadeObject(1, 0.25)

		Wait(0.375)

		local btnQuitEnd = LuaGo.Find(_btnExitEndScreenPath)
		btnQuitEnd.DoFadeObject(1, 0.25)
	

    end)
	coroutine.resume(co)

	local co2 = coroutine.create(function ()
		for i = 1 , numPoint do 
			Wait(0.4)
			local objEnergyPath = LuaGo.Find(_imgEnergyPath[i])

			objEnergyPath.DoScaleAnim(1.25, 1.25, 1.25, 0.125)
			Wait(0.125)
			objEnergyPath.DoScaleAnim(1, 1, 1, 0.125)
		end
    end)
	coroutine.resume(co2)
end

function LoadDragItem()
	local content = LuaGo.Find(_questionContainer);
	CreateSubView(_dragItemPath, content.Transform)
end

function OpenCommingSoonPopup()
	local obj = LuaGo.Find(_commingSoonBtnPath)
	obj.SetActive(true)
end

function SetCorrectPanelData(meanTxt)
	--local word = LuaGo.Find(_panelCorrectWordPath)
	--word.SetText(wordTxt)
	local mean = LuaGo.Find(_panelCorrectMeanPath)
	mean.SetText(meanTxt)
	SetActiveCorrectAndWrongPanel(true, false)
end

function SetWrongPanelData( meanTxt)
	--local word = LuaGo.Find(_panelWrongWordPath)
	--word.SetText(wordTxt)
	local mean = LuaGo.Find(_panelWrongMeanPath)
	mean.SetText(meanTxt)
	SetActiveCorrectAndWrongPanel(false, true)
end

function SetActiveCorrectAndWrongPanel(isActive, isActive2)
	local obj = LuaGo.Find(_panelCorrectPath)
	obj.SetActive(isActive)
	local obj2 = LuaGo.Find(_panelWrongPath)
	obj2.SetActive(isActive2)
end

function SetActiveWrongPanel2(isActive)
	local obj2 = LuaGo.Find(_panelWrongPath2)
	obj2.SetActive(isActive)
end

function SetActiveFalseWrongPanel2()
	local obj = LuaGo.Find(_panelWrongPath2)
	obj.RegisterButtonPressedCallback(function ()
		SetActiveWrongPanel2(false)
	end)
end

function SetWrongPanelData2( meanTxt)
	--local word = LuaGo.Find(_panelWrongWordPath2)
	--word.SetText(wordTxt)
	local mean = LuaGo.Find(_panelWrongMeanPath2)
	mean.SetText(meanTxt)
end

local _numberQuizitTotalPath = "head/QuizitHead/headBar/BGQuizitNumber/txtNumberQuizitTotal"
local _questionHead = "head/headBg"
local _quiztHeadPath = "head/QuizitHead"
local _quizitFootPath = "foot/QuizitFoot"
local _leftPath = "head/QuizitHead/questionLeft/text"
local _correctPath = "head/QuizitHead/questionCorrect/text"
local _wrongPath = "head/QuizitHead/questionWrong/text"
local _titleTextPath = "head/QuizitHead/titleBg/text"
local _namePath = "head/QuizitHead/bg2/bgFrame/ImageBGName/name"

local _finishOptionPath = "PopupGroup/PausePanel/Popup/pageFinish"
local _scorePath = "PopupGroup/PausePanel/Popup/sc"
local _countDownPanel = "PopupGroup/CountDownPanel"
local _countDownObject = "PopupGroup/CountDownPanel/panel"
local _nextPanel = "PopupGroup/NextPanel"
local _endQuizitPanel ="PopupGroup/EndPanelQuizit"
local _endQuizitTitlePath = "PopupGroup/EndPanelQuizit/TileBg/TileTxt"

local _scorePathGroup = {
	"foot/QuizitFoot/pointGroup/object1",
	"foot/QuizitFoot/pointGroup/object2",
	"foot/QuizitFoot/pointGroup/object3",
	"foot/QuizitFoot/pointGroup/object4",
	"foot/QuizitFoot/pointGroup/object5"
}

local _scoreTextPathGroup = {
	"foot/QuizitFoot/pointGroup/object1/text",
	"foot/QuizitFoot/pointGroup/object2/text",
	"foot/QuizitFoot/pointGroup/object3/text",
	"foot/QuizitFoot/pointGroup/object4/text",
	"foot/QuizitFoot/pointGroup/object5/text"
}

local _scoreIconPathGroup = {
	"foot/QuizitFoot/pointGroup/object1/icon",
	"foot/QuizitFoot/pointGroup/object2/icon",
	"foot/QuizitFoot/pointGroup/object3/icon",
	"foot/QuizitFoot/pointGroup/object4/icon",
	"foot/QuizitFoot/pointGroup/object5/icon"
}

local _headBgPath = "head/bg"


function SetActiveQuizitUI(isActive)
	local _quizitHead = LuaGo.Find(_quiztHeadPath)
	_quizitHead.SetActive(isActive)
	local _questionHead = LuaGo.Find(_questionHead)
	_questionHead.SetActive(false)

	local _quizitFoot = LuaGo.Find(_quizitFootPath)
	_quizitFoot.SetActive(isActive)

	local _soundBtn = LuaGo.Find(_btnAudioPath)
	_soundBtn.SetActive(not isActive)
	local _closeBtn = LuaGo.Find(_openOptionPath)
	_closeBtn.SetActive(not isActive)
	local _infoBtn = LuaGo.Find(_btnInfoPath)
	_infoBtn.SetActive(not isActive)

	local infoObj = LuaGo.Find(_infoPath)
	infoObj.SetActive(not isActive)

	local circleObj = LuaGo.Find(_circlePath)
	circleObj.SetActive(not isActive)

	local headObj = LuaGo.Find(_headBgPath)
	headObj.SetActive(not isActive)

	local numberQuizit = LuaGo.Find(_numberQuizitTotalPath)
	numberQuizit.SetText(Question.Model.NumberQuestion)
end

function SetupPauseBtn(btnPath, isActive)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		SetActiveOptionPanel(isActive)
    end)
end

function SetActivePausePanel(isActive)
	local obj = LuaGo.Find(_optionalPanelPath)
	obj.SetActive(isActive)
	Question.LuaCall_PauseQuizit(isActive)
end

function SetDataQuizit(left ,correct ,wrong, point, total)
	local obj1 = LuaGo.Find(_leftPath)
	obj1.SetText(left)
	local obj2 = LuaGo.Find(_correctPath)
	obj2.SetText(correct)
	local obj3 = LuaGo.Find(_wrongPath)
	obj3.SetText(wrong)
	local obj4 = LuaGo.Find(_finishOptionPath)
	obj4.SetText(total)

	local obj6 = LuaGo.Find(_scorePath)
	obj6.SetText(point)
end

function SetTitle(title)
	local obj = LuaGo.Find(_titleTextPath)
	obj.SetText(title)
	local obj2 = LuaGo.Find(_endQuizitTitlePath)
	obj2.SetText(title)
end

function SetActiveCountDown(isActive)
	
	
	local obj = LuaGo.Find(_countDownPanel)
	obj.SetActive(isActive)

	if (isActive) then
		numQuizit = numQuizit + 1
		local objTextNumber = LuaGo.Find(_numberQuizitPath)
		objTextNumber.SetText(numQuizit)
		local obj2 = LuaGo.Find(_countDownObject)
		obj2.AnimationPlay("123GO")
	end
end

function SetPlayerName(name)
	local obj = LuaGo.Find(_namePath)
	obj.SetText(name)
end

function SetActiveNextPanel(isActive)
	local obj = LuaGo.Find(_nextPanel)
	obj.SetActive(isActive)
end

local _currentScore

function SetActiveGroupScore(index, number)
	local obj = LuaGo.Find(_scorePathGroup[index])
	obj.SetActive(true)

	local obj2 = LuaGo.Find(_scoreTextPathGroup[index])
	obj2.SetText(number)
end

function SetMoveToScore(index)
	for i = 1, #_scoreTextPathGroup do
		local obj = LuaGo.Find(_scoreTextPathGroup[i])
		local text = obj.GetText()

		if text == index then
			_currentScore = LuaGo.Find(_scorePathGroup[i])

			local obj2 = LuaGo.Find(_scoreIconPathGroup[i])
			obj2.SetActive(true)

		else
			local obj3 = LuaGo.Find(_scoreIconPathGroup[i])
			obj3.SetActive(false)
		end		
	end
end

function SetColorScore(color)
	_currentScore.SetSprite(color)	
end

function ResetScoreGroup(color)
	for i = 1, #_scorePathGroup do
		local obj = LuaGo.Find(_scorePathGroup[i])
		obj.SetSprite(color)
		obj.SetActive(false)
	end
end

function SetActivePausePanel(isActive)
	local obj = LuaGo.Find(_pausePanelPath)
	obj.SetActive(isActive)
	Question.LuaCall_PauseQuizit(isActive)
end

function SetupPauseBtn(btnPath, isActive)
	local btn = LuaGo.Find(btnPath)	
	btn.RegisterButtonPressedCallback(function ()
		SetActivePausePanel(isActive)
    end)
end

function ActiveEndQuizitPanel()
	SetActiveEndQuizitPanel(true)
end

function SetActiveEndQuizitPanel(active)
	local obj = LuaGo.Find(_endQuizitPanel)
	obj.SetActive(active);
	--numQuizit = 0
end

function SetTitleQuestion(title)
	local titleObject = LuaGo.Find(_titleQuestionPath)
	titleObject.SetText(title)
end

local coAb = nil
local coIndex = 0
function ChangeImgAbBox(startColor, endColor)
	local abBox = LuaGo.Find(_abPanel)
	abBox.SetSprite(startColor)
	
	coAb = coroutine.create(function ()
			coIndex = coIndex + 1
			local index = coIndex
			Wait(2)

			if index == coIndex then			
				abBox.SetSprite(endColor)
			end

			coroutine.yield(coAb)	
    end)

	coroutine.resume(coAb)
end

function ChangeCorrectAb()
	ChangeImgAbBox(abGreen, abBlue)
end

function ChangeWrongAb()
	ChangeImgAbBox(abRed, abBlue)
end

function SetActivePopupTutorial(isActive)
	SetDefaultTutorialPopup()

	if isActive then
		Question.LuaCall_PauseSound(Question.Model.CurrentAudioPath)
		Question.LuaCall_PauseTextSyncAudioSource()
		OpenTutorialPopup()
	else
		Question.LuaCall_ResumeSound(Question.Model.CurrentAudioPath)
		Question.LuaCall_ResumeTextSyncAudioSource()
	end

	local _popup = LuaGo.Find(_popupTutorialPath)
	_popup.SetActive(isActive)
end

function SetDefaultTutorialPopup()
	_tutorialPageIndex = 1

	local circleGroup = LuaGo.Find(_groupCirclePath)
	circleGroup.SetActive(false)

	local btnBackTutorial = LuaGo.Find(_backTutorialPath)
	btnBackTutorial.SetActive(false)
end


function OpenTutorialPopup()
	_tutorialImgArray = _groupTutorialImgArray[Question.Model.CurrentQuestionType]
	_tutorialDesArray = _groupTutorialDesArray[Question.Model.CurrentQuestionType]

	if Question.Model.CurrentQuestionType == 6 or Question.Model.CurrentQuestionType == 7 or Question.Model.CurrentQuestionType == 9 then
		local _popup = LuaGo.Find(_popupTutorialPath)
		_popup.SetImageOpacity(0.9)
	else
		local _popup = LuaGo.Find(_popupTutorialPath)
		_popup.SetImageOpacity(0.5)
	end

	if #_tutorialImgArray > 1 then
		local circleGroup = LuaGo.Find(_groupCirclePath)
		circleGroup.SetActive(true)

		SetCircleTutorialColor(_circleColor1, _circleColor2)		
	end

	SetTutorialPageWithIndex()
end

function SetTutorialPageWithIndex()
	local tutorialImg = LuaGo.Find(_imgTutorialPath)
	tutorialImg.SetSprite(_tutorialImgArray[_tutorialPageIndex])

	local tutorialDes = LuaGo.Find(_desTutorialPath)
	tutorialDes.SetText(_tutorialDesArray[_tutorialPageIndex])
end

function SetCircleTutorialColor(color1, color2)
	local circle1 = LuaGo.Find(_circleTutorial1Path)
	circle1.SetImgHexColor(color1)

	local circle2 = LuaGo.Find(_circleTutorial2Path)
	circle2.SetImgHexColor(color2)
end

function NextTutorialOnclick()
	if _tutorialPageIndex < #_tutorialImgArray then
		MoveNextTutorial()
	else
		SetActivePopupTutorial(false)
	end
end

function MoveNextTutorial()
		_tutorialPageIndex = _tutorialPageIndex + 1
		SetTutorialPageWithIndex()
		SetCircleTutorialColor(_circleColor2, _circleColor1)
		local btnBackTutorial = LuaGo.Find(_backTutorialPath)
		btnBackTutorial.SetActive(true)
end

function MoveBackTutorial()
		_tutorialPageIndex = _tutorialPageIndex - 1
		SetTutorialPageWithIndex()
		SetCircleTutorialColor(_circleColor1, _circleColor2)
		if _tutorialPageIndex == 1 then
			local btnBackTutorial = LuaGo.Find(_backTutorialPath)
			btnBackTutorial.SetActive(false)
		end
end

function SetBtnNextTutorial(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		NextTutorialOnclick()
    end)
end

function SetBtnBackTutorial(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MoveBackTutorial()
    end)
end

function SetActiveTryAgainButtons()
	local btn1 = LuaGo.Find(_btnNextEndScreenPath)
	btn1.SetActive(false)

	local btn2 = LuaGo.Find(_endQuizitLearnMoreBtnPath)
	btn2.SetActive(false)

	local btn3 = LuaGo.Find(_btnTryAgainEndScreenPath)
	btn3.SetActive(true)

	local btn4 = LuaGo.Find(_tryAgainQuizitLearnMoreBtnPath)
	btn4.SetActive(true)
end

function Hide()
end
