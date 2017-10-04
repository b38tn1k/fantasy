Dungeon = {}
Dungeon.__index = Dungeon

function Dungeon.create(x,y,depth)
  local d = {}
  setmetatable(d, Dungeon)
  d.x = x
  d.y = y
  d.depth = depth
  d.sections = {}
  d.corridors = {}
  d.occupancy = {}
  for i = 1, x do
    d.occupancy[i] = {}
    for j = 1, y do
      d.occupancy[i][j] = 0
    end
  end
  return d
end

function Dungeon:generate()
  Section = require("classes.section")
  local sec = Section.create(1, self.x, 1, self.y)
  sec:makeChildren()
  local children = {}
  local newGeneration = {}
  table.insert(children, sec:getLeftChild())
  table.insert(children, sec:getRightChild())
  table.insert(self.corridors, sec.road)
  local i = self.depth
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
  lowest_children = {}
  for _, child in ipairs(children) do
    if child.hasChildren == false then
      table.insert(lowest_children, child)
    end
  end
  self.base_sections = lowest_children

   for i = 1, self.y do
     for j = 1, self.x do
       self.occupancy[i][j] = 0
       for _, child in ipairs(lowest_children) do
         if i > child.xRoomMin and i <child.xRoom and j > child.yRoomMin and j < child.yRoom then
           self.occupancy[i][j] = 1
         end
       end
     end
   end
   debugTools:printArray(self.occupancy)
  self.sections = children
end

function Dungeon:render(texture)
  self.canvas = lg.newCanvas(xp, yp)
  lg.setCanvas(self.canvas)
  lg.draw(texture, 1, 1)
  for i, rec in ipairs(self.sections) do
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
  -- for i = 1, self.y do
  --   for j = 1, self.x do
  --     if self.occupancy[i][j] == 1 then
  --       lg.setColor(colors.blue)
  --       love.graphics.points(i, j)
  --     else
  --       lg.setColor(colors.green)
  --       love.graphics.points(i, j)
  --     end
  --   end
  -- end
  lg.setCanvas()
  lg.reset()
end

return Dungeon
