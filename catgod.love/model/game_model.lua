local cat_entity = require "model/entity/cat_entity"
local thing_entity = require "model/entity/thing_entity"
local game_model = { }

game_model.construct = function()
  local self = { }

  self.cat = cat_entity.new()
  self.stuff = { }
  self.wait_time = 0
  self.score = 0
  self.health = 3
  self.gameover = false

  return self
end

game_model.new = function()
  local self = game_model.construct()

  -- User controlled changes
  -- =======================
  self.press = function(action)
    for i, thing in ipairs(self.stuff) do
      if util.pressed(thing, action) and thing.pressed == false then
        self.stuff[i].pressed = true
        self.stuff[i].speed = 0
      end
    end
  end

  -- Automatic changes
  -- =================
  self.update_cat = function(dt)
    self.cat.update(dt)
  end

  self.update_stuff = function(dt)
    -- Should new stuff appear?
    self.wait_time = self.wait_time - dt
    if self.wait_time <= 0 then
      table.insert(self.stuff, thing_entity.new())
      self.wait_time = 1 + love.math.random() * 5
    end

    -- Update stuff
    for _, thing in pairs(self.stuff) do
      thing.update(dt)
    end
  end

  self.check_collisions = function()
    local surviving = { }

    for i, it in pairs(self.stuff) do
      if util.check_collision(self.cat, it) then
        self.score = self.score + 1
      elseif it.y > love.graphics.getHeight() then
        self.health = self.health - 1
      else
        table.insert(surviving, it)
      end
    end

    self.stuff = surviving
  end

  self.is_game_over = function()
    self.gameover = not (self.health > 0)
    return self.gameover
  end

  self.update = function(dt)
    self.update_cat(dt)
    self.update_stuff(dt)
  end

  return self
end

return game_model
