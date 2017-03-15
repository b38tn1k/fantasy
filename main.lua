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
  test2 = animator.create(assets.princess, 64, 64)
  test2.sequence[LPC.walk.right]:isRetrograde()
  test2:setCurrentSequence(LPC.walk.right)
  test2.currentSequence.frameCount = test2.currentSequence.frameCount - 1
  test3 = animator.create(assets.princess, 64, 64)
  test3:setCurrentSequence(LPC.walk.right)
 -- test3.currentSequence:isRetrograde()
  test3.currentSequence.frameCount = test3.currentSequence.frameCount - 2
  test4 = animator.create(assets.spriteTest2, 64, 64)
  test4:setCurrentSequence(1)
  config = {}
  config["ONESHOT"] = false
  config["RETROGRADE"] = true
  config["REMOVE_FROM_TAIL"] = 3
  test4:configureSpriteSheet({config})
  test4.frameDuration = 0.25
end

function love.update(dt)
  game.time = game.time + dt
  test1:update(game.time)
  test2:update(game.time)
  test3:update(game.time)
  test4:update(game.time)
end

function love.draw()
  if game.debug == true then
    lg.print("FPS:\t "..love.timer.getFPS(), 10, 10)
    lg.print(("DUR:\t %.1f"):format(game.time) .."s", 10, 20)
  end
  test1.currentSequence:drawFrame(200, 200)
  test2.currentSequence:drawFrame(230, 200)
  test3.currentSequence:drawFrame(260, 200)
  test4.currentSequence:drawFrame(400, 200)
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
