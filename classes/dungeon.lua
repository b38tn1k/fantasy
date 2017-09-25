Dungeon = {}
Dungeon.__index = Dungeon

function Dungeon.create(x,y,blockSize)
  local d = {}
  setmetatable(d, Dungeon)
  d.x = x
  d.y = y
  d.sections = {}
  d.corridors = {}
  return d
end

function Dungeon:generate()
  Section = require("classes.section")
  local sec = Section.create(0, self.x, 0, self.y)
  sec:makeChildren()
  local children = {}
  local newGeneration = {}
  table.insert(children, sec:getLeftChild())
  table.insert(children, sec:getRightChild())
  table.insert(self.corridors, sec.road)
  local i = 3
  while i ~= 0 do
    newGeneration = {}
    for j, sec in ipairs(children) do
      if sec.hasChildren == false then
        sec:makeChildren()
        table.insert(newGeneration, sec:getLeftChild())
        table.insert(newGeneration, sec:getRightChild())
        table.insert(self.corridors, sec.road)
      end
    end
    for i, ng in ipairs(newGeneration) do
     -- if (ng.width > 100 and ng.height > 50) or (ng.width > 50 and ng.height > 100) then
     table.insert(children, ng)
      --end
    end
    i = i -1
  end
  self.sections = children
end

function Dungeon:render()
  self.canvas = lg.newCanvas(xp, yp)
  lg.setCanvas(self.canvas)
  for i, rec in ipairs(self.sections) do
    --lg.rectangle("line", rec.x, rec.y, rec.width, rec.height)
    lg.setColor(colors.red)
    if rec.hasChildren == false then
      lg.rectangle("fill", rec.xRoom, rec.yRoom, rec.wRoom, rec.hRoom)
    end
  end
  lg.setLineWidth( 20 )
  for i, lin in ipairs(self.corridors) do
   lg.setColor(colors.red)
   lg.line(lin)
  end
  lg.setCanvas()
  lg.reset()
end

return Dungeon
