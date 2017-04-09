local animationMotionHandler = {}
animationMotionHandler.__index = animationMotionHandler

function animationMotionHandler.create()
  local proto = {}
  setmetatable(proto, animationMotionHandler)
  --class variables here
  return proto
end

--class functions here eg. animationMotionHandler:draw()

return animationMotionHandler
