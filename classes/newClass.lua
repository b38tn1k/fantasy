-- Just run lua newClass.lua and follow the prompts!
-- creates a scaffold new class!
io.write('New Class Tool\n')
io.write('What is the name of the New Class (camelCase)?\n')
name = io.read()
f = io.open(name .. ".lua", "w")
f:write("local " .. name .. " = {}\n")
f:write(name..".__index = "..name.."\n\n")
f:write("function "..name..".create()\n  local proto = {}\n  setmetatable(proto, "..name..")\n  --class variables here\n  return proto\nend\n\n--class functions here eg. "..name..":draw()\n\nreturn "..name)
f:close()
