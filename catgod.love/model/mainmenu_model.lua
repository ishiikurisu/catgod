local mainmenu_model = { }

mainmenu_model.construct = function()
  local self = { }

  self.options = { "New game", "Scoreboard", "Quit" }
  self.current = 1

  return self
end

mainmenu_model.new = function()
  local self = mainmenu_model.construct()

  self.next = function()
    self.current = self.current + 1
    if self.current > #self.options then
      self.current = 1
    end
  end

  self.previous = function()
    self.current = self.current - 1
    if self.current == 0 then
      self.current = #self.options
    end
  end

  return self
end

return mainmenu_model
