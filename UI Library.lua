local Library = {}
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

function Create(Class, Parent, Table)
	local newObj = Instance.new(Class)
	newObj.Parent = Parent
	--newObj.Name = GiveName()
	for i, v in pairs(Table) do
		local success = pcall(function()
			return newObj[i]
		end)
		if (success) then
			newObj[i] = v
		else
			warn()
		end
	end
	return newObj
end

Library.GetUserId = function(Name)
	local UserId = Players:GetUserIdFromNameAsync(Name)
	return UserId
end

Library.GetName = function(UserId)
	local Name = Players:GetNameFromUserIdAsync(UserId)
	return Name
end

Library.Date = function(Pattern)
	local Result = os.date(Pattern, os.time())
	return Result
end

Library.Tween = function(GuiObj, Property, Value, Direction, Style, Duration)
	-- implement TweenService
	local nTweenInfo = TweenInfo.new(Duration, Enum.EasingStyle[Style], Enum.EasingDirection[Direction])
	local Tween = TweenService:Create(GuiObj, nTweenInfo, {[Property] = Value})
	Tween:Play()
end

return Library
