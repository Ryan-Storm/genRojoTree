local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--////////////////////////////////////////////////////////////
-- Build Service
--////////////////////////////////////////////////////////////

local BuildServiceClient = require(ReplicatedStorage.Shared.Services.BuildService.BuildServiceClient)

BuildServiceClient:init()

-- while true do
-- 	BuildServiceClient:attemptBuild(CFrame.new(10, 5, 1))
-- 	task.wait(1)
-- end

-- [[]]

--////////////////////////////////////////////////////////////
-- Data Servce
--////////////////////////////////////////////////////////////

local Data = require(ReplicatedStorage.Shared.Modules.Data).client

Data.currency.Changed(function(newCurrency)
	print("Currency Changed To ", newCurrency)
end)

print("Initial currency:", Data.currency())

-- task.wait(6)

-- print(Data())

--////////////////////////////////////////////////////////////
-- Vide UI
--////////////////////////////////////////////////////////////

local MountUI = require(ReplicatedStorage.Shared.Modules.MountUI)

--////////////////////////////////////////////////////////////
-- Counter Service
--////////////////////////////////////////////////////////////

local CounterServiceClient = require(ReplicatedStorage.Shared.Services.CounterService.CounterServiceClient)
CounterServiceClient:init()
