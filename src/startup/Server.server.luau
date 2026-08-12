local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local ExampleServiceServer = require(ServerScriptService.Services.ExampleService.ExampleServiceServer)
local BuildServiceServer = require(ServerScriptService.Services.BuildService.BuildServiceServer)
local Data = require(ReplicatedStorage.Shared.Modules.Data).server

ExampleServiceServer:init()
BuildServiceServer:init()

local player = Players:FindFirstChildWhichIsA("Player") or Players.PlayerAdded:Wait()
assert(player, "No player found")

local CounterServiceServer = require(ServerScriptService.Services.CounterService.CounterServiceServer)
CounterServiceServer:init()

-- Data[player].currency(100)

-- while true do
-- 	task.wait(1)
-- 	Data[player].currency(function(n: number)
-- 		return n + 1
-- 	end)
-- end
