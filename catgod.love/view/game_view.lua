local game_view = { }

game_view.new = function()
  local self = { }

  self.draw = function()
  end

  self.drawBackground = function()
  end

  self.drawCat = function(cat)
    local x = cat.x
    local y = cat.y
    local width = cat.width
    local height = 10
    love.graphics.setColor(209, 66, 141)
    love.graphics.rectangle("fill", x, y, width, height)
  end

  self.drawStuff = function(stuff)
    for _, it in pairs(stuff) do
      if it.pressed == true then
        love.graphics.setColor(255, 229, 43)
      else
        love.graphics.setColor(255, 255, 255)
      end
      love.graphics.rectangle("fill", it.x, it.y, it.width, it.height)
    end
  end

  return self
end

return game_view
