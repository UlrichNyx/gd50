IdleState = Class{__includes = BaseState}

function IdleState:update(dt)
	if love.keyboard.wasPressed('up') then
		pStateMachinge:change('move')
	end
end

function IdleState:render()
    love.graphics.draw(gTextures['hero'],gFrames['hero'][5], VIRTUAL_WIDTH / 2 - 16, VIRTUAL_HEIGHT / 2 - 16)
end