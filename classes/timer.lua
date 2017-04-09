local timer = {}
timer.__index = timer

function timer.create(interval)
  local proto = {}
  setmetatable(proto, timer)
  proto.interval = interval
  proto.updateTime = interval
  proto.tick = true
  --class variables here
  return proto
end

function timer:update(time)
  self.tick = false
  if time>= self.updateTime then
    self.updateTime = self.updateTime + self.interval
    self.tick = true
  end
  return self.tick
end

--class functions here eg. timer:draw()

return timer
