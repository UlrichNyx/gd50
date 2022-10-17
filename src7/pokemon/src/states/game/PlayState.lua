--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.level = Level()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

    self.dialogueOpened = false
end

function PlayState:update(dt)
    if not self.dialogueOpened and love.keyboard.wasPressed('p') then
        
        -- heal player pokemon
        gSounds['heal']:play()
        self.level.player.party.pokemon[1].currentHP = self.level.player.party.pokemon[1].HP
        
        -- show a dialogue for it, allowing us to do so again when closed
        gStateStack:push(DialogueState('Your Pokemon has been healed!',
    
        function()
            self.dialogueOpened = false
        end))
    end

    if not self.dialogueOpened and love.keyboard.wasPressed('l') then
        gSounds['heal']:play()
        local hp, attack, defense, speed = self.level.player.party.pokemon[1]:levelUp()
        --print("HP: " .. self.level.player.party.pokemon[1].HP .. " + " .. hp .. " = " .. self.level.player.party.pokemon[1].HP + hp)
        -- show a dialogue for it, allowing us to do so again when closed
        gStateStack:push(DialogueState('Your Pokemon has leveled up!',
        function()
            self.dialogueOpened = false
        end))
        gStateStack:push(LevelUpMenuState(hp, attack, defense, speed, self.level.player.party.pokemon[1]))
    end

    --self.playerPokemon:levelUp()

    self.level:update(dt)
end

function PlayState:render()
    self.level:render()
    if self.lvMenu then
        self.lvMenu:render()
    end
end