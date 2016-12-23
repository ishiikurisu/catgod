local scoreboard_controller = { }

scoreboard_controller.construct = function()
    local self = { }

    self.actions = { }
    self.scoreboard = { }

    -- Loading scoreboard
    local size, _ = love.filesystem.getSize(util.save_file)
    local contents, size = love.filesystem.read(util.save_file, size)
    contents = util.splitstring(contents, "\n")
    for _, content in pairs(contents) do
        local stuff = util.splitstring(content, " ")
        table.insert(self.scoreboard, stuff)
    end

    return self
end

scoreboard_controller.new = function()
    local self = scoreboard_controller.construct()

    self.push = function(key)
        table.insert(self.actions, key)
    end

    self.update = function(dt)
        for _, action in pairs(self.actions) do
            if action == "space" then
                return start.new()
            end
        end

        self.actions = { }
        return self
    end

    self.draw = function()
        for i, score in ipairs(self.scoreboard) do
            love.graphics.print(i .. ". " .. score[1] .. " ... " .. score[2], 10, i*20)
        end
    end

    return self
end

return scoreboard_controller
