
StartState = Class{__includes = BaseState}

local timer = 0
local timer2 = 0
local expired = false

function StartState:update(dt)
    timer = timer + dt * 50
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
        gSounds['mainmenu']:stop()
    end 

    if timer2 > 300 then
        expired = true
    end

    if expired then
        timer2 = timer2 - dt * 50
        if timer2 < 0 then
            expired = false
        end
    else
        timer2 = timer2 + dt * 50
    end


end

function StartState:render()
    love.graphics.setColor(255/255, 255/255, 255/255, timer/255) -- red, green, blue, opacity (this would be white with 20% opacity)
    love.graphics.draw(gTextures['mainmenu'], 0, 0, 0, VIRTUAL_WIDTH / gTextures['mainmenu']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['mainmenu']:getHeight())


    love.graphics.setFont(gFonts['zelda'])
    love.graphics.setColor(34/255, 34/255, 34/255, timer/255)
    love.graphics.printf('Helix', 2, VIRTUAL_HEIGHT / 2 - 30, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(175/255, 53/255, 42/255, timer/255)
    love.graphics.printf('Helix', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(255/255, 255/255, 255/255, timer2/255)
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter', 0, VIRTUAL_HEIGHT / 2 + 64, VIRTUAL_WIDTH, 'center')
end