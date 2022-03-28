function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Friend/FriendItemPrefab.prefab",
		Config = "",
		Anchor = "Cam",
		AnchorPreset = "MiddleCenter",
		SizeDelta = "{x: 458, y: 616}"
    }
end

local _txtIndex = "Item/txtNumber"
local _txtName = "Item/ImageAvata/txtName"
local _pathAvatar = "Item/ImageAvata"

local _objFriend = "Item/ImageAvata/Friend"
local _objFriendInvite ="Item/ImageAvata/FriendInvite"
local _objAddFriend = "Item/ImageAvata/AddFriend"

local _txtOnline = "Item/ImageAvata/Friend/imgOnline/txtOnline"
local _imgOnline = "Item/ImageAvata/Friend/imgOnline"

local _btnAddFriend = "Item/ImageAvata/AddFriend/btnAdd"

local _txtTimeLineInvite = "Item/ImageAvata/FriendInvite/txtTimeInvite"
local _btnAccept = "Item/ImageAvata/FriendInvite/btnAccept"
local _btnDelete = "Item/ImageAvata/FriendInvite/btnDelete"

local _btnExtend = "Item/ImageAvata/btnExtend"
local _btnCloseExtend = "Item/ImageAvata/unfriendGroup/btnBackground"
local _btnUnfriendConfirm = "Item/ImageAvata/unfriendGroup/btnUnfriend"
local _extendGroup = "Item/ImageAvata/unfriendGroup"

function OnReady()
	SetupButtonAddFriend()
	SetupButtonAcceptInvite()
	SetupButtonDeleteInvite()
	SetupButtonAvatar()
	SetupButtonExtend()
	SetupButtonConfirm()
	SetupButtonCLoseExtend()
end


function SetupButtonAddFriend()	
	local btn = LuaGo.Find(_btnAddFriend)
	btn.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_AddFriend(LuaGo.name)
    end)
end

function SetupButtonAvatar()
	local button = LuaGo.Find(_pathAvatar)
	button.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_LoadUserProfile(LuaGo.name)
	end)
end

function SetupButtonExtend()
	local button = LuaGo.Find(_btnExtend)
	local objExtend = LuaGo.Find(_extendGroup)
	button.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_OnExtendEnable(LuaGo, objExtend)
	end)
end

function SetupButtonConfirm()
	local button = LuaGo.Find(_btnUnfriendConfirm)
	local objAvatar = LuaGo.Find(_pathAvatar)
	button.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_OnExtendDisable(objAvatar)
		FriendItem.LuaCall_Unfriend(LuaGo.name)
	end)
end

function SetupButtonCLoseExtend()
	local button = LuaGo.Find(_btnCloseExtend)
	local objAvatar = LuaGo.Find(_pathAvatar)
	button.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_OnExtendDisable(objAvatar)
	end)
end

function SetupButtonAcceptInvite()
	local btn = LuaGo.Find(_btnAccept)
	btn.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_AcceptInviteFriend(LuaGo.name)
    end)
end
function SetupButtonDeleteInvite()
	local btn = LuaGo.Find(_btnDelete)
	btn.RegisterButtonPressedCallback(function ()
		FriendItem.LuaCall_DeleteInviteFriend(LuaGo.name)
    end)
end
function Refresh()
	FriendItem.LuaCall_SetTransform(LuaGo)
	local txtIndex = LuaGo.Find(_txtIndex)
	txtIndex.SetText(FriendItem.Model.IndexItem)

	local txtName = LuaGo.Find(_txtName)
	txtName.SetText(FriendItem.Model.ItemEntity.Name)

	local imgAvt = LuaGo.Find(_pathAvatar)
	imgAvt.SetSprite(FriendItem.Model.ItemEntity.ImageAvatar)

	local txtOnline = LuaGo.Find(_txtOnline)
	local imgOnline = LuaGo.Find(_imgOnline)
	if FriendItem.Model.ItemEntity.IsOnline 

		then
			txtOnline.SetText("Online")
			imgOnline.SetSprite("icon_online")
		else
			txtOnline.SetText("Offline")
			imgOnline.SetSprite("icon_offline")
		
	end

	local txtTimeInvite = LuaGo.Find(_txtTimeLineInvite)
	txtTimeInvite.SetText(FriendItem.Model.ItemEntity.DateInvite)

end


function SetDataInViewFriend()
    local objFriend = LuaGo.Find(_objFriend)
	local objInvite = LuaGo.Find(_objFriendInvite)
	local objAddFriend = LuaGo.Find(_objAddFriend)

	objFriend.SetActive(true)
	objInvite.SetActive(false)
	objAddFriend.SetActive(false)
end
function SetDataInViewInvited()
    local objFriend = LuaGo.Find(_objFriend)
	local objInvite = LuaGo.Find(_objFriendInvite)
	local objAddFriend = LuaGo.Find(_objAddFriend)

	objFriend.SetActive(false)
	objInvite.SetActive(false)
	objAddFriend.SetActive(false)

	local objAdd = LuaGo.Find(_btnAddFriend)
	objAdd.SetActive(false)
end

function SetDataInViewAddFriend()
    local objFriend = LuaGo.Find(_objFriend)
	local objInvite = LuaGo.Find(_objFriendInvite)
	local objAddFriend = LuaGo.Find(_objAddFriend)

	objFriend.SetActive(false)
	objInvite.SetActive(false)
	objAddFriend.SetActive(true)

	local objAdd = LuaGo.Find(_btnAddFriend)
	objAdd.SetActive(true)
end
function SetDataInViewReceiveFriend()
	local objFriend = LuaGo.Find(_objFriend)
	local objInvite = LuaGo.Find(_objFriendInvite)
	local objAddFriend = LuaGo.Find(_objAddFriend)

	objFriend.SetActive(false)
	objInvite.SetActive(true)
	objAddFriend.SetActive(false)
end
function Hide()
end
