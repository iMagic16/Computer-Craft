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
print("Wrapped reactor...")

print("type start to start reactor, stop to stop reactor and quit to exit")


while true  do

input = io.read()

if input == "stop" then

reactor.setActive(false)
print("stopping reactor")
print(reactor.getActive())

elseif input == "start" then

reactor.setActive(true)
print("starting reactor")
print(reactor.getActive())

elseif input == "quit" then

exit()

end


end

