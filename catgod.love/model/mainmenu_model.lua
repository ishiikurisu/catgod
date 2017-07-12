local mainmenu_model = { }

mainmenu_model.construct = function()
  local self = { }

  self.options = { "New game", "Scoreboard", "Quit" }
  self.current = 0

  return self
end

mainmenu_model.new = function()
  local self = mainmenu_model.construct()

  return self
end

return mainmenu_model
