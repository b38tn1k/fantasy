--animationMotionHandlerconverts continuous movement
--into pixel-y movement.
local animationMotionHandler = {}
animationMotionHandler.__index = animationMotionHandler

function animationMotionHandler.create(timer)
  local proto = {}
  setmetatable(proto, animationMotionHandler)
  proto.timer = timer
  proto.x = nil
  proto.y = nil
  --class variables here
  return proto
end

function animationMotionHandler:init(x, y)
  self.x = x
  self.y = y
end

function animationMotionHandler:update(time, x, y)
  if self.timer:update(time) == true then
    self.x = math.floor(x)
    self.y = math.floor(y)
  end
end

return animationMotionHandler
