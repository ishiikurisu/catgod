local gameover_view = require "view/gameover_view"
local gameover_controller = { }

gameover_controller.construct = function(score)
  local self = { }

  self.actions = { }
  self.score = score
  self.player = { 1, 1, 1 }
  self.current = 1
  self.view = gameover_view.new()

  return self
end

gameover_controller.new = function(score)
  local self = gameover_controller.construct(score)

  self.press = function(x, y)
    local action = { x = x, y = y}
    table.insert(self.actions, action)
  end

  self.update = function(dt)
    for _, action in pairs(self.actions) do
      local clicked = self.determineClickedButton(action)
      if clicked == 0 then
        self.save()
        return start.new()
      elseif clicked == 1 then
        self.updateIndex(1, 1)
      elseif clicked == 2 then
        self.updateIndex(1, -1)
      elseif clicked == 3 then
        self.updateIndex(2, 1)
      elseif clicked == 4 then
        self.updateIndex(2, -1)
      elseif clicked == 5 then
        self.updateIndex(3, 1)
      elseif clicked == 6 then
        self.updateIndex(3, -1)
      end
    end

    self.actions = { }
    return self
  end

  self.determineClickedButton = function(action)
    if util.pressed(self.view.saveButton, action) then
      return 0
    end

    for i, button in pairs(self.view.buttons) do
      if util.pressed(button, action) then
        return i
      end
    end

    return -1
  end

  self.updateIndex = function(index, diff)
    self.player[index] = self.player[index] + diff
    if self.player[index] > #util.alphabet then
      self.player[index] = 1
    elseif self.player[index] == 0 then
      self.player[index] = #util.alphabet
    end
  end

  self.save = function()
    local name = ""

    for _, letter in pairs(self.player) do
      name = name .. util.alphabet[letter]
    end

    util.store(name, self.score)
  end

  self.draw = function()
    self.view.drawBasics(self.score)
    self.view.drawPlayer(self.player, self.current)
  end

  return self
end

return gameover_controller
