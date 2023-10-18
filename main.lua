local Rect =  require("src.rect")
local Position = require("src.position")
local Func = require('src.func')

function love.load()
    Width = love.graphics.getWidth()
    Height = love.graphics.getHeight()


    Func1 = Func(
        20,
        0.0001,
        0,
        math.sin
    )
    Func2 = Func(
        20,
        0.00005,
        20,
        math.cos
    )
    Position1 = Position(0, 0)
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
        love.graphics.getWidth(),
        love.graphics.getHeight()
    )
    Funs = {Func1, Func2}
    Frames = 0
end

function love.update(td)
    Frames = Frames + 1
end

function love.draw()
    Rect1:draw(Frames, Funs)
    Rect2:draw(Frames, Funs)
    Rect3:draw(Frames, Funs)
end
