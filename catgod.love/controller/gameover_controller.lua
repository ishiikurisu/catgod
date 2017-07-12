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
            -- TODO Enable saving of stuff
            return start.new()
        end

        self.actions = { }
        return self
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
