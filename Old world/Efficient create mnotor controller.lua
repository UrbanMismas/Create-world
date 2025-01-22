local motor = peripheral.find("electric_motor")
local stressometer = peripheral.find("Create_Stressometer")
while true do
    shell.run("clear")
    local stress = stressometer.getStress()
    print(("Current stress: %d"):format(stress))
    local requiredSpeed = stress/64
    requiredSpeed = math.ceil(requiredSpeed)
    if (requiredSpeed == 0)
    then
        requiredSpeed = 1
    end
    print(("Setting speed to: %d"):format(requiredSpeed))
    motor.setSpeed(requiredSpeed)
    sleep(1)
end
