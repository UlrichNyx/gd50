--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    self.rng = math.random(1,10)
    self.shiny = false

    if self.rng == 1 then
        self.shiny = true 
    else
        self.shiny = false
    end

end

function Tile:getX()
    return self.x
end

function Tile:getY()
    return self.y
end

function Tile:update(dt)

end

function Tile:getVariety()
    return self.variety
end

--[[
    Function to swap this tile with another tile, tweening the two's positions.
]]
function Tile:swap(tile)

end

function Tile:render(x, y)
    -- draw shadow
    love.graphics.setColor(34/255, 32/255, 52/255, 255/255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],self.x + x, 
        self.y + y)
    if self.shiny then
        love.graphics.draw(gTextures['sparkle'], self.x + x + 2, self.y + y + 2)
    end
end