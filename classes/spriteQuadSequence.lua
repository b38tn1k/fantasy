--spriteQuadSequence class handles a single animation sequence
--frame quads are extracted horizontally until an empty frame is encountered
--individual settings for looping and one shotting are controled here
--in addition to stepping through the sequence
local lg = love.graphics
local spriteQuadSequence = {}
spriteQuadSequence.__index = spriteQuadSequence

local function newQuadSequence(sheet, x, y, width, height)
  local quads = {}
  local a, _x
  local _y = y + height / 2
  local occupied = true
  local frameCount = 0
  local xDim, yDim = sheet:getDimensions()
  while occupied == true and x < xDim do
    _x = x + width / 2
    _, _, _, a = sheet:getData():getPixel(_x, _y)
    if a ~= 0 then
      table.insert(quads, lg.newQuad(x, y, width, height, xDim, yDim ))
      frameCount = frameCount + 1
    else
      occupied = false
    end
    x = x + width
  end
  return frameCount, quads
end

function spriteQuadSequence.create(sheet, x, y, width, height)
  local proto = {}
  setmetatable(proto, spriteQuadSequence)
  proto.sheet = sheet
  proto.frameCount, proto.quads = newQuadSequence(sheet, x, y, width, height)
  proto.frame = 1
  proto.loop = true
  return proto
end

function spriteQuadSequence:setLoop()
  self.loop = true
end

function spriteQuadSequence:setOneShot()
  self.loop = false
end

function spriteQuadSequence:removeFromTail(n)
  if n then
    self.frameCount = self.frameCount - n
  end
end

function spriteQuadSequence:configureSequence(config)
  if config["ONESHOT"] == true then self:setOneShot() else self:setLoop() end
  self:removeFromTail(config["REMOVE_FROM_TAIL"])
  if config["RETROGRADE"] == true then self:isRetrograde() end
end

function spriteQuadSequence:isRetrograde()
  for j in range(1, self.frameCount-1, 1) do
   self.quads[self.frameCount + j] = self.quads[self.frameCount - j]
 end
 self.frameCount = self.frameCount * 2 - 2
end

function spriteQuadSequence:stepFrame(step)
  self.frame = self.frame + step
  if self.loop then
    if self.frame > self.frameCount then
      self.frame = 1
    elseif self.frame < 1 then
      self.frame = self.frameCount
    end
  else
    if self.frame > self.frameCount then
      self.frame = self.frameCount
    elseif self.frame < 1 then
      self.frame = 1
    end
  end
end

function spriteQuadSequence:drawFrame(x, y)
  lg.draw(self.sheet, self.quads[self.frame], x, y)
end

return spriteQuadSequence
