local mainmenu_view = require "view/mainmenu_view"
local mainmenu_model = require "model/mainmenu_model"
local game_controller = require "controller/game_controller"
local scoreboard_controller = require "controller/scoreboard_controller"
local gameover_controller = require "controller/gameover_controller"
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

  self.press = function(x, y)
    local action = { x = x, y = y }
    for i, choice in ipairs(self.view.choices) do
      if util.pressed(choice, action) then
        table.insert(self.actions, i)
      end
    end
  end

  self.update = function(dt)
    local next_controller = self
    for _, action in pairs(self.actions) do
      next_controller = self.choose_next_controller(action)
    end
    self.actions = { }
    return next_controller
  end

  -- Will return a game_controller if the current selection is 1; or will close
  -- the game if the current selection is 3.
  self.choose_next_controller = function(action)
    local next_controller = self

    if action == 1 then
      next_controller = gameover_controller.new(123) -- game_controller.new()
    elseif action == 2 then
      next_controller = scoreboard_controller.new()
    elseif action == 3 then
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
