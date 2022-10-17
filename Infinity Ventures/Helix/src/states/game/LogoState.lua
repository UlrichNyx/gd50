--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

LogoState = Class{__includes = BaseState}

local timer = 0
local expired = false

function LogoState:update(dt)

    if expired then
        timer = timer - dt * 50
    else
         timer = timer + dt * 50
    end
   
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start')
    end

    if timer > 300 then
        expired = true
    end

    if timer < 0 then
        gStateMachine:change('start')
    end
end

function LogoState:render()
    love.graphics.setColor(255,255,255,255)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    love.graphics.setColor(255/255, 255/255, 255/255, timer/255)
    love.graphics.draw(gTextures['logo'], VIRTUAL_WIDTH/2 - 30, VIRTUAL_HEIGHT/2 - 16 - 64)
    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(0, 0, 0, timer/255)
    love.graphics.printf('Infinity Ventures', 2, VIRTUAL_HEIGHT / 2 - 30, VIRTUAL_WIDTH, 'center')

end