local UILibrary = {}


local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player788/luau1/main/lib.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local screenGui = lib.Create("ScreenGui", game.CoreGui, {
	IgnoreGuiInset = true,
	ResetOnSpawn = false,
})
local instanceLog = {}
local textlog = {}
local config = {Save = false, SaveFolderName = ""}
local Keys = {}

function UILibrary:Window(Table)
	local cache = {
		HubName = Table.Name or game.Name, 
		ScriptName = Table.ScriptName or '<font color="rgb(255, 255, 127)">UNLISTED</font>', 
		Creator = Table.Creator or '<font color="rgb(255, 255, 127)">UNLISTED</font>',
		Hotkey = Table.Hotkey[1] or "Comma"
	}
	Sys('<font color="rgb(85, 170, 127)">Loading..</font>', "["..cache.HubName.."] "  .. cache.ScriptName .. " by " .. cache.Creator, 60)


	local mainkey
	if Table.Hotkey then
		mainkey = Enum.KeyCode[Table.Hotkey[1]]
	else
		mainkey = Enum.KeyCode["Comma"]
	end

	if Table.Save then
		config.Save = Table.Save
		config.SaveFolderName = Table.SaveFolderName
	else
		config.Save = false
	end

	local mainFrame = lib.Create("Frame", screenGui, {
		AnchorPoint = Vector2.new(0.5, 0.5);
		BackgroundColor3 = Color3.fromRGB(34, 34, 34), 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		Position = UDim2.new(0.5, 0,0.5, 0), 
		Size = UDim2.new(0.35, 0,0.35, 0), --UDim2.new(0.35, 0,0.4, 0)
		Active = true,
		Draggable = true,
		Visible = false,
	})
	local mainFrame_corner = lib.Create("UICorner", mainFrame, {
		CornerRadius = UDim.new(0, 5)
	})
	local topBar = lib.Create("Frame", mainFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		Position = UDim2.new(0, 0,0, 0), 
		Size = UDim2.new(1, 0,0.075, 0),
	})
	local topBar_gradient = lib.Create("UIGradient", topBar, {
		Color = ColorSequence.new(Color3.fromRGB(150, 150, 150), Color3.fromRGB(200, 200, 200));
		Rotation = 270;
		Transparency = NumberSequence.new(0, 1)
	})
	local iconFrame = lib.Create("Frame", topBar, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0, 
		Position = UDim2.new(0, 0,0, 0), 
		Size = UDim2.new(0.047, 0,1, 0),
	})
	local iconButton = lib.Create("ImageButton", iconFrame, {
		BackgroundTransparency = 1, 
		AnchorPoint = Vector2.new(0.5, 0.5);
		Position = UDim2.new(0.5, 0,0.5, 0),
		Size = UDim2.new(0.512, 0,0.512, 0),
		ScaleType = Enum.ScaleType.Fit;
		Image = Table.Icon or lib.Headshot(Players.LocalPlayer.UserId)
	})
	local closeButton = lib.Create("TextButton", topBar, {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.925, 0,0, 0), 
		Size = UDim2.new(0.075, 0,1, 0),
		Font = "Code",
		TextColor3 = Color3.fromRGB(150, 150, 150), 
		Text = "-",
		TextScaled = true,
	})
	local scriptName = lib.Create("TextButton", topBar, {
		AutoButtonColor = false,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.05, 0,0.5, 0), 
		Size = UDim2.new(0.15, 0,0.5, 0),
		Font = Enum.Font.SourceSansItalic,
		--FontWeight = Enum.FontWeight.Book,
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		Text = Table.ScriptName or "Editor",
		TextScaled = true,
		AutomaticSize = "X",
		TextSize = 16,
		TextXAlignment = "Left",
		TextTransparency = 1,
	})
	local activeFrame = lib.Create("Frame", mainFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		Position = UDim2.new(0, 0,0.075, 0), 
		Size = UDim2.new(1, 0,0.925, 0),
	})
	local activeFrame_corner = lib.Create("UICorner", activeFrame, {
		CornerRadius = UDim.new(0, 5)
	})
	local sideFrame = lib.Create("Frame", activeFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		Position = UDim2.new(0, 0,0, 0), 
		Size = UDim2.new(0.225, 0,1, 0),
	})	
	local sideFrame_corner = lib.Create("UICorner", sideFrame, {
		CornerRadius = UDim.new(0, 5)
	})
	local headTextFrame = lib.Create("Frame", sideFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0,0, 0), 
		Size = UDim2.new(1, 0,0.1, 0),
	})
	local headTextButton = lib.Create("TextButton", headTextFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29),
		AnchorPoint = Vector2.new(0, 0.5),
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0,0.5, 0), 
		Size = UDim2.new(1, 0,0.5, 0),
		Font = "GothamMedium",
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		Text = Table.Name or game.Name,
		TextScaled = true,
		TextSize = 20,
		ZIndex = 2,
		ClipsDescendants = true,
	})
	local headTextgradFrame1 = lib.Create("Frame", headTextFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0,0, 0), 
		Size = UDim2.new(1, 0,1, 0),
	})
	local headTextgradFrame2 = lib.Create("Frame", headTextFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0,0, 0), 
		Size = UDim2.new(1, 0,1, 0),
	})
	local headText_grad1 = lib.Create("UIGradient", headTextgradFrame1, {
		Color = ColorSequence.new(Color3.fromRGB(150, 150, 150), Color3.fromRGB(200, 200, 200));
		Rotation = 90;
		Transparency = NumberSequence.new(0, 1)
	})
	local headText_grad2 = lib.Create("UIGradient", headTextgradFrame2, {
		Color = ColorSequence.new(Color3.fromRGB(150, 150, 150), Color3.fromRGB(200, 200, 200));
		Rotation = 270;
		Transparency = NumberSequence.new(0, 1)
	})
	local sideButtonsFrame = lib.Create("ScrollingFrame", sideFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0, 
		Position = UDim2.new(0, 0,0.1, 0), 
		Size = UDim2.new(1, 0,0.9, 0),
		CanvasSize = UDim2.new(0, 0,1, 0),
		AutomaticCanvasSize = "Y",
		ScrollBarThickness = 0,
	})
	local listlayout_sideButtonsFrame = lib.Create("UIListLayout", sideButtonsFrame, {
		Padding = UDim.new(0, 5),
		SortOrder = "LayoutOrder",
	})
	local sideFramegradient = lib.Create("Frame", sideFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		Position = UDim2.new(1, 0,0, 0), 
		Size = UDim2.new(0.2, 0,1, 0),
	})
	local sidegradient = lib.Create("UIGradient", sideFramegradient, {
		Color = ColorSequence.new(Color3.fromRGB(150, 150, 150), Color3.fromRGB(200, 200, 200));
		Rotation = 0;
		Transparency = NumberSequence.new(0, 1)
	})

	local tabFrame = lib.Create("Frame", activeFrame, {
		BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
		BackgroundTransparency = 0,
		BorderSizePixel = 0, 
		Position = UDim2.new(0.27, 0,0.1, 0), 
		Size = UDim2.new(0.685, 0,0.85, 0),
	})

	iconButton.MouseEnter:Connect(function()
		lib.Tween(scriptName, "TextTransparency", 0, "InOut", "Linear", 0.1)
	end)
	iconButton.MouseLeave:Connect(function()
		lib.Tween(scriptName, "TextTransparency", 1, "InOut", "Linear", 0.1)
	end)
	closeButton.MouseEnter:Connect(function()
		lib.Tween(closeButton, "TextColor3", Color3.fromRGB(200,200,200), "InOut", "Linear", 0.1)
	end)
	closeButton.MouseLeave:Connect(function()
		lib.Tween(closeButton, "TextColor3", Color3.fromRGB(150,150,150), "InOut", "Linear", 0.1)
	end)
	local maintoggle = false
	closeButton.MouseButton1Down:Connect(function()
		if maintoggle then
			lib.Tween(mainFrame, "Position", UDim2.new(0.5, 0,1.15, 0), "InOut", "Linear", 0.1)
			closeButton.Text = "+"
			maintoggle = false
		else
			lib.Tween(mainFrame, "Position", UDim2.new(0.5, 0,0.5, 0), "InOut", "Linear", 0.1)
			closeButton.Text = "-"
			maintoggle = true
		end

	end)

	UserInputService.InputBegan:Connect(function(input, gpe)
		if input.KeyCode == mainkey then
			if Table.Hotkey and Table.Hotkey[2] == true then mainFrame.Visible = true return end
			mainFrame.Visible = not mainFrame.Visible
		end	
	end)
	UserInputService.InputEnded:Connect(function(input, gpe)
		if input.KeyCode == mainkey then
			if Table.Hotkey and Table.Hotkey[2] == true then mainFrame.Visible = false return end
		end	
	end)

	iconButton.MouseButton1Down:Connect(function()
		for _, v in pairs(textlog) do
			print(v.Title or "Error", v.Content)
			print(" ")
		end
		UILibrary:Notification({Title = "Console", Content = "[F9] Check Devconsole for script logs", Time = 5})
	end)

	--local function Warn(err)
	--	UILibrary:Notification({
	--		Content = err,
	--	})
	--end

	local tabLibrary = {}

	local currentTab
	function tabLibrary:AddTab(Text)
		local tabButton = lib.Create("TextButton", sideButtonsFrame, {
			BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
			AutoButtonColor = false,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0,0, 0), 
			Size = UDim2.new(1, 0,0.1, 0),
			Font = "Gotham",
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			Text = Text,
			TextSize = 16,
		})
		local tabButton_highlight = lib.Create("Frame", tabButton, {
			ZIndex = 2,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0,1, 0),
		})
		local tabScrollFrame = lib.Create("ScrollingFrame", tabFrame, {
			BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0, 
			Position = UDim2.new(0, 0,0, 0), 
			Size = UDim2.new(1, 0,1, 0),
			AutomaticCanvasSize = "Y",
			CanvasSize = UDim2.new(0, 0,1, 0),
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 1,
			Visible = false,
		})
		local listlayout_tabScrollFrame = lib.Create("UIListLayout", tabScrollFrame, {
			Padding = UDim.new(0, 5),
			SortOrder = "LayoutOrder",
		})

		tabButton.MouseEnter:Connect(function()
			lib.Tween(tabButton_highlight, "BackgroundTransparency", 0.9, "InOut", "Linear", 0.1)
		end)
		tabButton.MouseLeave:Connect(function()
			lib.Tween(tabButton_highlight, "BackgroundTransparency", 1, "InOut", "Linear", 0.1)
		end)

		tabButton.MouseButton1Down:Connect(function()
			for _, v in pairs(sideButtonsFrame:GetChildren()) do
				if v:IsA("TextButton") then
					v.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
				end
			end
			for _, v in pairs(tabFrame:GetChildren()) do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
			tabScrollFrame.Visible = true
			tabButton.BackgroundColor3 = Color3.fromRGB(24, 163, 255)
			currentTab = tabButton
		end)

		local sectionLibrary = {}

		function sectionLibrary:AddSection(Text)
			local sectionFrame = lib.Create("Frame", tabScrollFrame, {
				BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 1, 
				Position = UDim2.new(0, 0,0, 0), 
				Size = UDim2.new(1, 0,0.1, 0), -- scale y 0.2
				--AutomaticSize = "Y",
				Visible = false, -- fix sections

			})
			local listlayout_tabScrollFrame = lib.Create("UIListLayout", sectionFrame, {
				Padding = UDim.new(0, 5),
				SortOrder = "LayoutOrder",
			})
			local sectionLabelFrame = lib.Create("Frame", sectionFrame, {
				BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Position = UDim2.new(0, 0,0, 0), 
				Size = UDim2.new(1, 0,1, 0), -- scale y 0.1 
				--AutomaticSize = "Y",
			})
			local sectionlabel = lib.Create("TextLabel", sectionLabelFrame, {
				BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Position = UDim2.new(0, 0,0, 0), 
				Size = UDim2.new(1, 0,1, 0),
				Font = "GothamMedium",
				Text = Text,
				TextSize = 14,
				TextColor3 = Color3.fromRGB(155, 155, 155),
				TextXAlignment = "Left",
			})

			local buttonsLibrary = {}

			function buttonsLibrary:AddButton(Table)
				local buttonFrame = lib.Create("Frame", tabScrollFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,0.1, 0),
					--AutomaticSize = "Y",
				})
				local Button_highlight = lib.Create("Frame", buttonFrame, {
					ZIndex = 2,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,1, 0),
				})
				local buttonhighlight_corner = lib.Create("UICorner", Button_highlight, {
					CornerRadius = UDim.new(0, 5)
				})
				local buttonFrame_corner = lib.Create("UICorner", buttonFrame, {
					CornerRadius = UDim.new(0, 5)
				})
				local button = lib.Create("TextButton", buttonFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0.025, 0,0, 0), 
					Size = UDim2.new(0.975, 0,1, 0),
					Font = "GothamMedium",
					Text = Table.Text,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextXAlignment = "Left",
				})
				
				button.MouseEnter:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 0.95, "InOut", "Linear", 0.1)
				end)
				button.MouseLeave:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 1, "InOut", "Linear", 0.1)
				end)
				button.MouseButton1Down:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 0.9, "InOut", "Linear", 0.01)
				end)
				button.MouseButton1Up:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 0.95, "InOut", "Linear", 0.01)
				end)
				button.Activated:Connect(function()
					local success, err = pcall(function()
						return Table.Callback()
					end)
					if (success) then
						--
					else

						Warn(err)
					end
				end)
				local setLib = {}
				function setLib:Destroy()
					buttonFrame:Destroy()
				end
				return setLib
			end

			function buttonsLibrary:AddLabel(Text)
				local buttonFrame = lib.Create("Frame", tabScrollFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,0.1, 0),
					--AutomaticSize = "Y",
				})
				local buttonFrame_corner = lib.Create("UICorner", buttonFrame, {
					CornerRadius = UDim.new(0, 5)
				})
				local button = lib.Create("TextLabel", buttonFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,1, 0),
					Font = "GothamMedium",
					Text = Text,
					TextSize = 14,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextXAlignment = "Center",
				})
				local setLib = {}
				function setLib:Set(value)
					button.Text = value
				end
				return setLib
			end

			function buttonsLibrary:AddParagraph(Text, Text2)
				local paraheader = lib.Create("Frame", tabScrollFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,0.1, 0),
					--AutomaticSize = "Y",
				})
				local buttonFrame_corner = lib.Create("UICorner", paraheader, {
					CornerRadius = UDim.new(0, 5)
				})
				local headerbutton = lib.Create("TextLabel", paraheader, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,1, 0),
					Font = "GothamMedium",
					Text = Text,
					TextSize = 14,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextXAlignment = "Left",
					AutomaticSize = "Y",
				})
				local paratext = lib.Create("Frame", tabScrollFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,0.1, 0),
					AutomaticSize = "Y",
				})
				local buttonFrame_corner = lib.Create("UICorner", paratext, {
					CornerRadius = UDim.new(0, 5)
				})
				local button = lib.Create("TextLabel", paratext, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,1, 0),
					Font = "Gotham",
					Text = Text2,
					TextSize = 14,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextXAlignment = "Left",
					AutomaticSize = "Y",
					TextWrapped = true,
				})
				local button_padding = lib.Create("UIPadding", button, {
					PaddingTop = UDim.new(0, 5),
					PaddingLeft = UDim.new(0, 5),
					PaddingRight = UDim.new(0, 5),
					PaddingBottom = UDim.new(0, 5),
				})

				local setLib = {}
				function setLib:Set(value)
					button.Text = value
				end
				return setLib
			end

			function buttonsLibrary:AddTextBox(Table)
				local buttonFrame = lib.Create("Frame", tabScrollFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,0.1, 0),
					--AutomaticSize = "Y",
				})
				local Button_highlight = lib.Create("Frame", buttonFrame, {
					ZIndex = 2,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,1, 0),
				})
				local Buttonhighlight_corner = lib.Create("UICorner", Button_highlight, {
					CornerRadius = UDim.new(0, 5)
				})
				local buttonFrame_corner = lib.Create("UICorner", buttonFrame, {
					CornerRadius = UDim.new(0, 5)
				})
				local button = lib.Create("TextButton", buttonFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0.025, 0,0, 0), 
					Size = UDim2.new(0.975, 0,1, 0),
					Font = "GothamMedium",
					Text = Table.Text,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextXAlignment = "Left",
				})
				local box = lib.Create("TextBox", buttonFrame, {
					AnchorPoint = Vector2.new(1, 0.5),
					AutomaticSize = "X",
					BackgroundColor3 = Color3.fromRGB(54, 54, 54), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(1, 0,0.5, 0), 
					Size = UDim2.new(0.15, 0,1, 0),
					ClearTextOnFocus = false,
					Font = "GothamMedium",
					Text = Table.Default or "Default",
					PlaceholderText = "Enter value",
					TextSize = 16,
					TextColor3 = Color3.fromRGB(155, 155, 155),
					PlaceholderColor3 = Color3.fromRGB(155, 155, 155),
				})
				local box_corner = lib.Create("UICorner", box, {
					CornerRadius = UDim.new(0, 5)
				})
				local box_padding = lib.Create("UIPadding", box, {
					PaddingTop = UDim.new(0, 5),
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8),
					PaddingBottom = UDim.new(0, 5),
				})
				button.MouseEnter:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 0.95, "InOut", "Linear", 0.1)
				end)
				button.MouseLeave:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 1, "InOut", "Linear", 0.1)
				end)
				box.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLost)
					if not enterPressed then return end
					local success, err = pcall(function()
						return Table.Callback(box.Text)
					end)
					if (success) then
						--
					else
						Warn(err)
					end
				end)
				local setLib = {}
				function setLib:Set(value)
					box.Text = value
				end
				function setLib:Destroy()
					buttonFrame:Destroy()
				end
				return setLib
			end

			function buttonsLibrary:AddToggle(Table)
				local buttonFrame = lib.Create("Frame", tabScrollFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,0.1, 0),
					--AutomaticSize = "Y",
				})
				local buttonFrame_corner = lib.Create("UICorner", buttonFrame, {
					CornerRadius = UDim.new(0, 5)
				})
				local label = lib.Create("TextLabel", buttonFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0.025, 0,0, 0), 
					Size = UDim2.new(0.975, 0,1, 0),
					Font = "GothamMedium",
					Text = Table.Text,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextXAlignment = "Left",
					ZIndex = 2,
				})
				local button = lib.Create("TextButton", buttonFrame, {
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,1, 0),
					Text = "",
				})
				local button_corner = lib.Create("UICorner", button, {
					CornerRadius = UDim.new(0, 5)
				})
				local button_gradient = lib.Create("UIGradient", button, {
					Rotation = 180;
					Transparency = NumberSequence.new(0, 1)
				})
				
				local Toggle = Table.Default or false

				if Table.Key then
					Keys[Table.Key] = {}
					Keys[Table.Key]["Value"] = Table.Default or false
					Toggle = Keys[Table.Key].Value
				end
				
				if (Table.Default) then
					button.BackgroundColor3 = Color3.fromRGB(85, 170, 127)
				else
					button.BackgroundColor3 = Color3.fromRGB(227, 67, 67)
				end

				local function onActivate()
					
					if (Toggle) then			
						Toggle = false
						if Table.Key then
							Keys[Table.Key].Value = Toggle
						end
						lib.Tween(button, "BackgroundColor3", Color3.fromRGB(227, 67, 67), "InOut", "Linear", 0.1)
					elseif not (Toggle) then
						Toggle = true
						if Table.Key then
							Keys[Table.Key].Value = Toggle
						end
						lib.Tween(button, "BackgroundColor3", Color3.fromRGB(85, 170, 127), "InOut", "Linear", 0.1)
					end
					local success, err = pcall(function()
						return Table.Callback(Toggle)
					end)
					if (success) then
						--
					else
						Warn(err)
					end
				end
				--onActivate()
				button.Activated:Connect(function()
					onActivate()
				end)
				local setLib = {}
				function setLib:Set(value)
					Toggle = not value
					onActivate()
				end
				function setLib:Destroy()
					buttonFrame:Destroy()
				end
				return setLib

			end

			function buttonsLibrary:AddSlider(Table)
				local buttonFrame = lib.Create("Frame", tabScrollFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,0.2, 0),
					--AutomaticSize = "Y",
				})
				local Button_highlight = lib.Create("Frame", buttonFrame, {
					ZIndex = 2,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,1, 0),
				})
				local Buttonhighlight_corner = lib.Create("UICorner", Button_highlight, {
					CornerRadius = UDim.new(0, 5)
				})
				local buttonFrame_corner = lib.Create("UICorner", buttonFrame, {
					CornerRadius = UDim.new(0, 5)
				})
				local button = lib.Create("TextButton", buttonFrame, {
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(50, 50, 50), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0.025, 0,0, 0), 
					Size = UDim2.new(0.975, 0,0.5, 0),
					Text = Table.Text,
					Font = "GothamMedium",
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextXAlignment = "Left",
				})
				local maxFrame = lib.Create("Frame", buttonFrame, {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
					BackgroundTransparency = 0.95, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0.025, 0,0.5, 0), 
					Size = UDim2.new(0.95, 0,0.35, 0),
				})
				local buttonFrame_corner = lib.Create("UICorner", maxFrame, {
					CornerRadius = UDim.new(0, 5)
				})
				local slider = lib.Create("Frame", maxFrame, {
					BackgroundColor3 = Table.Color or Color3.fromRGB(85, 170, 255), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(0.7, 0,1, 0),
				})
				local buttonFrame_corner = lib.Create("UICorner", slider, {
					CornerRadius = UDim.new(0, 5)
				})
				local label = lib.Create("TextLabel", maxFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,1, 0),
					Font = "GothamMedium",
					Text = Table.Default or Table.Min,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					ZIndex = 2,
				})
				
				button.MouseEnter:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 0.95, "InOut", "Linear", 0.1)
				end)
				button.MouseLeave:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 1, "InOut", "Linear", 0.1)
				end)
				
				local mouse = Players.LocalPlayer:GetMouse()
				local current = Table.Default or Table.Min
				local default = current/Table.Max
				
				if Table.Key then
					Keys[Table.Key] = {}
					Keys[Table.Key]["Value"] = current
					--Toggle = Keys[Table.Key].Value
				end
				
				slider.Size = UDim2.new(default, 0,1, 0)
				local dragging = false

				local function update(value)
					local int = math.floor(value * Table.Max)
					label.Text = tostring(int)
					if Table.Key then
						Keys[Table.Key].Value = int
					end
					return Table.Callback(int)
				end

				maxFrame.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						mainFrame.Draggable = false
						mainFrame.Active = false
						dragging = true
					end
				end)
				maxFrame.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						mainFrame.Draggable = true
						mainFrame.Active = true
						dragging = false
					end
				end)

				maxFrame.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						mainFrame.Draggable = false
						mainFrame.Active = false
						--print((mouse.X - maxFrame.AbsolutePosition.X) / maxFrame.AbsoluteSize.X)
						local pos = UDim2.new(math.clamp((mouse.X - maxFrame.AbsolutePosition.X) / maxFrame.AbsoluteSize.X, 0, 1), 0, 1, 0)
						slider:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true, update(pos.X.Scale))
					end
				end)
				UserInputService.InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						local pos = UDim2.new(math.clamp((mouse.X - maxFrame.AbsolutePosition.X) / maxFrame.AbsoluteSize.X, 0, 1), 0, 1, 0)
						slider:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true, update(pos.X.Scale))
					end
				end)

				local setLib = {}
				function setLib:Set(value)
					local change = tonumber(value)/Table.Max
					slider.Size = UDim2.new(change, 0,1, 0)
					update(change)
				end
				function setLib:Destroy()
					buttonFrame:Destroy()
				end
				return setLib

			end

			function buttonsLibrary:AddDropDown(Table)
				local buttonFrame = lib.Create("Frame", tabScrollFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,0.1, 0),
					--AutomaticSize = "Y",
					ZIndex = 2
				})
				local buttonFrame_corner = lib.Create("UICorner", buttonFrame, {
					CornerRadius = UDim.new(0, 5)
				})
				local button = lib.Create("TextButton", buttonFrame, {
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(50, 50, 50), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0.025, 0,0, 0), 
					Size = UDim2.new(0.975, 0,1, 0),
					Text = Table.Text,
					Font = "GothamMedium",
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextXAlignment = "Left",
					ZIndex = 2
				})
				local imageFrame = lib.Create("Frame", button, {
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0.927, 0,0, 0), 
					Size = UDim2.new(0.072, 0,1, 0),
					ZIndex = 2
				})
				local imagebutton = lib.Create("ImageButton", imageFrame, {
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0.1, 0,0.1, 0), 
					Size = UDim2.new(0.8, 0,0.8, 0),
					ScaleType = Enum.ScaleType.Fit;
					Image = "rbxassetid://11113708488",
					ZIndex = 2
				})
				local optionsFrame = lib.Create("Frame", buttonFrame, {
					BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,1, 0), 
					Size = UDim2.new(1, 0,1, 0),
					ZIndex = 5,
					--AutomaticSize = "Y",
					Visible = false,
				})
				local uilistlayout_optionsFrame = lib.Create("UIListLayout", optionsFrame, {
					SortOrder = "LayoutOrder",
					HorizontalAlignment = "Right",
				})
				local function createOpt(t)
					local buttonFrame = lib.Create("Frame", optionsFrame, {
						BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
						BackgroundTransparency = 0, 
						BorderSizePixel = 0, 
						Position = UDim2.new(0, 0,0, 0), 
						Size = UDim2.new(1, 0,1, 0),
						ZIndex = 5
					})
					local button = lib.Create("TextButton", buttonFrame, {
						AutoButtonColor = false,
						BackgroundColor3 = Color3.fromRGB(50, 50, 50), 
						BackgroundTransparency = 1, 
						BorderSizePixel = 0, 
						Position = UDim2.new(0.025, 0,0, 0), 
						Size = UDim2.new(0.975, 0,1, 0),
						Text = t,
						Font = "GothamMedium",
						TextSize = 14,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextXAlignment = "Left",
						ZIndex = 5
					})
					
					if Table.Key then
						--if Keys[Table.Key] then table.clear(Keys[Table.Key]) return button end
						Keys[Table.Key] = {}
						Keys[Table.Key]["Options"] = Table.Options
					end
					
					return button
				end

				local show = false

				local function onActivate(v)
					optionsFrame.Visible = false
					show = false
					imagebutton.Image = "rbxassetid://11113708488"
					local success, err = pcall(function()
						return Table.Callback(v)
					end)
					if (success) then
						--
					else
						Warn(err)
					end
				end

				if Table.Default and not Table.Options then
					local newOp = createOpt(Table.Default)
					newOp.Activated:Connect(function()
						--optionsFrame.Visible = false
						--show = false
						onActivate(Table.Default)
					end)
				else
					for _, v in pairs(Table.Options) do
						local newOp = createOpt(v)
						newOp.Activated:Connect(function()
							--optionsFrame.Visible = false
							--show = false
							onActivate(v)
						end)
					end
				end

				button.MouseButton1Down:Connect(function()
					if (show) then
						imagebutton.Image = "rbxassetid://11113708488"
						optionsFrame.Visible = false
						show = false
					elseif not (show) then
						imagebutton.Image = "rbxassetid://11113709353"
						optionsFrame.Visible = true
						show = true
					end
				end)

				local setLib = {}
				function setLib:Set(v)
					onActivate(v)
				end
				function setLib:Destroy()
					buttonFrame:Destroy()
				end
				function setLib:Refresh(upTable, boolean)
					if boolean then
						table.clear(Table.Options)
						Table.Options = upTable
						for _, v in pairs(optionsFrame:GetChildren()) do
							if v:IsA("Frame") then
								v:Destroy()
							end
						end
						for _, v in pairs(Table.Options) do
							local newOp = createOpt(v)
							newOp.Activated:Connect(function()
								onActivate(v)
							end)
						end
					else
						for _, v in pairs(upTable) do
							table.insert(Table.Options, v)
						end

						for _, v in pairs(optionsFrame:GetChildren()) do
							if v:IsA("Frame") then
								v:Destroy()
							end
						end
						for _, v in pairs(Table.Options) do
							local newOp = createOpt(v)
							newOp.Activated:Connect(function()
								onActivate(v)
							end)
						end
					end

				end

				return setLib

			end

			function buttonsLibrary:AddBind(Table)
				local buttonFrame = lib.Create("Frame", tabScrollFrame, {
					BackgroundColor3 = Color3.fromRGB(44, 44, 44), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0, 0,0, 0), 
					Size = UDim2.new(1, 0,0.1, 0),
					--AutomaticSize = "Y",
				})
				local Button_highlight = lib.Create("Frame", buttonFrame, {
					ZIndex = 2,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,1, 0),
				})
				local Buttonhighlight_corner = lib.Create("UICorner", Button_highlight, {
					CornerRadius = UDim.new(0, 5)
				})
				local buttonFrame_corner = lib.Create("UICorner", buttonFrame, {
					CornerRadius = UDim.new(0, 5)
				})
				local labelbutton = lib.Create("TextButton", buttonFrame, {
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(50, 50, 50), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Position = UDim2.new(0.025, 0,0, 0), 
					Size = UDim2.new(0.975, 0,1, 0),
					Text = Table.Text,
					Font = "GothamMedium",
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextXAlignment = "Left",
				})
				local InputButton = lib.Create("TextButton", buttonFrame, {
					AnchorPoint = Vector2.new(1, 0.5),
					AutomaticSize = "X",
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(54, 54, 54), 
					BackgroundTransparency = 0, 
					BorderSizePixel = 0, 
					Position = UDim2.new(1, 0,0.5, 0), 
					Size = UDim2.new(0.072, 0,1, 0),
					Text = Table.Default.Name,
					Font = "GothamMedium",
					TextSize = 14,
					TextColor3 = Color3.fromRGB(255, 255, 255),
				})
				local InputButton_corner = lib.Create("UICorner", InputButton, {
					CornerRadius = UDim.new(0, 5)
				})
				local InputButton_padding = lib.Create("UIPadding", InputButton, {
					PaddingTop = UDim.new(0, 5),
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8),
					PaddingBottom = UDim.new(0, 5),
				})
				
				labelbutton.MouseEnter:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 0.95, "InOut", "Linear", 0.1)
				end)
				labelbutton.MouseLeave:Connect(function()
					lib.Tween(Button_highlight, "BackgroundTransparency", 1, "InOut", "Linear", 0.1)
				end)
				
				local key = Table.Default
				local focus = false
				
				if Table.Key then
					Keys[Table.Key] = {}
					Keys[Table.Key]["Value"] = Table.Default
				end
				
				InputButton.Activated:Connect(function()
					focus = true
					InputButton.Text = "..."
				end)
				UserInputService.InputEnded:Connect(function(input, gpe)
					if not focus and input.KeyCode == key then
						local success, err = pcall(function()
							return Table.Callback(key)
						end)
						if (success) then
							--
						else
							Warn(err)
						end
					end
					if focus and input.UserInputType == Enum.UserInputType.Keyboard then
						key = input.KeyCode
						focus = false
						InputButton.Text = key.Name
						if Table.Key then
							Keys[Table.Key].Value = key
						end
					end

				end)

				local setLib = {}
				function setLib:Set(value)
					key = value
					if Table.Key then
						Keys[Table.Key].Value = key
					end
					InputButton.Text = key.Name
				end
				function setLib:Destroy()
					buttonFrame:Destroy()
				end
				return setLib

			end

			return buttonsLibrary

		end

		return sectionLibrary

	end
	mainFrame.Visible = true
	Sys('<font color="rgb(85, 170, 127)">Loaded!</font>', "["..cache.HubName.."] "  .. cache.ScriptName .. " by " .. cache.Creator .. ", press '" ..  cache.Hotkey .. "' to toggle UI.")
	return tabLibrary

end

function UILibrary:Notification(Table)
	spawn(function()
		for _, v in pairs(instanceLog) do
			if v:IsA("Frame") then

				v:Destroy()
			end
		end
		local function gen()
			local frame = lib.Create("Frame", screenGui, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(34,34,34),
				BorderSizePixel = 0,
				Position = UDim2.new(0.5,0,1.05,0),
				Size = UDim2.new(0.45,0,0.05,0),
				ClipsDescendants = true,
				--Visible = false,
			})
			local frame_corner = lib.Create("UICorner", frame, {
				CornerRadius = UDim.new(0, 5)
			})
			local frame_stroke = lib.Create("UIStroke", frame, {
				ApplyStrokeMode = "Border",
				Color = Color3.fromRGB(0,0,0),
				Thickness = 3,
				Transparency = 0.75,
			})
			local frame_uilistlayout = lib.Create("UIListLayout", frame, {
				SortOrder = "LayoutOrder",
				FillDirection = "Horizontal"
			})
			local title = lib.Create("TextButton", frame, {
				BackgroundColor3 = Color3.fromRGB(29, 29, 29), 
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 1,
				Position = UDim2.new(0, 0,0, 0), 
				Size = UDim2.new(0.05, 0,1, 0),
				Font = "GothamMedium",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				RichText = true,
				Text = Table.Title or '<font color="rgb(227, 67, 67)">Error</font>',
				TextSize = 16,
				AutomaticSize = "X"
			})
			local title_padding = lib.Create("UIPadding", title, {
				PaddingLeft = UDim.new(0, 10),
			}) 
			local content = lib.Create("TextButton", frame, {
				AutomaticSize = "X",
				BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 1, 
				Position = UDim2.new(0, 0,0, 0), 
				Size = UDim2.new(0.05, 0,1, 0),
				--ClearTextOnFocus = false,
				Font = "Gotham",
				Text = Table.Content,
				--PlaceholderText = "monke",
				TextSize = 14,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				--TextEditable = false,
				--PlaceholderColor3 = Color3.fromRGB(255, 255, 255),
				RichText = true,
			})
			local content_padding = lib.Create("UIPadding", content, {
				PaddingLeft = UDim.new(0, 10),
			})
			return frame, frame_stroke, title, content
		end

		local delay_ = Table.Time or 5

		local frame, frame_stroke, title, content = gen()

		content.Activated:Connect(function()
			if typeof(setclipboard) == "function" then
				setclipboard(content.Text)
				UILibrary:Notification({Title = "Console", Content = "content copied to clipboard!"})
			else
				for _, v in pairs(textlog) do
					print(v.Title or "Error", v.Content)
					print(" ")
				end
				UILibrary:Notification({Title = "Console", Content = "[F9] Check Devconsole for script logs"})
			end
		end)

		table.insert(instanceLog, frame)
		table.insert(textlog, Table)
		lib.Tween(frame, "Position", UDim2.new(0.5,0,0.85,0), "InOut", "Back", 0.25)
		wait(delay_)
		lib.Tween(frame, "Transparency", 1, "InOut", "Linear", delay_)
		lib.Tween(frame_stroke, "Transparency", 1, "InOut", "Linear", delay_)
		lib.Tween(title, "TextTransparency", 1, "InOut", "Linear", delay_)
		lib.Tween(content, "TextTransparency", 1, "InOut", "Linear", delay_)
		wait(delay_)
		frame:Destroy()
	end)
end

function Warn(err)
	UILibrary:Notification({
		Content = err,
	})
end
function Sys(Title, Content, Time)
	UILibrary:Notification({
		Title = Title,
		Content = Content,
		Time = Time or 5
	})
end

function UILibrary:Get(str)
	if not Keys[str] then Warn("Key : " .. str .. " not found.") return end
	local toReturn
	if Keys[str].Options then
		toReturn = Keys[str].Options
	else
		toReturn = Keys[str].Value
	end
	return toReturn
end
function UILibrary:Destroy()
	screenGui:Destroy()
end

return UILibrary

