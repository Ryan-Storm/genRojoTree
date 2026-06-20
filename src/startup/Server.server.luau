local ServerScriptService = game:GetService("ServerScriptService")

local ExampleServiceServer = require(ServerScriptService.Services.ExampleService.ExampleServiceServer)
local BuildServiceServer = require(ServerScriptService.Services.BuildService.BuildServiceServer)

ExampleServiceServer:init()
BuildServiceServer:init()
