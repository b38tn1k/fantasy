--animationGroup handles a group of related animation sequences
--for a sprite or tile. The Frame timing is handled here to allow
--for normal looking sequence transisitions
local animator = require("classes.animationSequence")
local lg = love.graphics
local animationGroup = {}
animationGroup.__index = animationGroup

local function generateSequences(sheet, tileWidth, tileHeight)
  local x, y = sheet:getDimensions()
  local sequence = {}
  local count = 0
  for i in range(0, y-1, tileHeight) do
     table.insert(sequence, animator.create(sheet, 0, i, tileWidth, tileHeight))
     count = count + 1
     print(count)
   end
   return count, sequence
end

function animationGroup.create(sheet, tileWidth, tileHeight)
  local proto = {}
  setmetatable(proto, animationGroup)
  proto.updateTime = 0.0
  proto.updateFrame = false
  proto.frameDuration = 0.2
  proto.step = 1
  proto.sequenceCount, proto.sequence = generateSequences(sheet, tileWidth, tileHeight)
  proto.currentSequence = proto.sequence[1]
  return proto
end

function animationGroup:configureSpriteSheet(config)
  for i in range(1, self.sequenceCount, 1) do
    if config[i] then 
      if config[i]["ONESHOT"] == true then self.sequence[i]:setOneShot() else self.sequence[i]:setLoop() end
      self.sequence[i]:removeFromTail(config[i]["REMOVE_FROM_TAIL"])
      if config[i]["RETROGRADE"] == true then self.sequence[i]:isRetrograde() end
    end
  end
end

function animationGroup:setAnimationStep(step)
  self.step = step
end

function animationGroup:setCurrentSequence(n)
  self.currentSequence = self.sequence[n]
end

function animationGroup:update(gameTime)
  if gameTime >= self.updateTime then
    self.updateTime = self.updateTime + self.frameDuration
    self.currentSequence:stepFrame(self.step)
    -- self.currentSequence:freakOut()
  end
end

return animationGroup
