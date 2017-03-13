--animationGroup handles a group of related animation sequences
--for a sprite or tile. The Frame timing is handled here to allow
--for normal looking sequence transisitions
local animator = require("classes.animationSequence")
local lg = love.graphics
local animationGroup = {}
animationGroup.__index = animationGroup

function generateSequences(sheet, tileWidth, tileHeight)
  local x, y = sheet:getDimensions()
  local sequences = {}
  local count = 0
  for i in range(0, y-1, tileHeight) do
     table.insert(sequences, animator.create(sheet, 0, i, tileWidth, tileHeight))
     count = count + 1
   end
   return count, sequences
end

function animationGroup.create(sheet, tileWidth, tileHeight)
  local proto = {}
  setmetatable(proto, animationGroup)
  proto.sequenceCount, proto.sequences = generateSequences(sheet, tileWidth, tileHeight)
  proto.updateTime = 0.0
  proto.updateFrame = false
  proto.frameDuration = 0.2
  proto.step = 1
  proto.currentSequence = proto.sequences[1]
  return proto
end

function animationGroup:setAnimationStep(step)
  self.step = step
end

function animationGroup:setCurrentSequence(n)
  self.currentSequence = self.sequences[n % self.sequenceCount]
end

function animationGroup:update(gameTime)
  if gameTime >= self.updateTime then
    self.updateTime = self.updateTime + self.frameDuration
    self.currentSequence:stepFrame(self.step)
    -- self.currentSequence:freakOut()
  end
end

return animationGroup
