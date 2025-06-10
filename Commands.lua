
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local WhitelistSystems = loadstring(game:HttpGet("https://raw.githubusercontent.com/DanXvoIsMe/Imperium/refs/heads/main/Whitelist.lua"))

function GetArgs(fullmsg)
    return string.split(fullmsg, " ")
end

-- Find player by partial name (case insensitive)
function FindPlayerByShortName(partialName)
    partialName = partialName:lower()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #partialName) == partialName then
            return plr
        end
    end
    return nil
end

local function sitPlayer()
    local character = Player.Character or Player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Sit = true
end

function HandleMessage(msg, rec)
    local Arguments = GetArgs(msg)
    local command = Arguments[1]
    local partialTargetName = Arguments[2]

    if not partialTargetName then return end

    local TargetPlayer = FindPlayerByShortName(partialTargetName)
    if not TargetPlayer then return end

    if command == "!bring" then
        if TargetPlayer.Character and Player.Character then
            TargetPlayer.Character:PivotTo(Player.Character:GetPivot())
        end
    elseif command == "!kill" then
        if TargetPlayer.Character then
            local humanoid = TargetPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end
    elseif command == "!kick" then
        TargetPlayer:Kick()
    elseif command == "!rocket" then
        if TargetPlayer.Character and Player.Character then
            local targetHRP = TargetPlayer.Character:FindFirstChild("HumanoidRootPart")
            local playerHRP = Player.Character:FindFirstChild("HumanoidRootPart")

            if targetHRP and playerHRP then
                local targetPos = targetHRP.Position
                local destinationY = targetPos.Y + 500
                local speed = 100

                while playerHRP.Position.Y < destinationY do
                    local currentPos = playerHRP.Position
                    local newY = math.min(currentPos.Y + speed * 0.03, destinationY)
                    playerHRP.CFrame = CFrame.new(currentPos.X, newY, currentPos.Z)
                    wait(0.03)
                end

                local targetHumanoid = TargetPlayer.Character:FindFirstChildOfClass("Humanoid")
                if targetHumanoid then
                    targetHumanoid.Health = 0
                end
            end
        end
    elseif command == "!sit" then
        sitPlayer()
    end
end

for _, plr in pairs(Players:GetPlayers()) do
    if WhitelistSystems.IsWhitelisted(plr.Name) then
        plr.Chatted:Connect(HandleMessage)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if WhitelistSystems.IsWhitelisted(plr.Name) then
        plr.Chatted:Connect(HandleMessage)
    end
end)
