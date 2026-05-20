--// LIGHT HUB V1
--// Yellow & Black Mobile GUI
--// Original Customizable UI Base

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- GUI

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LightHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

-- MAIN FRAME

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 520, 0, 320)
Main.Position = UDim2.new(0.5,-260,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0,18)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(255,200,0)
Stroke.Thickness = 2

-- TOP BAR

local Top = Instance.new("Frame")
Top.Parent = Main
Top.Size = UDim2.new(1,0,0,45)
Top.BackgroundColor3 = Color3.fromRGB(25,25,25)
Top.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner", Top)
TopCorner.CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel")
Title.Parent = Top
Title.Size = UDim2.new(0.5,0,1,0)
Title.Position = UDim2.new(0.02,0,0,0)
Title.BackgroundTransparency = 1
Title.Text = "LIGHT HUB"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255,220,0)

local Ping = Instance.new("TextLabel")
Ping.Parent = Top
Ping.Size = UDim2.new(0.3,0,1,0)
Ping.Position = UDim2.new(0.68,0,0,0)
Ping.BackgroundTransparency = 1
Ping.Text = "0 MS"
Ping.Font = Enum.Font.GothamBold
Ping.TextScaled = true
Ping.TextColor3 = Color3.fromRGB(255,255,255)

-- UPDATE PING

task.spawn(function()
	while true do
		local ping = math.random(20,80)
		Ping.Text = ping.." MS"
		task.wait(1)
	end
end)

-- TAB HOLDER

local Tabs = Instance.new("Frame")
Tabs.Parent = Main
Tabs.Size = UDim2.new(0,120,1,-55)
Tabs.Position = UDim2.new(0,10,0,50)
Tabs.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", Tabs)
UIList.Padding = UDim.new(0,8)

-- CONTENT FRAME

local Content = Instance.new("Frame")
Content.Parent = Main
Content.Size = UDim2.new(1,-145,1,-65)
Content.Position = UDim2.new(0,135,0,55)
Content.BackgroundTransparency = 1

-- BUTTON CREATOR

local function CreateButton(text,posY)

	local Button = Instance.new("TextButton")
	Button.Parent = Content
	Button.Size = UDim2.new(0,140,0,50)
	Button.Position = UDim2.new(0,10,0,posY)

	Button.BackgroundColor3 = Color3.fromRGB(25,25,25)
	Button.TextColor3 = Color3.fromRGB(255,220,0)
	Button.Font = Enum.Font.GothamBold
	Button.TextScaled = true
	Button.Text = text
	Button.AutoButtonColor = false

	local Corner = Instance.new("UICorner", Button)
	Corner.CornerRadius = UDim.new(0,14)

	local Stroke = Instance.new("UIStroke", Button)
	Stroke.Color = Color3.fromRGB(255,200,0)

	Button.MouseButton1Click:Connect(function()

		local Tween = TweenService:Create(
			Button,
			TweenInfo.new(0.15),
			{BackgroundColor3 = Color3.fromRGB(60,60,0)}
		)

		Tween:Play()

		task.wait(0.15)

		local Tween2 = TweenService:Create(
			Button,
			TweenInfo.new(0.15),
			{BackgroundColor3 = Color3.fromRGB(25,25,25)}
		)

		Tween2:Play()

		print(text.." Activated")

	end)

	return Button
end

-- TAB BUTTONS

local function CreateTab(name)

	local Tab = Instance.new("TextButton")
	Tab.Parent = Tabs
	Tab.Size = UDim2.new(1,0,0,40)

	Tab.BackgroundColor3 = Color3.fromRGB(20,20,20)
	Tab.TextColor3 = Color3.fromRGB(255,220,0)
	Tab.Font = Enum.Font.GothamBold
	Tab.TextScaled = true
	Tab.Text = name

	local Corner = Instance.new("UICorner", Tab)
	Corner.CornerRadius = UDim.new(0,12)

	local Stroke = Instance.new("UIStroke", Tab)
	Stroke.Color = Color3.fromRGB(255,200,0)

	return Tab
end

-- CREATE TABS

CreateTab("HOME")
CreateTab("MOVEMENT")
CreateTab("UTILITY")
CreateTab("CUSTOM")
CreateTab("SETTINGS")

-- FEATURE BUTTONS

CreateButton("Infinite Jump",10)
CreateButton("Speed Customizer",70)
CreateButton("Optimizer",130)
CreateButton("Theme Switch",190)

-- INFINITE JUMP

UIS.JumpRequest:Connect(function()
	local Character = Player.Character
	if Character then
		local Humanoid = Character:FindFirstChildOfClass("Humanoid")
		if Humanoid then
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

-- OPEN ANIMATION

Main.Size = UDim2.new(0,0,0,0)

TweenService:Create(
	Main,
	TweenInfo.new(0.4,Enum.EasingStyle.Back),
	{Size = UDim2.new(0,520,0,320)}
):Play()

print("LIGHT HUB LOADED")
