--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        consumable = false,
        collidable = true,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['pot'] = {
        type = 'pot',
        texture = 'pots',
        frame = 14,
        width = 16,
        height = 16,
        solid = true,
        collidable = true,
        projectile = true,
        defaultState = 'onGround',
        states = {
                ['onGround'] = {
                    frame = 14
                },
                ['onGround'] = {
                    frame = 14
                }
            }
    },

    ['heart'] = {

        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        consumable = true,
        defaultState = 'unconsumed',
        states = {
            ['unconsumed'] = {
                frame = 5
            },
            ['consumed'] = {
                frame = 1
            }
        }
    }
}