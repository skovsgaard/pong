debug = true

keymap = require "keymap"

basepaddlecenter = (love.graphics.getWidth() / 2) - 50

player = {
  x = basepaddlecenter,
  y = love.graphics.getHeight() - 40,
  speed = 250,
  img = nil
}

ai = {
  x = basepaddlecenter,
  y = 20,
  speed = 250,
  img = nil
}

function love.load()
  player.img = love.graphics.newImage("images/paddle_base.png")
  ai.img = love.graphics.newImage("images/paddle_base.png")
end

function love.update(dt)
end

function love.draw(dt)
  love.graphics.draw(player.img, player.x, player.y)
  love.graphics.draw(ai.img, ai.x, ai.y)
end

function love.keypressed(key)
  keymap(key)
end
