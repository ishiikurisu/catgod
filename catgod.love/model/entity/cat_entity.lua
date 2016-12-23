local cat_entity = { }

cat_entity.construct = function()
  local self = { }

  self.x = 300
  self.y = 10
  self.width = 32

  return self
end

cat_entity.new = function()
  local self = cat_entity.construct()
  return self
end

return cat_entity
