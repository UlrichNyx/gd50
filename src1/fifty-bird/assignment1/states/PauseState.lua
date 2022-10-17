--[[
    TitleScreenState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The TitleScreenState is the starting screen of the game, shown on startup. It should
    display "Press Enter" and also our highest score.
]]

PauseState = Class{__includes = BaseState}

paused = false

function PauseState:init()
    self.bird = Bird()
    self.pipePairs = {}
    self.score = 0
end

function PauseState:update(dt)
    -- transition to countdown when enter/return are pressed
    paused = true
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {
            score = self.score, bird = self.bird, pipePairs = self.pipePairs
        })
        sounds['music']:play()
        sounds['pause']:play()
    end
end

function PauseState:render()
    -- simple UI code
    --
    love.graphics.setFont(flappyFont)
    
    for k, pair in pairs(self.pipePairs) do
        pair:render()
    end

    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

    self.bird:render()

    love.graphics.print('II', VIRTUAL_WIDTH/2. - 4, VIRTUAL_HEIGHT/2 - 4)
end

function PauseState:enter(params)
    self.bird = params['bird']
    self.pipePairs = params['pipePairs']
    self.score = params['score']
end
