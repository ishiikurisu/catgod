start = require "controller/mainmenu_controller"
util = require "util"

function love.load()
  current_controller = start.new()
  mainFont = love.graphics.newFont("assets/8BIT.TTF", 18)
  love.graphics.setFont(mainFont)
end

function love.mousepressed(x, y, button, istouch)
  current_controller.press(x, y)
end

function love.update(dt)
  current_controller = current_controller.update(dt)
end

function love.draw()
  current_controller.draw()
end
