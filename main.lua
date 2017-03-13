--UTILS
require "utils.load"
--CLASSES
require "classes.load"
--VARS
local lg = love.graphics
game = {}
game.pause = true
game.debug = false
game.time = 0
game.dims = {}

function love.load()
  game.dims.x = lg.getWidth()
  game.dims.y = lg.getHeight()
  princess = animator.create(assets.princessPixel, 0, 128, 64, 64, 7)
end

function love.update(dt)
  game.time = game.time + dt
  princess:stepFrame(1)

  love.timer.sleep( 0.1 )
end

function love.draw()
  princess:drawFrame(100, 100)
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
