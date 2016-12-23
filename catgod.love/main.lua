start = require "controller/mainmenu_controller"

function love.load()
  current_controller = start.new()
end

function love.keyreleased(key)
  if current_controller.push ~= nil then
    current_controller.push(key)
  end
end

function love.mousepressed(x, y, button, istouch)
  if current_controller.press ~= nil then
    current_controller.press(x, y)
  end
end

function love.update(dt)
  current_controller = current_controller.update(dt)
end

function love.draw()
  current_controller.draw()
end
