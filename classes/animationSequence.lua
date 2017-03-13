--animationSequence class handles a single animation sequence
local lg = love.graphics
local animationSequence = {}
animationSequence.__index = animationSequence

function newQuadSequence(sheet, x, y, width, height, frameCount)
  local frames = {}
  for i in range(1, frameCount, 1) do
    table.insert(frames, love.graphics.newQuad(x, y, width, height, sheet:getDimensions() ))
    x = x + width
  end
  return frames
end

function animationSequence.create(sheet, x, y, width, height, frameCount)
  local proto = {}
  setmetatable(proto, animationSequence)
  proto.sheet = sheet
  proto.frameCount = frameCount
  proto.quads = newQuadSequence(sheet, x, y, width, height, frameCount)
  proto.frame = 1
  return proto
end

function animationSequence:stepFrame(step)
  self.frame = self.frame + step
  if self.frame > self.frameCount then
    self.frame = 1
  elseif self.frame < 1 then
    self.frame = self.frameCount
  end
end

function animationSequence:drawFrame(x, y)
  lg.draw(self.sheet, self.quads[self.frame], x, y)
end

return animationSequence
