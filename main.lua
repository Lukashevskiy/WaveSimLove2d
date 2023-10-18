local Rect     = require("src.rect")
local Position = require("src.position")
local Func     = require('src.func')

function love.load()
    Width  = love.graphics.getWidth()
    Height = love.graphics.getHeight()

    Rect1 = Rect(
        Position(0, 0),
        200,
        500
    )

    Rect2 = Rect(
        Position(0, 0),
        600,
        300
    )
    Rect3 = Rect(
        Position(0, 0),
        Height,
        Width
    )
    Funcs1 = {
        Func(
            20,
            0.001,
            0,
            function (self, time, position)
                return self.aplitude * math.sqrt((self.angle + position.x / 240) * 4)
            end),
        Func(
            20,
            0.005,
            20,
            function (self, time, position)
                return self.aplitude * math.sqrt((self.angle + position.x / 240) * 4)
            end)
    }
    Funcs2 = {
        Func(
            5,
            0.001,
            35,
            function (self, time, position)
                return self.aplitude * math.sqrt((self.angle + position.x / 240) * 4)
            end
        ),
        Func(
            0,
            0.001,
            20,
            function (self, time, position)
                return self.aplitude * math.sqrt((self.angle + position.x / 240) * 4)
            end
        )
    }
    Funcs3 = {
        Func(
            45,
            0.001,
            100,
            function (self, time, position)
                return self.aplitude * math.sqrt((self.angle + position.x / 240) * 4)
            end
        ),
        Func(
            100,
            0.001,
            100,
            function (self, time, position)
                return self.aplitude * math.sqrt((self.angle + position.x / 240) * 4)
            end        )
    }
    Frames = 0
end

function love.update(td)
    Frames = Frames + 1
end

function love.draw()
    Rect1:draw(Frames, Funcs1)
    Rect2:draw(Frames, Funcs2)
    Rect3:draw(Frames, Funcs3)
end
