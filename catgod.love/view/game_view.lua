local game_view = { }

game_view.new = function()
  local self = { }

  self.draw = function()
  end

  self.drawBackground = function()
  end

  self.drawCat = function(cat)
    local x = cat.x - cat.width/2
    local y = cat.y
    local width = cat.width
    local height = 10
    love.graphics.rectangle("fill", x, y, width, height)
  end

  return self
end

return game_view
