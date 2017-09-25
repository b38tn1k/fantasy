local Section = {}
Section.__index = Section

function flipCoin()
    if math.random() > 0.5 then
      return 1
    else
      return 0
    end
  end

  function getSafeRandomNumber()
    local r = 0
    while r < 0.25 or r > 0.75 do
      r = math.random()
    end
    return r
  end

  function Section.create(xMin, xMax, yMin, yMax, coin)
    local s = {}
    setmetatable(s, Section)
    border = 20
    s.xMin = xMin
    s.xMax = xMax
    s.yMin = yMin
    s.yMax = yMax
    s.x = xMin
    s.y = yMin
    s.xMid = xMin + math.ceil((xMax - xMin)/2)
    s.yMid = yMin + math.ceil((yMax - yMin)/2)
    s.road = {}
    s.width = xMax - xMin
    s.height = yMax - yMin
    s.xRoom = xMin + border
    s.yRoom = yMin + border
    s.wRoom = s.width - (2 * border)
    s.hRoom = s.height - (2 * border)
    s.children = {}
    s.hasChildren = false
    if coin == nil then
      coin = flipCoin()
    end
    s.coin = coin
    return s
  end

  function Section:makeChildren()
    sub = getSafeRandomNumber()
    if self.coin == 1 then
      split = math.floor((self.xMax - self.xMin) * sub) + self.xMin
      leftChild = Section.create(self.xMin, split, self.yMin, self.yMax, 0)
      rightChild = Section.create(split, self.xMax, self.yMin, self.yMax, 0)
    else
      split = math.floor((self.yMax - self.yMin) * sub) + self.yMin
      leftChild = Section.create(self.xMin, self.xMax, self.yMin,  split, 1)
      rightChild = Section.create(self.xMin, self.xMax, split, self.yMax, 1)
    end
    self.road = {leftChild.xMid, leftChild.yMid, rightChild.xMid, rightChild.yMid}
    table.insert(self.children, leftChild)
    table.insert(self.children, rightChild)
    self.hasChildren = true
  end

  function Section:getLeftChild()
    return self.children[1]
  end

  function Section:getRightChild()
    return self.children[2]
  end


return Section
