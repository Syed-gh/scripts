-- DEX 2.0
local PlayerGui = game.Players.LocalPlayer.PlayerGui
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- Generate
function Create(Class, Parent, Table)
	local newObj = Instance.new(Class)
	newObj.Parent = Parent
	newObj.Name = GiveName()
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

function GiveName()
	local a, b, c, d = math.random(0, 10000), math.random(0, 5000), math.random(0, 10000), math.random(0, 5000)
	local random = tostring(a .. "-" .. b .. "-" .. c .. "-" .. d .. "-MADEBYBLOODY888")
	return random
end


function Alert(Title, Desc)
	StarterGui:SetCore("SendNotification", {
		Title = Title,
		Text = Desc,
	})
end

-- UI
local MainGui = Create("ScreenGui", PlayerGui, {})


local MainFrame = Create("Frame", MainGui, {
	BackgroundColor3 = Color3.fromRGB(27, 27, 27), 
	BackgroundTransparency = 0, 
	BorderSizePixel = 0, 
	Position = UDim2.new(0, 0,0, 0), 
	Size = UDim2.new(0.2, 0,0.5, 0),
	Draggable = true,
	Active = true,
	Selectable = true,
})

local ButtonFrame = Create("ScrollingFrame", MainFrame, {
	BackgroundColor3 = Color3.fromRGB(27, 27, 27), 
	BackgroundTransparency = 1, 
	BorderSizePixel = 0, 
	Position = UDim2.new(0, 0,0, 0), 
	Size = UDim2.new(1, 0,1, 0),
	CanvasSize = UDim2.new(0, 0,100, 0),
	ScrollBarThickness = 1,
})

local UIListLayout1 = Create("UIListLayout", ButtonFrame, {
	Padding = UDim.new(0, 5)
})

local MainFrame2 = Create("Frame", MainGui, {
	BackgroundColor3 = Color3.fromRGB(27, 27, 27), 
	BackgroundTransparency = 0, 
	BorderSizePixel = 1,
	BorderColor3 = Color3.fromRGB(255, 255, 255),
	Position = UDim2.new(0, 0,0.5, 0), 
	Size = UDim2.new(0.2, 0,0.5, 0),
	Draggable = true,
	Active = true,
	Selectable = true,
})

local PropertiesFrame = Create("ScrollingFrame", MainFrame2, {
	BackgroundColor3 = Color3.fromRGB(27, 27, 27), 
	BackgroundTransparency = 1, 
	BorderSizePixel = 0, 
	Position = UDim2.new(0, 0,0, 0), 
	Size = UDim2.new(1, 0,1, 0),
	CanvasSize = UDim2.new(0, 0,100, 0),
	ScrollBarThickness = 1,
})

local UIListLayout2 = Create("UIListLayout", PropertiesFrame, {
	Padding = UDim.new(0, 5)
})

-- Intance

local TAB1 = {}
local TAB2 = {}

local ClassProperties = {
	"Name",
	"Parent",
	"ClassName",
	"Health",
	"MaxHealth",
	"WalkSpeed",
	"JumpPower",
	--"TeamColor",
	"Value",
	"Size",
	"Position",
	"Orientation",
	"Anchored",
	"CanCollide",
	"BrickColor",
	"BackgroundColor3",
	"Text",
	"Texture",
	"Image",
	"MeshId",
	"TextureId",
	"Visible",
	"Disabled",
	"Enabled",
	"AnimationId",
	"SoundId",
	"Team",
	"TeamColor",
	"UserId",
	"SizeOffset",
	"StudsOffset",
	"MaxDistance",
	"Adornee",
	"ShirtTemplate",
	"PantsTemplate",
}

function Install()

	for i, v in pairs(game:GetChildren()) do

		local success, err = pcall(function()
			return v.Name
		end)
		if (success) then

			if v.Name == "Workspace" then
				table.insert(TAB1, v)
			end
			
			if v.Name == "Players" then
				table.insert(TAB1, v)
			end
			
			if v.Name == "Teams" then
				table.insert(TAB1, v)
			end
			
			if v.Name == "CoreGui" then
				table.insert(TAB1, v)
			end
			
		else
			warn()
		end

	end
end

function remove()
	for i, v in pairs(ButtonFrame:GetChildren()) do
		if v:IsA("UIListLayout") then

		else
			v:Destroy()
		end

	end
	for i, v in pairs(PropertiesFrame:GetChildren()) do
		if v:IsA("UIListLayout") then

		else
			v:Destroy()
		end

	end
	for i, v in pairs(TAB1) do
		
		--table.remove(TAB1, #TAB1)
		
		TAB1[i] = nil
		--print(i, v)

	end

end

function getAttributes(obj)


	for i, v in pairs(ClassProperties) do
		local success = pcall(function()
			if obj[v] then
				return obj[v]
			end
			
		end)
		if success then
			if obj:FindFirstChild(v) then return end
			
			local IndProperty = Create("Frame", PropertiesFrame, {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Position = UDim2.new(0, 0,0, 0), 
				Size = UDim2.new(1, 0,0, 20),
				Active = true,
			})
			
			local Button = Create("TextButton", IndProperty, {

				AutoButtonColor = false,
				BackgroundColor3 = Color3.fromRGB(27, 27, 27), 
				BackgroundTransparency = 0, 
				BorderSizePixel = 0, 
				Position = UDim2.new(0, 0,0, 0), 
				Size = UDim2.new(0.5, 0,1, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				Font = "Code",
				TextScaled = true,
				Text = tostring(v),
				TextXAlignment = "Left",
			}) 
		
			local Box = Create("TextBox", IndProperty, {

				BackgroundColor3 = Color3.fromRGB(27, 27, 27), 
				BackgroundTransparency = 0, 
				BorderSizePixel = 0, 
				Position = UDim2.new(0.5, 0,0, 0), 
				Size = UDim2.new(0.5, 0,1, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				Font = "Code",
				TextScaled = true,
				ClearTextOnFocus = false,
				TextWrapped = true,
				TextXAlignment = "Left",
				PlaceholderText = tostring(obj[v]),
				Text = tostring(obj[v]),
			}) 
			
			obj:GetPropertyChangedSignal(v):Connect(function()
				Box.PlaceholderText = tostring(obj[v])
				Box.Text = tostring(obj[v])
			end)
			
			if typeof(obj[v]) ~= "string" and "boolean" and "number" and "Vector3" then
				Box.TextColor3 = Color3.fromRGB(100,100,100)
			end
			
			Box.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					
					local success, err = pcall(function()
						
						
						if typeof(obj[v]) == "string" then
							obj[v] = Box.Text
						end
						if typeof(obj[v]) == "boolean" then
							obj[v] = not obj[v]
						end
						if typeof(obj[v]) == "number" then
							obj[v] = tonumber(Box.Text)
						end
						if typeof(obj[v]) == "Vector3" then
							local xyz = string.split(Box.Text, ',')
							obj[v] =  Vector3.new(tonumber(xyz[1]), tonumber(xyz[2]), tonumber(xyz[3]))
						end
						
						--obj[v] = Box.Text	
						Alert("DEX", "You have changed " .. tostring(obj) .. "'s " .. v .. " to " .. tostring(obj[v]))
					end)
					
					if not (success) then
						Alert("Locked Property", err)
						Box.Text = Box.PlaceholderText
					end
					
				end
			end)
			
			--local Button = Create("TextButton", PropertiesFrame, {

			--	AutoButtonColor = false,
			--	BackgroundColor3 = Color3.fromRGB(27, 27, 27), 
			--	BackgroundTransparency = 0, 
			--	BorderSizePixel = 0, 
			--	Position = UDim2.new(0, 0,0, 0), 
			--	Size = UDim2.new(1, 0,0, 20),
			--	TextColor3 = Color3.fromRGB(255, 255, 255),
			--	Font = "Code",
			--	TextScaled = true,
			--	Text = tostring(v) .. " - " .. tostring(obj[v]),
			--	TextXAlignment = "Left",
			--}) 
			--obj:GetPropertyChangedSignal(v):Connect(function()
			--	Button.Text = tostring(v) .. " - " .. tostring(obj[v])
			--end)
			
		end

	end
end


local StartConnection 
local EndConnection

function viewButton(Obj, Button, callback)


	Button.Activated:Connect(function()
		remove()
		getAttributes(Obj)

		for i, v in pairs(Obj:GetChildren()) do
			table.insert(TAB1, v)
			--callback()
		end
		
		Install2()
		
		--StartConnection = Obj.ChildAdded:Connect(function(v_)
		--	print("x")
		--	remove()
		--	getAttributes(Obj)
		--	for i, v in pairs(Obj:GetChildren()) do
		--		table.insert(TAB1, v)
		--	end
		--	Install2()
		--end)
		
		--EndConnection = Obj.ChildRemoved:Connect(function(v_)
		--	for i, x in pairs(TAB1) do
		--		if v_ == x then
		--			remove()
		--			getAttributes(Obj)
		--			for i, v in pairs(Obj:GetChildren()) do
		--				table.insert(TAB1, v)
		--			end
		--			Install2()
		--		end
		--	end
		--end)
		
	end)
	
	
	
end


function Install2()
	for i, v in pairs(TAB1) do
		local Button = Create("TextButton", ButtonFrame, {
			AutoButtonColor = false,
			BackgroundColor3 = Color3.fromRGB(27, 27, 27), 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			Position = UDim2.new(0, 0,0, 0), 
			Size = UDim2.new(1, 0,0, 20),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Font = "Code",
			TextScaled = true,
			Text = "+ " .. v.Name .. " [" .. v.ClassName .. "]",
			TextXAlignment = "Left",
		})
		
		viewButton(v, Button, function()
			
		end)

	end
end


wait(math.random())
Alert("Explorer", "Basic Dev explorer loaded")
Install()
Install2()

UIS.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Home then
		remove()
		if StartConnection then
			StartConnection:Disconnect()
			EndConnection:Disconnect()
		end
		Install()
		Install2()
		Alert("Explorer", "Reloaded")
	end
end)


wait(math.random(3, 5))
Alert("DEX", 'You can press "Home" key to refresh DEX to fix errors')
wait(math.random(3, 5))
Alert("DEX", "You can change instance properties by clicking on its values in properties")
