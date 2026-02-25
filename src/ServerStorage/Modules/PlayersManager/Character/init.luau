local MAIN = script
local InitialFunctions = require(MAIN.InitialFunctions)

-- / MAIN
local Character = {}
Character.__index = Character

function Character.New(char: Model)
    local self = {}

    for _, initFunc: () -> any in InitialFunctions do
        initFunc(char)
    end
    
    setmetatable(self, Character)
    return self
end

function Character:Destroy()
    table.clear(self)
end

return Character