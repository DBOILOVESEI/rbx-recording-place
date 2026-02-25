local ServerStorage = game:GetService("ServerStorage")

-- / ROOTS
local MODULES = ServerStorage.Modules

-- / MODULES
local PlayersManager = require(MODULES.PlayersManager)

-- / MAIN
local function Main()
   PlayersManager.Init() 
end

Main()