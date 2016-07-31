function quit()
  love.event.push("quit")
end

function moveright()
  player.x = player.x + player.speed
end

function moveleft()
  player.x = player.x - player.speed
end

local keymap = {
  ["escape"] = quit,
  ["q"] = quit,
  ["right"] = moveright,
  ["left"] = moveleft
}

-- Check the mapping and fire

function dispatch(key)
  keymap[key]()
end

return dispatch

