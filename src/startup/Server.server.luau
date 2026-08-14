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

--////////////////////////////////////////////////////////////
-- Counter Service: Project 01
--////////////////////////////////////////////////////////////

local CounterServiceServer = require(ServerScriptService.Services.CounterService.CounterServiceServer)
CounterServiceServer:init()

--////////////////////////////////////////////////////////////
-- Settings Service: Project 02
--////////////////////////////////////////////////////////////

local SettingServiceServer = require(ServerScriptService.Services.SettingService.SettingServiceServer)
SettingServiceServer:init()
