local mainmenu_view = require "view/mainmenu_view"
local mainmenu_model = require "model/mainmenu_model"
local game_controller = require "controller/game_controller"
local scoreboard_controller = require "controller/scoreboard_controller"
local mainmenu_controller = { }

mainmenu_controller.construct = function()
  local self = { }

  self.model = mainmenu_model.new()
  self.view = mainmenu_view.new()
  self.actions = { }

  return self
end

mainmenu_controller.new = function()
  local self = mainmenu_controller.construct()

  -- Update methods
  -- ==============

  self.push = function(key)
    table.insert(self.actions, key)
  end

  self.update = function(dt)
    local next_controller = self

    for _, action in pairs(self.actions) do
      if action == "up" then
        self.model.previous()
      elseif action == "down" then
        self.model.next()
      elseif action == "space" then
        next_controller = self.choose_next_controller()
      end
    end

    self.actions = { }
    return next_controller
  end

  -- Will return a game_controller if the current selection is 1; or will close
  -- the game if the current selection is 3.
  self.choose_next_controller = function()
    local next_controller = self
    local current = self.model.current

    -- TODO Implement a scoreboard controller to be chosen when selection is 2.
    if current == 1 then
      next_controller = game_controller.new()
    elseif current == 2 then
      next_controller = scoreboard_controller.new()
    elseif current == 3 then
      love.event.quit()
    end

    return next_controller
  end

  -- Draw methods
  -- ============

  self.draw = function()
    self.view.draw(self.model.options, self.model.current)
  end

  return self
end

return mainmenu_controller
