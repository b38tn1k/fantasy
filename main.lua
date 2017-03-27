--UTILS
require "utils.load"
--CLASSES
require "classes.load"
animator = require('classes.animationGroup')
tiler = require('classes.squareTileGroup')
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

  tile0 = tiler.create(assets.terrainTextures.dirt, 32, 32)
  local map = { 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10}
  dirtTest = tile0:getCanvasFromBlockMap(10, 10, map)

  map = {
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 2, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 2, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 1, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 2, 25, 25, 25, 25, 25, 25, 1, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25
              }
  topDirtTest = tile0:getCanvasFromBlockMap(10, 10, map)


  tile1 = tiler.create(assets.terrainTextures.grass, 32, 32)
  map = { 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                10, 10, 7, 13, 10, 10, 10, 10, 10, 10,
                10, 10, 16, 4, 10, 10, 10, 10, 10, 10,
                10, 10, 16, 4, 10, 10, 10, 10, 10, 10,
                10, 10, 16, 4, 10, 10, 7, 11, 13, 10,
                10, 10, 16, 4, 10, 10, 16, 25, 4, 10,
                10, 10, 16, 4, 10, 10, 8, 9, 14, 10,
                10, 10, 16, 4, 10, 10, 10, 10, 10, 10,
                10, 10, 8, 14, 10, 10, 10, 10, 10, 10,
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10}
  terrainTest = tile1:getCanvasFromBlockMap(10, 10, map)

  map = {
                1, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 2, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25,
                25, 25, 25, 25, 25, 25, 25, 25, 25, 25
              }
  topGrassTest = tile1:getCanvasFromBlockMap(10, 10, map)

  tile3 = tiler.create(assets.itemTextures.treetop, 96, 96)
  tree = tile3:getCanvasFromBlockMap(1, 1, {1})
  tile4 = tiler.create(assets.itemTextures.trunk, 96, 96)
  trunk = tile4:getCanvasFromBlockMap(1, 1, {1})

  canvas = lg.newCanvas(500, 500)
  lg.setCanvas(canvas)
  lg.draw(dirtTest, 128, 128)
  lg.draw(terrainTest, 128, 128)
  lg.draw(topDirtTest, 128, 128)
  lg.draw(topGrassTest, 128, 128)
  lg.draw(trunk, 160, 160)
  lg.draw(tree, 160, 96)
  lg.setCanvas()

  test1 = animator.create(assets.spriteTextures.princess, 64, 64)
  test1:setCurrentSequence(LPC.walk.right)
  config = {}
  config7 = {}
  config7["ONESHOT"] = false
  config7["RETROGRADE"] = false
  config7["REMOVE_FROM_TAIL"] = 2
  config[LPC.walk.right] = config7
  test1:configureSpriteSheet(config)
  test1:setFrameDuration(0.2)

  test2 = animator.create(assets.spriteTextures.bat, 32, 32)
  test2:setCurrentSequence(1)
  test2:setFrameDuration(0.2)

end

function love.update(dt)
  game.time = game.time + dt
  test1:update(game.time)
  test2:update(game.time)
end

function love.draw()
  if game.debug == true then
    lg.print("FPS:\t "..love.timer.getFPS(), 10, 10)
    lg.print(("DUR:\t %.1f"):format(game.time) .."s", 10, 20)
  end
  lg.draw(canvas, 0, 0)
  test1.currentSequence:drawFrame(250, 250)
  test2.currentSequence:drawFrame(200 + 50*math.sin(game.time), 200+ 50*math.cos(game.time))
  lg.draw(trunk, 160, 160)
  lg.draw(tree, 160, 96)
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
