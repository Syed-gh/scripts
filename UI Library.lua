local Library = {}
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

Library.create = function(classData)
	local dataModel = Instance.new(classData.Data.Class)
	dataModel.Parent = classData.Data.Parent
	dataModel.Name = classData.Data.Name

	if dataModel:IsA("ValueBase") then
		dataModel.Value = classData.Data.Value
	end

	return classData.Data.Class .. " Created"
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
