local Players = game:GetService("Players")
local InitialFunctions = {}

function InitialFunctions.ToR6(char: Model)
    local plr: Player = Players:GetPlayerFromCharacter(char)
    local hum: Humanoid = char:FindFirstChild("Humanoid")
    if not (plr and hum) then return end

    local humDesc = Players:GetHumanoidDescriptionFromUserIdAsync(plr.UserId)
    hum:ApplyDescriptionAsync(humDesc)
end

return InitialFunctions