--Magic's reactor monitor
print()
print()
print("---------------------------")
sleep(0.15)
print("| Magic's Reactor Control |")
sleep(0.15)
print("---------------------------")
sleep(1)
print()
print()


local reactor = peripheral.wrap("BigReactors-Reactor_1")
print("Connected to the reactor...")

print()
print("Type 'start' to start reactor, 'stop' to stop reactor and 'quit' to exit")
print()

while true  do

input = io.read()

if input == "stop" then
print()
print("Stopping reactor...")
reactor.setActive(false)
print("Reactor stopped")
print()

elseif input == "start" then
print()
print("Starting reactor...")
reactor.setActive(true)
print("Reactor started")
print()


elseif input == "quit" then

exit()

end


end

