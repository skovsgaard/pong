debug = true

keymap = require "keymap"

basepaddlecenter = (love.graphics.getWidth() / 2) - 50

ball = {
  x = (love.graphics.getWidth() / 2) - 10,
  y = (love.graphics.getHeight() / 2) - 10,
  speed = 10,
  direction = {x=1,y=1}, -- Positive 1 is down or right. Opposite for negative.
  img = nil
}

player = {
  x = basepaddlecenter,
  y = love.graphics.getHeight() - 40,
  speed = 20,
  img = nil
}

ai = {
  x = basepaddlecenter,
  y = 20,
  speed = 20,
  img = nil
}

function moveball(ball)
  if ball.direction.y > 0 then
    ball.y = ball.y + ball.speed
  else
    ball.y = ball.y - ball.speed
  end
end

function love.load()
  -- Before you do anything, allow hold-to-move
  love.keyboard.setKeyRepeat(true)

  player.img = love.graphics.newImage("images/paddle_base.png")
  ai.img = love.graphics.newImage("images/paddle_base.png")
  ball.img = love.graphics.newImage("images/ball.png")
end

function love.update(dt)
  moveball(ball)
end

function love.draw(dt)
  love.graphics.draw(player.img, player.x, player.y)
  love.graphics.draw(ai.img, ai.x, ai.y)
  love.graphics.draw(ball.img, ball.x, ball.y)
end

function love.keypressed(key)
  keymap(key)
end
