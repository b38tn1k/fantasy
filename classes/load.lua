lg = love.graphics
math.randomseed(os.time())
assets = require('classes.cargo').init('assets')
JSON = (loadfile "classes/JSON.lua")()
animator = require('classes.animationGroup')
tiler = require('classes.squareTileGroup')
timer = require('classes.timer')
motion = require('classes.animationMotionHandler')
dungeon = require ("classes.dungeon")
