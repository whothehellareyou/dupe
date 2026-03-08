-- Trade GUI Script (LocalScript)
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

-- Settings
local itemName = "WastelandBackpack"
local insertAmount = 6

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TradeGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 400)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 180, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.5
MainStroke.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(10, 14, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

-- Fix bottom corners of title bar
local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0.5, 0)
TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleFix.BackgroundColor3 = Color3.fromRGB(10, 14, 30)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 14, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⚡  TRADE EXECUTOR"
TitleLabel.TextColor3 = Color3.fromRGB(0, 210, 255)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -36, 0.5, -14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Content Frame
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -24, 1, -52)
Content.Position = UDim2.new(0, 12, 0, 48)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 10)
ContentLayout.Parent = Content

-- Helper: create a label
local function makeLabel(text, parent, order)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 16)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(80, 160, 200)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = order
    lbl.Parent = parent
    return lbl
end

-- Helper: create a styled text box row
local function makeInputRow(labelText, defaultVal, layoutOrder, parent)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 58)
    row.BackgroundColor3 = Color3.fromRGB(13, 17, 28)
    row.BorderSizePixel = 0
    row.LayoutOrder = layoutOrder
    row.Parent = parent

    local rowCorner = Instance.new("UICorner")
    rowCorner.CornerRadius = UDim.new(0, 8)
    rowCorner.Parent = row

    local rowStroke = Instance.new("UIStroke")
    rowStroke.Color = Color3.fromRGB(0, 180, 255)
    rowStroke.Thickness = 1
    rowStroke.Transparency = 0.75
    rowStroke.Parent = row

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -12, 0, 18)
    lbl.Position = UDim2.new(0, 10, 0, 6)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = Color3.fromRGB(80, 160, 200)
    lbl.TextSize = 10
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, -20, 0, 26)
    box.Position = UDim2.new(0, 10, 0, 26)
    box.BackgroundColor3 = Color3.fromRGB(8, 10, 18)
    box.BorderSizePixel = 0
    box.Text = defaultVal
    box.TextColor3 = Color3.fromRGB(180, 230, 255)
    box.TextSize = 13
    box.Font = Enum.Font.Code
    box.ClearTextOnFocus = false
    box.Parent = row

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 5)
    boxCorner.Parent = box

    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = Color3.fromRGB(0, 180, 255)
    boxStroke.Thickness = 1
    boxStroke.Transparency = 0.85
    boxStroke.Parent = box

    return box
end

-- Item Name Input
local ItemBox = makeInputRow("ITEM NAME", itemName, 1, Content)

-- Amount Input
local AmountBox = makeInputRow("TABLE INSERT AMOUNT", tostring(insertAmount), 2, Content)

-- Divider
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, 0, 0, 1)
Divider.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
Divider.BackgroundTransparency = 0.75
Divider.BorderSizePixel = 0
Divider.LayoutOrder = 3
Divider.Parent = Content

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Ready."
StatusLabel.TextColor3 = Color3.fromRGB(100, 180, 120)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.LayoutOrder = 4
StatusLabel.Parent = Content

-- Run Button
local RunBtn = Instance.new("TextButton")
RunBtn.Name = "RunBtn"
RunBtn.Size = UDim2.new(1, 0, 0, 48)
RunBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 200)
RunBtn.Text = "▶  RUN SCRIPT"
RunBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RunBtn.TextSize = 15
RunBtn.Font = Enum.Font.GothamBold
RunBtn.BorderSizePixel = 0
RunBtn.LayoutOrder = 5
RunBtn.Parent = Content

local RunCorner = Instance.new("UICorner")
RunCorner.CornerRadius = UDim.new(0, 8)
RunCorner.Parent = RunBtn

local RunStroke = Instance.new("UIStroke")
RunStroke.Color = Color3.fromRGB(0, 210, 255)
RunStroke.Thickness = 1.5
RunStroke.Transparency = 0.3
RunStroke.Parent = RunBtn

-- Hover effects
RunBtn.MouseEnter:Connect(function()
    RunBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 230)
end)
RunBtn.MouseLeave:Connect(function()
    RunBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 200)
end)

CloseBtn.MouseEnter:Connect(function()
    CloseBtn.BackgroundColor3 = Color3.fromRGB(240, 60, 70)
end)
CloseBtn.MouseLeave:Connect(function()
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 60)
end)

-- Close button logic
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Run button logic
RunBtn.MouseButton1Click:Connect(function()
    local currentItem = ItemBox.Text
    local currentAmount = tonumber(AmountBox.Text)

    if not currentItem or currentItem == "" then
        StatusLabel.Text = "⚠ Enter a valid item name!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 160, 60)
        return
    end

    if not currentAmount or currentAmount < 1 then
        StatusLabel.Text = "⚠ Enter a valid amount!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 160, 60)
        return
    end

    StatusLabel.Text = "⏳ Running..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
    RunBtn.Active = false
    RunBtn.BackgroundColor3 = Color3.fromRGB(30, 80, 110)

    local success, err = pcall(function()
        local RSP = RS.Players[LP.Name]
        local ItemX = RSP.Inventory.WastelandShirt.Inventory[currentItem]
        local tradeList = {}

        for i = 1, currentAmount do
            table.insert(tradeList, ItemX)
        end

        RS.Remotes.Trade:InvokeServer({
            Action = "Update",
            TradeList = tradeList
        })

        RS.Remotes.Trade:InvokeServer({
            Action = "Confirm"
        })
    end)

    if success then
        StatusLabel.Text = "✔ Script executed successfully!"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 130)
    else
        StatusLabel.Text = "✘ Error: " .. tostring(err)
        StatusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
    end

    RunBtn.Active = true
    RunBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 200)
end)
