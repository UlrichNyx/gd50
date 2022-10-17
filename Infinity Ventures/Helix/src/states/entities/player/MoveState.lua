MoveState = Class{__includes = BaseState}

function MoveState:update(dt)
	print("Hello!")
end

function MoveState:render()
    love.graphics.draw(gTextures['hero'],gFrames['hero'][5], VIRTUAL_WIDTH / 2 - 16, VIRTUAL_HEIGHT / 2 - 16)
end