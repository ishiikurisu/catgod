local gameover_view = { }

gameover_view.new = function()
    local self = { }

    self.drawBasics = function(score)
        local x = love.graphics.getWidth()/2
        local y = love.graphics.getHeight()/2

        love.graphics.setColor(255, 0, 0)
        love.graphics.print("GAME OVER", x, y)
        love.graphics.print("SCORE: " .. score, x, y + 30)
    end

    self.drawPlayer = function(player, current)
        local y = love.graphics.getHeight()/2 + 60
        local x = love.graphics.getWidth()/2

        for i, letter in ipairs(player) do
            if i == current then
                love.graphics.setColor(255, 229, 43)
            else
                love.graphics.setColor(255, 255, 255)
            end
            love.graphics.print(util.alphabet[player[i]], x + (i-1)*10, y)
        end
    end

    return self
end

return gameover_view
