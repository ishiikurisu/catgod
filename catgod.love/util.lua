local util = { }

function util.pressed(thing, action)
  local x0 = thing.x
  local y0 = thing.y
  local dx = thing.width
  local dy = thing.height
  local x = action.x
  local y = action.y
  local conditions = { x >= x0,
                       x <= x0 + dx,
                       y >= y0,
                       y <= y0 + dy }
  local fact = true

  for _, condition in pairs(conditions) do
    fact = fact and condition
  end

  return fact
end

util.gravity = 1000

return util
