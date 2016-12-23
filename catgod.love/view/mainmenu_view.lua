local mainmenu_view = { }

mainmenu_view.new = function()
  local self = { }

  self.draw = function(options, current)
    for i, option in ipairs(options) do
      if i == current then
        love.graphics.setColor(0, 255, 255)
      else
        love.graphics.setColor(255, 255, 255)
      end
      love.graphics.print(option, 50, i*50)
    end
  end

  return self
end

return mainmenu_view
