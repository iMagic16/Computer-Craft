while true do

local reactorOnline 
reactorOnline = false

--Magic's reactor monitor
print()
print()
print("---------------------------")
sleep(0.15)
print("|Magic's Reactor Controller|")
sleep(0.15)
print("---------------------------")
sleep(1)
print()
print()

local reactor = peripheral.wrap("BigReactors-Reactor_0")
print("Wrapped reactor...")

local monitor = peripheral.wrap("monitor_2")
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
monitor.write("--------------------------------------------------")
monitor.setCursorPos(1,2)
monitor.setTextColor(colors.purple)
monitor.write("|           Magic's Reactor Controller            |")
monitor.setCursorPos(1,3)
monitor.setTextColor(colors.red)
monitor.write("--------------------------------------------------")

--Reactor state
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,26)
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
monitor.write(" mB / ")
monitor.write(reactor.getFuelAmountMax())
monitor.write(" mB MAX")
print("Output fuel level...")

--write temp to monitor
monitor.setCursorPos(1,6)
monitor.setTextColor(colors.white)
monitor.write("Fuel Temperature: ")
monitor.setTextColor(colors.yellow)
monitor.write(math.floor(reactor.getFuelTemperature()))
monitor.write("*c")
print("Output fuel temp...")

--write reactivity to monitor
monitor.setCursorPos(1,7)
monitor.setTextColor(colors.white)
monitor.write("Fuel Reactivity: ")
monitor.setTextColor(colors.yellow)
monitor.write(math.floor(reactor.getFuelReactivity()))
monitor.write("%")
print("Output fuel reactivity...")

local function roundToNthDecimal(num, n)
  local mult = 10^(n or 0)
  return math.floor(num * mult + 0.5) / mult
end

--output fuel usage...
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,8)
monitor.write("Fuel Usage: ")
monitor.setTextColor(colors.yellow)
local f = reactor.getFuelConsumedLastTick()
monitor.write(roundToNthDecimal(reactor.getFuelConsumedLastTick(), 2))
monitor.write(" mB / tick ")
print("Output fuel level...")


--write RF stored
monitor.setCursorPos(1,10)
monitor.setTextColor(colors.white)
monitor.write("Power Stored: ")
monitor.setTextColor(colors.cyan)
monitor.write(math.floor(reactor.getEnergyStored()))
monitor.write(" RF / 10000000 RF MAX ")
print("Output RF stored...")

--write RF/tick
monitor.setCursorPos(1,11)
monitor.setTextColor(colors.white)
monitor.write("Power Generation: ")
monitor.setTextColor(colors.cyan)
monitor.write(math.floor(reactor.getEnergyProducedLastTick()))
monitor.write(" RF / tick")
print("Output RF rate...")



--write rod rate to monitor
monitor.setCursorPos(1,13)
monitor.setTextColor(colors.white)
monitor.write("Rod insertion: ")
monitor.setTextColor(colors.red)
monitor.write(math.floor(reactor.getControlRodLevel(1)))
monitor.write("% / 100% MAX")
print("Output rod insertion rate...")

if(reactor.getEnergyStored() < 5000000) then --less than 50%
reactor.setActive(true)
elseif(reactor.getEnergyStored() > 9500000) then --more than 99%
reactor.setActive(false)
end


end