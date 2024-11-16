-- GUI Library Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AutoEggHatchGUI"

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.BorderSizePixel = 0
MainFrame.Draggable = true
MainFrame.Active = true

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
Title.Text = "Auto Egg Hatch GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 18
Title.BorderSizePixel = 0

-- Minimize and Terminate Buttons
local minimizeButton = Instance.new("TextButton")
minimizeButton.Parent = MainFrame
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -40, 0, 0) -- Right side, offset by width of buttons
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Text = "-"
minimizeButton.Font = Enum.Font.SourceSans
minimizeButton.TextSize = 18

local terminateButton = Instance.new("TextButton")
terminateButton.Parent = MainFrame
terminateButton.Size = UDim2.new(0, 30, 0, 30)
terminateButton.Position = UDim2.new(1, -70, 0, 0) -- Right side, offset by width of buttons
terminateButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
terminateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
terminateButton.Text = "X"
terminateButton.Font = Enum.Font.SourceSans
terminateButton.TextSize = 18

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)

local toggleYOffset = 0 -- This will keep track of vertical positioning

-- Helper function to create toggles
local function addEggToggle(parent, eggName, eggId, varName)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, -20, 0, 30)
    ToggleFrame.Position = UDim2.new(0, 10, 0, toggleYOffset) -- Position based on Y offset
    ToggleFrame.BackgroundTransparency = 1
    ToggleFrame.Parent = parent

    local ToggleText = Instance.new("TextLabel")
    ToggleText.Size = UDim2.new(0.7, 0, 1, 0)
    ToggleText.Position = UDim2.new(0, 0, 0, 0)
    ToggleText.BackgroundTransparency = 1
    ToggleText.Text = "Auto Hatch " .. eggName .. " Egg"
    ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleText.Font = Enum.Font.SourceSans
    ToggleText.TextSize = 16
    ToggleText.Parent = ToggleFrame

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0.3, 0, 1, 0)
    ToggleButton.Position = UDim2.new(0.7, 0, 0, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Text = "Off"
    ToggleButton.Font = Enum.Font.SourceSans
    ToggleButton.TextSize = 16
    ToggleButton.Parent = ToggleFrame

    _G[varName] = false
    ToggleButton.MouseButton1Click:Connect(function()
        _G[varName] = not _G[varName]
        ToggleButton.Text = _G[varName] and "On" or "Off"
        while _G[varName] and task.wait() do
            local args = { [1] = tostring(eggId) }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerPressedKeyOnEgg"):FireServer(unpack(args))
        end
    end)

    toggleYOffset = toggleYOffset + 35 -- Increase Y offset for next toggle
end

-- Adding egg toggles to ScrollingFrame
addEggToggle(ScrollingFrame, "Gem", "VisitEgg", "autoBreakGemEgg")
addEggToggle(ScrollingFrame, "Forest", 1, "autoBreakEgg1")
addEggToggle(ScrollingFrame, "Desert", 2, "autoBreakEgg2")
addEggToggle(ScrollingFrame, "Cave", 3, "autoBreakEgg3")
addEggToggle(ScrollingFrame, "Ocean", 4, "autoBreakEgg4")
addEggToggle(ScrollingFrame, "Candy", 5, "autoBreakEgg5")
addEggToggle(ScrollingFrame, "Snow", 6, "autoBreakEgg6")
addEggToggle(ScrollingFrame, "Toy", 7, "autoBreakEgg7")
addEggToggle(ScrollingFrame, "Farm", 8, "autoBreakEgg8")
addEggToggle(ScrollingFrame, "Samurai", 9, "autoBreakEgg9")
addEggToggle(ScrollingFrame, "Space", 10, "autoBreakEgg10")
addEggToggle(ScrollingFrame, "Magic Forest", 11, "autoBreakEgg11")
addEggToggle(ScrollingFrame, "Heaven", 12, "autoBreakHeavenEgg")
addEggToggle(ScrollingFrame, "Underworld", 13, "autoBreakUnderworldEgg")
addEggToggle(ScrollingFrame, "Laboratory", 14, "autoBreakLaboratoryEgg")
addEggToggle(ScrollingFrame, "Pirate", 15, "autoBreakPirateEgg")
addEggToggle(ScrollingFrame, "Savanna", 16, "autoBreakSavannaEgg")
addEggToggle(ScrollingFrame, "Roman", 17, "autoBreakRomanEgg")
addEggToggle(ScrollingFrame, "Ice World", 18, "autoBreakIceEgg")
addEggToggle(ScrollingFrame, "Robotic World", 19, "autoBreakRoboticEgg")
addEggToggle(ScrollingFrame, "Lava World", 20, "autoBreakLavaEgg")
addEggToggle(ScrollingFrame, "Fairy Forest", 21, "autoBreakFairyEgg")
addEggToggle(ScrollingFrame, "Haunted World", 22, "autoBreakHauntedEgg")
addEggToggle(ScrollingFrame, "Egyptian Land", 23, "autoBreakEgyptianEgg")
addEggToggle(ScrollingFrame, "Mechanical World", 24, "autoBreakMechanicalEgg")
addEggToggle(ScrollingFrame, "Nebula World", 25, "autoBreakNebulaEgg")
addEggToggle(ScrollingFrame, "Cloud World", 26, "autoBreakCloudEgg")
addEggToggle(ScrollingFrame, "Bakery World", 27, "autoBreakBakeryEgg")

-- Adjust the CanvasSize to fit all toggles
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, toggleYOffset)

-- Minimize functionality
local isMinimized = false
minimizeButton.MouseButton1Click:Connect(function()
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 300, 0, 400) -- Restore original size
        ScrollingFrame.Visible = true
        minimizeButton.Text = "-"
    else
        MainFrame.Size = UDim2.new(0, 300, 0, 30) -- Minimize size to show only title and buttons
        ScrollingFrame.Visible = false
        minimizeButton.Text = "+"
    end
    isMinimized = not isMinimized
end)

-- Terminate functionality
terminateButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
