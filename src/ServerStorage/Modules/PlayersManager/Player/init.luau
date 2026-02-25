local MAIN = script
local ROOT = MAIN.Parent

local Character = require(ROOT.Character)

-- / MAIN
local Player = {}
Player.__index = Player

function Player.New(plr: Player)
    local self = {}
    self.Connections = {}

    self.Connections.CharacterAdded = plr.CharacterAdded:Connect(function(char)
        local existingCharacter = self.Character
        if existingCharacter and existingCharacter.Destroy then
            existingCharacter:Destroy()
        end

		self.Character = Character.New(char)
        
    end)
end

function Player:Destroy()
    for _, conn: RBXScriptConnection in self.Connections do
        if typeof(conn) ~= "RBXScriptConnection" then continue end

        conn:Disconnect()
    end
    table.clear(self.Connections)

    table.clear(self)
end

return Player