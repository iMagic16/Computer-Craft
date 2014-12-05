--Magic's reactor control
print()
print()
print("---------------------------")
sleep(0.15)
print("| Magic's Reactor Control |")
sleep(0.15)
print("---------------------------")
sleep(0.5)
print()
print()

local reactor = peripheral.wrap("BigReactors-Reactor_0")
print("Wrapped reactor...")

local monitor = peripheral.wrap("monitor_0")
print("Wrapped monitor...")

--monitor init stuff
monitor.clear()
monitor.setTextScale(1)
monitor.setBackgroundColor(colors.black)
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,1)
print("Initializing monitor etc...")

--print to monitor splash...
monitor.write("---------------------------")
sleep(0.15)
monitor.setCursorPos(1,2)
monitor.write("| Magic's Reactor Control |")
sleep(0.15)
monitor.setCursorPos(1,3)
monitor.write("---------------------------")
sleep(0.5)

--output fuel level
monitor.setCursorPos(1,4)
monitor.write("Fuel Level: ")
monitor.setCursorPos(1,5)
monitor.setTextColor(colors.yellow)
monitor.write(reactor.getFuelAmount())
monitor.write("%")
print("Output fuel level...")

--reset cursor pos
monitor.setCursorPos(1,6)
monitor.setTextColor(colors.white)
print("Move cursor down...")

--output fuel temperature
monitor.write("Fuel Temperature: ")
monitor.setCursorPos(1,7)
monitor.setTextColor(colors.red)
local mathme 
mathme = math.floor(reactor.getFuelTemperature() + 0.5)
monitor.write(mathme)
monitor.write("c")
print("Output fuel temperature...")

