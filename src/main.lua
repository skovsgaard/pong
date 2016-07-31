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

function xcollide(entity)
  return entity.x <= 0 or
	 entity.x >= love.graphics.getWidth() - entity.img:getWidth()
end

function ycollide(entity)
  return entity.y <= 0 or
	 entity.y >= love.graphics.getHeight() - entity.img:getHeight()
end

function entitycollide(entity, foreignentity)
  return entity.y + entity.img:getHeight() == foreignentity.y or
	 entity.y == foreignentity.y + foreignentity.img:getHeight()
end

function moveball(ball)
  function domoveball()
    if ball.direction.y > 0 then
      ball.y = ball.y + ball.speed
    else
      ball.y = ball.y - ball.speed
    end
  end

  if xcollide(ball) then
    ball.direction.x = ball.direction.x * -1
    return domoveball()
  end

  if ycollide(ball) or entitycollide(ball, player) or entitycollide(ball, ai) then
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
