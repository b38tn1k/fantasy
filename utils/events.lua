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
    dungeon = Dungeon.create(lg.getWidth(), lg.getHeight(), 3)
    dungeon:generate()
    dungeon:render(Assets.terrainTextures.dirt)
  end
end


function love.resize(w, h)
end
