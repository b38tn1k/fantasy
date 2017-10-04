local debugTools = {}
debugTools.__index = debugTools

function debugTools.create(on)
  local proto = {}
  setmetatable(proto, debugTools)
  proto.on = on
  --class variables here
  return proto
end

--class functions here eg. debugTools:draw()

function debugTools:printArray(array)
  if self.on == true then
    for _, i in ipairs(array) do
      myString = ""
      for _, j in ipairs(i) do
        myString = myString .. tostring(j)
      end
      print(myString)
    end
  end
end

return debugTools
