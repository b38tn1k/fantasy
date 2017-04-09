local animationMotionHandler = {}
animationMotionHandler.__index = animationMotionHandler

function animationMotionHandler.create(timer)
  local proto = {}
  setmetatable(proto, animationMotionHandler)
  proto.timer = timer
  proto.x = 0
  proto.y = 0
  --class variables here
  return proto
end
--class functions here eg. animationMotionHandler:draw()

function animationMotionHandler:update(time, x, y)
  if self.timer:update(time) == true then
    self.x = math.floor(x)
    self.y = math.floor(y)
  end
end

return animationMotionHandler
