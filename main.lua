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
  test1 = animator.create(assets.orc, 64, 64)
  test1:setCurrentSequence(LPC.walk.front)
  test2 = animator.create(assets.princess, 64, 64)
  test2:setCurrentSequence(LPC.walk.right)
  test2:setAnimationStep(-1)
  test3 = animator.create(assets.skeleton, 64, 64)
  test3:setCurrentSequence(LPC.cast.front)
  test3.currentSequence:setOneShot()
end

function love.update(dt)
  game.time = game.time + dt
  test1:update(game.time)
  test2:update(game.time)
  test3:update(game.time)
end

function love.draw()
  if game.debug == true then
    lg.print("FPS:\t "..love.timer.getFPS(), 10, 10)
    lg.print(("DUR:\t %.1f"):format(game.time) .."s", 10, 20)
  end
  test1.currentSequence:drawFrame(200, 200)
  test2.currentSequence:drawFrame(300, 200)
  test3.currentSequence:drawFrame(400, 200)
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
