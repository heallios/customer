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
local _btnBackLobby = "Bg/body/btnBack"
local _handIcon = "Bg/body/Hand Icon"
local _goHorizontalSnap = "Horizontal Scroll Snap"

local _planetContainerPath = "Horizontal Scroll Snap/Content"
local _planetPath = "Horizontal Scroll Snap/Content/planet";
--local _goHorizontalSnap_planet2 = "Horizontal Scroll Snap/Content/planet2";
--local _goHorizontalSnap_planet3 = "Horizontal Scroll Snap/Content/planet3";
--local _goHorizontalSnap_planet4 = "Horizontal Scroll Snap/Content/planet4";
--local _goHorizontalSnap_planet5 = "Horizontal Scroll Snap/Content/planet5";

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
    MapIsLand.LuaCall_AddSetupHorizontalSnap(go)
end

function SetupPlanetButtons(length)
    for i = 1, length do
        local planetButtonLocation = string.format("%s%d/Button", _planetPath, i)
        local _planetButton = LuaGo.Find(planetButtonLocation)
        MapIsLand.LuaCall_InitializePlanetData(i)
        _planetButton.RegisterButtonPressedCallback(function ()
            MapIsLand.LuaCall_JoinIsLandSubView(i)
        end)
    end
    --local container = LuaGo.Find(_planetContainerPath)
    --MapIsLand.LuaCall_DisableHorizontalLayoutGroup(container)
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
function Hide()
end

