
PlayerPotIdleState = Class{__includes = BaseState}

function PlayerPotIdleState:init(player)
	self.entity = player
	self.entity.offsetY = 5
    self.entity.offsetX = 0
    self.entity:changeAnimation('pot-idle-' .. self.entity.direction)
end

function PlayerPotIdleState:enter(enterParams)
	self.pot = enterParams['pot']
end

function PlayerPotIdleState:update(dt)
	self.pot.x = self.entity.x
	self.pot.y = self.entity.y - self.pot.height / 2

	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
       	self.entity:changeState('idle')
       	if self.entity.direction == 'left' then
       		self.pot.x = self.entity.x - self.pot.width - 1
       		self.pot.y = self.entity.y + self.pot.height / 2
       	elseif self.entity.direction == 'right' then
       		self.pot.x = self.entity.x + self.pot.width + 1
       		self.pot.y = self.entity.y + self.pot.height / 2
       	elseif self.entity.direction == 'up' then
       		self.pot.x = self.entity.x
       		self.pot.y = self.entity.y - self.pot.height / 2 - 1

      	elseif self.entity.direction == 'down' then
      		self.pot.x = self.entity.x
       		self.pot.y = self.entity.y + self.entity.height + 1
       end
    end

    if love.keyboard.wasPressed('space') then
        self.entity:changeState('idle')
        self.pot.proj = Projectile(self.pot, self.entity.direction)
    end

    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('pot-walk', {pot = self.pot})
    end
end

function PlayerPotIdleState:render()
	    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
    math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
end