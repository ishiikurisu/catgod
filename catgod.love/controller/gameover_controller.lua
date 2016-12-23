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

    self.push = function(key)
        table.insert(self.actions, key)
    end

    self.update = function(dt)
        for _, action in pairs(self.actions) do
            if action == "space" then
                self.save()
                return start.new()
            elseif action == "right" then
                self.current = self.current + 1
                if self.current > #self.player then
                    self.current = 1
                end
            elseif action == "left" then
                self.current = self.current - 1
                if self.current == 0 then
                    self.current = #self.player
                end
            elseif action == "up" then
                self.player[self.current] = self.player[self.current] - 1
                if self.player[self.current] == 0 then
                    self.player[self.current] = #util.alphabet
                end
            elseif action == "down" then
                self.player[self.current] = self.player[self.current] + 1
                if self.player[self.current] > #util.alphabet then
                    self.player[self.current] = 1
                end
            end
        end

        self.actions = { }
        return self
    end

    self.save = function()
    end

    self.draw = function()
        self.view.drawBasics(self.score)
        self.view.drawPlayer(self.player, self.current)
    end

    return self
end

return gameover_controller
