--animationGroup handles a group of related animation sequences
--for a sprite or tile
local animator = require("classes.animationSequence")
local lg = love.graphics
local animationGroup = {}
animationGroup.__index = animationGroup

function animationGroup.create(sheet)
  local proto = {}
  setmetatable(proto, animationGroup)
  proto.sheet = sheet
  proto.sequences = {}
  return proto
end

function animationGroup:generateSequences(tileWidth, tileHeight)
  local x, y = sheet:getDimensions()
  local maxFrames = x/tileWidth
  for i in range(0, y, tileHeight) do
     table.insert(proto.sequences, animator.create(self.sheet, 0, i, tileWidth, tileHeight, maxFrames))
  end
end

return animationGroup
