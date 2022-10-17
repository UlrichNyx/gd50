Powerup = Class{}

function Powerup:init()
	self.dy = 30
	self.inPlay = false
	self.y = 0
	self.x = 0
	self.activated = false
	self.width = 16
	self.height = 16
	self.isKey = false
	self.timer = 0
    self.timerThreshold = math.random(1, 2)
end

function Powerup:generate(x, y)
	self.inPlay = true
	self.x = x
	self.y = y
end

function Powerup:update(dt)
	self.y = self.y + self.dy * dt
end

function Powerup:render()
	if self.isKey then
		love.graphics.draw(gTextures['main'], gFrames['powerups'][10], self.x, self.y)
	else
		if(self.inPlay and (not self.activated)) then
        	love.graphics.draw(gTextures['main'], gFrames['powerups'][9], self.x, self.y)
		end
	end
end

function Powerup:setOutOfPlay() 
	self.inPlay = false
end


function Powerup:isInPlay()
	if self.inPlay then
		return true
	end
	return false
end

function Powerup:getYPos()
	return self.y
end

function Powerup:collides(target)
	if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 
    return true
end


function Powerup:setActivated()
	self.activated = true;
end

function Powerup:isActivated()
	return self.activated
end

function Powerup:setKey()
	self.isKey = true
	self.timerThreshold = math.random(1, 10)
end