local RS = game:GetService("ReplicatedStorage")
local LP = game.Players.LocalPlayer
local RSP = RS.Players[LP.Name]

-- item inside shirt inventory not main inventory:
local ItemX = RSP.Inventory.WastelandShirt.Inventory["WastelandBackpack"]

local tradeList = {}
for i = 1, 6 do
    table.insert(tradeList, ItemX)
end

RS.Remotes.Trade:InvokeServer({
    Action = "Update",
    TradeList = tradeList
})

RS.Remotes.Trade:InvokeServer({
    Action = "Confirm"
})
