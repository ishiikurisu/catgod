local mainmenu_view = { }

mainmenu_view.construct = function()
  local self = { }

  self.choices = { }
  for i = 1, 3 do
    local choice = {  }
    choice.x = 50
    choice.y = i*50
    choice.width = 100
    choice.height = 50
    table.insert(self.choices, choice)
  end

  return self
end

mainmenu_view.new = function()
  local self = mainmenu_view.construct()

  self.draw = function(options, current)
    love.graphics.setColor(255, 255, 255)
    for i, option in ipairs(options) do
      love.graphics.print(option, 50, i*50)
    end
  end

  return self
end

return mainmenu_view
