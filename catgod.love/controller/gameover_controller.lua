local gameover_controller = { }

gameover_controller.new = function(score)
  local self = { }
  self.actions = { }
  self.score = score

  self.push = function(key)
      table.insert(self.actions, key)
  end

  self.update = function(dt)
    for _, action in pairs(self.actions) do
      if action == "space" then
          return start.new()
      end
    end

    self.actions = { }
    return self
  end

  self.draw = function()
    love.graphics.setColor(255, 0, 0)
    love.graphics.print("GAME OVER", love.graphics.getWidth()/2, love.graphics.getHeight()/2)
    love.graphics.print("SCORE: " .. self.score, love.graphics.getWidth()/2, love.graphics.getHeight()/2 + 30)
  end

  return self
end

return gameover_controller
