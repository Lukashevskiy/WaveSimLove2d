local class = require("lib.30log/30log")

local Func = class("Func")
Func.angle = 2
Func.aplitude = 20
Func.fun = math.sin
Func.velocity = 0.01

function Func:init(aplitude, velocity, angle, fun)
    self.aplitude = aplitude
    self.velocity = velocity
    self.angle = angle
    self.fun = fun
end

function Func:__call(time, position)
    return self.aplitude * math.sin((self.angle + position.x / 240) * 4)
end

return Func