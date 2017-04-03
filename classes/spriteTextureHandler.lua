--spriteTextureHandler handles a group of related animation sequences
--for a sprite or tile. The Frame timing is handled here to allow
--for normal looking sequence transisitions
local animator = require("classes.spriteQuadSequence")
local lg = love.graphics
local spriteTextureHandler = {}
spriteTextureHandler.__index = spriteTextureHandler

local function generateSequences(sheet, tileWidth, tileHeight)
  local x, y = sheet:getDimensions()
  local sequence = {}
  local count = 0
  for i in range(0, y-1, tileHeight) do
     table.insert(sequence, animator.create(sheet, 0, i, tileWidth, tileHeight))
     count = count + 1
   end
   return count, sequence
end

function spriteTextureHandler.create(sheet, tileWidth, tileHeight)
  local proto = {}
  setmetatable(proto, spriteTextureHandler)
  proto.sheet = sheet
  proto.updateTime = 0.0
  proto.updateFrame = false
  proto.frameDuration = 0.2
  proto.frame = 1
  proto.sequenceCount, proto.sequence = generateSequences(sheet, tileWidth, tileHeight)
  proto.currentSequence = proto.sequence[1]
  return proto
end

function spriteTextureHandler:configureSpriteSheet(config)
  for i in range(1, self.sequenceCount, 1) do
    if config[i] then
      self.sequence[i]:configureSequence(config[i])
    end
  end
end

function spriteTextureHandler:stepFrame()
  self.frame = self.frame + 1
  if self.currentSequence.loop then
    if self.frame > self.currentSequence.frameCount then
      self.frame = 1
    elseif self.frame < 1 then
      self.frame = self.currentSequence.frameCount
    end
  else
    if self.frame > self.currentSequence.frameCount then
      self.frame = self.currentSequence.frameCount
    elseif self.frame < 1 then
      self.frame = 1
    end
  end
end

function spriteTextureHandler:setCurrentSequence(n)
  self.currentSequence = self.sequence[n]
  self.frame = 1
end

function spriteTextureHandler:setFrameDuration(n)
  self.frameDuration = n
end

function spriteTextureHandler:update(gameTime)
  if gameTime >= self.updateTime then
    self.updateTime = self.updateTime + self.frameDuration
    self:stepFrame()
  end
end

function spriteTextureHandler:drawFrame(x, y)
  lg.draw(self.sheet, self.currentSequence.quads[self.frame], x, y)
end

return spriteTextureHandler
