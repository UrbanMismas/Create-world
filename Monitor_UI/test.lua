
UI_element = {}

function UI_element:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end
