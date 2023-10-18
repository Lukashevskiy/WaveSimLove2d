---@diagnostic disable: duplicate-set-field
require("lib.lua-esc.ECS_concat")

function love.load()
    
end


function love.update()
    
end

function love.draw()
    
end

require("lib.lua-esc.ECS_concat")




local Component = ECS.Component
local System = ECS.System
local Query = ECS.Query
local World = ECS.World
local Entity = ECS.Entity

local Position = Component({
    x = 0,
    y = 0,
    z = 0
})

local Velocity = Component(0)

local Accelerate = Component(0)

local Width = Component(0)

local Height = Component(0)

local Radius = Component(0)



local BallRenderSystem = System("render", 1, Query.All(Position, Radius), function (self)
    self:Result():ForEach(function(entity)
        local position = entity[Position]
        local radius = entity[Radius].value
        love.graphics.setColor(1, 1, 1)
        love.graphics.circle("fill", position.x, position.y, radius)
    end)
end)

local MovableSystem = System('process', 1, Query.All(Velocity), function (self, time)
    local delta = time.DeltaFixed
 
    -- Iterate through all entities in the query
    for i, entity in self:Result():Iterator() do
       local velocity = entity[Velocity].value
 
       local position = entity[Position]
       position.x = position.x + velocity * delta
       position.y = position.y + velocity * delta
       position.z = position.z + velocity * delta
    end
end)

function love.load()
    -- Timer = love.timer
    GameWorld = World()
    GameWorld:AddSystem(BallRenderSystem)
    -- GameWorld:AddSystem(MovableSystem)

    WindowBorderRectangle =
        GameWorld:Entity(
            Position(0, 0),
            Width(love.graphics.getWidth()),
            Height(love.graphics.getHeight())
        )

    Balls = {}
    for i = 0, 10 do
        local r = math.random(10, 50)
        local v = math.random(10, 100)
        local x = math.random(r + 1, love.graphics.getWidth()  - r - 1)
        local y = math.random(r + 1, love.graphics.getHeight() - r - 1)
        -- print(r, v, x, y)
        table.insert(
            Balls,
            GameWorld:Entity(Radius({value = r}), Position({x = x, y = y}), Velocity({value = v}))
        )
    end
    Frames = 0
end


function love.update()
    -- Frames = Frames + 1
    GameWorld:Update("process", love.timer.getTime())
end

function love.draw()
    GameWorld:Update("render", love.timer.getTime())
end