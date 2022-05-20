


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/LeaderBoard/LeaderBoard.prefab",
		Config = "",
		Anchor = "Root",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end
local _txtCoinPath = "Bg/header/objCoin/txtCoin"
local _txtGemPath = "Bg/header/objGem/txtGem"
local _txtObjEnergyPath = "Bg/header/objEnergy/txtEnergy"

local _pathWeekToggle ="Bg/body/ToggleGroup/WeekToggle"
local _pathMonthToggle = "Bg/body/ToggleGroup/MonthToggle"
local _pathScrollWeek= "Bg/body/objScrollWeek"
local _pathScrollMonth ="Bg/body/objScrollMonth"
local _pathPannelWeek = "Bg/body/objScrollWeek/ScrollWeek/pannel"
local _pathPanneMonth = "Bg/body/objScrollMonth/ScrollMonth/pannel"
local _txtTextWeek ="Bg/body/ToggleGroup/WeekToggle/Label"
local _txtTextMonth = "Bg/body/ToggleGroup/MonthToggle/Label"
local _btnShowRewardPath = "Bg/infoBtn"

local _pathMeWeek ="Bg/body/objScrollWeek/ObjItemWeekMe"
local _pathMeMonth ="Bg/body/objScrollMonth/ObjItemMonthMe"

local _txtTimeRefeshWeek = "Bg/body/objScrollWeek/txtTimeLeft"
local _txtTimeRefeshMonth = "Bg/body/objScrollMonth/txtTimeLeft"

local _objPopup = "Bg/PopupReward"
local _btnCloseOutscreen = "Bg/PopupReward/btnCloseOutScreen"
local _btnCloseWeek = "Bg/PopupReward/Week/header/btnClose"
local _btnCloseMonth = "Bg/PopupReward/Month/header/btnClose"


local _pathRewardWeek ="Bg/PopupReward/Week"
local _pathRewardMonth ="Bg/PopupReward/Month"


local _btnBackLobbyPath = "Bg/header/imgButton/btnBack"

local objWeek =nil
local objMonth = nil
local objReward = nil;
function OnReady()
	SetupButtonBackLobby(_btnBackLobbyPath)
	SetupToggleWeekTab()
	SetupToggleMonthTab()
	SetupButtonShowReward(_btnShowRewardPath)
	SetScrollPanel()
	SetupButtonClose(_btnCloseOutscreen)
	SetupButtonClose(_btnCloseWeek)
    SetupButtonClose(_btnCloseMonth)
	GetObj()
end
function GetObj()
	objWeek = LuaGo.Find(_pathScrollWeek)
	objMonth = LuaGo.Find(_pathScrollMonth)
    objReward = _pathRewardWeek
end
function SetAllActive()
	objWeek.SetActive(true)
	objMonth.SetActive(true)
	LeaderBoard.LuaCall_WeekTabActive(true)
	LeaderBoard.LuaCall_MonthTabActive(true)

end
function SetupButtonBackLobby(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		SetAllActive()
		LeaderBoard.LuaCall_Back()
    end)
end
function SetupButtonShowReward(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
        local objPopupReward = LuaGo.Find(_objPopup)
        objPopupReward.SetActive(true);
        local obj = LuaGo.Find(objReward)
        obj.SetActive(true)
    end)
end



function SetupToggleWeekTab()
	local objToggle = LuaGo.Find(_pathWeekToggle)
	local _pathScrollInviteFriend = LuaGo.Find(_pathScrollWeek)
	local objText = LuaGo.Find(_txtTextWeek)
	objToggle.OnEventToggleChange(function (boolValue) 
		_pathScrollInviteFriend.SetActive(boolValue)
		if(boolValue)
			then
				objText.SetTextHexColor("#FFFFFF")
                LeaderBoard.LuaCall_WeekTabActive(true)
                objReward = _pathRewardWeek

			else
				objText.SetTextHexColor("#515d75")
                LeaderBoard.LuaCall_WeekTabActive(false)

		end
		
	end)
end
function SetupToggleMonthTab()
	local objToggle = LuaGo.Find(_pathMonthToggle)
	local _pathAddFriend = LuaGo.Find(_pathScrollMonth)
	local objText = LuaGo.Find(_txtTextMonth)
	objToggle.OnEventToggleChange(function (boolValue) 
		_pathAddFriend.SetActive(boolValue)
		if(boolValue)
			then
				objText.SetTextHexColor("#FFFFFF")
                LeaderBoard.LuaCall_MonthTabActive(true)
                objReward = _pathRewardMonth
			else
				objText.SetTextHexColor("#515d75")
                LeaderBoard.LuaCall_MonthTabActive(false)

		end
		
	end)
end
function SetScrollPanel()
	local scrollWeek = LuaGo.Find(_pathPannelWeek)
	local scrollMonth = LuaGo.Find(_pathPanneMonth)
    local objMeWeek= LuaGo.Find(_pathMeWeek)
    local objMeMonth = LuaGo.Find(_pathMeMonth)
	LeaderBoard.LuaCall_SetTransform(scrollWeek,scrollMonth,objMeWeek,objMeMonth)
	
end
function Refresh()
	local objCoin = LuaGo.Find(_txtCoinPath)
	objCoin.SetText(LeaderBoard.Model.Gold,objCoin)

	local objGem = LuaGo.Find(_txtGemPath)
	objGem.SetText(LeaderBoard.Model.Gem,objGem)

	local objEnergy = LuaGo.Find(_txtObjEnergyPath)
	objEnergy.SetText(LeaderBoard.Model.Energy,objEnergy)
end

function SetupButtonClose(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		local objPopup = LuaGo.Find(_objPopup)
		objPopup.SetActive(false)
        local obj = LuaGo.Find(objReward)
        obj.SetActive(false)
    end)
end

function SetSeasonInfo()
	local txtWeek = LuaGo.Find(_txtTimeRefeshWeek)
	local txtMonth = LuaGo.Find(_txtTimeRefeshMonth)
	LeaderBoard.LuaCall_SetTimeLeft(txtWeek,txtMonth)
end


function Hide()
end
