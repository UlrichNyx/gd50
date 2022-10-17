
Class = require 'lib/class'
Event = require 'lib/knife.event'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/constants'
require 'src/StateMachine'
require 'src/Util'


require 'src/states/BaseState'
require 'src/states/game/StartState'
require 'src/states/game/LogoState'
require 'src/states/game/PlayState'
require 'src/states/entities/player/IdleState'
require 'src/states/entities/player/MoveState'

gTextures = {
    ['mainmenu'] = love.graphics.newImage('graphics/mainmenu.png'),
    ['logo'] = love.graphics.newImage('graphics/logo.jpg'),
    ['hero'] = love.graphics.newImage('graphics/characters.png')
}

gFrames = {
    ['hero'] = GenerateQuads(gTextures['hero'], 16, 16)
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['gothic-medium'] = love.graphics.newFont('fonts/GothicPixels.ttf', 16),
    ['gothic-large'] = love.graphics.newFont('fonts/GothicPixels.ttf', 32),
    ['zelda'] = love.graphics.newFont('fonts/zelda.otf', 64),
    ['zelda-small'] = love.graphics.newFont('fonts/zelda.otf', 32)
}

gSounds = {
    ['mainmenu'] = love.audio.newSource('sounds/mainmenu.mp3', 'static'),
}