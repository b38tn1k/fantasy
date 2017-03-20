--UTILS
require "utils.load"
--CLASSES
require "classes.load"
animator = require('classes.animationGroup')
--VARS
local lg = love.graphics
game = {}
game.pause = true
game.debug = false
game.time = 0.0
game.dims = {}

function love.load()
  game.dims.x = lg.getWidth()
  game.dims.y = lg.getHeight()
  test1 = animator.create(assets.princess, 64, 64)
  test1:setCurrentSequence(LPC.walk.right)
  config = {}
  config7 = {}
  config7["ONESHOT"] = false
  config7["RETROGRADE"] = false
  config7["REMOVE_FROM_TAIL"] = 2
  config[LPC.walk.right] = config7
  test1:configureSpriteSheet(config)
  test1:setFrameDuration(0.2)
end

function love.update(dt)
  game.time = game.time + dt
  test1:update(game.time)
end

function love.draw()
  if game.debug == true then
    lg.print("FPS:\t "..love.timer.getFPS(), 10, 10)
    lg.print(("DUR:\t %.1f"):format(game.time) .."s", 10, 20)
  end
  test1.currentSequence:drawFrame(200, 200)
end


function save(table, fileName)
  local jsonText = JSON:encode(table)
  local saveFile = io.open(fileName, "w")
  saveFile:write(jsonText)
  saveFile:close()
end

function load(fileName)
  local saveFile = io.open(fileName, "r")
  local jsonText = saveFile:read()
  local loadedTable = JSON:decode(jsonText)
  return loadedTable
end
