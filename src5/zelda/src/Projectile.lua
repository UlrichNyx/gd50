--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{}

function Projectile:init(obj, direction)
	self.entity = obj
	self.direction = direction
	self.distance = 0
	self.hitbox = Hitbox(self.entity.x, self.entity.y, self.entity.width, self.entity.height)
	self.faded = false

	if self.direction == 'left' then
       	self.entity.dx = -100
       	self.entity.dy = 0
    elseif self.direction == 'right' then
       	self.entity.dx = 100
       	self.entity.dy = 0
    elseif self.direction == 'up' then
       	self.entity.dx = 0
       	self.entity.dy = -100
    elseif self.direction == 'down' then
       	self.entity.dx = 0
       	self.entity.dy = 100
    end
end

function Projectile:update(dt)
	self.distance = self.distance + (self.entity.dx * dt) + (self.entity.dy * dt)
	self.entity.x = self.entity.x + self.entity.dx * dt
	self.entity.y = self.entity.y + self.entity.dy * dt
	if self.distance > math.abs(TILE_SIZE * 4)  or self.distance < -TILE_SIZE * 4 then
		self.faded = true
		--print("got it!")
	end

    if self.direction == 'left' then
        if self.entity.x <= MAP_RENDER_OFFSET_X + TILE_SIZE then
        	self.entity.x = MAP_RENDER_OFFSET_X + TILE_SIZE
        	self.entity.dx = 0
        	self.faded = true
        	print("nice")
        end
    elseif self.direction == 'right' then
        if self.entity.x + self.entity.width >= VIRTUAL_WIDTH - TILE_SIZE * 2 then
        	self.entity.x = VIRTUAL_WIDTH - TILE_SIZE * 2 - self.entity.width
        	self.faded = true
        	print("nice")
        end
    elseif self.direction == 'up' then
        if self.entity.y <= MAP_RENDER_OFFSET_Y + TILE_SIZE - self.entity.height / 2 then 
        	self.faded = true
        	print("nice")
        end
    elseif self.direction == 'down' then
        local bottomEdge = VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) 
            + MAP_RENDER_OFFSET_Y - TILE_SIZE

        if self.entity.y + self.entity.height >= bottomEdge then
        	self.faded = true
        	print("nice")
        end
    end

    if self.faded then
    	self.entity.remove = true
    end
end



function Projectile:render()
	
end