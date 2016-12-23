local cat_entity = require "model/entity/cat_entity"
local game_model = { }

game_model.construct = function()
  local self = { }

  self.cat = cat_entity.new()

  return self
end

game_model.new = function()
  local self = game_model.construct()

  -- User controlled changes
  -- =======================

  -- Automatic changes
  -- =================
  self.update_cat = function(dt)
    self.cat.update(dt)
  end

  return self
end

return game_model
