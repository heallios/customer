function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/Island/GroupCell.prefab",
		Config = ""
    }
end

local CellPaths ={
    "Group/Cell_1",
    "Group/Cell_2",
    "Group/Cell_3",
    "Group/Cell_4",
    "Group/Cell_5",
    "Group/Cell_6",
    "Group/Cell_7",
    "Group/Cell_8",
    "Group/Cell_9",
    "Group/Cell_10"
}

local CellTextPaths ={
    "Group/Cell_1/Text",
    "Group/Cell_2/Text",
    "Group/Cell_3/Text",
    "Group/Cell_4/Text",
    "Group/Cell_5/Text",
    "Group/Cell_6/Text",
    "Group/Cell_7/Text",
    "Group/Cell_8/Text",
    "Group/Cell_9/Text",
    "Group/Cell_10/Text"
}

local CellCirclePaths ={
    "Group/Cell_1/CircleImg",
    "Group/Cell_2/CircleImg",
    "Group/Cell_3/CircleImg",
    "Group/Cell_4/CircleImg",
    "Group/Cell_5/CircleImg",
    "Group/Cell_6/CircleImg",
    "Group/Cell_7/CircleImg",
    "Group/Cell_8/CircleImg",
    "Group/Cell_9/CircleImg",
    "Group/Cell_10/CircleImg"
}

local CellLockIconPaths ={
    "Group/Cell_1/LockIcon",
    "Group/Cell_2/LockIcon",
    "Group/Cell_3/LockIcon",
    "Group/Cell_4/LockIcon",
    "Group/Cell_5/LockIcon",
    "Group/Cell_6/LockIcon",
    "Group/Cell_7/LockIcon",
    "Group/Cell_8/LockIcon",
    "Group/Cell_9/LockIcon",
    "Group/Cell_10/LockIcon"
}

local CellStarPaths ={
    "Group/Cell_1/Star_",
    "Group/Cell_2/Star_",
    "Group/Cell_3/Star_",
    "Group/Cell_4/Star_",
    "Group/Cell_5/Star_",
    "Group/Cell_6/Star_",
    "Group/Cell_7/Star_",
    "Group/Cell_8/Star_",
    "Group/Cell_9/Star_",
    "Group/Cell_10/Star_"
}

local CellIds ={}

local UnlockSprite = "Unlock_Cell"
local LockSprite = "Lock_Cell"

local UnlockStarSprite = "Unlock_Star"
local LockStarSprite = "Lock_Star"

function OnReady()

end

function SetUpCellId(startId, currentIndex, maxId)
    for i = 1, #CellPaths do
		local id = startId + i - 1

        local text = LuaGo.Find(CellTextPaths[i])
        
        local lockIcon = LuaGo.Find(CellLockIconPaths[i])

        local btn = LuaGo.Find(CellPaths[i])

        btn.UnregisterButtonPressedCallback()

        btn.RegisterButtonPressedCallback(function ()
		    IsLand.LuaCall_JoinCellView(id)
        end)

        local obj = LuaGo.Find(CellCirclePaths[i])

        local obj2 = LuaGo.Find(CellPaths[i])

        if id == currentIndex then
            obj.SetActive(true)

            IsLand.LuaCall_MoveToCell(btn)

            lockIcon.SetActive(false)
            text.SetActive(true)
            text.SetText(id)
        else
            obj.SetActive(false)

            if id > currentIndex then
                obj2.SetSprite(LockSprite)

                lockIcon.SetActive(true)
                text.SetActive(false)
            else
                obj2.SetSprite(UnlockSprite)

                lockIcon.SetActive(false)
                text.SetActive(true)
                text.SetText(id)
            end
        end

        --if CellIds[i] > maxId then
            --btn.SetActive(false)
        --end
    end
end

function SetStarData(star, id)
    for i = 1, star do
        local starImg = LuaGo.Find(string.format("%s%s",CellStarPaths[id] ,i))
        starImg.SetSprite(UnlockStarSprite)
    end
end

function Hide()
end
