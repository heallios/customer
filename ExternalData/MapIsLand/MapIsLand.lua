function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/IsLand/MapIsLand.prefab",
		Config = "{\"planetPath\":\"Assets/PolygonSciFiSpace/Scenes/PlanetView_1.prefab\"}",
		Anchor = "CamScale",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _btnJoinIsLand = "Bg/body/btnJoinIsLand"
local _camPath = "MainCam_PlanetView"
local _planetContentPath = "MainCam_PlanetView/Canvas/Scroll View/Viewport/Content"
local _btnBackLobby = "Bg/body/btnBack"
local _handIcon = "Bg/body/Hand Icon"
local _goHorizontalSnap = "scroll_HorizontalSnap"

local _planetContainerPath = "scroll_HorizontalSnap/Content"
local _planetPath = "scroll_HorizontalSnap/Content/planet";

--Locator--
local _indicatorContainerPath = "scroll_HorizontalSnap/Indicator View"
local _indicatorLuaPath = "MapIsLand/SubViews/Locator"
-----

local _planetTxtLevel = "Bg/PlanetView/Info/Level"
local _planetTxtName = "Bg/PlanetView/Info/Name"
local _planetEnergyText = "Bg/PlanetView/Info/Energy"
local _goLock = "Bg/PlanetView/Lock"
local _goInfo = "Bg/PlanetView"
function OnReady()
	--SetupBtnPlanet()
	SetupButtonBackLobby(_btnBackLobby)
	SetupHorizontalSnap(_goHorizontalSnap)
    SetupCamera()
    CreateLocator()
end
function SetupCamera()
    local cam = LuaGo.Find(_camPath)
    MapIsLand.LuaCall_SetupPlanetCam(cam)
end
function SetPlanetTxtLevel(level)
	local txtLevel = LuaGo.Find(_planetTxtLevel)
    txtLevel.SetText(level)
end

function SetPlanetTxtName(name)
	local txtName = LuaGo.Find(_planetTxtName)
    txtName.SetText(name)
end

function SetPlanetTextEnergy(energy, maxEnergy)
    local textName = LuaGo.Find(_planetEnergyText)
    textName.SetText(string.format("%d/%d", energy, maxEnergy))
end

function EnableLock()
    local goLock = LuaGo.Find(_goLock)
    goLock.SetActive(true)
end

function DisableLock()
    local goLock = LuaGo.Find(_goLock)
    goLock.SetActive(false)
end

function EnableInfo()
    local goInfo = LuaGo.Find(_goInfo)
    goInfo.SetActive(true)
end

function DisableInfo()
    local goInfo = LuaGo.Find(_goInfo)
    goInfo.SetActive(false)
end

function SetupHorizontalSnap(goPath)
	local go = LuaGo.Find(goPath)
    Log(go)
    MapIsLand.LuaCall_AddSetupHorizontalSnap(go)
end

function SetupPlanetButtons(length)
    for i = 1, length do
        local planetButtonLocation = string.format("%s%d/Button", _planetPath, i)
        local _planetButton = LuaGo.Find(planetButtonLocation)
        --MapIsLand.LuaCall_InitializePlanetData(i)
        _planetButton.RegisterButtonPressedCallback(function ()
            MapIsLand.LuaCall_JoinIsLandSubView(i)
        end)
    end
end

function SetupButtonJoinIsland(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MapIsLand.LuaCall_JoinIsLand()
    end)
end

function SetupButtonBackLobby(btnPath)
	local btn = LuaGo.Find(btnPath)
	btn.RegisterButtonPressedCallback(function ()
		MapIsLand.LuaCall_BackLobby()
    end)
end

function SetupHandTutorialAnimation(loops)
    SetupAnimation(_handIcon, loops)
end

function ActiveHandTutorial(active)
    local icon = LuaGo.Find(_handIcon)
    icon.SetActive(active)
end

function SetupAnimation(iconPath, loops)
    local icon = LuaGo.Find(iconPath)
    MapIsLand.LuaCall_SwipeAnimation(icon, loops)
end

function CreateLocator()
    local container = LuaGo.Find(_indicatorContainerPath)
    CreateSubView(_indicatorLuaPath, container.Transform)
end

function CreateIndicator(luaPath, container)
    CreateSubView(luaPath, container.Transform)
end

function SetPlanetParent(gameObject)
    local planetContent = LuaGo.Find(_planetContentPath)
    planetContent.SetParentUI(planetContent.Transform, gameObject)
end

function SetupButton(index)
    local container = LuaGo.Find(_planetContainerPath)
    MapIsLand.LuaCall_SetupButton(container, index)
end

function Hide()
end

