


function GetConfig ()
	return {
        Bundle = "Assets/Bundles/Views/AddCurrencyEffect/AddCurrencyEffect.prefab",
		Config = "",
		Anchor = "Load",
		AnchorPreset = "StretchAll",
		SizeDelta = "{x: 0, y: 0}"
    }
end

local _targetSize = {
	1
	, 1
	, 1
}
local _shrinkSize = {
	0
	, 0
	, 0
}
local _minSize = 62
local _maxSize = 74

local _scaleTime = 0.5
local _moveTime = 0.5

function OnReady()
end

function DoCurrencyEffect(position)
	AddCurrencyEffect.LuaCall_DoEffect(_minSize, _maxSize, _targetSize, _shrinkSize, position, _scaleTime, _moveTime)
end

function DoCurrencyAnimation(targetSize, time, gameObject)
	gameObject.DoScale(targetSize, time)
end

function Hide()
end
