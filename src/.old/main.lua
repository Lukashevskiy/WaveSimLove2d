local Rect     = require("src.old.rect")
local Position = require("src.old.position")
local Func     = require('src.old.func')

function love.load()
    Width  = love.graphics.getWidth()
    Height = love.graphics.getHeight()

    Rect1 = Rect(
        Position(0, 0),
        200,
        500
    )

    Rect2 = Rect(
        Position(100, 400),
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
            0.0001,
            0,
            math.sin
        ),
        Func(
            20,
            0.00005,
            20,
            math.cos
        )
    }
    Funcs2 = {
        Func(
            5,
            0.0001,
            35,
            math.sin
        ),
        Func(
            0,
            0.0001,
            20,
            math.cos
        )
    }
    Funcs3 = {
        Func(
            45,
            0.0001,
            100,
            math.sin
        ),
        Func(
            100,
            0.0001,
            100,
            math.cos
        )
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
