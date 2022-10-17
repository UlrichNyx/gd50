PlayState = Class{__includes = BaseState}

function PlayState:update(dt)
	player = Player()
end

function PlayState:render()
	love.graphics.clear(0,0,0)
    love.graphics.draw(gTextures['hero'],gFrames['hero'][5], VIRTUAL_WIDTH / 2 - 16, VIRTUAL_HEIGHT / 2 - 16)

end