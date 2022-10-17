Player = Class{__includes = Entities}

function Player:init()

	    pStateMachine = StateMachine {
        ['idle'] = function() return IdleState() end,
        ['move'] = function() return MoveState() end,
    }
end


function Player:update(dt)

end

function Player:render()
    love.graphics.draw(gTextures['hero'],gFrames['hero'][5], VIRTUAL_WIDTH / 2 - 16, VIRTUAL_HEIGHT / 2 - 16)
end