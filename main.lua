--UTILS
require "utils.load"
--CLASSES
require "classes.load"
--VARS
local lg = love.graphics
local game = {}
game.pause = true
game.debug = false
game.time = 0.0
game.dims = {}

function love.load()
  game.dims.x = lg.getWidth()
  game.dims.y = lg.getHeight()
  -- Disorganised collection of shit here:
  require('testshit')
  testMap = map.create(game.dims.x, game.dims.y)
  testMap:addLayer(dirtmap, 1, false, assets.terrainTextures.dirt, 32, 32, 10, 10)
  testMap:addLayer(grassmap, 1, false, assets.terrainTextures.grass, 32, 32, 10, 10)
  testMap:addLayer(topdirtmap, 1, false, assets.terrainTextures.dirt, 32, 32, 10, 10)
  testMap:addLayer(topgrassmap, 1, false, assets.terrainTextures.grass, 32, 32, 10, 10)
  testMap:generate()
end

function love.update(dt)
  game.time = game.time + dt
  --test
  batMotion:update(game.time, 300 + 50*math.sin(game.time), 200 + 50*math.cos(game.time))
  test1:update(game.time)
  test2:update(game.time)
end

function love.draw()
  if game.debug == true then
    lg.print("FPS:\t "..love.timer.getFPS(), 10, 10)
    lg.print(("DUR:\t %.1f"):format(game.time) .."s", 10, 20)
  end
  -- TEST
  lg.draw(testMap.canvas, 0, 0)
  test1:drawFrame(250, 250)
  test2:drawFrame(batMotion.x, batMotion.y)
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
