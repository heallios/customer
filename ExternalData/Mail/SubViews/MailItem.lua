


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Mail/SubViews/MailItem.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _iconNoticePath = "Group/iconRed"
local _bgMailMaskPath = "Group/Mask"
local _iconMailPath = "Group/Icon"
local _titleMailPath = "Group/titleTxt"
local _timePath = "Group/timeTxt"
local _btnPath = "Group"

local _iconNotice = nil
local _bgMailMask = nil
local _iconMail = nil
local _titleMail = nil
local _timeTxt = nil
local _btnMail = nil

function OnReady()
	FindUI()
end

function FindUI()
	_iconNotice = LuaGo.Find(_iconNoticePath)
	_bgMailMask = LuaGo.Find(_bgMailMaskPath)
	_iconMail = LuaGo.Find(_iconMailPath)
	_titleMail = LuaGo.Find(_titleMailPath)
	_timeTxt = LuaGo.Find(_timePath)
	_btnMail = LuaGo.Find(_btnPath)
end

function UpdateView(isRead, tilte, iconImg, time, Id)
	if isRead then
		_iconNotice.SetActive(false)
		_bgMailMask.SetActive(true)
	else
		_iconNotice.SetActive(true)
		_bgMailMask.SetActive(false)
	end

	_titleMail.SetText(tilte)
	_iconMail.SetSprite(iconImg)
	_timeTxt.SetText(time)

	_btnMail.UnregisterButtonPressedCallback()
	_btnMail.RegisterButtonPressedCallback(function ()
		Mail.LuaCall_OpenMail(Id)
    end)
end

function Hide()
end
