local thing_entity = { }

thing_entity.construct = function()
  local self = { }

  local direction = love.math.random(0, 1)
  local x = love.graphics.getWidth()
  local y = love.math.random(love.graphics.getHeight() - 50)

  if direction == 0 then
    direction = -1
  end

  if direction > 0 then
    x = 0
  end

  self.direction = direction
  self.x = x
  self.y = y
  self.width = 16
  self.height = 16
  self.speed = love.math.random(2, 16)

  return self
end

thing_entity.new = function()
  local self = thing_entity.construct()

  self.update = function(dt)
    self.x = self.x + self.direction * self.speed * dt
  end

  return self
end

return thing_entity
