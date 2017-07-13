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
  self.width = 32
  self.height = 32
  self.speed = love.math.random(10, 60)
  self.pressed = false

  return self
end

thing_entity.new = function()
  local self = thing_entity.construct()

  self.update = function(dt)
    if self.pressed then
      self.y = self.y + self.speed * dt + util.gravity * dt * dt
      self.speed = self.speed + util.gravity * dt
    else
      self.x = self.x + self.direction * self.speed * dt
    end
  end

  return self
end

return thing_entity
