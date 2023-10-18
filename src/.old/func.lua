local class = require("lib.30log/30log")

--- @class Func
--- @field angle    integer
--- @field aplitude integer
--- @field velocity integer
--- @field fun      function
local Func = class("Func")
      Func.angle    = 2
      Func.aplitude = 20
      Func.fun      = math.sin
      Func.velocity = 0.01


--- @param aplitude integer
--- @param velocity integer
--- @param angle    integer
--- @param fun      function
function Func:init(aplitude, velocity, angle, fun)
    self.aplitude = aplitude
    self.velocity = velocity
    self.angle    = angle
    self.fun      = fun
end


--- @param time     integer progressive value, make dinamic wave
--- @param position Position start position (x, y)
--- @return number  integer calculated value of func 
function Func:__call(time, position)
    return self.aplitude * math.sin((self.angle + position.x / 240) * 4)
end

return Func