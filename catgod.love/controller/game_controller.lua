local game_model = require "model/game_model"
local game_view = require "view/game_view"
local game_controller = { }

game_controller.construct = function()
  local self = { }

  self.model = game_model.new()
  self.view = game_view.new()
  self.actions = { }

  return self
end

game_controller.new = function()
  local self = game_controller.construct()

  -- Update methods
  -- ==============

  self.push = function(key)
    table.insert(self.actions, key)
  end

  self.update = function(dt)
    for _, action in pairs(self.actions) do
      
    end

    self.actions = { }
    return self
  end

  -- Draw methods
  -- ============

  self.draw = function()
    self.view.draw()
  end

  return self
end

return game_controller
