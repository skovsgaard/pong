function quit()
  love.event.push("quit")
end

local keymap = {
  ["escape"] = quit,
  ["q"] = quit
}

function dispatch(key)
  keymap[key]()
end

return dispatch

