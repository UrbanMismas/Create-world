local screen = peripheral.find("monitor")
local storage = peripheral.wrap("right") --.find("sophisticatedstorage:storage_io")
local output = peripheral.wrap("left")
local timerDelay = 2
os.startTimer(timerDelay)
local scroll = 1
screen.setTextScale(0.5)

function updateScreen()
	screen.clear()
	maxX, maxY = screen.getSize()
	itemList = storage.list()
	for line = 1, maxY, 1 do
		screen.setCursorPos(1, line)
		item = itemList[line+scroll]
		if not(item == nil)
		then
			screen.write(item.name.." x"..item.count)
		end
		screen.setCursorPos(maxX, line)
		if line == 1 then screen.write(string.char(30))
		elseif line == maxY then screen.write(string.char(31))
	    else screen.write(" ") end
		line = line + 1
		if line > maxY then break
		end
	end
end

while true do
	local event, val_1, val_2, val_3 = os.pullEvent()
	if (event == "monitor_touch")
	then
		x = val_2
		y = val_3
		maxX, maxY = screen.getSize()
		if x > maxX-2
		then
			if y < 3 and scroll > 1 then scroll = scroll -6
			elseif y > maxY-2 and scroll < #storage.list()-(maxY-5) then scroll = scroll +6 end
		else
			storage.pushItems("left",y+scroll)
		end
		updateScreen()
	elseif (event == "timer")
	then
		os.startTimer(timerDelay)
		print("timer")
        updateScreen()
	end
end