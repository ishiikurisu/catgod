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

function util.check_collision(cat, thing)
  local x0 = thing.x
  local y0 = thing.y
  local dx = thing.width
  local dy = thing.height
  local x = cat.x
  local y = cat.y
  local w = cat.width
  local h = cat.height
  local right_fact = true
  local right_conditions = { x0 + dx >= x,
                             x0 + dx <= x + w,
                             y0 + dy >= y,
                             y0 + dy <= y + h }
  local left_fact = true
  local left_conditions = { x0 >= x,
                            x0 <= x + w,
                            y0 + dy >= y,
                            y0 + dy <= y + h }

  for i = 1, 4 do
    right_fact = right_fact and right_conditions[i]
    left_fact = left_fact and left_conditions[i]
  end

  return right_fact or left_fact
end

util.gravity = 1000

util.alphabet = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                  "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
                  "U", "V", "W", "X", "Y", "Z" }

util.save_file = "scoreboard.txt"

function util.store(player, score)
  love.filesystem.append(util.save_file, player .. " " .. score .. "\n")
end

function util.splitstring(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

return util
