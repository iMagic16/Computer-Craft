while true do

local reactorOnline 
reactorOnline = false

--Magic's reactor monitor
print()
print()
print("---------------------------")
sleep(0.15)
print("| Magic's Reactor Monitor |")
sleep(0.15)
print("---------------------------")
sleep(1)
print()
print()

local reactor = peripheral.wrap("BigReactors-Reactor_1")
print("Wrapped reactor...")

local monitor = peripheral.wrap("monitor_1")
print("Wrapped monitor...")

--monitor init stuff
monitor.clear()
monitor.setTextScale(1)
monitor.setBackgroundColor(colors.black)
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,1)
print("Initializing monitor etc...")

--print to monitor splash...
monitor.setTextColor(colors.red)
monitor.write("---------------------------------------")
monitor.setCursorPos(1,2)
monitor.setTextColor(colors.purple)
monitor.write("|       Magic's Reactor Monitor       |")
monitor.setCursorPos(1,3)
monitor.setTextColor(colors.red)
monitor.write("---------------------------------------")

--Reactor state
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,17)
monitor.write("Reactor State: ")

if reactor.getActive() == true then
reactorOnline = true
monitor.setTextColor(colors.green)
monitor.write("ONLINE")
print("Reactor is online...")

else
reactorOnline = false
monitor.setTextColor(colors.red)
monitor.write("OFFLINE")
print("Reactor is offline...")

end


--output fuel level
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,5)
monitor.write("Fuel in Reactor: ")
monitor.setTextColor(colors.yellow)
monitor.write(reactor.getFuelAmount())
monitor.write(" mB")
print("Output fuel level...")

--below this requires reactor to be online

if reactorOnline == true then 
--fuel temperature control and moooore
print(reactor.getFuelTemperature())

if tonumber(reactor.getFuelTemperature()) > 2000 then
print("!! OVERHEATING, LOWERING CONTROL ROD !!")
monitor.setCursorPos(1,18)
monitor.write("!! OVERHEATING, LOWERING CONTROL ROD !!")
local CtrlRodLvl = tonumber(reactor.getControlRodLevel(0))
reactor.setAllControlRodLevels(CtrlRodLvl + 10)

elseif tonumber(reactor.getFuelTemperature()) < 1500 then
print("room for more heat... raising rods")
monitor.setTextColor(colors.green)
monitor.setCursorPos(1,18)
monitor.write("Room for more heat, raising control rods")
local CtrlRodLvl = tonumber(reactor.getControlRodLevel(0))
reactor.setAllControlRodLevels(CtrlRodLvl - 10)
end

--write temp to monitor
monitor.setCursorPos(1,6)
monitor.setTextColor(colors.white)
monitor.write("Fuel Temperature: ")
monitor.setTextColor(colors.cyan)
monitor.write(math.floor(reactor.getFuelTemperature()))
monitor.write("*c/2000*c MAX")
print("Output fuel temperature...")
end --end fuel check

end --end reactor check