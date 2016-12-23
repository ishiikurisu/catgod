local cat_entity = { }

cat_entity.construct = function()
  local self = { }

  self.x = 300
  self.y = love.graphics.getHeight() - 30
  self.width = 64
  self.direction = -1
  self.speed = 50

  return self
end

cat_entity.new = function()
  local self = cat_entity.construct()

  self.update = function(dt)
    self.x = self.x + self.direction * self.speed * dt

    -- Changing direction
    local amplitude = self.x + self.direction * self.width / 2
    if amplitude >= love.graphics.getWidth() then
      -- reached far right
      self.direction = -1
    elseif amplitude <= 0 then
      -- reached far left
      self.direction = 1
    end
  end

  return self
end

return cat_entity
