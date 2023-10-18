local class = require("lib.30log")


--- @class Position
--- @field x integer
--- @field y integer
local Position = class("Position")
Position.x = 0
Position.y = 0


function Position:init(x, y)
    self.x = x
    self.y = y
end

return Position