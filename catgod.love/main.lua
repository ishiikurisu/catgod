start = require "controller/mainmenu_controller"

function love.load()
  current_controller = start.new()
end

function love.keyreleased(key)
    current_controller.push(key)
end

function love.update(dt)
  current_controller = current_controller.update(dt)
end

function love.draw()
  current_controller.draw()
end
