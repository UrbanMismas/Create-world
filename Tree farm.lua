local screen = peripheral.find("monitor")
local link = peripheral.wrap("top")

screen.setCursorPos(1, 1)
local width, height1 = screen.getSize()
link.setWidth(width)
local width, height2 = link.getSize()

local height = 0
if height1 > height2 then
    height = height2
else
    height = height1
end

for i = 1, height do
    local line = link.getLine(i)
    screen.write(line)
end
