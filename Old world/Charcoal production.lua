local chest = peripheral.wrap("left")
local redstoneDirection = "back"
local redstoneIndicator = "top"
redstone.setOutput(redstoneDirection, false)
redstone.setOutput(redstoneIndicator, false)
while true do
    local logs = 0
    local charcoal = 0
    for slot, item in pairs(chest.list()) do
        if (item.name == "minecraft:oak_log")
        then
            logs=logs+item.count
        elseif (item.name == "minecraft:charcoal")
        then
            charcoal=charcoal+item.count
        end
    end
    shell.run("clear")
    print(("Logs: %d"):format(logs))
    print(("Charcoal: %d"):format(charcoal))
    if (logs > 10000 and (logs - 100) > charcoal)
    then
        redstone.setOutput(redstoneDirection, false)
        redstone.setOutput(redstoneIndicator, true)
        print("Charcoal production on")
    else
        redstone.setOutput(redstoneDirection, true)
        redstone.setOutput(redstoneIndicator, false)
        print("Charcoal production off")
    end
    sleep(3)
end