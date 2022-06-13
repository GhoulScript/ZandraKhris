-- Alt that's all <3

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local CashDropped = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(127, 127, 127)
Frame.Position = UDim2.new(0.282216489, 0, 0.508833885, 0)
Frame.Size = UDim2.new(0, 299, 0, 83)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
TextLabel.Position = UDim2.new(0, 0, -0.385542154, 0)
TextLabel.Size = UDim2.new(0, 299, 0, 32)
TextLabel.Font = Enum.Font.Jura
TextLabel.Text = "ZANDRA MADE THIS SCRIPT"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

CashDropped.Name = "CashDropped"
CashDropped.Parent = Frame
CashDropped.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CashDropped.BackgroundTransparency = 1.000
CashDropped.Position = UDim2.new(0, 0, 0.3253012, 0)
CashDropped.Size = UDim2.new(0, 299, 0, 56)
CashDropped.Font = Enum.Font.GothamBlack
CashDropped.Text = "Dropped"
CashDropped.TextColor3 = Color3.fromRGB(255, 255, 255)
CashDropped.TextScaled = true
CashDropped.TextSize = 14.000
CashDropped.TextWrapped = true

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.163879603, 0, 0, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 27)
TextLabel_2.Font = Enum.Font.Merriweather
TextLabel_2.Text = "Dropped Cash"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

-- Scripts:

local function JEHXK_fake_script() -- CashDropped.LocalScript 
	local script = Instance.new('LocalScript', CashDropped)

	while wait() do
		pcall(function()
			local amount = 0
			for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
				if v.Name == "MoneyDrop" then
					local cash = string.split(v.BillboardGui.TextLabel.Text,"$")[2]
					if string.match(cash,',') then
						amount = amount + cash:gsub("%,","")
					else
						amount = amount + cash
					end
				end
			end
			local function checking(amount)
				amount = tostring(amount)
				return amount:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
			end
			script.Parent.Text = "$"..checking(amount).." "
		end)
	end
end
coroutine.wrap(JEHXK_fake_script)()
local function EBEAK_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.2
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(EBEAK_fake_script)()
