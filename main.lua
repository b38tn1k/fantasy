--UTILS
require "utils.load"
--CLASSES
require "classes.load"
--VARS
local lg = love.graphics
game = {}
game.pause = true
game.debug = false
game.time = 0.0
game.dims = {}
dungeon = {}

function love.load()
  game.dims.x = lg.getWidth()
  print(game.dims.x)
  game.dims.y = lg.getHeight()
  print(game.dims.y)
  -- Disorganised collection of shit here:
  require('testshit')
  dungeon = Dungeon.create(game.dims.x, game.dims.y)
  dungeon:generate()
  dungeon:render()
end

function love.update(dt)
  game.time = game.time + dt
  --test
  batMotion:update(game.time, 300 + 50*math.sin(game.time), 200 + 50*math.cos(game.time))
  test1:update(game.time)
  test2:update(game.time)

end

function love.draw()
  -- TEST
  lg.draw(dungeon.canvas, 1, 1)
  test1:drawFrame(250, 250)
  test2:drawFrame(batMotion.x, batMotion.y)
  if game.debug == true then
    lg.print("FPS:\t "..love.timer.getFPS(), 10, 10)
    lg.print(("DUR:\t %.1f"):format(game.time) .."s", 10, 20)
    lg.print("X:   \t" .. game.dims.x, 10, 30)
    lg.print("Y:   \t" .. game.dims.y, 10, 40)
  end
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
