--Magic's reactor monitor
print()
print()
print("---------------------------")
sleep(0.15)
print("| Magic's Reactor Monitor |")
sleep(0.15)
print("---------------------------")
sleep(0.5)
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
sleep(0.2)
monitor.setCursorPos(1,2)
monitor.setTextColor(colors.purple)
monitor.write("|       Magic's Reactor Monitor       |")
sleep(0.2)
monitor.setCursorPos(1,3)
monitor.setTextColor(colors.red)
monitor.write("---------------------------------------")
sleep(0.2)

--output fuel level
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,4)
monitor.write("Fuel Level: ")
monitor.setCursorPos(1,5)
monitor.setTextColor(colors.yellow)
monitor.write(reactor.getFuelAmount())
monitor.write(" mB")
print("Output fuel level...")

--reset cursor pos
monitor.setCursorPos(1,6)
monitor.setTextColor(colors.white)
print("Move cursor down...")

--fuel temperature control and moooore
monitor.write("Fuel Temperature: ")
monitor.setTextColor(colors.red)
print(reactor.getFuelTemperature())

if tonumber(reactor.getFuelTemperature()) > 2000 then
monitor.setCursorPos(1,18)
monitor.write("!! OVERHEATING, LOWERING CONTROL ROD !!")
local CtrlRodLvl = tonumber(reactor.getControlRodLevel(0))
reactor.setAllControlRodLevels(CtrlRodLvl + 10)
end

monitor.setTextColor(colors.cyan)
monitor.setCursorPos(1,7)
monitor.write(math.floor(reactor.getFuelTemperature()))
monitor.write("*c/2000*c MAX")
print("Output fuel temperature...")

