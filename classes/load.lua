lg = love.graphics
DebugTools = require('classes.debugTools')
Debug = require('classes.debugTools')
debugTools = Debug.create(true)
math.randomseed(os.time())
Assets = require('classes.cargo').init('assets')
JSON = (loadfile "classes/JSON.lua")()
Animator = require('classes.animationGroup')
Tiler = require('classes.squareTileGroup')
Timer = require('classes.timer')
Motion = require('classes.animationMotionHandler')
Dungeon = require ("classes.dungeon")
