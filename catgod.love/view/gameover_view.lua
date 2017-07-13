local gameover_view = { }

gameover_view.construct = function()
  local self = { }

  local x = love.graphics.getWidth()/4
  local y = love.graphics.getHeight()/4
  local firstUp    = { x = x,     y = y,     width = 40, height = 50 }
  local firstDown  = { x = x,     y = y+100, width = 40, height = 50 }
  local secondUp   = { x = x+50,  y = y,     width = 40, height = 50 }
  local secondDown = { x = x+50,  y = y+100, width = 40, height = 50 }
  local thirdUp    = { x = x+100, y = y,     width = 40, height = 50 }
  local thirdDown  = { x = x+100, y = y+100, width = 40, height = 50 }
  self.saveButton = { text = "Save",
                      x = 1*love.graphics.getWidth()/4,
                      y = 3*love.graphics.getHeight()/4, }
  self.buttons = { firstUp,
                   firstDown,
                   secondUp,
                   secondDown,
                   thirdUp,
                   thirdDown }

  return self
end

gameover_view.new = function()
  local self = gameover_view.construct()

  self.drawBasics = function(score)
    local x = love.graphics.getWidth()/8
    local y = love.graphics.getHeight()/8

    love.graphics.setColor(255, 0, 0)
    love.graphics.print("GAME OVER", x, y)
    love.graphics.print("SCORE: " .. score, x, y + 50)

    love.graphics.setColor(255, 255, 255)
    love.graphics.print(self.saveButton.text, self.saveButton.x, self.saveButton.y)

    love.graphics.setColor(255, 229, 43)
    for _, button in ipairs(self.buttons) do
      love.graphics.rectangle("fill", button.x,
                                      button.y,
                                      button.width,
                                      button.height)
    end
  end

  self.drawPlayer = function(player, current)
    local y = love.graphics.getHeight()/4 + 50
    local x = love.graphics.getWidth()/4

    for i, letter in ipairs(player) do
      if i == current then
        love.graphics.setColor(255, 229, 43)
      else
        love.graphics.setColor(255, 255, 255)
      end
      love.graphics.print(util.alphabet[player[i]], x + (i-1)*50+10, y)
    end
  end

  return self
end

return gameover_view
