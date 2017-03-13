-- higher order utils go last!
utils = {
  "range",
  "colors",
  "events"
}

for k,v in pairs(utils) do require("utils." .. v) end
