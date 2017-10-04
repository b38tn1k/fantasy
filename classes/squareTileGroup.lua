--for square tiles only!
local squareTileGroup = {}
squareTileGroup.__index = squareTileGroup
local lg = love.graphics

function newSquareTileGroup (sheet, tileSize)
  local quads = {}
  local xDim, yDim = sheet:getDimensions()
  local tileCount = 0
  for i in range(0, yDim - tileSize, tileSize) do
    for j in range(0, xDim - tileSize, tileSize) do
      table.insert(quads, lg.newQuad(i, j, tileSize, tileSize, xDim, yDim))
      tileCount = tileCount + 1
    end
  end
  return tileCount, quads
end

function squareTileGroup.create(sheet, tileSize)
  local proto = {}
  setmetatable(proto, squareTileGroup)
  proto.sheet = sheet
  proto.tileSize = tileSize
  proto.tileSize = tileSize
  proto.tileSize = tileSize
  proto.tileCount, proto.quads = newSquareTileGroup(sheet, tileSize)
  print("tiles")
  print(proto.tileCount)
  --class variables here
  return proto
end

function squareTileGroup:getCanvasFromBlockMap(map, x, y)
  xInPixels = x*self.tileSize
  yInPixels = y*self.tileSize
  local canvas = lg.newCanvas(xInPixels, yInPixels)
  lg.setCanvas(canvas)
  lg.clear()
  lg.setBlendMode("alpha")
  local counter = 0
  for j in range(0, xInPixels - self.tileSize, self.tileSize) do
    for i in range(0, yInPixels  - self.tileSize, self.tileSize) do
      counter = counter + 1
      if map[counter] > 0 then
        print("map_counter:")
        print(map[counter])
        lg.draw(self.sheet, self.quads[map[counter]], i, j)
      end
    end
  end
  lg.setCanvas()
  return canvas
end

return squareTileGroup
