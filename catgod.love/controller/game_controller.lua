local game_model = require "model/game_model"
local game_view = require "view/game_view"
local gameover_controller = require "controller/gameover_controller"
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

  self.press = function(x, y)
    local action = { x = x, y = y }
    table.insert(self.actions, action)
  end

  self.update = function(dt)
    -- Automatic changes
    self.model.update_cat(dt)
    self.model.update_stuff(dt)
    self.model.check_collisions()

    -- Is game ended?
    self.model.is_game_over()
    if self.model.gameover then
      return gameover_controller.new()
    end

    -- User controlled changes
    for _, action in pairs(self.actions) do
      self.model.press(action)
    end

    self.actions = { }
    return self
  end

  -- Draw methods
  -- ============

  self.draw = function()
    self.view.draw()
    self.view.drawBackground()
    self.view.drawCat(self.model.cat)
    self.view.drawStuff(self.model.stuff)
    self.view.drawScoreboard(self.model.score, self.model.health)
  end

  return self
end

return game_controller
