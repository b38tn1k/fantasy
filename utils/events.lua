-- keep all key, mouse, etc events here
function love.keyreleased(key)
  if key == "escape" then
    game.pause = not game.pause
  end
  if key == 'tab' then
    game.debug = not game.debug
  end
  if key == 'q' then
    love.event.quit()
  end
  if key == 'r' then
    dungeon = Dungeon.create(game.dims.x, game.dims.y)
    dungeon:generate()
    dungeon:render()
  end
end


function love.resize(w, h)
  game.dims.x = w
  game.dims.y = h
end
