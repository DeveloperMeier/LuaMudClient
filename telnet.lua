socket = require 'socket'
local port = 4000
local host = "aardmud.org"
local conn = socket.connect(host, port)
while true do
        local s, status, partial = conn:receive()
        print(s or partial)
        stdin = io.read("*a")
        if stdin then
                conn:send(stdin)
        end
        if status == "closed" then break end
end
