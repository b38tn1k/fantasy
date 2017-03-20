--spriteAnimationHandler controls the movement of sprites
--linking the animations with their motions and states
local spriteAnimationHandler = {}
spriteAnimationHandler.__index = spriteAnimationHandler

function spriteAnimationHandler.create()
  local proto = {}
  setmetatable(proto, spriteAnimationHandler)
  --class variables here
  return proto
end

--class functions here eg. spriteAnimationHandler:draw()

return spriteAnimationHandler
