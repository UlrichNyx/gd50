LevelUpMenuState = Class{__includes = BaseState}

function LevelUpMenuState:init(hp, attack, defense, speed, pokemon)
    self.lvMenu = Menu {
        x = VIRTUAL_WIDTH - 128,
        y = VIRTUAL_HEIGHT - 192,
        width = 128,
        height = 92,
        items = {
            {
                text = 'HP:' .. pokemon.HP .. "+" .. hp .. "=" .. pokemon.HP + hp,
                onSelect = function()
                    gStateStack:pop()
                end
            },
            {
                text = 'ATK:' .. pokemon.attack .. "+" .. attack .. "=" .. pokemon.attack + attack,
                onSelect = function()
                    gStateStack:pop()
                end
            },
            {
                text = 'DEF:' .. pokemon.defense .. "+" .. defense .. "=" .. pokemon.defense + defense,
                onSelect = function()
                    gStateStack:pop()
                end
            },
            {
                text = 'SPD:' .. pokemon.speed .. "+" .. speed .. "=" .. pokemon.speed + speed,
                onSelect = function()
                    gStateStack:pop()
                end
            }
        }
    }
    self.lvMenu.selection.disabled = true
end

function LevelUpMenuState:update(dt)
    self.lvMenu:update(dt)
end

function LevelUpMenuState:render()
    self.lvMenu:render()
end