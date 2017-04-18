local map = {}
map.__index = map
local lg = love.graphics
local tiler = require('classes.squareTileGroup')

function map.create(width, height)
  local proto = {}
  setmetatable(proto, map)
  proto.layers = {}
  proto.canvas = nil
  proto.width = width
  proto.height = height
  proto.collisionMap = {}
  return proto
end

function map:addLayer(aLayer, ground, solid, texture, quadWidth, quadHeight, xCount, yCount)
  local layer = {}
  layer['LAYER'] = aLayer
  layer['GROUND'] = ground --foreground, middleground, background
  layer['SOLID'] = solid
  local canvas = tiler.create(texture, quadWidth, quadHeight)
  layer['CANVAS'] = canvas:getCanvasFromBlockMap(aLayer, xCount, yCount)
  table.insert(self.layers, layer)
end

function map:checkCollision(x, y)
  return self.collisionMap[x][y]
end

function map:generate()
  local canvas = lg.newCanvas(self.width, self.height)
  lg.setCanvas(canvas)
  lg.setBlendMode("alpha")
  for i, v in ipairs(self.layers) do
    lg.draw(v['CANVAS'], 0, 0)
  end
  lg.setCanvas()
  self.canvas = canvas
end


return map
