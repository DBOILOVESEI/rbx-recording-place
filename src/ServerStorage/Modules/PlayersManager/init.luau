local Players = game:GetService("Players")
-- / MODULES
local MAIN = script
local Player = require(MAIN.Player)

-- / MAIN
local PlayersManager = {}
local self = PlayersManager
self.Controllers = {}

function PlayersManager.Init()
    self.PlayerAdded = Players.PlayerAdded:Connect(function(plr)
        local existingPlayer = self.Controllers[plr.Name]
        if existingPlayer and existingPlayer.Destroy then
            existingPlayer:Destroy()
        end

        self.Controllers[plr.Name] = Player.New(plr)
    end)

    self.PlayerRemoving = Players.PlayerRemoving:Connect(function(plr, reason)
        local player = self.Controllers[plr.Name]
        if not player then return end

        player:Destroy()
    end)
end

return PlayersManager