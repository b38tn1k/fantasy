--animationSequence class handles a single animation sequence
--frame quads are extracted horizontally until an empty frame is encountered
local lg = love.graphics
local animationSequence = {}
animationSequence.__index = animationSequence

function newQuadSequence(sheet, x, y, width, height)
  local quads = {}
  local a, _x
  local _y = y + height / 2
  local occupied = true
  local frameCount = 0
  local xDim, yDim = sheet:getDimensions()
  while (occupied == true and x < xDim) do
    _x = x + width / 2
    _, _, _, a = sheet:getData():getPixel(_x, _y)
    if (a ~= 0) then
      table.insert(quads, love.graphics.newQuad(x, y, width, height, xDim, yDim ))
      frameCount = frameCount + 1
    else
      occupied = false
    end
    x = x + width
  end
  return frameCount, quads
end

function animationSequence.create(sheet, x, y, width, height)
  local proto = {}
  setmetatable(proto, animationSequence)
  proto.sheet = sheet
  proto.frameCount, proto.quads = newQuadSequence(sheet, x, y, width, height)
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
