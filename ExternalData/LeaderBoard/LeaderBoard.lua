


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/LeaderBoard/LeaderBoard.prefab",
		Config = "",
		Anchor = "Front",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end
local _txtCoinPath = "Bg/header/objCoin/txtCoin"
local _txtGemPath = "Bg/header/objGem/txtGem"
local _txtObjEnergyPath = "Bg/header/objEnergy/txtEnergy"

local _pathDayToggle ="Bg/body/ToggleGroup/DayToggle"
local _pathWeekToggle ="Bg/body/ToggleGroup/WeekToggle"
local _pathMonthToggle = "Bg/body/ToggleGroup/MonthToggle"
local _pathScrollDay ="Bg/body/objScrollDay"
local _pathScrollWeek= "Bg/body/objScrollWeek"
local _pathScrollMonth ="Bg/body/objScrollMonth"
local _pathPannelDay = "Bg/body/objScrollDay/ScrollDay/pannel"
local _pathPannelWeek = "Bg/body/objScrollWeek/ScrollWeek/pannel"
local _pathPanneMonth = "Bg/body/objScrollMonth/ScrollMonth/pannel"
local _txtTextDay = "Bg/body/ToggleGroup/DayToggle/Label"
local _txtTextWeek ="Bg/body/ToggleGroup/WeekToggle/Label"
local _txtTextMonth = "Bg/body/ToggleGroup/MonthToggle/Label"
local _btnShowRewardPath = "Bg/infoBtn"

local _pathMeDay ="Bg/body/objScrollDay/ObjItemDayMe"
local _pathMeWeek ="Bg/body/objScrollWeek/ObjItemWeekMe"
local _pathMeMonth ="Bg/body/objScrollMonth/ObjItemMonthMe"

local _txtTimeRefeshDay = "Bg/body/objScrollDay/txtTimeLeft"
local _txtTimeRefeshWeek = "Bg/body/objScrollWeek/txtTimeLeft"
local _txtTimeRefeshMonth = "Bg/body/objScrollMonth/txtTimeLeft"

local _objPopup = "Bg/PopupReward"
local _btnCloseOutscreen = "Bg/PopupReward/btnCloseOutScreen"
local _btnCloseDay = "Bg/PopupReward/Day/header/btnClose"
local _btnCloseWeek = "Bg/PopupReward/Week/header/btnClose"
local _btnCloseMonth = "Bg/PopupReward/Month/header/btnClose"


local _pathRewardDay ="Bg/PopupReward/Day"
local _pathRewardWeek ="Bg/PopupReward/Week"
local _pathRewardMonth ="Bg/PopupReward/Month"


local _btnBackLobbyPath = "Bg/header/imgButton/btnBack"

local objDay = nil;
local objWeek =nil
local objMonth = nil
local objReward = nil;
function OnReady()
	SetupButtonBackLobby(_btnBackLobbyPath)
	SetupToggleDayTab()
	SetupToggleWeekTab()
	SetupToggleMonthTab()
	SetupButtonShowReward(_btnShowRewardPath)
	SetScrollPanel()
	SetupButtonClose(_btnCloseOutscreen)
	SetupButtonClose(_btnCloseDay)
	SetupButtonClose(_btnCloseWeek)
    SetupButtonClose(_btnCloseMonth)
	GetObj()
end
function GetObj()
	objDay = LuaGo.Find(_pathScrollDay)
	objWeek = LuaGo.Find(_pathScrollWeek)
	objMonth = LuaGo.Find(_pathScrollMonth)
    objReward = _pathRewardDay
end
function SetAllActive()
	objDay.SetActive(true)
	objWeek.SetActive(true)
	objMonth.SetActive(true)
	LeaderBoard.LuaCall_DayTabActive(true)
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

function SetupToggleDayTab()
    local objToggle = LuaGo.Find(_pathDayToggle)
    local _pathScrollFriend = LuaGo.Find(_pathScrollDay)
    local objText = LuaGo.Find(_txtTextDay)
    objToggle.OnEventToggleChange(function (boolValue)
        _pathScrollFriend.SetActive(boolValue)
        if(boolValue)
            then
                objText.SetTextHexColor("#FFFFFF")
                LeaderBoard.LuaCall_DayTabActive(true)
                objReward = _pathRewardDay
            else
                objText.SetTextHexColor("#515D75")
                LeaderBoard.LuaCall_DayTabActive(false)
        end
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
	local scrollDay = LuaGo.Find(_pathPannelDay)
	local scrollWeek = LuaGo.Find(_pathPannelWeek)
	local scrollMonth = LuaGo.Find(_pathPanneMonth)
    local objMeDay = LuaGo.Find(_pathMeDay)
    local objMeWeek= LuaGo.Find(_pathMeWeek)
    local objMeMonth = LuaGo.Find(_pathMeMonth)
	LeaderBoard.LuaCall_SetTransform(scrollDay,scrollWeek,scrollMonth,objMeDay,objMeWeek,objMeMonth)
	
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




function Hide()
end
