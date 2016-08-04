debug = true

keymap = require "keymap"

basepaddlecenter = (love.graphics.getWidth() / 2) - 50

ball = {
  x = (love.graphics.getWidth() / 2) - 10,
  y = (love.graphics.getHeight() / 2) - 10,
  speed = 5,
  direction = {x=1,y=1}, -- Positive 1 is down or right. Opposite for negative.
  img = nil
}

player = {
  x = basepaddlecenter,
  y = love.graphics.getHeight() - 25,
  speed = 20,
  img = nil
}

ai = {
  x = basepaddlecenter,
  y = 5,
  speed = 20,
  img = nil
}

function xcollide(ball)
  return ball.x <= 0 or
	 ball.x >= love.graphics.getWidth() - ball.img:getWidth()
end

function ycollide(ball)
  return ball.y <= 0 or
	 ball.y >= love.graphics.getHeight() - ball.img:getHeight()
end

function collide(ball, paddle)
  local paddlecenter = paddle.x + (paddle.img:getWidth() / 2)
  local ballcenter = ball.x + (ball.img:getWidth() / 2)

  if ball.x < paddle.x or
     ball.x > paddle.x + paddle.img:getWidth() then
    return false
  end

  if ball.y + ball.img:getHeight() == paddle.y or
     ball.y == paddle.y + paddle.img:getHeight() then
    if ballcenter < paddlecenter then
      ball.direction.x = -1
    else
      ball.direction.x = 1
    end
    return true
  end

  return false
end

function moveball(ball)
  function domoveball()
    if ball.direction.y > 0 then
      ball.y = ball.y + ball.speed
    else
      ball.y = ball.y - ball.speed
    end

    if ball.direction.x > 0 then
      ball.x = ball.x + ball.speed
    else
      ball.x = ball.x - ball.speed
    end
  end

  if xcollide(ball) then
    ball.direction.x = ball.direction.x * -1
    return domoveball()
  end

  if ycollide(ball) or collide(ball, player) or collide(ball, ai) then
    ball.direction.y = ball.direction.y * -1
    return domoveball()
  end

  domoveball()
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
