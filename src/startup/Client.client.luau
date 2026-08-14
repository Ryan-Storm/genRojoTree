local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- [[]]

--////////////////////////////////////////////////////////////
-- Data Servce
--////////////////////////////////////////////////////////////

local Data = require(ReplicatedStorage.Shared.Modules.Data).client

Data.currency.Changed(function(newCurrency)
	print("Currency Changed To ", newCurrency)
end)

print("Initial currency:", Data.currency())

--////////////////////////////////////////////////////////////
-- Build Service: Project 00
--////////////////////////////////////////////////////////////

-- local BuildServiceClient = require(ReplicatedStorage.Shared.Services.BuildService.BuildServiceClient)
-- BuildServiceClient:init()

-- while true do
-- 	BuildServiceClient:attemptBuild(CFrame.new(10, 5, 1))
-- 	task.wait(1)
-- end

--////////////////////////////////////////////////////////////
-- Counter Service: Project 01
--////////////////////////////////////////////////////////////

local CounterServiceClient = require(ReplicatedStorage.Shared.Services.CounterService.CounterServiceClient)
CounterServiceClient:init()

--////////////////////////////////////////////////////////////
-- Settings Service: Project 02
--////////////////////////////////////////////////////////////

local SettingServiceClient = require(ReplicatedStorage.Shared.Services.SettingService.SettingServiceClient)
SettingServiceClient:init()

Data.settings.music.Changed(function(enabled)
	print("Music setting changed:", enabled)
end)

print("Initial music:", Data.settings.music())

--////////////////////////////////////////////////////////////
-- Vide UI
--////////////////////////////////////////////////////////////

local MountUI = require(ReplicatedStorage.Shared.Modules.MountUI)
