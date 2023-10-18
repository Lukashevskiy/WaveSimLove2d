local class = require('lib.30log')
local Position = require("src.position")

--- @class Rect
--- @field position Position
--- @field width integer
--- @field height integer
local Rect = class("Rect")
Rect.height = 0
Rect.width = 0
Rect.position = Position(0, 0)

function Rect:init(position, width, height)
    self.position = position
    self.width = width
    self.height = height
end



function Rect:draw(time, func_array)
    local width = self.width
    local height = self.height
    for x = 0, width, 8 do
        local y = 0

        for _, i in ipairs(func_array) do
            y = y + i(time, Position(x, y))
            i.angle = i.angle + i.velocity
        end

        local current_x = self.position.x + x
        local current_y = self.position.y + y + self.height / 2
        love.graphics.setColor(1, 10 / (current_x / 8), 20 / ((current_x / 8)))
        love.graphics.circle('line', current_x, current_y, 2)
    end
end



return Rect
