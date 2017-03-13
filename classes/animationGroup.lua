--animationGroup handles a group of related animation sequences
--for a sprite or tile
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
  local sequenceCount = x/tileWidth


end

function animationGroup:removeBlankFrames()
end

return animationGroup
