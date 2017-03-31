--for square tiles only!
local squareTileGroup = {}
squareTileGroup.__index = squareTileGroup
local lg = love.graphics

function newSquareTileGroup (sheet, xTileSize, yTileSize)
  local quads = {}
  local xDim, yDim = sheet:getDimensions()
  local tileCount = 0
  for i in range(0, xDim - xTileSize, xTileSize) do
    for j in range(0, yDim - yTileSize, yTileSize) do
      table.insert(quads, lg.newQuad(i, j, xTileSize, yTileSize, xDim, yDim))
      tileCount = tileCount + 1
    end
  end
  return tileCount, quads
end

function squareTileGroup.create(sheet, xTileSize, yTileSize)
  local proto = {}
  setmetatable(proto, squareTileGroup)
  proto.sheet = sheet
  proto.tileSize = tileSize
  proto.xTileSize = xTileSize
  proto.yTileSize = yTileSize
  proto.tileCount, proto.quads = newSquareTileGroup(sheet, xTileSize, yTileSize)
  --class variables here
  return proto
end

function squareTileGroup:getCanvasFromBlockMap(x, y, map)
  xInPixels = x*self.xTileSize
  yInPixels = y*self.yTileSize
  local canvas = lg.newCanvas(xInPixels, yInPixels)
  lg.setCanvas(canvas)
  lg.clear()
  lg.setBlendMode("alpha")
  local counter = 0
  for j in range(0, xInPixels - self.xTileSize, self.xTileSize) do
    for i in range(0, yInPixels  - self.yTileSize, self.yTileSize) do
      counter = counter + 1
      lg.draw(self.sheet, self.quads[map[counter]], i, j)
    end
  end
  lg.setCanvas()
  return canvas
end

return squareTileGroup