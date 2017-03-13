-- higher order utils go last!
utils = {
  "range",
  "colors",
  "events",
  "LPCSpriteValues"
}

for k,v in pairs(utils) do require("utils." .. v) end
