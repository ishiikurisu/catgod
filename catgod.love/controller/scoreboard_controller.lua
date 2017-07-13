local scoreboard_controller = { }

scoreboard_controller.construct = function()
  local self = { }

  self.actions = { }
  self.scoreboard = { }

  -- Loading scoreboard
  local size, _ = love.filesystem.getSize(util.save_file)
  if size ~= nil then
    local contents, size = love.filesystem.read(util.save_file, size)
    contents = util.splitstring(contents, "\n")
    for _, content in pairs(contents) do
      local stuff = util.splitstring(content, " ")
      table.insert(self.scoreboard, stuff)
    end
    table.sort(self.scoreboard, function(this, that) return tonumber(this[2]) > tonumber(that[2]) end)
  end

  return self
end

scoreboard_controller.new = function()
  local self = scoreboard_controller.construct()

  self.press = function(x, y)
    local action = { x = x, y = y }
    table.insert(self.actions, action)
  end

  self.update = function(dt)
    for _, action in pairs(self.actions) do
      return start.new()
    end

    self.actions = { }
    return self
  end

  self.draw = function()
    if #self.scoreboard > 0 then
      for i, score in ipairs(self.scoreboard) do
        love.graphics.print(i .. ". " .. score[1] .. " ... " .. score[2], 50, i*50)
      end
    else
      love.graphics.print("No one has played this yet! Why not be the first?", 50, 50)
    end
  end

  return self
end

return scoreboard_controller
